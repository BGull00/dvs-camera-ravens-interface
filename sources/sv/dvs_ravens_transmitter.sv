`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;


/* When a new spike arrives, its timestamp, ravens_spike_timestamp_us, will fall into one of the following categories:

        1. ravens_spike_timestamp_us is less than or equal to segment_last_timestamp_us
            - Send spike immediately to RAVENS because it should be applied at the current timestep

        2. ravens_spike_timestamp_us is greater than segment_last_timestamp_us, but not by enough to make the next value of cur_sim_time_timestep greater than NUM_SEGMENTS_PER_SIM_TIME
            - num_timesteps_to_run = (ravens_spike_timestamp_us - segment_last_timestamp_us - 1) / SEGMENT_LENGTH_US + 1
            - Increase segment_last_timestamp_us by num_timesteps_to_run*SEGMENT_LENGTH_US
            - Run RAVENS for num_timesteps_to_run timesteps
            - Increase cur_sim_time_timestep by num_timesteps_to_run

        3. ravens_spike_timestamp_us is greater than segment_last_timestamp_us by enough to make the next value of cur_sim_time_timestep greater than NUM_SEGMENTS_PER_SIM_TIME
            - Run RAVENS to the end of the SIM_TIME
            - Reset cur_sim_time_timestep to 0
            - Get and just throw out spikes until time_us_start_looking_for_new_sim_time - ravens_spike_timestamp_us is less than SEGMENT_LENGTH_US*NUM_SEGMENTS_PER_SIM_TIME

    Registers required:
        - segment_last_timestamp_us
        - cur_sim_time_timestep
*/

module dvs_ravens_transmitter #(parameter SEGMENT_LENGTH_US = 25, NUM_SEGMENTS_PER_SIM_TIME = 10, SIM_TIME = 15)
    (
        // Global inputs
        input logic clk,
        input logic rst_n,

        // Inputs for new spike that needs to be transmitted
        input logic new_spike,
        input logic [TIMESTAMP_US_BITS-1:0] ravens_spike_timestamp_us,
        input logic [RAVENS_PKT_BITS-1:0] ravens_spike,

        // Time in us input
        input logic [TIMESTAMP_US_BITS-1:0] time_us,

        // Synchronization outputs
        output logic sent_spike,
        output logic rdy_for_next_spike,

        // Transmitted RAVENS packet outputs
        output logic [RAVENS_PKT_BITS-1:0] ravens_pkt
    );

    enum {WAIT_FOR_SPIKE_NEW_SIM_TIME, WAIT_FOR_NEXT_SPIKE_IN_SIM_TIME, START_NEW_SIM_TIME, RUN, TRANSMIT_SPIKE} cur_fsm_state, next_fsm_state;

    logic [TIMESTAMP_US_BITS-1:0] time_us_start_looking_for_new_sim_time;
    logic [TIMESTAMP_US_BITS-1:0] segment_last_timestamp_us;
    logic [$clog2(SIM_TIME)-1:0] cur_sim_time_timestep;
    logic [clog((1<<TIMESTAMP_US_BITS) / SEGMENT_LENGTH_US + 1) - 1 : 0] num_timesteps_to_run;
    logic is_new_sim_time;

    //=====================//
    // Sequential Circuits //
    //=====================//

    // RAVENS transmitter state machine flip-flop memory (transition from current state to next state on clock edge)
    always_ff @(posedge clk, negedge rst_n) begin: ravens_trasmitter_fsm_mem
        if(!rst_n) begin
            cur_fsm_state <= WAIT_FOR_SPIKE_NEW_SIM_TIME;
        end
        else begin
            cur_fsm_state <= next_fsm_state;
        end
    end

    // Update the last us timestamp of the segment (last us timestamp for the current RAVENS timestep) in flip-flop memory on positive clock edge
    always_ff @(posedge clk, negedge rst_n) begin: ravens_trasmitter_last_timestamp_us_mem
        if(!rst_n) begin
            segment_last_timestamp_us <= 0;
        end
        else begin
            if(cur_fsm_state == RUN) begin
                segment_last_timestamp_us <= segment_last_timestamp_us + num_timesteps_to_run * SEGMENT_LENGTH_US;
            end
            else if(cur_fsm_state == START_NEW_SIM_TIME) begin
                segment_last_timestamp_us <= ravens_spike_timestamp_us;
            end
        end
    end

    // Update the current timestep in the sim time in flip-flop memory on positive clock edge
    always_ff @(posedge clk, negedge rst_n) begin: ravens_trasmitter_sim_time_timestep_mem
        if(!rst_n) begin
            cur_sim_time_timestep <= 0;
        end
        else begin
            if(cur_fsm_state == RUN) begin
                cur_sim_time_timestep <= cur_sim_time_timestep + num_timesteps_to_run;
            end
            else if(cur_fsm_state == START_NEW_SIM_TIME) begin
                cur_sim_time_timestep <= 0;
            end
        end
    end

    // Update the RAVENS packet that is being sent to the RAVENS neuroprocessor
    always_ff @(posedge clk, negedge rst_n) begin: ravens_trasmitter_ravens_pkt_mem
        if(!rst_n) begin
            ravens_pkt <= 0;
        end
        else begin
            unique case(cur_fsm_state)
                TRANSMIT_SPIKE: ravens_pkt <= ravens_spike;
                RUN: ravens_pkt <= {3'b001, 0};
                START_NEW_SIM_TIME: ravens_pkt <= {3'b010, 0};
                default: ravens_pkt <= ravens_pkt;
            endcase
        end
    end

    // Update the time at which we start looking for the spikes that will be in a new sim time
    always_ff @(posedge clk, negedge rst_n) begin: ravens_trasmitter_time_us_start_looking_for_new_sim_time_mem
        if(!rst_n) begin
            time_us_start_looking_for_new_sim_time <= 0;
        end
        else begin
            if(next_fsm_state == WAIT_FOR_SPIKE_NEW_SIM_TIME) begin
                time_us_start_looking_for_new_sim_time <= time_us;
            end
        end
    end

    //========================//
    // Combinational Circuits //
    //========================//

    // RAVENS transmitter state machine next state logic
    always_comb begin: ravens_transmitter_fsm_next_state
        unique case(cur_fsm_state)

            // When starting a new sim time, get and throw out spikes until one's timestamp is close enough to the the time in us at which the search for spike in a new sim time began
            WAIT_FOR_SPIKE_NEW_SIM_TIME: begin
                if(new_spike == 1 && (time_us_start_looking_for_new_sim_time < ravens_spike_timestamp_us || time_us_start_looking_for_new_sim_time - ravens_spike_timestamp_us < SEGMENT_LENGTH_US*NUM_SEGMENTS_PER_SIM_TIME)) begin
                    next_fsm_state = START_NEW_SIM_TIME;
                end
                else begin
                    next_fsm_state = WAIT_FOR_SPIKE_NEW_SIM_TIME;
                end
            end

            // Wait for the next spike within a sim_time. When it arrives, either run RAVENS until the new spike's correct timestep or go ahead and transmit the spike if its correct timestep is now.
            WAIT_FOR_NEXT_SPIKE_IN_SIM_TIME: begin
                if(new_spike == 1) begin
                    if(num_timesteps_to_run > 0) begin
                        next_fsm_state = RUN;
                    end
                    else begin
                        next_fsm_state = TRANSMIT_SPIKE;    
                    end
                end
                else begin
                    next_fsm_state = WAIT_FOR_NEXT_SPIKE_IN_SIM_TIME;
                end
            end

            // Setup for a new sim time after the first spike in the sim time has been found only takes one clock cycle
            START_NEW_SIM_TIME: next_fsm_state = TRANSMIT_SPIKE;

            // After running, either transmit the next spike or wait until the first spike for a sim time arrives (depending on whether or not the run finished out the sim time)
            RUN: begin
                if(is_new_sim_time) begin
                    next_fsm_state = WAIT_FOR_SPIKE_NEW_SIM_TIME;
                end
                else begin
                    next_fsm_state = TRANSMIT_SPIKE;
                end
            end

            // After transmitting a spike, wait on the next one for the current sim time
            TRANSMIT_SPIKE: next_fsm_state <= WAIT_FOR_NEXT_SPIKE_IN_SIM_TIME;

            default: next_fsm_state = WAIT_FOR_SPIKE_NEW_SIM_TIME;
        endcase
    end

    // Calculate number of timesteps to run; minimum is 0 and maximum is the remaining timesteps in the sim time (if the current spike's timestep is outside of the number of segments in a sim time)
    always_comb begin: ravens_transmitter_num_timesteps_to_run
        if(ravens_spike_timestamp_us > segment_last_timestamp_us) begin
            num_timesteps_to_run = (ravens_spike_timestamp_us - segment_last_timestamp_us - 1) / SEGMENT_LENGTH_US + 1;
            if(cur_sim_time_timestep + num_timesteps_to_run >= NUM_SEGMENTS_PER_SIM_TIME) begin
                num_timesteps_to_run = SIM_TIME - cur_sim_time_timestep;
            end
        end
        else begin
            num_timesteps_to_run = 0;
        end
    end

    // A new sim time is required when the number of timesteps to run gets to the end of the sim time
    assign is_new_sim_time = (num_timesteps_to_run == SIM_TIME - cur_sim_time_timestep) ? 1 : 0;

    // Assert sent_spike only when the spike has been transmitted
    assign sent_spike = (cur_fsm_state == TRANSMIT_SPIKE) ? 1 : 0;

    // Assert rdy_for_next_spike when the FSM is in any state in which it is waiting for a new spike
    assign rdy_for_next_spike = (cur_fsm_state == WAIT_FOR_SPIKE_NEW_SIM_TIME || cur_fsm_state == WAIT_FOR_NEXT_SPIKE_IN_SIM_TIME) ? 1 : 0;

endmodule: dvs_ravens_transmitter
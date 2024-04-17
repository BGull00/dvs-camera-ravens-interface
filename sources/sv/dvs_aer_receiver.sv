`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dvs_aer_receiver
    (
        // Global inputs
        input logic clk,
        input logic rst_n,

        // AER interface inputs
        input logic [9:0] aer,
        input logic xsel,
        input logic req,

        // AER interface outputs
        output logic ack,

        // Output information that describes a single event
        output logic [DVS_X_ADDR_BITS-1:0] event_x,
        output logic [DVS_Y_ADDR_BITS-1:0] event_y,
        output logic [TIMESTAMP_US_BITS-1:0] event_timestamp,
        output logic event_polarity,

        // Output control information
        output logic new_event
    );

    enum {WAIT_FOR_REQ_ASSERT, DELAY_50NS, RECEIVE_DATA, WAIT_FOR_REQ_DEASSERT} cur_fsm_state, next_fsm_state;

    // # of clock cycles needed to delay to ensure 50ns between REQ assertion and reading of X address AER data
    // - 2 comes from: one clock cycle needed to transition from delay FSM state to AER read state, 1 clock cycle from double FF sync
    localparam CLK_CYCLES_50NS = (50/CLK_PERIOD_NS);
    localparam REQ_COUNT_50NS = (CLK_CYCLES_50NS > 2) ? CLK_CYCLES_50NS - 2 : 0;

    logic [DVS_Y_ADDR_BITS-1:0] y_addr;
    logic [TIMESTAMP_US_BITS-1:0] timestamp_us;
    logic [TIMESTAMP_CLK_CYCLE_BITS-1:0] timestamp_clk_cycles;
    logic [$clog2(REQ_COUNT_50NS):0] req_count;
    logic [9:0] aer_mid_sync, aer_synced;
    logic xsel_mid_sync, xsel_synced;
    logic req_mid_sync, req_synced;

    //=====================//
    // Sequential Circuits //
    //=====================//

    // Double flip-flop synchronizers for REQ, XSelect, and AER data
    always_ff @(posedge clk, negedge rst_n) begin: rec_double_ff_sync
        if(!rst_n) begin

            // Reset first stage of input signals in double FF sync
            aer_mid_sync <= 0;
            xsel_mid_sync <= 0;
            req_mid_sync <= 0;

            // Reset input signals coming out of double FF sync
            aer_synced <= 0;
            xsel_synced <= 0;
            req_synced <= 0;
        end
        else begin
            
            // First stage of input signals in double FF sync
            aer_mid_sync <= aer;
            xsel_mid_sync <= xsel;
            req_mid_sync <= req;

            // Second and last stage of double FF sync to get synchronized input signals
            aer_synced <= aer_mid_sync;
            xsel_synced <= xsel_mid_sync;
            req_synced <= req_mid_sync;
        end
    end

    // Receiver state machine flip-flop memory (transition from current state to next state on clock edge)
    always_ff @(posedge clk, negedge rst_n) begin: rec_fsm_mem
        if(!rst_n) begin
            cur_fsm_state <= WAIT_FOR_REQ_ASSERT;
        end
        else begin
            cur_fsm_state <= next_fsm_state;
        end
    end

    // Counter based timer used to ensure delay of ~50ns between REQ and reading the AER data (only used in DELAY_50NS FSM state)
    always_ff @(posedge clk, negedge rst_n) begin: rec_req_delay_counter
        if(!rst_n || cur_fsm_state != DELAY_50NS) begin
            req_count <= REQ_COUNT_50NS;
        end
        else begin
            req_count <= req_count - 1;
        end
    end

    // Keep track of the current timestamp in terms of number of clock cycles
    always_ff @(posedge clk, negedge rst_n) begin: rec_timestamp_counter
        if(!rst_n) begin
            timestamp_clk_cycles <= 0;
        end
        else begin
            timestamp_clk_cycles <= timestamp_clk_cycles + 1;
        end
    end

    // On FSM transition into the RECEIVE_DATA state, sample and store event data using double FF synced AER data
    always_ff @(posedge clk, negedge rst_n) begin: rec_sample_aer_event_data
        if(!rst_n) begin
            y_addr <= 0;
            timestamp_us <= 0;
            event_x <= 0;
            event_y <= 0;
            event_timestamp <= 0;
            event_polarity <= 0;
            new_event <= 0;
        end
        else begin

            // Only sample AER data on FSM transition into RECEIVE_DATA state
            if(next_fsm_state == RECEIVE_DATA) begin

                // Read in Y address and find the timestamp in microseconds for every subsequently read event at this Y address
                if(xsel_synced == 0) begin
                    y_addr <= aer_synced[DVS_Y_ADDR_BITS-1:0];
                    timestamp_us <= timestamp_clk_cycles / CLK_PERIOD_US_DIVISOR;
                    new_event <= 0;
                end

                // Set event signals when reading in an X address and polarity using previously read Y address and its timestamp in microseconds
                else begin
                    event_x <= aer_synced[DVS_X_ADDR_BITS:1];
                    event_y <= y_addr;
                    event_timestamp <= timestamp_us;
                    event_polarity <= aer_synced[0];
                    new_event <= 1;
                end
            end
            else begin
                new_event <= 0;
            end
        end
    end

    //========================//
    // Combinational Circuits //
    //========================//

    // Receiver state machine next state combinational logic
    always_comb begin: rec_fsm_next_state
        unique case(cur_fsm_state)
            
            // Wait until the DVS camera sender asserts REQ before continuing to FSM state in which either the system delays for 50ns (for Y addresses) or AER data is read (for X addresses)
            WAIT_FOR_REQ_ASSERT: begin
                if(req_synced) begin
                    if(xsel_synced == 0) begin
                        next_fsm_state = DELAY_50NS;
                    end
                    else begin
                        next_fsm_state = RECEIVE_DATA;
                    end
                end
                else begin
                    next_fsm_state = WAIT_FOR_REQ_ASSERT;
                end
            end

            // Delay ~50ns between REQ assertion and reading AER data (only for Y addresses)
            DELAY_50NS: begin
                if(req_count > 1) begin
                    next_fsm_state = DELAY_50NS;
                end
                else begin
                    next_fsm_state = RECEIVE_DATA;
                end
            end

            // Only spend a single clock cycle receiving AER data before moving on to next state in which we wait for the DVS camera to re-assert REQ
            RECEIVE_DATA: begin
                next_fsm_state = WAIT_FOR_REQ_DEASSERT;
            end

            // Wait until the DVS camera sender deasserts REQ before continuing to next state in which we wait for the DVS camera sender to re-assert REQ
            WAIT_FOR_REQ_DEASSERT: begin
                if(!req_synced) begin
                    next_fsm_state = WAIT_FOR_REQ_ASSERT;
                end
                else begin
                    next_fsm_state = WAIT_FOR_REQ_DEASSERT;
                end
            end

            // Default receive FSM state is to wait for the DVS camera sender to assert REQ
            default: begin
                next_fsm_state = WAIT_FOR_REQ_ASSERT;
            end
        endcase
    end

    // Receiver state machine output combinational logic; only assert ACK when receiver has received AER data and is waiting for the sender to deassert REQ
    assign ack = (cur_fsm_state == WAIT_FOR_REQ_DEASSERT || cur_fsm_state == RECEIVE_DATA) ? 1 : 0;

endmodule: dvs_aer_receiver
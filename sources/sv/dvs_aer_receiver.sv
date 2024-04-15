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

        // Sampled and stored valid AER data of most recently received event
        output logic [9:0] aer_rx,
	    output logic xsel_rx
    );

    enum {WAIT_FOR_REQ_ASSERT, DELAY_50NS, RECEIVE_DATA, WAIT_FOR_REQ_DEASSERT} cur_fsm_state, next_fsm_state;

    // # of clock cycles needed to delay to ensure 50ns between REQ assertion and reading of X address AER data
    // - 2 comes from: one clock cycle needed to transition from delay FSM state to AER read state, 1 clock cycle from double FF sync
    localparam CLK_CYCLES_50NS = (50/CLK_PERIOD);
    localparam REQ_COUNT_50NS = (CLK_CYCLES_50NS > 2) ? CLK_CYCLES_50NS - 2 : 0;

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
    always_ff @(posedge clk, negedge rst_n) begin: rec_timer
        if(!rst_n || cur_fsm_state != DELAY_50NS) begin
            req_count <= REQ_COUNT_50NS;
        end
        else begin
            req_count <= req_count - 1;
        end
    end

    // On FSM transition into the RECEIVE_DATA state, sample and store input aer data (after double FF sync)
    always_ff @(posedge clk, negedge rst_n) begin: rec_read_aer_into_reg
        if(!rst_n) begin
            aer_rx <= 0;
        end
        else begin
            if(next_fsm_state == RECEIVE_DATA) begin
                aer_rx <= aer_synced;
		xsel_rx <= xsel_synced;
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

    // Receiver state machine output combinational logic
    always_comb begin: rec_fsm_output
        unique case(cur_fsm_state)
            
            // While waiting until the DVS camera sender asserts REQ, deassert ACK
            WAIT_FOR_REQ_ASSERT: begin
                ack = 0;
            end

            DELAY_50NS: begin
                ack = 0;
            end

            // Receive AER data and ensure ACK is deasserted
            RECEIVE_DATA: begin
                ack = 0;
            end

            // While waiting until the DVS camera sender deasserts REQ, assert ACK
            WAIT_FOR_REQ_DEASSERT: begin
                ack = 1;
            end

            // In case of an invalid state, ensure all signals are at their safest default settings for restarting this AER protocol
            default: begin
                ack = 0;
            end
        endcase
    end

endmodule: dvs_aer_receiver
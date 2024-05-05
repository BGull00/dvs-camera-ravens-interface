`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dvs_event_to_ravens
    (
        // Global inputs
        input logic clk,
        input logic rst_n,

        // FIFO bus interface inputs
        input logic fifo_grant,
        input logic [EVENT_BITS-1:0] fifo_event,

        // Time in us input
        input logic [TIMESTAMP_US_BITS-1:0] time_us,

        // FIFO bus interface outputs
        output logic fifo_req,
        output logic fifo_rd_en,

        // Outputs to RAVENS
        output logic [RAVENS_PKT_BITS-1:0] ravens_pkt
    );

    enum {WAIT_FOR_GRANT, READ_CTRL, READ} cur_fsm_state, next_fsm_state;

    logic new_spike;
    logic sent_spike;
    logic [EVENT_BITS-1:0] dvs_event;
    logic [RAVENS_PKT_BITS-1:0] ravens_spike;

    //=========================//
    // Component Instantiation //
    //=========================//

    dvs_event_to_ravens_spike DVS_EVENT_TO_RAVENS_SPIKE_INST (
        .dvs_event(dvs_event),
        .ravens_spike(ravens_spike)
    );

    dvs_ravens_transmitter DVS_RAVENS_TRANSMITTER_INST (
        .clk(clk),
        .rst_n(rst_net),
        .new_spike(new_spike),
        .ravens_spike_timestamp_us(dvs_event[TIMESTAMP_US_BITS-1:0]),
        .ravens_spike(ravens_spike),
        .time_us(time_us),
        .sent_spike(sent_spike),
        .rdy_for_next_spike(fifo_req),
        .ravens_pkt(ravens_pkt)
    );

    //=====================//
    // Sequential Circuits //
    //=====================//
    
    // FIFO event queue reading state machine flip-flop memory (transition from current state to next state on clock edge)
    always_ff @(posedge clk, negedge rst_n) begin: event_ravens_interface_fsm_mem
        if(!rst_n) begin
            cur_fsm_state <= WAIT_FOR_GRANT;
        end
        else begin
            cur_fsm_state <= next_fsm_state;
        end
    end

    // Read in an event from the FIFO event queue when the FSM is in the READ state (one clock cycle after setting the fifo read enable control signal)
    always_ff @(posedge clk, negedge rst_n) begin: event_ravens_interface_fifo_bus_read_event
        if(!rst_n) begin
            dvs_event <= 0;
        end
        else begin
            if(cur_fsm_state == READ) begin
                dvs_event <= fifo_event;
            end
        end
    end

    // Indicate a spike is newly obtained when an event is read from the FIFO event queue; indicate a spike is not new when it has been sent by the transmitter
    always_ff @(posedge clk, negedge rst_n) begin: event_ravens_interface_new_spike
        if(!rst_n) begin
            new_spike <= 0;
        end
        else begin
            if(cur_fsm_state == READ) begin
                new_spike <= 1;
            end
            else if(sent_spike == 1) begin
                new_spike = 0;
            end
        end
    end

    //========================//
    // Combinational Circuits //
    //========================//

    // FIFO event queue reading state machine next state logic
    always_comb begin: event_ravens_interface_fsm_next_state
        unique case(cur_fsm_state)

            // Wait until the grant signal goes high
            WAIT_FOR_GRANT: next_fsm_state = (fifo_grant == 1) ? READ_CTRL : WAIT_FOR_GRANT
            
            // Spend one clock cycle where the FIFO event queue read enable signal is high
            READ_CTRL: next_fsm_state = READ;

            // Spend one clock cycle reading event outputted from FIFO event queue (done on clock edge)
            READ: next_fsm_state = WAIT_FOR_GRANT;

            default: next_fsm_state = WAIT_FOR_GRANT;
        endcase
    end

    // Enable read on FIFO event queue when in correct FSM state (one cycle after granted access and one cycle before reading event from FIFO event queue)
    assign fifo_rd_en = (cur_fsm_state == READ_CTRL) ? 1 : 0;

endmodule: dvs_event_to_ravens
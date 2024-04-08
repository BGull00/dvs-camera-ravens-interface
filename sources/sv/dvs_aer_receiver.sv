module aer_receiver
    (
        // Global inputs
        input logic clk,
        input logic rst_n,

        // AER interface inputs
        input logic [9:0] aer,
        input logic xsel,
        input logic req,

        // AER interface outputs
        output logic ack
    )

    enum {WAIT_FOR_REQ_ASSERT, RECEIVE_DATA, WAIT_FOR_REQ_DEASSERT} cur_fsm_state, next_fsm_state;

    logic [9:0] aer_mid_sync, aer_synced;
    logic xsel_mid_sync, xsel_synced;
    logic req_mid_sync, req_synced;

    //=====================//
    // Sequential Circuits //
    //=====================//

    // Double flip-flop synchronizers for REQ, XSelect, and AER data
    always_ff @(posedge clk, negedge rst_n) begin: double_ff_sync
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

    //========================//
    // Combinational Circuits //
    //========================//

    // Receiver state machine next state combinational logic
    always_comb begin : rec_fsm_next_state
        unique case(cur_fsm_state)
            
            // Wait until the DVS camera sender asserts REQ before continuing to FSM state in which AER data is read
            WAIT_FOR_REQ_ASSERT: begin
                if(req_synced) begin
                    next_fsm_state = RECEIVE_DATA;
                end
                else begin
                    next_fsm_state = WAIT_FOR_REQ_ASSERT;
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
    always_comb begin : rec_fsm_output
        unique case(cur_fsm_state)
            
            // While waiting until the DVS camera sender asserts REQ, deassert ACK
            WAIT_FOR_REQ_ASSERT: begin
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

endmodule: aer_receiver
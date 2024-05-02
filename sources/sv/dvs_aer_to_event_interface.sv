`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dvs_aer_to_event_interface
    (
        // Global inputs
        input logic clk,
        input logic rst_n,

        // AER interface inputs
        input logic [9:0] aer,
        input logic xsel,
        input logic req,

        // FIFO bus interface inputs
        input logic fifo_grant,

        // AER interface outputs
        output logic ack,

        // FIFO bus interface outputs
        output logic fifo_req,
        output logic fifo_wr_en,
        output logic [EVENT_BITS-1:0] fifo_event
    );

    // Sampled and stored valid event data of most recently received event from receiver
    logic [DVS_X_ADDR_BITS-1:0] event_x;
    logic [DVS_Y_ADDR_BITS-1:0] event_y;
    logic [TIMESTAMP_US_BITS-1:0] event_timestamp;
    logic event_polarity;
    logic new_event;

    // Event after preprocessing and whether or not it was filtered out
    logic [EVENT_BITS-1:0] preprocessed_event;
    logic event_filtered;

    logic event_written;

    //=========================//
    // Component Instantiation //
    //=========================//

    // Module instance used to receive event data (X address, Y address, polarity, and timestep in microseconds of an event) from event camera via AER interface
    dvs_aer_receiver DVS_AER_RECEIVER_INST (
        .clk(clk),
        .rst_n(rst_n),
        .aer(aer),
        .xsel(xsel),
        .req(req),
        .ack(ack),
        .event_x(event_x),
        .event_y(event_y),
        .event_timestamp(event_timestamp),
        .event_polarity(event_polarity),
        .new_event(new_event)
    );

    // Module instance used to preprocess an event
    dvs_event_preprocessor DVS_EVENT_PREPROCESSOR_INST (
        .clk(clk),
        .rst_n(rst_n),
        .event_x(event_x),
        .event_y(event_y),
        .event_timestamp(event_timestamp),
        .event_polarity(event_polarity),
        .preprocessed_event(preprocessed_event),
        .event_filtered(event_filtered)
    );

    //=====================//
    // Sequential Circuits //
    //=====================//

    // Control signal that says whether or not most recently received event has been written to the FIFO
    always_ff @(posedge clk, negedge rst_n) begin: aer_event_interface_event_written
        if(!rst_n) begin
            event_written <= 1;
        end
        else begin
            if(new_event) begin
                event_written <= 0;
            end
            else if(fifo_grant) begin
                event_written <= 1;
            end
        end
    end

    // When granted access to the FIFO bus, write most recently received and preprocessed event to the bus (otherwise, set shared bus write control line to high impedance state)
    always_ff @(posedge clk, negedge rst_n) begin: aer_event_interface_fifo_bus_event
        if(!rst_n) begin
            fifo_event <= 0;
            fifo_wr_en <= 0;
        end
        else begin
            if(fifo_grant) begin
                fifo_event <= preprocessed_event;
                fifo_wr_en <= 1;
            end
            else begin
                fifo_event <= fifo_event;
                fifo_wr_en <= 0;
            end
        end
    end

    //========================//
    // Combinational Circuits //
    //========================//

    // FIFO bus request control signal that is only high when most recently received event needs to be written to the FIFO
    assign fifo_req = ~(event_written | event_filtered);

endmodule: dvs_aer_to_event_interface
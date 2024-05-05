`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dvs_fifo_event_queue
    (
        // Global inputs
        input logic clk,
        input logic rst_n,

        // Input event to wr_en to queue
        input logic [EVENT_BITS-1:0] event_in,

        // Read/write control signals
        input logic wr_en,
        input logic rd_en,

        // Output event popped from queue
        output logic [EVENT_BITS-1:0] event_out,

        // Outputs to indicate ifqueue is empty or full
        output logic empty,
        output logic full
    );

    logic [$clog(EVENT_QUEUE_DEPTH)-1:0] read_ptr;
    logic [$clog(EVENT_QUEUE_DEPTH)-1:0] write_ptr;
    logic [$clog(EVENT_QUEUE_DEPTH)-1:0] next_write_ptr;
    logic [$clog(EVENT_QUEUE_DEPTH)-1:0] next_read_ptr;
    logic [$clog(EVENT_QUEUE_DEPTH)-1:0] addr;

    //=========================//
    // Component Instantiation //
    //=========================//

    dummy_sram DUMMY_SRAM_INST  (
        .clk(clk),
        .addr(addr),
        .din(event_in),
        .wr_en(wr_en),
        .sense_en(rd_en),
        .d_out(event_out)
    );

    //=====================//
    // Sequential Circuits //
    //=====================//

    // Update either read or write pointer flip-flop memory based on if read or write is enabled
    always_ff @(posedge clk, negedge rst_n) begin: fifo_queue_update_pointer_mem
        if(!rst_n) begin
            read_ptr <= 0;
            write_ptr <= 0;
        end
        else begin
            read_ptr <= next_read_ptr;
            write_ptr <= next_write_ptr;
        end
    end

    //========================//
    // Combinational Circuits //
    //========================//

    // Increment either read or write pointer based on if a read or write is enabled
    always_comb begin: fifo_queue_next_pointer_logic
        next_read_ptr = read_ptr;
        next_write_ptr = write_ptr;

        if(wr_en && !full) begin
            next_write_ptr = (write_ptr + 1) % EVENT_QUEUE_DEPTH;
        end

        if(rd_en && !empty) begin
            next_read_ptr = (read_ptr + 1) % EVENT_QUEUE_DEPTH;
        end
    end

    // Use the write pointer as the address for pushes and the read pointer as the address otherwise
    assign addr = (wr_en == 1) ? write_ptr : read_ptr;

    // Queue is empty when the read pointer is equal to the write pointer
    assign empty = (read_ptr == write_ptr);

    // Queue is full when the write pointer is equal to the read pointer - 1 (address before the read pointer)
    assign full = ((write_ptr + 1) % EVENT_QUEUE_DEPTH == read_ptr);

endmodule: dvs_fifo_event_queue

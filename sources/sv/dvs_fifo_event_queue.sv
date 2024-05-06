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

    logic [$clog2(EVENT_QUEUE_DEPTH)-1:0] read_ptr;
    logic [$clog2(EVENT_QUEUE_DEPTH)-1:0] write_ptr;
    logic [$clog2(EVENT_QUEUE_DEPTH)-1:0] next_write_ptr;
    logic [$clog2(EVENT_QUEUE_DEPTH)-1:0] next_read_ptr;
    logic [$clog2(EVENT_QUEUE_DEPTH)-1:0] addr;

    //=========================//
    // Component Instantiation //
    //=========================//

    // dummy_sram DUMMY_SRAM_INST  (
    //     .clk(clk),
    //     .addr(addr),
    //     .din(event_in),
    //     .wr_en(wr_en),
    //     .sense_en(rd_en),
    //     .dout(event_out)
    // );

    sram_compiled_array SRAM_COMPILED_ARRAY_INST (addr[0],addr[1],addr[2],addr[3],addr[4],addr[5],addr[6],addr[7],addr[8],addr[9],event_in[0],event_in[1],event_in[2],event_in[3],event_in[4],event_in[5],event_in[6],event_in[7],event_in[8],event_in[9],event_in[10],event_in[11],event_in[12],event_in[13],event_in[14],event_in[15],event_in[16],event_in[17],event_in[18],event_in[19],event_in[20],event_in[21],event_in[22],event_in[23],event_in[24],event_in[25],event_in[26],event_in[27],event_in[28],event_in[29],event_in[30],event_in[31],event_in[32],event_in[33],event_in[34],event_in[35],event_in[36],event_in[37],event_in[38],event_in[39],event_in[40],event_in[41],event_in[42],event_in[43],event_in[44],event_in[45],event_in[46],event_in[47],event_in[48],event_in[49],event_in[50],event_in[51],event_in[52],event_in[53],event_in[54],event_in[55],event_in[56],event_in[57],event_in[58],event_in[59],event_in[60],event_in[61],event_in[62],event_in[63],event_out[0],event_out[1],event_out[2],event_out[3],event_out[4],event_out[5],event_out[6],event_out[7],event_out[8],event_out[9],event_out[10],event_out[11],event_out[12],event_out[13],event_out[14],event_out[15],event_out[16],event_out[17],event_out[18],event_out[19],event_out[20],event_out[21],event_out[22],event_out[23],event_out[24],event_out[25],event_out[26],event_out[27],event_out[28],event_out[29],event_out[30],event_out[31],event_out[32],event_out[33],event_out[34],event_out[35],event_out[36],event_out[37],event_out[38],event_out[39],event_out[40],event_out[41],event_out[42],event_out[43],event_out[44],event_out[45],event_out[46],event_out[47],event_out[48],event_out[49],event_out[50],event_out[51],event_out[52],event_out[53],event_out[54],event_out[55],event_out[56],event_out[57],event_out[58],event_out[59],event_out[60],event_out[61],event_out[62],event_out[63],clk,wr_en,rd_en);

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

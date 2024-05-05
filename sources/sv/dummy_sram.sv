`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dummy_sram
    (
        // Global inputs
        input logic clk,

        // Input address of target SRAM word
        input logic [$clog2(EVENT_QUEUE_DEPTH)-1:0] addr,

        // Input data to write to SRAM
        input logic [EVENT_BITS-1:0] d_in,

        // Read/write control signals
        input logic wr_en,
        input logic sense_en,

        // Output data to read from SRAM
        output logic [EVENT_BITS-1:0] d_out
    );

    logic [EVENT_BITS-1:0] sram [EVENT_QUEUE_DEPTH-1:0];

    //=====================//
    // Sequential Circuits //
    //=====================//

    always_ff @(posedge clk) begin: dummy_sram_mem
        if(wr_en) begin
            sram[addr] <= d_in;
        end
        else if(sense_en) begin
            d_out <= sram[addr];
        end
    end

endmodule: dummy_sram
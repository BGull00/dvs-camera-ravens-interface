`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module clk_timer
    (
        // Global inputs
        input logic clk,
        input logic rst_n,

        // Clock timer output
        output logic [TIMESTAMP_CLK_CYCLE_BITS-1:0] timestamp_clk_cycles
    );
    
    //=====================//
    // Sequential Circuits //
    //=====================//

    // Keep track of the current timestamp in terms of number of clock cycles
    always_ff @(posedge clk, negedge rst_n) begin: timestamp_clk_cycles_counter
        if(!rst_n) begin
            timestamp_clk_cycles <= 0;
        end
        else begin
            timestamp_clk_cycles <= timestamp_clk_cycles + 1;
        end
    end

endmodule: clk_timer
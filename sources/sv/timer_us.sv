`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module timer_us
    (
        // Global inputs
        input logic clk,
        input logic rst_n,

        // Time in us output
        output logic [TIMESTAMP_US_BITS-1:0] time_us
    );
    
    logic [TIMESTAMP_CLK_CYCLE_BITS-1:0] timestamp_clk_cycles;

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

    assign time_us = timestamp_clk_cycles / CLK_PERIOD_US_DIVISOR;

endmodule: timer_us
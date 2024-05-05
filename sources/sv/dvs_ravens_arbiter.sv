`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dvs_ravens_arbiter
    (
        // Request inputs
        input logic req_m1,
        input logic req_m2,

        // FIFO event queue control signals
        input logic fifo_empty,
        input logic fifo_full,

        // Grant outputs
        output logic grant_m1,
        output logic grant_m2
    );

    //========================//
    // Combinational Circuits //
    //========================//

    // Combinational logic arbiter where M1 always has priority over M2
    assign grant_m1 = req_m1 & ~fifo_full;
    assign grant_m2 = req_m2 & ~req_m1 & ~fifo_empty;

endmodule: dvs_ravens_arbiter
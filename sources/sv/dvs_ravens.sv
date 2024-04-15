`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dvs_ravens
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
    );

    // Sampled and stored valid AER data of most recently received event
    logic [9:0] aer_rx;
	logic xsel_rx;

    //=========================//
    // Component Instantiation //
    //=========================//

    aer_receiver AER_RECEIVER_INST (
        .clk(clk),
        .rst_n(rst_n)l,
        .aer(aer),
        .xsel(xsel),
        .req(req),
        .ack(ack),
        .aer_rx(aer_rx),
        .xsel_rx(sxel_rx)
    );

endmodule: dvs_ravens
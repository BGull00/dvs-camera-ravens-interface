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

    logic [TIMESTAMP_US_BITS-1:0] time_us;
    logic fifo_req_write;
    logic fifo_req_read;
    logic fifo_grant_write;
    logic fifo_grant_read;
    logic fifo_wr_en;
    logic fifo_rd_en;
    logic [EVENT_BITS-1:0] fifo_write_event;
    logic [EVENT_BITS-1:0] fifo_read_event;
    logic [RAVENS_PKT_BITS-1:0] ravens_pkt;

    //=========================//
    // Component Instantiation //
    //=========================//

    // Module instance used to receive camera data, preprocess it into an event, and connect it to the FIFO event queue bus
    dvs_aer_to_event_interface  DVS_AER_TO_EVENT_INTERFACE_INST (
        .clk(clk),
        .rst_n(rst_n),
        .aer(aer),
        .xsel(xsel),
        .req(req),
        .fifo_grant(fifo_grant_write),
        .time_us(time_us),
        .ack(ack),
        .fifo_req(fifo_req_write),
        .fifo_wr_en(fifo_wr_en),
        .fifo_event(fifo_write_event)
    );

    // Module instance used to measure current time in us
    timer_us TIMER_US_INST (
        .clk(clk),
        .rst_n(rst_n),
        .time_us(time_us)
    );

    // Module instance used as arbiter for FIFO event queue bus
    dvs_ravens_arbiter DVS_RAVENS_ARBITER_INST (
        .req_m1(fifo_req_write),
        .req_m2(fifo_req_read),
        .grant_m1(fifo_grant_write),
        .grant_m2(fifo_grant_read)
    );

    // Module instance used as FIFO event queue connected to bus
    dvs_fifo_event_queue DVS_FIFO_EVENT_QUEUE_INST (
        .clk(clk),
        .rst_n(rst_n),
        .event_in(fifo_write_event),
        .wr_en(fifo_wr_en),
        .rd_en(fifo_rd_en),
        .event_out(fifo_read_event),
        .empty,
        .full
    );

    // Module instance used to turn DVS events into sequence of RAVENS packets, one packet at a time
    dvs_event_to_ravens DVS_EVENT_TO_RAVENS_INST (
        .clk(clk),
        .rst_n(rst_n),
        .fifo_grant(fifo_grant_read),
        .fifo_event(fifo_read_event),
        .time_us(time_us),
        .fifo_req(fifo_req_read),
        .fifo_rd_en(fifo_rd_en),
        .ravens_pkt(ravens_pkt)
    );

endmodule: dvs_ravens
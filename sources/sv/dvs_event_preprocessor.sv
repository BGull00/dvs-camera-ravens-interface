`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dvs_event_preprocessor
    (
        // Global inputs
        input logic clk,
        input logic rst_n,

        // Input information that describes a single event
        input logic [DVS_X_ADDR_BITS-1:0] event_x,
        input logic [DVS_Y_ADDR_BITS-1:0] event_y,
        input logic [TIMESTAMP_US_BITS-1:0] event_timestamp,
        input logic event_polarity,

        // Output is preprocessed event (X address, Y address, polarity bit, and timestamp in microseconds concatenated together) and whether or not the event should be filtered out
        output logic [EVENT_BITS-1:0] preprocessed_event,
        output logic event_filtered
    );

    logic polarity_filter;
    logic crop_filter;

    //=========================//
    // Component Instantiation //
    //=========================//

    // Module instance used to filter out negative polarity events (only keep positive events)
    dvs_event_polarity_filter #(.POS_FILTER(1)) DVS_EVENT_POLARITY_FILTER_INST (
        .event_polarity(event_polarity),
        .polarity_filter(polarity_filter)
    );

    // Module instance used to filter out any events not in the chosen crop region of X addresses in the interval [0, 100) and Y addresses in the interval [0, 100)
    dvs_event_crop_filter #(.CROP_WIDTH(100), .CROP_HEIGHT(100), .CROP_CORNER_X(0), .CROP_CORNER_Y(0)) DVS_EVENT_CROP_FILTER_INST (
        .event_x(event_x),
        .event_y(event_y),
        .crop_filter(crop_filter)
    );

    //========================//
    // Combinational Circuits //
    //========================//

    // Preprocessed event is all event information (X address, Y address, polarity bit, and timestamp in microseconds) concatenated together (or 0 if the event is filtered out)
    assign preprocessed_event = (event_filtered == 0) ? {event_x, event_y, event_polarity, event_timestamp} : 0;

    // Filter out any events that did not make it through any one of the preprocessing filters
    assign event_filtered = polarity_filter | crop_filter;

endmodule: dvs_event_preprocessor
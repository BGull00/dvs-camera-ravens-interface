`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

// POS_FILTER = 1 => positive event filter (negative events thrown out)
// POS_FILTER = 0 => negative event filter (positive events thrown out)
module dvs_event_polarity_filter #(parameter POS_FILTER = 1)
    (
        // Event polarity fed into polarity filter
        input logic event_polarity,

        // Output is a single bit representing whether the event should be filtered out (1 means event should be thrown out)
        output logic polarity_filter
    );

    //========================//
    // Combinational Circuits //
    //========================//

    // Filter out events according to whether we're using a positive event filter or negative event filter
    always_comb begin: polarity_filter_comb
        if(POS_FILTER) begin
            // For positive event filter, only filter out (get rid of) negative events (i.e. filter events with polarity 0)
            if(event_polarity == 0) begin
                polarity_filter = 1;
            end
            else begin
                polarity_filter = 0;
            end
        end
        else begin
            // For negative event filter, only filter out (get rid of) positive events (i.e. filter events with polarity 1)
            if(event_polarity == 0) begin
                polarity_filter = 0;
            end
            else begin
                polarity_filter = 1;
            end
        end
    end

endmodule: dvs_event_polarity_filter
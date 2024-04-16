`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

// Crop region is a rectangle that contains X addresses in the interval [CROP_CORNER_X, CROP_CORNER_X+CROP_WIDTH) and Y addresses in the interval [CROP_CORNER_Y, CROP_CORNER_Y+CROP_HEIGHT)
// All events not in the crop region are thrown out
module dvs_event_crop_filter #(parameter CROP_WIDTH = 100, CROP_HEIGHT = 100, CROP_CORNER_X = 0, CROP_CORNER_Y = 0)
    (
        // Event X and Y addresses fed into crop filter
        input logic [DVS_X_ADDR_BITS-1:0] event_x,
        input logic [DVS_Y_ADDR_BITS-1:0] event_y,

        // Output is a single bit representing whether the event should be filtered out (1 means event should be thrown out)
        output logic crop_filter
    );

    //========================//
    // Combinational Circuits //
    //========================//

    // Filter out events not in the crop rectangle
    always_comb begin: crop_filter_comb
        if(event_x < CROP_CORNER_X || event_x >= CROP_CORNER_X + CROP_WIDTH || event_y < CROP_CORNER_Y || event_y >= CROP_CORNER_Y + CROP_HEIGHT) begin
            crop_filter = 1;
        end
        else begin
            crop_filter = 0;
        end    
    end

endmodule: dvs_event_crop_filter
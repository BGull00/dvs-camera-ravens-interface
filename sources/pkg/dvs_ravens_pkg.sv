`ifndef DVS_RAVENS_PKG
    `define DVS_RAVENS_PKG

    package dvs_ravens_pkg;

        // Width and height of camera
        localparam DVS_WIDTH_PXLS = 346;
        localparam DVS_HEIGHT_PXLS = 260;
        localparam DVS_X_ADDR_BITS = $clog2(DVS_WIDTH_PXLS);
        localparam DVS_Y_ADDR_BITS = $clog2(DVS_HEIGHT_PXLS);

        // Clock cycle period in different units
        localparam CLK_PERIOD_NS = 10;
        localparam CLK_PERIOD_US_DIVISOR = 1000 / CLK_PERIOD_NS;

        // Number of bits for the timestamp value in an event
        localparam TIMESTAMP_US_BITS = 48;
        localparam TIMESTAMP_CLK_CYCLE_BITS = TIMESTAMP_US_BITS + $clog2(CLK_PERIOD_US_DIVISOR);

        // Number of bits in an event (X address, Y address, polarity bit, and timestamp in microseconds concatenated together)
        localparam EVENT_BITS = DVS_X_ADDR_BITS + DVS_Y_ADDR_BITS + 1 + TIMESTAMP_US_BITS;

    endpackage: dvs_ravens_pkg
`endif
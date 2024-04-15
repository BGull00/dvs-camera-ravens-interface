`ifndef DVS_RAVENS_PKG
    `define DVS_RAVENS_PKG

    package dvs_ravens_pkg;

        localparam DVS_WIDTH_PXLS = 346;
        localparam DVS_HEIGHT_PXLS = 260;
        localparam DVS_X_ADDR_BITS = $clog2(DVS_WIDTH_PXLS);
        localparam DVS_Y_ADDR_BITS = $clog2(DVS_HEIGHT_PXLS);
        localparam CLK_PERIOD_NS = 10;
        localparam CLK_PERIOD_US = CLK_PERIOD_NS / 1000;
        localparam TIMESTAMP_BITS = 48;

    endpackage: dvs_ravens_pkg
`endif
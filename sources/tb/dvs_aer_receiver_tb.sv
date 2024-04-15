`timescale 1ns/1ps

// Import global constants from SystemVerilog package
import dvs_ravens_pkg::*;

module dvs_aer_receiver_tb;

    // Signals part of AER interface
    logic clk;
    logic rst_n;
    logic [9:0] aer;
    logic xsel;
    logic req;
    logic ack;

    // Output of AER receiver
    logic [9:0] aer_rx;
    logic xsel_rx;

    // Internal testbench signals
    int y_addr;
    int x_addr;
    int prev_y_addr;
    int min_remain_time_between_events;
    int delay_between_events;
    int event_time;
    time event_start_time;
    logic polarity;

    // Internal testbench constants
    localparam DVS_READOUT_TIME = 83.333333333333;
    localparam LONG_GUARANTEED_DELAY = 1000;
    localparam LONG_MAX_ADDITIONAL_DELAY = 100;
    localparam SHORT_MAX_ADDITIONAL_DELAY = 4;
    localparam MAX_RAND_DELAY = $rtoi(DVS_READOUT_TIME / 4);

    // DUT: dvs_aer_receiver
    dvs_aer_receiver DVS_AER_RECEIVER_INST (
        .clk(clk),
        .rst_n(rst_n),
        .aer(aer),
        .xsel(xsel),
        .req(req),
        .ack(ack),
        .aer_rx(aer_rx),
	.xsel_rx(xsel_rx)
    );

    /* AER Protocol Format From Sender's Point of View:
        1. Place most recent AER bus data on lines once it is ready to send
        2. Assert REQ
        3. Wait on receiver to assert ACK
        4. Deassert REQ
	5. Wait on receiver to deassert ACK and go back to step 1
    */
    task aer_protocol_dvs_sim(logic [9:0] aer_data, logic xselect);
        
        // 1. Place most recent AER bus data on lines
        aer = aer_data;
        xsel = xselect;
        #1;

        // 2. Assert REQ
        req = 1;

        // 3. Wait on receiver to assert ACK
        @(posedge ack);

        // Extra random delaying to test receiver's waiting on REQ deassertion
        #($urandom%MAX_RAND_DELAY);

        // 4. Deassert REQ
        req = 0;

	// 5. Wait on receiver to deassert ACK
	@(negedge ack);

    endtask

    // Simulate event data coming out of a DVS camera at plausible (but random) times
    initial begin: dvs_sim
    
        prev_y_addr = -1;
        
        // Generate a single event for a random pixel, do AER protocol handshaking on DVS camera side, and wait a random amount of time until continuing
        forever begin

            event_start_time = $time;

            // Randomly generate X and Y coordinates of pixel for single event to send
            x_addr = $urandom%DVS_WIDTH_PXLS;
            y_addr = $urandom%DVS_HEIGHT_PXLS;

	    $display("x_addr=%h , y_addr=%h", x_addr, y_addr);

            // Send pixel Y coordinate to receiver through AER Protocol in following format: aer_data[9] = Don't care; aer_data[8:0] = Y address; XSelect = 0
            if(prev_y_addr != y_addr) begin
                polarity = $urandom&1;
                aer_protocol_dvs_sim({polarity, y_addr[8:0]}, 0);

                // Extra random delaying between y and x addresses
                #($urandom%MAX_RAND_DELAY);
            end
            prev_y_addr = y_addr;

            // Send pixel X coordinate to receiver through AER Protocol in following format: aer_data[9:1] = X address; aer_data[0] = Polarity; XSelect = 1
            polarity = $urandom&1;
            aer_protocol_dvs_sim({x_addr[8:0], polarity}, 1);

            // Randomly find amount of delay between events
            if($urandom%2 == 0) begin

                // 50% chance of having a long delay time between events
                delay_between_events = LONG_GUARANTEED_DELAY + ($urandom%LONG_MAX_ADDITIONAL_DELAY);

                // Long time between events means Y address will need to be sent again no matter what
                prev_y_addr = -1;
            end
            else begin

                // 50% chance of having a short delay time between events
                delay_between_events = $urandom%SHORT_MAX_ADDITIONAL_DELAY;
            end

            // Delay a random amount of time until the next event
	    event_time = $time - event_start_time;
            min_remain_time_between_events = DVS_READOUT_TIME - event_time;
            if(min_remain_time_between_events > 0) begin
                #(min_remain_time_between_events + delay_between_events);
            end
            else begin
                #(delay_between_events);
            end
        end 
    end

    // Simulate interface's clock
    initial begin: clk_sim
        clk = 0;
        forever #(CLK_PERIOD_NS/2) clk = ~clk;
    end

    // Simulate reset signal
    initial begin: rst_sim
        rst_n = 1;
        #10
        rst_n = 0;
        #10
        rst_n = 1;
    end

endmodule: dvs_aer_receiver_tb
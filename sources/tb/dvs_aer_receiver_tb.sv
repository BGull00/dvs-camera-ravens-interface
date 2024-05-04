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

    // Output of AER receiver; describes a single event
    logic [DVS_X_ADDR_BITS-1:0] event_x;
    logic [DVS_Y_ADDR_BITS-1:0] event_y;
    logic [TIMESTAMP_US_BITS-1:0] event_timestamp;
    logic event_polarity;
    logic new_event;

    // Internal testbench signals
    int y_addr;
    int x_addr;
    int prev_y_addr;
    int min_remain_time_between_events;
    int delay_between_events;
    int event_time;
    int min_event_timestamp;
    int max_event_timestamp;
    time event_start_time;
    logic polarity;
    logic [TIMESTAMP_US_BITS-1:0] time_us;

    // Internal testbench constants
    localparam DVS_READOUT_TIME = 83.333333333333;
    localparam LONG_GUARANTEED_DELAY = 1000;
    localparam LONG_MAX_ADDITIONAL_DELAY = 100;
    localparam SHORT_MAX_ADDITIONAL_DELAY = 4;
    localparam MAX_RAND_DELAY = $rtoi(DVS_READOUT_TIME / 4);
    localparam INV_PROB_LONG_DELAY = 20;

    // DUT: dvs_aer_receiver
    dvs_aer_receiver DVS_AER_RECEIVER_INST (
        .clk(clk),
        .rst_n(rst_n),
        .aer(aer),
        .xsel(xsel),
        .req(req),
        .time_us(time_us),
        .ack(ack),
        .event_x(event_x),
        .event_y(event_y),
        .event_timestamp(event_timestamp),
        .event_polarity(event_polarity),
        .new_event(new_event)
    );

    // Supporting clock timer instance
    timer_us TIMER_US_INST (
        .clk(clk),
        .rst_n(rst_n),
        .time_us(time_us)
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

        // Ensure 50ns delay between REQ assertion and reading data for Y addresses
        if(xselect == 0 && ($time - event_start_time - 1) < 50) begin
            $display("ERROR: Y address read less than 50ns after REQ assertion");
            $stop;
        end

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
            else begin
                $display("Multiple X addresses for same Y address");
            end
            prev_y_addr = y_addr;

            // Send pixel X coordinate to receiver through AER Protocol in following format: aer_data[9:1] = X address; aer_data[0] = Polarity; XSelect = 1
            polarity = $urandom&1;
            aer_protocol_dvs_sim({x_addr[8:0], polarity}, 1);

            // Ensure received event matches generated event
            min_event_timestamp = (event_timestamp != 0) ? event_timestamp-1 : 0;
            max_event_timestamp = (event_timestamp + 1 != 0) ? event_timestamp+1 : event_timestamp;
            if(x_addr != event_x || y_addr != event_y || event_polarity != polarity || (event_start_time/1000) < min_event_timestamp || (event_start_time/1000) > max_event_timestamp) begin
                $display("ERROR: Received event does not match generated event!");
                $stop;
            end

            // Randomly find amount of delay between events
            if($urandom%INV_PROB_LONG_DELAY == 0) begin

                // Random chance of having a long delay time between events
                delay_between_events = LONG_GUARANTEED_DELAY + ($urandom%LONG_MAX_ADDITIONAL_DELAY);

                // Long time between events means Y address will need to be sent again no matter what
                prev_y_addr = -1;
            end
            else begin

                //  Otherwise, have a short delay time between events
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

            // Ensure events are not generated at > 12MHz
            if(($time - event_start_time) < $rtoi(DVS_READOUT_TIME)) begin
                $display("TB ERROR: Events generated at >12MHz");
                $stop;
            end
        end 
    end

    // Simulate interface's clock
    initial begin: clk_sim
        clk = 0;
        forever #($itor(CLK_PERIOD_NS)/2) clk = ~clk;
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
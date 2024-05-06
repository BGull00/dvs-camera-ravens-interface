/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Mon May  6 01:25:37 2024
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net75, net77, net78, net81, n1;
  assign net75 = CLK;
  assign ENCLK = net77;
  assign net78 = EN;

  latchgd_x1 latch ( .G(n1), .D(net78), .Q(net81) );
  and2_x1 main_gate ( .A(net81), .B(net75), .Y(net77) );
  inv_x1 U2 ( .A(net75), .Y(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net75, net77, net78, net81, n2;
  assign net75 = CLK;
  assign ENCLK = net77;
  assign net78 = EN;

  latchgd_x1 latch ( .G(n2), .D(net78), .Q(net81) );
  and2_x1 main_gate ( .A(net81), .B(net75), .Y(net77) );
  inv_x1 U2 ( .A(net75), .Y(n2) );
endmodule


module dvs_aer_receiver ( clk, rst_n, aer, xsel, req, time_us, ack, event_x, 
        event_y, event_timestamp, event_polarity, new_event );
  input [9:0] aer;
  input [44:0] time_us;
  output [8:0] event_x;
  output [8:0] event_y;
  output [44:0] event_timestamp;
  input clk, rst_n, xsel, req;
  output ack, event_polarity, new_event;
  wire   xsel_mid_sync, req_mid_sync, xsel_synced, req_synced, N15, N16, N17,
         N18, N19, net87, net92, n16, n18, n19, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13;
  wire   [9:0] aer_mid_sync;
  wire   [9:0] aer_synced;
  wire   [1:0] cur_fsm_state;
  wire   [2:0] req_count;
  wire   [8:0] y_addr;
  wire   [44:0] timestamp_us;
  assign ack = cur_fsm_state[1];

  SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_0 clk_gate_y_addr_reg ( .CLK(clk), 
        .EN(N19), .ENCLK(net87) );
  SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_1 clk_gate_event_x_reg ( .CLK(clk), 
        .EN(N18), .ENCLK(net92) );
  ffrs_x1 \req_count_reg[0]  ( .D(N15), .CLK(clk), .RSTN(n16), .SETN(rst_n), 
        .Q(req_count[0]) );
  ffrs_x1 \req_count_reg[1]  ( .D(N16), .CLK(clk), .RSTN(n16), .SETN(rst_n), 
        .Q(req_count[1]) );
  ffr_x1 \aer_mid_sync_reg[1]  ( .D(aer[1]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[1]) );
  ffr_x1 xsel_synced_reg ( .D(xsel_mid_sync), .CLK(clk), .RSTN(rst_n), .Q(
        xsel_synced) );
  ffr_x1 \timestamp_us_reg[43]  ( .D(time_us[43]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[43]) );
  ffr_x1 \timestamp_us_reg[28]  ( .D(time_us[28]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[28]) );
  ffr_x1 \timestamp_us_reg[13]  ( .D(time_us[13]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[13]) );
  ffr_x1 \event_x_reg[7]  ( .D(aer_synced[8]), .CLK(net92), .RSTN(rst_n), .Q(
        event_x[7]) );
  ffr_x1 \event_y_reg[1]  ( .D(y_addr[1]), .CLK(net92), .RSTN(rst_n), .Q(
        event_y[1]) );
  ffr_x1 \event_timestamp_reg[31]  ( .D(timestamp_us[31]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[31]) );
  ffr_x1 \event_timestamp_reg[16]  ( .D(timestamp_us[16]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[16]) );
  ffr_x1 \event_timestamp_reg[1]  ( .D(timestamp_us[1]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[1]) );
  ffr_x1 \req_count_reg[2]  ( .D(N17), .CLK(clk), .RSTN(rst_n), .Q(
        req_count[2]) );
  ffr_x1 \cur_fsm_state_reg[1]  ( .D(n18), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[1]) );
  ffr_x1 \cur_fsm_state_reg[0]  ( .D(n19), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[0]) );
  ffr_x1 new_event_reg ( .D(N18), .CLK(clk), .RSTN(rst_n), .Q(new_event) );
  ffr_x1 \y_addr_reg[8]  ( .D(aer_synced[8]), .CLK(net87), .RSTN(rst_n), .Q(
        y_addr[8]) );
  ffr_x1 \y_addr_reg[7]  ( .D(aer_synced[7]), .CLK(net87), .RSTN(rst_n), .Q(
        y_addr[7]) );
  ffr_x1 \y_addr_reg[6]  ( .D(aer_synced[6]), .CLK(net87), .RSTN(rst_n), .Q(
        y_addr[6]) );
  ffr_x1 \y_addr_reg[5]  ( .D(aer_synced[5]), .CLK(net87), .RSTN(rst_n), .Q(
        y_addr[5]) );
  ffr_x1 \y_addr_reg[4]  ( .D(aer_synced[4]), .CLK(net87), .RSTN(rst_n), .Q(
        y_addr[4]) );
  ffr_x1 \y_addr_reg[3]  ( .D(aer_synced[3]), .CLK(net87), .RSTN(rst_n), .Q(
        y_addr[3]) );
  ffr_x1 \y_addr_reg[2]  ( .D(aer_synced[2]), .CLK(net87), .RSTN(rst_n), .Q(
        y_addr[2]) );
  ffr_x1 \y_addr_reg[1]  ( .D(aer_synced[1]), .CLK(net87), .RSTN(rst_n), .Q(
        y_addr[1]) );
  ffr_x1 \y_addr_reg[0]  ( .D(aer_synced[0]), .CLK(net87), .RSTN(rst_n), .Q(
        y_addr[0]) );
  ffr_x1 \timestamp_us_reg[44]  ( .D(time_us[44]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[44]) );
  ffr_x1 \timestamp_us_reg[42]  ( .D(time_us[42]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[42]) );
  ffr_x1 \timestamp_us_reg[41]  ( .D(time_us[41]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[41]) );
  ffr_x1 \timestamp_us_reg[40]  ( .D(time_us[40]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[40]) );
  ffr_x1 \timestamp_us_reg[39]  ( .D(time_us[39]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[39]) );
  ffr_x1 \timestamp_us_reg[38]  ( .D(time_us[38]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[38]) );
  ffr_x1 \timestamp_us_reg[37]  ( .D(time_us[37]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[37]) );
  ffr_x1 \timestamp_us_reg[36]  ( .D(time_us[36]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[36]) );
  ffr_x1 \timestamp_us_reg[35]  ( .D(time_us[35]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[35]) );
  ffr_x1 \timestamp_us_reg[34]  ( .D(time_us[34]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[34]) );
  ffr_x1 \timestamp_us_reg[33]  ( .D(time_us[33]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[33]) );
  ffr_x1 \timestamp_us_reg[32]  ( .D(time_us[32]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[32]) );
  ffr_x1 \timestamp_us_reg[31]  ( .D(time_us[31]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[31]) );
  ffr_x1 \timestamp_us_reg[30]  ( .D(time_us[30]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[30]) );
  ffr_x1 \timestamp_us_reg[29]  ( .D(time_us[29]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[29]) );
  ffr_x1 \timestamp_us_reg[27]  ( .D(time_us[27]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[27]) );
  ffr_x1 \timestamp_us_reg[26]  ( .D(time_us[26]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[26]) );
  ffr_x1 \timestamp_us_reg[25]  ( .D(time_us[25]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[25]) );
  ffr_x1 \timestamp_us_reg[24]  ( .D(time_us[24]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[24]) );
  ffr_x1 \timestamp_us_reg[23]  ( .D(time_us[23]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[23]) );
  ffr_x1 \timestamp_us_reg[22]  ( .D(time_us[22]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[22]) );
  ffr_x1 \timestamp_us_reg[21]  ( .D(time_us[21]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[21]) );
  ffr_x1 \timestamp_us_reg[20]  ( .D(time_us[20]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[20]) );
  ffr_x1 \timestamp_us_reg[19]  ( .D(time_us[19]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[19]) );
  ffr_x1 \timestamp_us_reg[18]  ( .D(time_us[18]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[18]) );
  ffr_x1 \timestamp_us_reg[17]  ( .D(time_us[17]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[17]) );
  ffr_x1 \timestamp_us_reg[16]  ( .D(time_us[16]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[16]) );
  ffr_x1 \timestamp_us_reg[15]  ( .D(time_us[15]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[15]) );
  ffr_x1 \timestamp_us_reg[14]  ( .D(time_us[14]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[14]) );
  ffr_x1 \timestamp_us_reg[12]  ( .D(time_us[12]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[12]) );
  ffr_x1 \timestamp_us_reg[11]  ( .D(time_us[11]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[11]) );
  ffr_x1 \timestamp_us_reg[10]  ( .D(time_us[10]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[10]) );
  ffr_x1 \timestamp_us_reg[9]  ( .D(time_us[9]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[9]) );
  ffr_x1 \timestamp_us_reg[8]  ( .D(time_us[8]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[8]) );
  ffr_x1 \timestamp_us_reg[7]  ( .D(time_us[7]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[7]) );
  ffr_x1 \timestamp_us_reg[6]  ( .D(time_us[6]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[6]) );
  ffr_x1 \timestamp_us_reg[5]  ( .D(time_us[5]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[5]) );
  ffr_x1 \timestamp_us_reg[4]  ( .D(time_us[4]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[4]) );
  ffr_x1 \timestamp_us_reg[3]  ( .D(time_us[3]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[3]) );
  ffr_x1 \timestamp_us_reg[2]  ( .D(time_us[2]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[2]) );
  ffr_x1 \timestamp_us_reg[1]  ( .D(time_us[1]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[1]) );
  ffr_x1 \timestamp_us_reg[0]  ( .D(time_us[0]), .CLK(net87), .RSTN(rst_n), 
        .Q(timestamp_us[0]) );
  ffr_x1 \event_x_reg[8]  ( .D(aer_synced[9]), .CLK(net92), .RSTN(rst_n), .Q(
        event_x[8]) );
  ffr_x1 \event_x_reg[6]  ( .D(aer_synced[7]), .CLK(net92), .RSTN(rst_n), .Q(
        event_x[6]) );
  ffr_x1 \event_x_reg[5]  ( .D(aer_synced[6]), .CLK(net92), .RSTN(rst_n), .Q(
        event_x[5]) );
  ffr_x1 \event_x_reg[4]  ( .D(aer_synced[5]), .CLK(net92), .RSTN(rst_n), .Q(
        event_x[4]) );
  ffr_x1 \event_x_reg[3]  ( .D(aer_synced[4]), .CLK(net92), .RSTN(rst_n), .Q(
        event_x[3]) );
  ffr_x1 \event_x_reg[2]  ( .D(aer_synced[3]), .CLK(net92), .RSTN(rst_n), .Q(
        event_x[2]) );
  ffr_x1 \event_x_reg[1]  ( .D(aer_synced[2]), .CLK(net92), .RSTN(rst_n), .Q(
        event_x[1]) );
  ffr_x1 \event_x_reg[0]  ( .D(aer_synced[1]), .CLK(net92), .RSTN(rst_n), .Q(
        event_x[0]) );
  ffr_x1 \event_y_reg[8]  ( .D(y_addr[8]), .CLK(net92), .RSTN(rst_n), .Q(
        event_y[8]) );
  ffr_x1 \event_y_reg[7]  ( .D(y_addr[7]), .CLK(net92), .RSTN(rst_n), .Q(
        event_y[7]) );
  ffr_x1 \event_y_reg[6]  ( .D(y_addr[6]), .CLK(net92), .RSTN(rst_n), .Q(
        event_y[6]) );
  ffr_x1 \event_y_reg[5]  ( .D(y_addr[5]), .CLK(net92), .RSTN(rst_n), .Q(
        event_y[5]) );
  ffr_x1 \event_y_reg[4]  ( .D(y_addr[4]), .CLK(net92), .RSTN(rst_n), .Q(
        event_y[4]) );
  ffr_x1 \event_y_reg[3]  ( .D(y_addr[3]), .CLK(net92), .RSTN(rst_n), .Q(
        event_y[3]) );
  ffr_x1 \event_y_reg[2]  ( .D(y_addr[2]), .CLK(net92), .RSTN(rst_n), .Q(
        event_y[2]) );
  ffr_x1 \event_y_reg[0]  ( .D(y_addr[0]), .CLK(net92), .RSTN(rst_n), .Q(
        event_y[0]) );
  ffr_x1 \event_timestamp_reg[44]  ( .D(timestamp_us[44]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[44]) );
  ffr_x1 \event_timestamp_reg[43]  ( .D(timestamp_us[43]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[43]) );
  ffr_x1 \event_timestamp_reg[42]  ( .D(timestamp_us[42]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[42]) );
  ffr_x1 \event_timestamp_reg[41]  ( .D(timestamp_us[41]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[41]) );
  ffr_x1 \event_timestamp_reg[40]  ( .D(timestamp_us[40]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[40]) );
  ffr_x1 \event_timestamp_reg[39]  ( .D(timestamp_us[39]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[39]) );
  ffr_x1 \event_timestamp_reg[38]  ( .D(timestamp_us[38]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[38]) );
  ffr_x1 \event_timestamp_reg[37]  ( .D(timestamp_us[37]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[37]) );
  ffr_x1 \event_timestamp_reg[36]  ( .D(timestamp_us[36]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[36]) );
  ffr_x1 \event_timestamp_reg[35]  ( .D(timestamp_us[35]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[35]) );
  ffr_x1 \event_timestamp_reg[34]  ( .D(timestamp_us[34]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[34]) );
  ffr_x1 \event_timestamp_reg[33]  ( .D(timestamp_us[33]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[33]) );
  ffr_x1 \event_timestamp_reg[32]  ( .D(timestamp_us[32]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[32]) );
  ffr_x1 \event_timestamp_reg[30]  ( .D(timestamp_us[30]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[30]) );
  ffr_x1 \event_timestamp_reg[29]  ( .D(timestamp_us[29]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[29]) );
  ffr_x1 \event_timestamp_reg[28]  ( .D(timestamp_us[28]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[28]) );
  ffr_x1 \event_timestamp_reg[27]  ( .D(timestamp_us[27]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[27]) );
  ffr_x1 \event_timestamp_reg[26]  ( .D(timestamp_us[26]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[26]) );
  ffr_x1 \event_timestamp_reg[25]  ( .D(timestamp_us[25]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[25]) );
  ffr_x1 \event_timestamp_reg[24]  ( .D(timestamp_us[24]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[24]) );
  ffr_x1 \event_timestamp_reg[23]  ( .D(timestamp_us[23]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[23]) );
  ffr_x1 \event_timestamp_reg[22]  ( .D(timestamp_us[22]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[22]) );
  ffr_x1 \event_timestamp_reg[21]  ( .D(timestamp_us[21]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[21]) );
  ffr_x1 \event_timestamp_reg[20]  ( .D(timestamp_us[20]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[20]) );
  ffr_x1 \event_timestamp_reg[19]  ( .D(timestamp_us[19]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[19]) );
  ffr_x1 \event_timestamp_reg[18]  ( .D(timestamp_us[18]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[18]) );
  ffr_x1 \event_timestamp_reg[17]  ( .D(timestamp_us[17]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[17]) );
  ffr_x1 \event_timestamp_reg[15]  ( .D(timestamp_us[15]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[15]) );
  ffr_x1 \event_timestamp_reg[14]  ( .D(timestamp_us[14]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[14]) );
  ffr_x1 \event_timestamp_reg[13]  ( .D(timestamp_us[13]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[13]) );
  ffr_x1 \event_timestamp_reg[12]  ( .D(timestamp_us[12]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[12]) );
  ffr_x1 \event_timestamp_reg[11]  ( .D(timestamp_us[11]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[11]) );
  ffr_x1 \event_timestamp_reg[10]  ( .D(timestamp_us[10]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[10]) );
  ffr_x1 \event_timestamp_reg[9]  ( .D(timestamp_us[9]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[9]) );
  ffr_x1 \event_timestamp_reg[8]  ( .D(timestamp_us[8]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[8]) );
  ffr_x1 \event_timestamp_reg[7]  ( .D(timestamp_us[7]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[7]) );
  ffr_x1 \event_timestamp_reg[6]  ( .D(timestamp_us[6]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[6]) );
  ffr_x1 \event_timestamp_reg[5]  ( .D(timestamp_us[5]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[5]) );
  ffr_x1 \event_timestamp_reg[4]  ( .D(timestamp_us[4]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[4]) );
  ffr_x1 \event_timestamp_reg[3]  ( .D(timestamp_us[3]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[3]) );
  ffr_x1 \event_timestamp_reg[2]  ( .D(timestamp_us[2]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[2]) );
  ffr_x1 \event_timestamp_reg[0]  ( .D(timestamp_us[0]), .CLK(net92), .RSTN(
        rst_n), .Q(event_timestamp[0]) );
  ffr_x1 event_polarity_reg ( .D(aer_synced[0]), .CLK(net92), .RSTN(rst_n), 
        .Q(event_polarity) );
  ffr_x1 req_synced_reg ( .D(req_mid_sync), .CLK(clk), .RSTN(rst_n), .Q(
        req_synced) );
  ffr_x1 \aer_mid_sync_reg[9]  ( .D(aer[9]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[9]) );
  ffr_x1 \aer_mid_sync_reg[8]  ( .D(aer[8]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[8]) );
  ffr_x1 \aer_mid_sync_reg[7]  ( .D(aer[7]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[7]) );
  ffr_x1 \aer_mid_sync_reg[6]  ( .D(aer[6]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[6]) );
  ffr_x1 \aer_mid_sync_reg[5]  ( .D(aer[5]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[5]) );
  ffr_x1 \aer_mid_sync_reg[4]  ( .D(aer[4]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[4]) );
  ffr_x1 \aer_mid_sync_reg[3]  ( .D(aer[3]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[3]) );
  ffr_x1 \aer_mid_sync_reg[2]  ( .D(aer[2]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[2]) );
  ffr_x1 \aer_mid_sync_reg[0]  ( .D(aer[0]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[0]) );
  ffr_x1 xsel_mid_sync_reg ( .D(xsel), .CLK(clk), .RSTN(rst_n), .Q(
        xsel_mid_sync) );
  ffr_x1 req_mid_sync_reg ( .D(req), .CLK(clk), .RSTN(rst_n), .Q(req_mid_sync)
         );
  ffr_x1 \aer_synced_reg[9]  ( .D(aer_mid_sync[9]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[9]) );
  ffr_x1 \aer_synced_reg[8]  ( .D(aer_mid_sync[8]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[8]) );
  ffr_x1 \aer_synced_reg[7]  ( .D(aer_mid_sync[7]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[7]) );
  ffr_x1 \aer_synced_reg[6]  ( .D(aer_mid_sync[6]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[6]) );
  ffr_x1 \aer_synced_reg[5]  ( .D(aer_mid_sync[5]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[5]) );
  ffr_x1 \aer_synced_reg[4]  ( .D(aer_mid_sync[4]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[4]) );
  ffr_x1 \aer_synced_reg[3]  ( .D(aer_mid_sync[3]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[3]) );
  ffr_x1 \aer_synced_reg[2]  ( .D(aer_mid_sync[2]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[2]) );
  ffr_x1 \aer_synced_reg[1]  ( .D(aer_mid_sync[1]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[1]) );
  ffr_x1 \aer_synced_reg[0]  ( .D(aer_mid_sync[0]), .CLK(clk), .RSTN(rst_n), 
        .Q(aer_synced[0]) );
  nor2_x1 U3 ( .A(req_count[2]), .B(req_count[1]), .Y(n5) );
  nor2_x1 U4 ( .A(cur_fsm_state[1]), .B(n3), .Y(n11) );
  nor2_x1 U5 ( .A(xsel_synced), .B(n9), .Y(N19) );
  tiehi U6 ( .H(n16) );
  inv_x1 U7 ( .A(cur_fsm_state[0]), .Y(n3) );
  nand2_x1 U8 ( .A(n11), .B(req_count[0]), .Y(N15) );
  nor2_x1 U9 ( .A(req_count[1]), .B(req_count[0]), .Y(n13) );
  aoi21_x1 U10 ( .A0(req_count[1]), .A1(req_count[0]), .B0(n13), .Y(n1) );
  nand2_x1 U11 ( .A(n11), .B(n1), .Y(N16) );
  inv_x1 U12 ( .A(n5), .Y(n2) );
  nor2b_x1 U13 ( .AN(req_synced), .B(cur_fsm_state[0]), .Y(n6) );
  inv_x1 U14 ( .A(xsel_synced), .Y(n10) );
  aoi22_x1 U15 ( .A0(n11), .A1(n2), .B0(n6), .B1(n10), .Y(n4) );
  oai21_x1 U16 ( .A0(req_synced), .A1(n3), .B0(cur_fsm_state[1]), .Y(n8) );
  nand2_x1 U17 ( .A(n4), .B(n8), .Y(n19) );
  aoi22_x1 U18 ( .A0(xsel_synced), .A1(n6), .B0(n11), .B1(n5), .Y(n7) );
  nand2_x1 U19 ( .A(n7), .B(n8), .Y(n18) );
  nand2_x1 U20 ( .A(n18), .B(n8), .Y(n9) );
  nor2_x1 U21 ( .A(n10), .B(n9), .Y(N18) );
  oai21_x1 U22 ( .A0(req_count[2]), .A1(n13), .B0(n11), .Y(n12) );
  aoi21_x1 U23 ( .A0(req_count[2]), .A1(n13), .B0(n12), .Y(N17) );
endmodule



    module dvs_event_crop_filter_CROP_WIDTH100_CROP_HEIGHT100_CROP_CORNER_X0_CROP_CORNER_Y0 ( 
        event_x, event_y, crop_filter );
  input [8:0] event_x;
  input [8:0] event_y;
  output crop_filter;
  wire   N2, n1, n2, n3, n4, n5, n6, n7;
  assign crop_filter = N2;

  nor3_x1 U3 ( .A(event_y[4]), .B(event_y[2]), .C(event_y[3]), .Y(n7) );
  nand2_x1 U4 ( .A(event_y[6]), .B(event_y[5]), .Y(n6) );
  nor3_x1 U5 ( .A(event_x[4]), .B(event_x[2]), .C(event_x[3]), .Y(n3) );
  nand2_x1 U6 ( .A(event_x[6]), .B(event_x[5]), .Y(n2) );
  nor2_x1 U7 ( .A(event_y[7]), .B(event_y[8]), .Y(n1) );
  oai21_x1 U8 ( .A0(n3), .A1(n2), .B0(n1), .Y(n4) );
  nor3_x1 U9 ( .A(event_x[7]), .B(event_x[8]), .C(n4), .Y(n5) );
  oai21_x1 U10 ( .A0(n7), .A1(n6), .B0(n5), .Y(N2) );
endmodule


module dvs_event_preprocessor ( clk, rst_n, event_x, event_y, event_timestamp, 
        event_polarity, preprocessed_event, event_filtered );
  input [8:0] event_x;
  input [8:0] event_y;
  input [44:0] event_timestamp;
  output [63:0] preprocessed_event;
  input clk, rst_n, event_polarity;
  output event_filtered;
  wire   crop_filter, n1;

  dvs_event_crop_filter_CROP_WIDTH100_CROP_HEIGHT100_CROP_CORNER_X0_CROP_CORNER_Y0 DVS_EVENT_CROP_FILTER_INST ( 
        .event_x({event_x[8:2], n1, n1}), .event_y({event_y[8:2], n1, n1}), 
        .crop_filter(crop_filter) );
  and2_x1 U2 ( .A(event_y[8]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[54]) );
  tielo U3 ( .L(n1) );
  nor2b_x1 U4 ( .AN(event_polarity), .B(crop_filter), .Y(
        preprocessed_event[45]) );
  and2_x1 U5 ( .A(event_x[5]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[60]) );
  and2_x1 U6 ( .A(event_x[4]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[59]) );
  and2_x1 U7 ( .A(event_x[3]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[58]) );
  and2_x1 U8 ( .A(event_x[2]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[57]) );
  and2_x1 U9 ( .A(event_x[1]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[56]) );
  and2_x1 U10 ( .A(event_x[6]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[61]) );
  and2_x1 U11 ( .A(event_x[0]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[55]) );
  and2_x1 U12 ( .A(event_y[0]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[46]) );
  and2_x1 U13 ( .A(event_y[7]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[53]) );
  and2_x1 U14 ( .A(event_timestamp[44]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[44]) );
  and2_x1 U15 ( .A(event_timestamp[43]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[43]) );
  and2_x1 U16 ( .A(event_timestamp[42]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[42]) );
  and2_x1 U17 ( .A(event_timestamp[41]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[41]) );
  and2_x1 U18 ( .A(event_timestamp[40]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[40]) );
  and2_x1 U19 ( .A(event_timestamp[39]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[39]) );
  and2_x1 U20 ( .A(event_timestamp[38]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[38]) );
  and2_x1 U21 ( .A(event_timestamp[37]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[37]) );
  and2_x1 U22 ( .A(event_timestamp[36]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[36]) );
  and2_x1 U23 ( .A(event_timestamp[35]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[35]) );
  and2_x1 U24 ( .A(event_timestamp[34]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[34]) );
  and2_x1 U25 ( .A(event_timestamp[33]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[33]) );
  and2_x1 U26 ( .A(event_timestamp[32]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[32]) );
  and2_x1 U27 ( .A(event_timestamp[31]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[31]) );
  and2_x1 U28 ( .A(event_y[1]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[47]) );
  and2_x1 U29 ( .A(event_timestamp[30]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[30]) );
  and2_x1 U30 ( .A(event_timestamp[29]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[29]) );
  and2_x1 U31 ( .A(event_timestamp[28]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[28]) );
  and2_x1 U32 ( .A(event_timestamp[27]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[27]) );
  and2_x1 U33 ( .A(event_timestamp[26]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[26]) );
  and2_x1 U34 ( .A(event_timestamp[25]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[25]) );
  and2_x1 U35 ( .A(event_timestamp[24]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[24]) );
  and2_x1 U36 ( .A(event_timestamp[23]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[23]) );
  and2_x1 U37 ( .A(event_timestamp[22]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[22]) );
  and2_x1 U38 ( .A(event_timestamp[21]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[21]) );
  and2_x1 U39 ( .A(event_timestamp[20]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[20]) );
  and2_x1 U40 ( .A(event_timestamp[19]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[19]) );
  and2_x1 U41 ( .A(event_timestamp[18]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[18]) );
  and2_x1 U42 ( .A(event_timestamp[17]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[17]) );
  and2_x1 U43 ( .A(event_timestamp[16]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[16]) );
  and2_x1 U44 ( .A(event_timestamp[15]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[15]) );
  and2_x1 U45 ( .A(event_timestamp[14]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[14]) );
  and2_x1 U46 ( .A(event_timestamp[13]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[13]) );
  and2_x1 U47 ( .A(event_timestamp[12]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[12]) );
  and2_x1 U48 ( .A(event_timestamp[11]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[11]) );
  and2_x1 U49 ( .A(event_timestamp[10]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[10]) );
  and2_x1 U50 ( .A(event_timestamp[9]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[9]) );
  and2_x1 U51 ( .A(event_timestamp[8]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[8]) );
  and2_x1 U52 ( .A(event_timestamp[7]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[7]) );
  and2_x1 U53 ( .A(event_timestamp[6]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[6]) );
  and2_x1 U54 ( .A(event_timestamp[5]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[5]) );
  and2_x1 U55 ( .A(event_timestamp[4]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[4]) );
  and2_x1 U56 ( .A(event_timestamp[3]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[3]) );
  and2_x1 U57 ( .A(event_timestamp[2]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[2]) );
  and2_x1 U58 ( .A(event_timestamp[1]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[1]) );
  and2_x1 U59 ( .A(event_timestamp[0]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[0]) );
  inv_x1 U60 ( .A(preprocessed_event[45]), .Y(event_filtered) );
  and2_x1 U61 ( .A(event_y[2]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[48]) );
  and2_x1 U62 ( .A(event_y[3]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[49]) );
  and2_x1 U63 ( .A(event_y[4]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[50]) );
  and2_x1 U64 ( .A(event_y[5]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[51]) );
  and2_x1 U65 ( .A(event_y[6]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[52]) );
  and2_x1 U66 ( .A(event_x[7]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[62]) );
  and2_x1 U67 ( .A(event_x[8]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[63]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_aer_to_event_interface ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net60, net62, net63, net66, n1;
  assign net60 = CLK;
  assign ENCLK = net62;
  assign net63 = EN;

  latchgd_x1 latch ( .G(n1), .D(net63), .Q(net66) );
  and2_x1 main_gate ( .A(net66), .B(net60), .Y(net62) );
  inv_x1 U2 ( .A(net60), .Y(n1) );
endmodule


module dvs_aer_to_event_interface ( clk, rst_n, aer, xsel, req, fifo_grant, 
        time_us, ack, fifo_req, fifo_wr_en, fifo_event );
  input [9:0] aer;
  input [44:0] time_us;
  output [63:0] fifo_event;
  input clk, rst_n, xsel, req, fifo_grant;
  output ack, fifo_req, fifo_wr_en;
  wire   event_polarity, new_event, event_filtered, n2, net72, n5, n6, n8, n9;
  wire   [8:0] event_x;
  wire   [8:0] event_y;
  wire   [44:0] event_timestamp;
  wire   [63:0] dvs_event;

  dvs_aer_receiver DVS_AER_RECEIVER_INST ( .clk(clk), .rst_n(rst_n), .aer(aer), 
        .xsel(xsel), .req(req), .time_us(time_us), .ack(ack), .event_x(event_x), .event_y(event_y), .event_timestamp(event_timestamp), .event_polarity(
        event_polarity), .new_event(new_event) );
  dvs_event_preprocessor DVS_EVENT_PREPROCESSOR_INST ( .clk(n2), .rst_n(n2), 
        .event_x(event_x), .event_y(event_y), .event_timestamp(event_timestamp), .event_polarity(event_polarity), .preprocessed_event(dvs_event), 
        .event_filtered(event_filtered) );
  SNPS_CLOCK_GATE_HIGH_dvs_aer_to_event_interface clk_gate_fifo_event_reg ( 
        .CLK(clk), .EN(fifo_grant), .ENCLK(net72) );
  ffr_x1 \fifo_event_reg[51]  ( .D(dvs_event[51]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[51]) );
  ffr_x1 \fifo_event_reg[36]  ( .D(dvs_event[36]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[36]) );
  ffr_x1 \fifo_event_reg[21]  ( .D(dvs_event[21]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[21]) );
  ffr_x1 \fifo_event_reg[6]  ( .D(dvs_event[6]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[6]) );
  ffr_x1 event_written_reg ( .D(n6), .CLK(clk), .RSTN(rst_n), .Q(n5) );
  ffr_x1 \fifo_event_reg[63]  ( .D(dvs_event[63]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[63]) );
  ffr_x1 \fifo_event_reg[62]  ( .D(dvs_event[62]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[62]) );
  ffr_x1 \fifo_event_reg[61]  ( .D(dvs_event[61]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[61]) );
  ffr_x1 \fifo_event_reg[60]  ( .D(dvs_event[60]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[60]) );
  ffr_x1 \fifo_event_reg[59]  ( .D(dvs_event[59]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[59]) );
  ffr_x1 \fifo_event_reg[58]  ( .D(dvs_event[58]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[58]) );
  ffr_x1 \fifo_event_reg[57]  ( .D(dvs_event[57]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[57]) );
  ffr_x1 \fifo_event_reg[56]  ( .D(dvs_event[56]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[56]) );
  ffr_x1 \fifo_event_reg[55]  ( .D(dvs_event[55]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[55]) );
  ffr_x1 \fifo_event_reg[54]  ( .D(dvs_event[54]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[54]) );
  ffr_x1 \fifo_event_reg[53]  ( .D(dvs_event[53]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[53]) );
  ffr_x1 \fifo_event_reg[52]  ( .D(dvs_event[52]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[52]) );
  ffr_x1 \fifo_event_reg[50]  ( .D(dvs_event[50]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[50]) );
  ffr_x1 \fifo_event_reg[49]  ( .D(dvs_event[49]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[49]) );
  ffr_x1 \fifo_event_reg[48]  ( .D(dvs_event[48]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[48]) );
  ffr_x1 \fifo_event_reg[47]  ( .D(dvs_event[47]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[47]) );
  ffr_x1 \fifo_event_reg[46]  ( .D(dvs_event[46]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[46]) );
  ffr_x1 \fifo_event_reg[45]  ( .D(dvs_event[45]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[45]) );
  ffr_x1 \fifo_event_reg[44]  ( .D(dvs_event[44]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[44]) );
  ffr_x1 \fifo_event_reg[43]  ( .D(dvs_event[43]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[43]) );
  ffr_x1 \fifo_event_reg[42]  ( .D(dvs_event[42]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[42]) );
  ffr_x1 \fifo_event_reg[41]  ( .D(dvs_event[41]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[41]) );
  ffr_x1 \fifo_event_reg[40]  ( .D(dvs_event[40]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[40]) );
  ffr_x1 \fifo_event_reg[39]  ( .D(dvs_event[39]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[39]) );
  ffr_x1 \fifo_event_reg[38]  ( .D(dvs_event[38]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[38]) );
  ffr_x1 \fifo_event_reg[37]  ( .D(dvs_event[37]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[37]) );
  ffr_x1 \fifo_event_reg[35]  ( .D(dvs_event[35]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[35]) );
  ffr_x1 \fifo_event_reg[34]  ( .D(dvs_event[34]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[34]) );
  ffr_x1 \fifo_event_reg[33]  ( .D(dvs_event[33]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[33]) );
  ffr_x1 \fifo_event_reg[32]  ( .D(dvs_event[32]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[32]) );
  ffr_x1 \fifo_event_reg[31]  ( .D(dvs_event[31]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[31]) );
  ffr_x1 \fifo_event_reg[30]  ( .D(dvs_event[30]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[30]) );
  ffr_x1 \fifo_event_reg[29]  ( .D(dvs_event[29]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[29]) );
  ffr_x1 \fifo_event_reg[28]  ( .D(dvs_event[28]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[28]) );
  ffr_x1 \fifo_event_reg[27]  ( .D(dvs_event[27]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[27]) );
  ffr_x1 \fifo_event_reg[26]  ( .D(dvs_event[26]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[26]) );
  ffr_x1 \fifo_event_reg[25]  ( .D(dvs_event[25]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[25]) );
  ffr_x1 \fifo_event_reg[24]  ( .D(dvs_event[24]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[24]) );
  ffr_x1 \fifo_event_reg[23]  ( .D(dvs_event[23]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[23]) );
  ffr_x1 \fifo_event_reg[22]  ( .D(dvs_event[22]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[22]) );
  ffr_x1 \fifo_event_reg[20]  ( .D(dvs_event[20]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[20]) );
  ffr_x1 \fifo_event_reg[19]  ( .D(dvs_event[19]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[19]) );
  ffr_x1 \fifo_event_reg[18]  ( .D(dvs_event[18]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[18]) );
  ffr_x1 \fifo_event_reg[17]  ( .D(dvs_event[17]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[17]) );
  ffr_x1 \fifo_event_reg[16]  ( .D(dvs_event[16]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[16]) );
  ffr_x1 \fifo_event_reg[15]  ( .D(dvs_event[15]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[15]) );
  ffr_x1 \fifo_event_reg[14]  ( .D(dvs_event[14]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[14]) );
  ffr_x1 \fifo_event_reg[13]  ( .D(dvs_event[13]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[13]) );
  ffr_x1 \fifo_event_reg[12]  ( .D(dvs_event[12]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[12]) );
  ffr_x1 \fifo_event_reg[11]  ( .D(dvs_event[11]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[11]) );
  ffr_x1 \fifo_event_reg[10]  ( .D(dvs_event[10]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[10]) );
  ffr_x1 \fifo_event_reg[9]  ( .D(dvs_event[9]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[9]) );
  ffr_x1 \fifo_event_reg[8]  ( .D(dvs_event[8]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[8]) );
  ffr_x1 \fifo_event_reg[7]  ( .D(dvs_event[7]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[7]) );
  ffr_x1 \fifo_event_reg[5]  ( .D(dvs_event[5]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[5]) );
  ffr_x1 \fifo_event_reg[4]  ( .D(dvs_event[4]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[4]) );
  ffr_x1 \fifo_event_reg[3]  ( .D(dvs_event[3]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[3]) );
  ffr_x1 \fifo_event_reg[2]  ( .D(dvs_event[2]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[2]) );
  ffr_x1 \fifo_event_reg[1]  ( .D(dvs_event[1]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[1]) );
  ffr_x1 \fifo_event_reg[0]  ( .D(dvs_event[0]), .CLK(net72), .RSTN(rst_n), 
        .Q(fifo_event[0]) );
  ffr_x1 fifo_wr_en_reg ( .D(fifo_grant), .CLK(clk), .RSTN(rst_n), .Q(
        fifo_wr_en) );
  nor2_x1 U8 ( .A(n9), .B(event_filtered), .Y(fifo_req) );
  tielo U9 ( .L(n2) );
  inv_x1 U10 ( .A(n5), .Y(n9) );
  inv_x1 U11 ( .A(new_event), .Y(n8) );
  oai21_x1 U12 ( .A0(n9), .A1(fifo_grant), .B0(n8), .Y(n6) );
endmodule


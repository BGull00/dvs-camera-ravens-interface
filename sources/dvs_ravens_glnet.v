/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Sun May  5 23:58:06 2024
/////////////////////////////////////////////////////////////


module sram_compiled_array ( addr0, addr1, addr2, addr3, addr4, addr5, addr6, 
        addr7, addr8, addr9, din0, din1, din2, din3, din4, din5, din6, din7, 
        din8, din9, din10, din11, din12, din13, din14, din15, din16, din17, 
        din18, din19, din20, din21, din22, din23, din24, din25, din26, din27, 
        din28, din29, din30, din31, din32, din33, din34, din35, din36, din37, 
        din38, din39, din40, din41, din42, din43, din44, din45, din46, din47, 
        din48, din49, din50, din51, din52, din53, din54, din55, din56, din57, 
        din58, din59, din60, din61, din62, din63, dout0, dout1, dout2, dout3, 
        dout4, dout5, dout6, dout7, dout8, dout9, dout10, dout11, dout12, 
        dout13, dout14, dout15, dout16, dout17, dout18, dout19, dout20, dout21, 
        dout22, dout23, dout24, dout25, dout26, dout27, dout28, dout29, dout30, 
        dout31, dout32, dout33, dout34, dout35, dout36, dout37, dout38, dout39, 
        dout40, dout41, dout42, dout43, dout44, dout45, dout46, dout47, dout48, 
        dout49, dout50, dout51, dout52, dout53, dout54, dout55, dout56, dout57, 
        dout58, dout59, dout60, dout61, dout62, dout63, clk, write_en, 
        sense_en );
  input addr0, addr1, addr2, addr3, addr4, addr5, addr6, addr7, addr8, addr9,
         din0, din1, din2, din3, din4, din5, din6, din7, din8, din9, din10,
         din11, din12, din13, din14, din15, din16, din17, din18, din19, din20,
         din21, din22, din23, din24, din25, din26, din27, din28, din29, din30,
         din31, din32, din33, din34, din35, din36, din37, din38, din39, din40,
         din41, din42, din43, din44, din45, din46, din47, din48, din49, din50,
         din51, din52, din53, din54, din55, din56, din57, din58, din59, din60,
         din61, din62, din63, clk, write_en, sense_en;
  output dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7, dout8, dout9,
         dout10, dout11, dout12, dout13, dout14, dout15, dout16, dout17,
         dout18, dout19, dout20, dout21, dout22, dout23, dout24, dout25,
         dout26, dout27, dout28, dout29, dout30, dout31, dout32, dout33,
         dout34, dout35, dout36, dout37, dout38, dout39, dout40, dout41,
         dout42, dout43, dout44, dout45, dout46, dout47, dout48, dout49,
         dout50, dout51, dout52, dout53, dout54, dout55, dout56, dout57,
         dout58, dout59, dout60, dout61, dout62, dout63;


endmodule


module dvs_ravens_arbiter ( req_m1, req_m2, fifo_empty, fifo_full, grant_m1, 
        grant_m2 );
  input req_m1, req_m2, fifo_empty, fifo_full;
  output grant_m1, grant_m2;


  nor2b_x1 U1 ( .AN(req_m1), .B(fifo_full), .Y(grant_m1) );
  nor3b_x1 U2 ( .AN(req_m2), .B(fifo_empty), .C(req_m1), .Y(grant_m2) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net281, net283, net284, net287, n1;
  assign net281 = CLK;
  assign ENCLK = net283;
  assign net284 = EN;

  latchgd_x1 latch ( .G(n1), .D(net284), .Q(net287) );
  and2_x2 main_gate ( .A(net287), .B(net281), .Y(net283) );
  inv_x1 U2 ( .A(net281), .Y(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net281, net283, net284, net287, n2;
  assign net281 = CLK;
  assign ENCLK = net283;
  assign net284 = EN;

  latchgd_x1 latch ( .G(n2), .D(net284), .Q(net287) );
  and2_x2 main_gate ( .A(net287), .B(net281), .Y(net283) );
  inv_x1 U2 ( .A(net281), .Y(n2) );
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
         N18, N19, net293, net298, n16, n18, n19, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n17;
  wire   [9:0] aer_mid_sync;
  wire   [9:0] aer_synced;
  wire   [1:0] cur_fsm_state;
  wire   [2:0] req_count;
  wire   [8:0] y_addr;
  wire   [44:0] timestamp_us;
  assign ack = cur_fsm_state[1];

  SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_0 clk_gate_y_addr_reg ( .CLK(clk), 
        .EN(N19), .ENCLK(net293) );
  SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_1 clk_gate_event_x_reg ( .CLK(clk), 
        .EN(N18), .ENCLK(net298) );
  ffrs_x1 \req_count_reg[0]  ( .D(N15), .CLK(clk), .RSTN(n16), .SETN(rst_n), 
        .Q(req_count[0]) );
  ffrs_x1 \req_count_reg[1]  ( .D(N16), .CLK(clk), .RSTN(n16), .SETN(rst_n), 
        .Q(req_count[1]) );
  ffr_x1 \aer_mid_sync_reg[1]  ( .D(aer[1]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[1]) );
  ffr_x1 \timestamp_us_reg[43]  ( .D(time_us[43]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[43]) );
  ffr_x1 \timestamp_us_reg[28]  ( .D(time_us[28]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[28]) );
  ffr_x1 \timestamp_us_reg[13]  ( .D(time_us[13]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[13]) );
  ffr_x1 \event_x_reg[7]  ( .D(aer_synced[8]), .CLK(net298), .RSTN(rst_n), .Q(
        event_x[7]) );
  ffr_x1 \event_y_reg[1]  ( .D(y_addr[1]), .CLK(net298), .RSTN(rst_n), .Q(
        event_y[1]) );
  ffr_x1 \event_timestamp_reg[31]  ( .D(timestamp_us[31]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[31]) );
  ffr_x1 \event_timestamp_reg[16]  ( .D(timestamp_us[16]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[16]) );
  ffr_x1 \event_timestamp_reg[1]  ( .D(timestamp_us[1]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[1]) );
  ffr_x1 \req_count_reg[2]  ( .D(N17), .CLK(clk), .RSTN(rst_n), .Q(
        req_count[2]) );
  ffr_x1 \cur_fsm_state_reg[1]  ( .D(n18), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[1]) );
  ffr_x1 \y_addr_reg[8]  ( .D(aer_synced[8]), .CLK(net293), .RSTN(rst_n), .Q(
        y_addr[8]) );
  ffr_x1 \y_addr_reg[7]  ( .D(aer_synced[7]), .CLK(net293), .RSTN(rst_n), .Q(
        y_addr[7]) );
  ffr_x1 \y_addr_reg[6]  ( .D(aer_synced[6]), .CLK(net293), .RSTN(rst_n), .Q(
        y_addr[6]) );
  ffr_x1 \y_addr_reg[5]  ( .D(aer_synced[5]), .CLK(net293), .RSTN(rst_n), .Q(
        y_addr[5]) );
  ffr_x1 \y_addr_reg[4]  ( .D(aer_synced[4]), .CLK(net293), .RSTN(rst_n), .Q(
        y_addr[4]) );
  ffr_x1 \y_addr_reg[3]  ( .D(aer_synced[3]), .CLK(net293), .RSTN(rst_n), .Q(
        y_addr[3]) );
  ffr_x1 \y_addr_reg[2]  ( .D(aer_synced[2]), .CLK(net293), .RSTN(rst_n), .Q(
        y_addr[2]) );
  ffr_x1 \y_addr_reg[1]  ( .D(aer_synced[1]), .CLK(net293), .RSTN(rst_n), .Q(
        y_addr[1]) );
  ffr_x1 \y_addr_reg[0]  ( .D(aer_synced[0]), .CLK(net293), .RSTN(rst_n), .Q(
        y_addr[0]) );
  ffr_x1 \timestamp_us_reg[44]  ( .D(time_us[44]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[44]) );
  ffr_x1 \timestamp_us_reg[42]  ( .D(time_us[42]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[42]) );
  ffr_x1 \timestamp_us_reg[41]  ( .D(time_us[41]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[41]) );
  ffr_x1 \timestamp_us_reg[40]  ( .D(time_us[40]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[40]) );
  ffr_x1 \timestamp_us_reg[39]  ( .D(time_us[39]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[39]) );
  ffr_x1 \timestamp_us_reg[38]  ( .D(time_us[38]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[38]) );
  ffr_x1 \timestamp_us_reg[37]  ( .D(time_us[37]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[37]) );
  ffr_x1 \timestamp_us_reg[36]  ( .D(time_us[36]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[36]) );
  ffr_x1 \timestamp_us_reg[35]  ( .D(time_us[35]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[35]) );
  ffr_x1 \timestamp_us_reg[34]  ( .D(time_us[34]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[34]) );
  ffr_x1 \timestamp_us_reg[33]  ( .D(time_us[33]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[33]) );
  ffr_x1 \timestamp_us_reg[32]  ( .D(time_us[32]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[32]) );
  ffr_x1 \timestamp_us_reg[31]  ( .D(time_us[31]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[31]) );
  ffr_x1 \timestamp_us_reg[30]  ( .D(time_us[30]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[30]) );
  ffr_x1 \timestamp_us_reg[29]  ( .D(time_us[29]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[29]) );
  ffr_x1 \timestamp_us_reg[27]  ( .D(time_us[27]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[27]) );
  ffr_x1 \timestamp_us_reg[26]  ( .D(time_us[26]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[26]) );
  ffr_x1 \timestamp_us_reg[25]  ( .D(time_us[25]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[25]) );
  ffr_x1 \timestamp_us_reg[24]  ( .D(time_us[24]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[24]) );
  ffr_x1 \timestamp_us_reg[23]  ( .D(time_us[23]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[23]) );
  ffr_x1 \timestamp_us_reg[22]  ( .D(time_us[22]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[22]) );
  ffr_x1 \timestamp_us_reg[21]  ( .D(time_us[21]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[21]) );
  ffr_x1 \timestamp_us_reg[20]  ( .D(time_us[20]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[20]) );
  ffr_x1 \timestamp_us_reg[19]  ( .D(time_us[19]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[19]) );
  ffr_x1 \timestamp_us_reg[18]  ( .D(time_us[18]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[18]) );
  ffr_x1 \timestamp_us_reg[17]  ( .D(time_us[17]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[17]) );
  ffr_x1 \timestamp_us_reg[16]  ( .D(time_us[16]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[16]) );
  ffr_x1 \timestamp_us_reg[15]  ( .D(time_us[15]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[15]) );
  ffr_x1 \timestamp_us_reg[14]  ( .D(time_us[14]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[14]) );
  ffr_x1 \timestamp_us_reg[12]  ( .D(time_us[12]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[12]) );
  ffr_x1 \timestamp_us_reg[11]  ( .D(time_us[11]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[11]) );
  ffr_x1 \timestamp_us_reg[10]  ( .D(time_us[10]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[10]) );
  ffr_x1 \timestamp_us_reg[9]  ( .D(time_us[9]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[9]) );
  ffr_x1 \timestamp_us_reg[8]  ( .D(time_us[8]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[8]) );
  ffr_x1 \timestamp_us_reg[7]  ( .D(time_us[7]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[7]) );
  ffr_x1 \timestamp_us_reg[6]  ( .D(time_us[6]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[6]) );
  ffr_x1 \timestamp_us_reg[5]  ( .D(time_us[5]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[5]) );
  ffr_x1 \timestamp_us_reg[4]  ( .D(time_us[4]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[4]) );
  ffr_x1 \timestamp_us_reg[3]  ( .D(time_us[3]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[3]) );
  ffr_x1 \timestamp_us_reg[2]  ( .D(time_us[2]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[2]) );
  ffr_x1 \timestamp_us_reg[1]  ( .D(time_us[1]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[1]) );
  ffr_x1 \timestamp_us_reg[0]  ( .D(time_us[0]), .CLK(net293), .RSTN(rst_n), 
        .Q(timestamp_us[0]) );
  ffr_x1 \event_x_reg[8]  ( .D(aer_synced[9]), .CLK(net298), .RSTN(rst_n), .Q(
        event_x[8]) );
  ffr_x1 \event_x_reg[6]  ( .D(aer_synced[7]), .CLK(net298), .RSTN(rst_n), .Q(
        event_x[6]) );
  ffr_x1 \event_x_reg[5]  ( .D(aer_synced[6]), .CLK(net298), .RSTN(rst_n), .Q(
        event_x[5]) );
  ffr_x1 \event_x_reg[4]  ( .D(aer_synced[5]), .CLK(net298), .RSTN(rst_n), .Q(
        event_x[4]) );
  ffr_x1 \event_x_reg[3]  ( .D(aer_synced[4]), .CLK(net298), .RSTN(rst_n), .Q(
        event_x[3]) );
  ffr_x1 \event_x_reg[2]  ( .D(aer_synced[3]), .CLK(net298), .RSTN(rst_n), .Q(
        event_x[2]) );
  ffr_x1 \event_x_reg[1]  ( .D(aer_synced[2]), .CLK(net298), .RSTN(rst_n), .Q(
        event_x[1]) );
  ffr_x1 \event_x_reg[0]  ( .D(aer_synced[1]), .CLK(net298), .RSTN(rst_n), .Q(
        event_x[0]) );
  ffr_x1 \event_y_reg[8]  ( .D(y_addr[8]), .CLK(net298), .RSTN(rst_n), .Q(
        event_y[8]) );
  ffr_x1 \event_y_reg[7]  ( .D(y_addr[7]), .CLK(net298), .RSTN(rst_n), .Q(
        event_y[7]) );
  ffr_x1 \event_y_reg[6]  ( .D(y_addr[6]), .CLK(net298), .RSTN(rst_n), .Q(
        event_y[6]) );
  ffr_x1 \event_y_reg[5]  ( .D(y_addr[5]), .CLK(net298), .RSTN(rst_n), .Q(
        event_y[5]) );
  ffr_x1 \event_y_reg[4]  ( .D(y_addr[4]), .CLK(net298), .RSTN(rst_n), .Q(
        event_y[4]) );
  ffr_x1 \event_y_reg[3]  ( .D(y_addr[3]), .CLK(net298), .RSTN(rst_n), .Q(
        event_y[3]) );
  ffr_x1 \event_y_reg[2]  ( .D(y_addr[2]), .CLK(net298), .RSTN(rst_n), .Q(
        event_y[2]) );
  ffr_x1 \event_y_reg[0]  ( .D(y_addr[0]), .CLK(net298), .RSTN(rst_n), .Q(
        event_y[0]) );
  ffr_x1 \event_timestamp_reg[44]  ( .D(timestamp_us[44]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[44]) );
  ffr_x1 \event_timestamp_reg[43]  ( .D(timestamp_us[43]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[43]) );
  ffr_x1 \event_timestamp_reg[42]  ( .D(timestamp_us[42]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[42]) );
  ffr_x1 \event_timestamp_reg[41]  ( .D(timestamp_us[41]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[41]) );
  ffr_x1 \event_timestamp_reg[40]  ( .D(timestamp_us[40]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[40]) );
  ffr_x1 \event_timestamp_reg[39]  ( .D(timestamp_us[39]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[39]) );
  ffr_x1 \event_timestamp_reg[38]  ( .D(timestamp_us[38]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[38]) );
  ffr_x1 \event_timestamp_reg[37]  ( .D(timestamp_us[37]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[37]) );
  ffr_x1 \event_timestamp_reg[36]  ( .D(timestamp_us[36]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[36]) );
  ffr_x1 \event_timestamp_reg[35]  ( .D(timestamp_us[35]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[35]) );
  ffr_x1 \event_timestamp_reg[34]  ( .D(timestamp_us[34]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[34]) );
  ffr_x1 \event_timestamp_reg[33]  ( .D(timestamp_us[33]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[33]) );
  ffr_x1 \event_timestamp_reg[32]  ( .D(timestamp_us[32]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[32]) );
  ffr_x1 \event_timestamp_reg[30]  ( .D(timestamp_us[30]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[30]) );
  ffr_x1 \event_timestamp_reg[29]  ( .D(timestamp_us[29]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[29]) );
  ffr_x1 \event_timestamp_reg[28]  ( .D(timestamp_us[28]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[28]) );
  ffr_x1 \event_timestamp_reg[27]  ( .D(timestamp_us[27]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[27]) );
  ffr_x1 \event_timestamp_reg[26]  ( .D(timestamp_us[26]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[26]) );
  ffr_x1 \event_timestamp_reg[25]  ( .D(timestamp_us[25]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[25]) );
  ffr_x1 \event_timestamp_reg[24]  ( .D(timestamp_us[24]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[24]) );
  ffr_x1 \event_timestamp_reg[23]  ( .D(timestamp_us[23]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[23]) );
  ffr_x1 \event_timestamp_reg[22]  ( .D(timestamp_us[22]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[22]) );
  ffr_x1 \event_timestamp_reg[21]  ( .D(timestamp_us[21]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[21]) );
  ffr_x1 \event_timestamp_reg[20]  ( .D(timestamp_us[20]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[20]) );
  ffr_x1 \event_timestamp_reg[19]  ( .D(timestamp_us[19]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[19]) );
  ffr_x1 \event_timestamp_reg[18]  ( .D(timestamp_us[18]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[18]) );
  ffr_x1 \event_timestamp_reg[17]  ( .D(timestamp_us[17]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[17]) );
  ffr_x1 \event_timestamp_reg[15]  ( .D(timestamp_us[15]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[15]) );
  ffr_x1 \event_timestamp_reg[14]  ( .D(timestamp_us[14]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[14]) );
  ffr_x1 \event_timestamp_reg[13]  ( .D(timestamp_us[13]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[13]) );
  ffr_x1 \event_timestamp_reg[12]  ( .D(timestamp_us[12]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[12]) );
  ffr_x1 \event_timestamp_reg[11]  ( .D(timestamp_us[11]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[11]) );
  ffr_x1 \event_timestamp_reg[10]  ( .D(timestamp_us[10]), .CLK(net298), 
        .RSTN(rst_n), .Q(event_timestamp[10]) );
  ffr_x1 \event_timestamp_reg[9]  ( .D(timestamp_us[9]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[9]) );
  ffr_x1 \event_timestamp_reg[8]  ( .D(timestamp_us[8]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[8]) );
  ffr_x1 \event_timestamp_reg[7]  ( .D(timestamp_us[7]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[7]) );
  ffr_x1 \event_timestamp_reg[6]  ( .D(timestamp_us[6]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[6]) );
  ffr_x1 \event_timestamp_reg[5]  ( .D(timestamp_us[5]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[5]) );
  ffr_x1 \event_timestamp_reg[4]  ( .D(timestamp_us[4]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[4]) );
  ffr_x1 \event_timestamp_reg[3]  ( .D(timestamp_us[3]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[3]) );
  ffr_x1 \event_timestamp_reg[2]  ( .D(timestamp_us[2]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[2]) );
  ffr_x1 \event_timestamp_reg[0]  ( .D(timestamp_us[0]), .CLK(net298), .RSTN(
        rst_n), .Q(event_timestamp[0]) );
  ffr_x1 event_polarity_reg ( .D(aer_synced[0]), .CLK(net298), .RSTN(rst_n), 
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
  ffrhq_x1 \cur_fsm_state_reg[0]  ( .D(n19), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[0]) );
  ffrhq_x1 new_event_reg ( .D(N18), .CLK(clk), .RSTN(rst_n), .Q(new_event) );
  ffrhq_x1 xsel_synced_reg ( .D(xsel_mid_sync), .CLK(clk), .RSTN(rst_n), .Q(
        xsel_synced) );
  tiehi U3 ( .H(n16) );
  inv_x1 U4 ( .A(cur_fsm_state[0]), .Y(n4) );
  nor2_x1 U5 ( .A(cur_fsm_state[1]), .B(n4), .Y(n8) );
  nand2_x1 U6 ( .A(n8), .B(req_count[0]), .Y(N15) );
  nor2_x1 U7 ( .A(req_count[1]), .B(req_count[0]), .Y(n10) );
  aoi21_x1 U8 ( .A0(req_count[1]), .A1(req_count[0]), .B0(n10), .Y(n1) );
  nand2_x1 U9 ( .A(n8), .B(n1), .Y(N16) );
  inv_x1 U10 ( .A(xsel_synced), .Y(n15) );
  or2_x1 U11 ( .A(req_count[2]), .B(req_count[1]), .Y(n6) );
  aoi21_x1 U12 ( .A0(n6), .A1(cur_fsm_state[0]), .B0(cur_fsm_state[1]), .Y(n2)
         );
  oai21_x1 U13 ( .A0(cur_fsm_state[0]), .A1(req_synced), .B0(n2), .Y(n3) );
  nor2_x1 U14 ( .A(n15), .B(n3), .Y(N18) );
  inv_x1 U15 ( .A(n8), .Y(n11) );
  nor3_x1 U16 ( .A(xsel_synced), .B(n6), .C(n11), .Y(N19) );
  nand2_x1 U17 ( .A(req_synced), .B(n4), .Y(n17) );
  oai21_x1 U18 ( .A0(n4), .A1(req_synced), .B0(cur_fsm_state[1]), .Y(n5) );
  inv_x1 U19 ( .A(n5), .Y(n13) );
  aoi21_x1 U20 ( .A0(n8), .A1(n6), .B0(n13), .Y(n7) );
  oai21_x1 U21 ( .A0(xsel_synced), .A1(n17), .B0(n7), .Y(n19) );
  oai21_x1 U22 ( .A0(req_count[2]), .A1(n10), .B0(n8), .Y(n9) );
  aoi21_x1 U23 ( .A0(req_count[2]), .A1(n10), .B0(n9), .Y(N17) );
  nor3_x1 U24 ( .A(req_count[2]), .B(req_count[1]), .C(n11), .Y(n12) );
  nor2_x1 U25 ( .A(n13), .B(n12), .Y(n14) );
  oai21_x1 U26 ( .A0(n17), .A1(n15), .B0(n14), .Y(n18) );
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
  and2_x1 U5 ( .A(event_timestamp[27]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[27]) );
  and2_x1 U6 ( .A(event_timestamp[14]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[14]) );
  and2_x1 U7 ( .A(event_timestamp[28]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[28]) );
  and2_x1 U8 ( .A(event_timestamp[11]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[11]) );
  and2_x1 U9 ( .A(event_timestamp[13]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[13]) );
  and2_x1 U10 ( .A(event_timestamp[31]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[31]) );
  and2_x1 U11 ( .A(event_timestamp[24]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[24]) );
  and2_x1 U12 ( .A(event_timestamp[23]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[23]) );
  and2_x1 U13 ( .A(event_timestamp[22]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[22]) );
  and2_x1 U14 ( .A(event_timestamp[12]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[12]) );
  and2_x1 U15 ( .A(event_timestamp[32]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[32]) );
  and2_x1 U16 ( .A(event_timestamp[10]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[10]) );
  and2_x1 U17 ( .A(event_timestamp[33]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[33]) );
  and2_x1 U18 ( .A(event_timestamp[4]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[4]) );
  and2_x1 U19 ( .A(event_timestamp[3]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[3]) );
  and2_x1 U20 ( .A(event_timestamp[34]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[34]) );
  and2_x1 U21 ( .A(event_timestamp[2]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[2]) );
  and2_x1 U22 ( .A(event_timestamp[1]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[1]) );
  and2_x1 U23 ( .A(event_timestamp[0]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[0]) );
  and2_x1 U24 ( .A(event_timestamp[35]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[35]) );
  and2_x1 U25 ( .A(event_timestamp[36]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[36]) );
  and2_x1 U26 ( .A(event_timestamp[30]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[30]) );
  and2_x1 U27 ( .A(event_timestamp[29]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[29]) );
  and2_x1 U28 ( .A(event_timestamp[39]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[39]) );
  and2_x1 U29 ( .A(event_timestamp[40]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[40]) );
  and2_x1 U30 ( .A(event_timestamp[26]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[26]) );
  and2_x1 U31 ( .A(event_timestamp[25]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[25]) );
  and2_x1 U32 ( .A(event_timestamp[42]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[42]) );
  and2_x1 U33 ( .A(event_timestamp[43]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[43]) );
  and2_x1 U34 ( .A(event_timestamp[44]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[44]) );
  and2_x1 U35 ( .A(event_timestamp[21]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[21]) );
  and2_x1 U36 ( .A(event_timestamp[20]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[20]) );
  and2_x1 U37 ( .A(event_timestamp[19]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[19]) );
  and2_x1 U38 ( .A(event_timestamp[18]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[18]) );
  and2_x1 U39 ( .A(event_timestamp[17]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[17]) );
  and2_x1 U40 ( .A(event_timestamp[16]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[16]) );
  and2_x1 U41 ( .A(event_timestamp[15]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[15]) );
  and2_x1 U42 ( .A(event_y[0]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[46]) );
  and2_x1 U43 ( .A(event_y[1]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[47]) );
  and2_x1 U44 ( .A(event_timestamp[9]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[9]) );
  and2_x1 U45 ( .A(event_timestamp[8]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[8]) );
  and2_x1 U46 ( .A(event_timestamp[7]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[7]) );
  and2_x1 U47 ( .A(event_timestamp[6]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[6]) );
  and2_x1 U48 ( .A(event_timestamp[5]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[5]) );
  and2_x1 U49 ( .A(event_y[7]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[53]) );
  and2_x1 U50 ( .A(event_x[0]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[55]) );
  and2_x1 U51 ( .A(event_x[1]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[56]) );
  and2_x1 U52 ( .A(event_x[2]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[57]) );
  and2_x1 U53 ( .A(event_x[3]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[58]) );
  and2_x1 U54 ( .A(event_x[4]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[59]) );
  and2_x1 U55 ( .A(event_x[5]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[60]) );
  and2_x1 U56 ( .A(event_x[6]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[61]) );
  and2_x1 U57 ( .A(event_timestamp[37]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[37]) );
  and2_x1 U58 ( .A(event_timestamp[38]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[38]) );
  and2_x1 U59 ( .A(event_timestamp[41]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[41]) );
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
  wire   net266, net268, net269, net272, n1;
  assign net266 = CLK;
  assign ENCLK = net268;
  assign net269 = EN;

  latchgd_x1 latch ( .G(n1), .D(net269), .Q(net272) );
  and2_x2 main_gate ( .A(net272), .B(net266), .Y(net268) );
  inv_x1 U2 ( .A(net266), .Y(n1) );
endmodule


module dvs_aer_to_event_interface ( clk, rst_n, aer, xsel, req, fifo_grant, 
        time_us, ack, fifo_req, fifo_wr_en, fifo_event );
  input [9:0] aer;
  input [44:0] time_us;
  output [63:0] fifo_event;
  input clk, rst_n, xsel, req, fifo_grant;
  output ack, fifo_req, fifo_wr_en;
  wire   event_polarity, new_event, event_filtered, n2, net278, n5, n6, n3, n4
;
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
        .CLK(clk), .EN(fifo_grant), .ENCLK(net278) );
  ffr_x1 \fifo_event_reg[51]  ( .D(dvs_event[51]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[51]) );
  ffr_x1 \fifo_event_reg[36]  ( .D(dvs_event[36]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[36]) );
  ffr_x1 \fifo_event_reg[21]  ( .D(dvs_event[21]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[21]) );
  ffr_x1 \fifo_event_reg[6]  ( .D(dvs_event[6]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[6]) );
  ffr_x1 event_written_reg ( .D(n6), .CLK(clk), .RSTN(rst_n), .Q(n5) );
  ffr_x1 fifo_wr_en_reg ( .D(fifo_grant), .CLK(clk), .RSTN(rst_n), .Q(
        fifo_wr_en) );
  ffr_x1 \fifo_event_reg[63]  ( .D(dvs_event[63]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[63]) );
  ffr_x1 \fifo_event_reg[62]  ( .D(dvs_event[62]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[62]) );
  ffr_x1 \fifo_event_reg[61]  ( .D(dvs_event[61]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[61]) );
  ffr_x1 \fifo_event_reg[60]  ( .D(dvs_event[60]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[60]) );
  ffr_x1 \fifo_event_reg[59]  ( .D(dvs_event[59]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[59]) );
  ffr_x1 \fifo_event_reg[58]  ( .D(dvs_event[58]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[58]) );
  ffr_x1 \fifo_event_reg[57]  ( .D(dvs_event[57]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[57]) );
  ffr_x1 \fifo_event_reg[56]  ( .D(dvs_event[56]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[56]) );
  ffr_x1 \fifo_event_reg[55]  ( .D(dvs_event[55]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[55]) );
  ffr_x1 \fifo_event_reg[54]  ( .D(dvs_event[54]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[54]) );
  ffr_x1 \fifo_event_reg[53]  ( .D(dvs_event[53]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[53]) );
  ffr_x1 \fifo_event_reg[52]  ( .D(dvs_event[52]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[52]) );
  ffr_x1 \fifo_event_reg[50]  ( .D(dvs_event[50]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[50]) );
  ffr_x1 \fifo_event_reg[49]  ( .D(dvs_event[49]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[49]) );
  ffr_x1 \fifo_event_reg[48]  ( .D(dvs_event[48]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[48]) );
  ffr_x1 \fifo_event_reg[47]  ( .D(dvs_event[47]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[47]) );
  ffr_x1 \fifo_event_reg[46]  ( .D(dvs_event[46]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[46]) );
  ffr_x1 \fifo_event_reg[45]  ( .D(dvs_event[45]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[45]) );
  ffr_x1 \fifo_event_reg[44]  ( .D(dvs_event[44]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[44]) );
  ffr_x1 \fifo_event_reg[43]  ( .D(dvs_event[43]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[43]) );
  ffr_x1 \fifo_event_reg[42]  ( .D(dvs_event[42]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[42]) );
  ffr_x1 \fifo_event_reg[41]  ( .D(dvs_event[41]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[41]) );
  ffr_x1 \fifo_event_reg[40]  ( .D(dvs_event[40]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[40]) );
  ffr_x1 \fifo_event_reg[39]  ( .D(dvs_event[39]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[39]) );
  ffr_x1 \fifo_event_reg[38]  ( .D(dvs_event[38]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[38]) );
  ffr_x1 \fifo_event_reg[37]  ( .D(dvs_event[37]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[37]) );
  ffr_x1 \fifo_event_reg[35]  ( .D(dvs_event[35]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[35]) );
  ffr_x1 \fifo_event_reg[34]  ( .D(dvs_event[34]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[34]) );
  ffr_x1 \fifo_event_reg[33]  ( .D(dvs_event[33]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[33]) );
  ffr_x1 \fifo_event_reg[32]  ( .D(dvs_event[32]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[32]) );
  ffr_x1 \fifo_event_reg[31]  ( .D(dvs_event[31]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[31]) );
  ffr_x1 \fifo_event_reg[30]  ( .D(dvs_event[30]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[30]) );
  ffr_x1 \fifo_event_reg[29]  ( .D(dvs_event[29]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[29]) );
  ffr_x1 \fifo_event_reg[28]  ( .D(dvs_event[28]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[28]) );
  ffr_x1 \fifo_event_reg[27]  ( .D(dvs_event[27]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[27]) );
  ffr_x1 \fifo_event_reg[26]  ( .D(dvs_event[26]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[26]) );
  ffr_x1 \fifo_event_reg[25]  ( .D(dvs_event[25]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[25]) );
  ffr_x1 \fifo_event_reg[24]  ( .D(dvs_event[24]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[24]) );
  ffr_x1 \fifo_event_reg[23]  ( .D(dvs_event[23]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[23]) );
  ffr_x1 \fifo_event_reg[22]  ( .D(dvs_event[22]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[22]) );
  ffr_x1 \fifo_event_reg[20]  ( .D(dvs_event[20]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[20]) );
  ffr_x1 \fifo_event_reg[19]  ( .D(dvs_event[19]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[19]) );
  ffr_x1 \fifo_event_reg[18]  ( .D(dvs_event[18]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[18]) );
  ffr_x1 \fifo_event_reg[17]  ( .D(dvs_event[17]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[17]) );
  ffr_x1 \fifo_event_reg[16]  ( .D(dvs_event[16]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[16]) );
  ffr_x1 \fifo_event_reg[15]  ( .D(dvs_event[15]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[15]) );
  ffr_x1 \fifo_event_reg[14]  ( .D(dvs_event[14]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[14]) );
  ffr_x1 \fifo_event_reg[13]  ( .D(dvs_event[13]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[13]) );
  ffr_x1 \fifo_event_reg[12]  ( .D(dvs_event[12]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[12]) );
  ffr_x1 \fifo_event_reg[11]  ( .D(dvs_event[11]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[11]) );
  ffr_x1 \fifo_event_reg[10]  ( .D(dvs_event[10]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[10]) );
  ffr_x1 \fifo_event_reg[9]  ( .D(dvs_event[9]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[9]) );
  ffr_x1 \fifo_event_reg[8]  ( .D(dvs_event[8]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[8]) );
  ffr_x1 \fifo_event_reg[7]  ( .D(dvs_event[7]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[7]) );
  ffr_x1 \fifo_event_reg[5]  ( .D(dvs_event[5]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[5]) );
  ffr_x1 \fifo_event_reg[4]  ( .D(dvs_event[4]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[4]) );
  ffr_x1 \fifo_event_reg[3]  ( .D(dvs_event[3]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[3]) );
  ffr_x1 \fifo_event_reg[2]  ( .D(dvs_event[2]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[2]) );
  ffr_x1 \fifo_event_reg[1]  ( .D(dvs_event[1]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[1]) );
  ffr_x1 \fifo_event_reg[0]  ( .D(dvs_event[0]), .CLK(net278), .RSTN(rst_n), 
        .Q(fifo_event[0]) );
  tielo U3 ( .L(n2) );
  inv_x1 U4 ( .A(n5), .Y(n4) );
  nor2_x1 U5 ( .A(n4), .B(event_filtered), .Y(fifo_req) );
  inv_x1 U6 ( .A(new_event), .Y(n3) );
  oai21_x1 U7 ( .A0(n4), .A1(fifo_grant), .B0(n3), .Y(n6) );
endmodule


module timer_us ( clk, rst_n, time_us );
  output [44:0] time_us;
  input clk, rst_n;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45,
         N46, N47, N48, N49, N50, N51, N52,
         \div_2/u_div/DP_OP_70_127_3758/n1703 , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941,
         n942, n943, n944, n945, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n955, n956, n957, n958, n959, n960, n961, n962, n963,
         n964, n965, n966, n967, n968, n969, n970, n971, n972, n973, n974,
         n975, n976, n977, n978, n979, n980, n981, n982, n983, n984, n985,
         n986, n987, n988, n989, n990, n991, n992, n993, n994, n995, n996,
         n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
         n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036,
         n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046,
         n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056,
         n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066,
         n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076,
         n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086,
         n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096,
         n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106,
         n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196,
         n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206,
         n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216,
         n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226,
         n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236,
         n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246,
         n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256,
         n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266,
         n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276,
         n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286,
         n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296,
         n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306,
         n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316,
         n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326,
         n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336,
         n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346,
         n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356,
         n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366,
         n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376,
         n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1386,
         n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396,
         n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406,
         n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416,
         n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426,
         n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436,
         n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445, n1446,
         n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456,
         n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466,
         n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476,
         n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486,
         n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495, n1496,
         n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505, n1506,
         n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516,
         n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526,
         n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536,
         n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545, n1546,
         n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555, n1556,
         n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564, n1565, n1566,
         n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576,
         n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586,
         n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594, n1595, n1596,
         n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606,
         n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616,
         n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625, n1626,
         n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635, n1636,
         n1637, n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1645, n1646,
         n1647, n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655, n1656,
         n1657, n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665, n1666,
         n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675, n1676,
         n1677, n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685, n1686,
         n1687, n1688, n1689, n1690, n1691, n1692, n1693, n1694, n1695, n1696,
         n1697, n1698, n1699, n1700, n1701, n1702, n1703, n1704, n1705, n1706,
         n1707, n1708, n1709, n1710, n1711, n1712, n1713, n1714, n1715, n1716,
         n1717, n1718, n1719, n1720, n1721, n1722, n1723, n1724, n1725, n1726,
         n1727, n1728, n1729, n1730, n1731, n1732, n1733, n1734, n1735, n1736,
         n1737, n1738, n1739, n1740, n1741, n1742, n1743, n1744, n1745, n1746,
         n1747, n1748, n1749, n1750, n1751, n1752, n1753, n1754, n1755, n1756,
         n1757, n1758, n1759, n1760, n1761, n1762, n1763, n1764, n1765, n1766,
         n1767, n1768, n1769, n1770, n1771, n1772, n1773, n1774, n1775, n1776,
         n1777, n1778, n1779, n1780, n1781, n1782, n1783, n1784, n1785, n1786,
         n1787, n1788, n1789, n1790, n1791, n1792, n1793, n1794, n1795, n1796,
         n1797, n1798, n1799, n1800, n1801, n1802, n1803, n1804, n1805, n1806,
         n1807, n1808, n1809, n1810, n1811, n1812, n1813, n1814, n1815, n1816,
         n1817, n1818, n1819, n1820, n1821, n1822, n1823, n1824, n1825, n1826,
         n1827, n1828, n1829, n1830, n1831, n1832, n1833, n1834, n1835, n1836,
         n1837, n1838, n1839, n1840, n1841, n1842, n1843, n1844, n1845, n1846,
         n1847, n1848, n1849, n1850, n1851, n1852, n1853, n1854, n1855, n1856,
         n1857, n1858, n1859, n1860, n1861, n1862, n1863, n1864, n1865, n1866,
         n1867, n1868, n1869, n1870, n1871, n1872, n1873, n1874, n1875, n1876,
         n1877, n1878, n1879, n1880, n1881, n1882, n1883, n1884, n1885, n1886,
         n1887, n1888, n1889, n1890, n1891, n1892, n1893, n1894, n1895, n1896,
         n1897, n1898, n1899, n1900, n1901, n1902, n1903, n1904, n1905, n1906,
         n1907, n1908, n1909, n1910, n1911, n1912, n1913, n1914, n1915, n1916,
         n1917, n1918, n1919, n1920, n1921, n1922, n1923, n1924, n1925, n1926,
         n1927, n1928, n1929, n1930, n1931, n1932, n1933, n1934, n1935, n1936,
         n1937, n1938, n1939, n1940, n1941, n1942, n1943, n1944, n1945, n1946,
         n1947, n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955, n1956,
         n1957, n1958, n1959, n1960, n1961, n1962, n1963, n1964, n1965, n1966,
         n1967, n1968, n1969, n1970, n1971, n1972, n1973, n1974, n1975, n1976,
         n1977, n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985, n1986,
         n1987, n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995, n1996,
         n1997, n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005, n2006,
         n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015, n2016,
         n2017, n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025, n2026,
         n2027, n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035, n2036,
         n2037, n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045, n2046,
         n2047, n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056,
         n2057, n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066,
         n2067, n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076,
         n2077, n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085, n2086,
         n2087, n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095, n2096,
         n2097, n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105, n2106,
         n2107, n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115, n2116,
         n2117, n2118, n2119, n2120, n2121, n2122, n2123, n2124, n2125, n2126,
         n2127;
  wire   [51:0] timestamp_clk_cycles;

  ffr_x1 \timestamp_clk_cycles_reg[43]  ( .D(N44), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[43]) );
  ffr_x1 \timestamp_clk_cycles_reg[28]  ( .D(N29), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[28]) );
  ffr_x1 \timestamp_clk_cycles_reg[13]  ( .D(N14), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[13]) );
  ffr_x1 \timestamp_clk_cycles_reg[50]  ( .D(N51), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[50]) );
  ffr_x1 \timestamp_clk_cycles_reg[14]  ( .D(N15), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[14]) );
  ffr_x1 \timestamp_clk_cycles_reg[51]  ( .D(N52), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[51]) );
  ffr_x1 \timestamp_clk_cycles_reg[49]  ( .D(N50), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[49]) );
  ffr_x1 \timestamp_clk_cycles_reg[48]  ( .D(N49), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[48]) );
  ffr_x1 \timestamp_clk_cycles_reg[47]  ( .D(N48), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[47]) );
  ffr_x1 \timestamp_clk_cycles_reg[46]  ( .D(N47), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[46]) );
  ffr_x1 \timestamp_clk_cycles_reg[45]  ( .D(N46), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[45]) );
  ffr_x1 \timestamp_clk_cycles_reg[44]  ( .D(N45), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[44]) );
  ffr_x1 \timestamp_clk_cycles_reg[42]  ( .D(N43), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[42]) );
  ffr_x1 \timestamp_clk_cycles_reg[41]  ( .D(N42), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[41]) );
  ffr_x1 \timestamp_clk_cycles_reg[40]  ( .D(N41), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[40]) );
  ffr_x1 \timestamp_clk_cycles_reg[39]  ( .D(N40), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[39]) );
  ffr_x1 \timestamp_clk_cycles_reg[38]  ( .D(N39), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[38]) );
  ffr_x1 \timestamp_clk_cycles_reg[37]  ( .D(N38), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[37]) );
  ffr_x1 \timestamp_clk_cycles_reg[36]  ( .D(N37), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[36]) );
  ffr_x1 \timestamp_clk_cycles_reg[35]  ( .D(N36), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[35]) );
  ffr_x1 \timestamp_clk_cycles_reg[34]  ( .D(N35), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[34]) );
  ffr_x1 \timestamp_clk_cycles_reg[33]  ( .D(N34), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[33]) );
  ffr_x1 \timestamp_clk_cycles_reg[32]  ( .D(N33), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[32]) );
  ffr_x1 \timestamp_clk_cycles_reg[31]  ( .D(N32), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[31]) );
  ffr_x1 \timestamp_clk_cycles_reg[30]  ( .D(N31), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[30]) );
  ffr_x1 \timestamp_clk_cycles_reg[29]  ( .D(N30), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[29]) );
  ffr_x1 \timestamp_clk_cycles_reg[27]  ( .D(N28), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[27]) );
  ffr_x1 \timestamp_clk_cycles_reg[26]  ( .D(N27), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[26]) );
  ffr_x1 \timestamp_clk_cycles_reg[25]  ( .D(N26), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[25]) );
  ffr_x1 \timestamp_clk_cycles_reg[24]  ( .D(N25), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[24]) );
  ffr_x1 \timestamp_clk_cycles_reg[23]  ( .D(N24), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[23]) );
  ffr_x1 \timestamp_clk_cycles_reg[22]  ( .D(N23), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[22]) );
  ffr_x1 \timestamp_clk_cycles_reg[21]  ( .D(N22), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[21]) );
  ffr_x1 \timestamp_clk_cycles_reg[20]  ( .D(N21), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[20]) );
  ffr_x1 \timestamp_clk_cycles_reg[19]  ( .D(N20), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[19]) );
  ffr_x1 \timestamp_clk_cycles_reg[18]  ( .D(N19), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[18]) );
  ffr_x1 \timestamp_clk_cycles_reg[17]  ( .D(N18), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[17]) );
  ffr_x1 \timestamp_clk_cycles_reg[15]  ( .D(N16), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[15]) );
  ffr_x1 \timestamp_clk_cycles_reg[12]  ( .D(N13), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[12]) );
  ffr_x1 \timestamp_clk_cycles_reg[11]  ( .D(N12), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[11]) );
  ffr_x1 \timestamp_clk_cycles_reg[10]  ( .D(N11), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[10]) );
  ffr_x1 \timestamp_clk_cycles_reg[9]  ( .D(N10), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[9]) );
  ffr_x1 \timestamp_clk_cycles_reg[8]  ( .D(N9), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[8]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[0]  ( .D(
        \div_2/u_div/DP_OP_70_127_3758/n1703 ), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[0]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[2]  ( .D(N3), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[2]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[3]  ( .D(N4), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[3]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[1]  ( .D(n1), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[1]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[5]  ( .D(N6), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[5]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[4]  ( .D(N5), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[4]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[6]  ( .D(N7), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[6]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[7]  ( .D(N8), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[7]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[16]  ( .D(N17), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[16]) );
  xor2_x1 U3 ( .A(timestamp_clk_cycles[0]), .B(timestamp_clk_cycles[1]), .Y(n1) );
  and2_x1 U4 ( .A(n1059), .B(n1058), .Y(n1060) );
  nor2_x1 U5 ( .A(n1067), .B(n1066), .Y(n1000) );
  nor2_x1 U6 ( .A(n1071), .B(n1000), .Y(n1075) );
  and2_x1 U7 ( .A(n1158), .B(n1157), .Y(n1159) );
  and2_x1 U8 ( .A(n1114), .B(n1113), .Y(n1115) );
  nand2_x1 U9 ( .A(n1173), .B(n1172), .Y(n1174) );
  nor2_x1 U10 ( .A(n1163), .B(n1162), .Y(n1166) );
  and2_x1 U11 ( .A(n1178), .B(n1177), .Y(n1179) );
  nand2_x1 U12 ( .A(n1294), .B(n1293), .Y(n1295) );
  nor2_x1 U13 ( .A(n1285), .B(n1284), .Y(n1263) );
  and2_x1 U14 ( .A(n1314), .B(n1313), .Y(n1315) );
  or2_x1 U15 ( .A(n1305), .B(n1304), .Y(n895) );
  nand2_x1 U16 ( .A(n1397), .B(n1396), .Y(n1398) );
  nand2_x1 U17 ( .A(n1395), .B(n1394), .Y(n1400) );
  and2_x1 U18 ( .A(n1437), .B(n1436), .Y(n1438) );
  nor2_x1 U19 ( .A(n1928), .B(n1933), .Y(n1765) );
  nand2_x1 U20 ( .A(n1667), .B(n1666), .Y(n1672) );
  nor2_x1 U21 ( .A(n1953), .B(n1949), .Y(n1754) );
  nand2_x1 U22 ( .A(n1765), .B(n1927), .Y(n1767) );
  nor2_x1 U23 ( .A(n1679), .B(n1678), .Y(n1681) );
  nand2_x1 U24 ( .A(n2027), .B(n2031), .Y(n1711) );
  nand2_x1 U25 ( .A(n1971), .B(n1975), .Y(n1746) );
  nand2_x1 U26 ( .A(n1962), .B(n1754), .Y(n1920) );
  nor2_x1 U27 ( .A(n1767), .B(n1920), .Y(n1769) );
  nand2_x1 U28 ( .A(n1702), .B(n2041), .Y(n1991) );
  nor2_x1 U29 ( .A(n1681), .B(n1658), .Y(n2064) );
  nor2_x1 U30 ( .A(n1696), .B(n1695), .Y(n2054) );
  nor2_x1 U31 ( .A(n1723), .B(n1722), .Y(n2002) );
  nor2_x1 U32 ( .A(n1752), .B(n1751), .Y(n1953) );
  nor2_x1 U33 ( .A(n1771), .B(n1770), .Y(n1915) );
  nand2_x1 U34 ( .A(n1686), .B(n1685), .Y(n2077) );
  nand2_x1 U35 ( .A(n1698), .B(n1697), .Y(n2049) );
  nor2_x1 U36 ( .A(n1713), .B(n1712), .Y(n2016) );
  nand2_x1 U37 ( .A(n1734), .B(n1733), .Y(n1986) );
  nand2_x1 U38 ( .A(n1752), .B(n1751), .Y(n1955) );
  nand2_x1 U39 ( .A(n1761), .B(n1760), .Y(n1935) );
  nand2_x1 U40 ( .A(n1778), .B(n1896), .Y(n1780) );
  or2_x1 U41 ( .A(n1792), .B(n1791), .Y(n1871) );
  nand2_x1 U42 ( .A(n1807), .B(n1806), .Y(n1845) );
  or2_x1 U43 ( .A(n1817), .B(n1816), .Y(n1826) );
  nand2_x1 U44 ( .A(timestamp_clk_cycles[15]), .B(timestamp_clk_cycles[14]), 
        .Y(n14) );
  nand2_x1 U45 ( .A(n2018), .B(n2017), .Y(n2019) );
  nand2_x1 U46 ( .A(n1963), .B(n1962), .Y(n1964) );
  nand2_x1 U47 ( .A(n1836), .B(n1835), .Y(n1837) );
  nor2_x1 U48 ( .A(n2123), .B(n56), .Y(N48) );
  inv_x1 U49 ( .A(timestamp_clk_cycles[0]), .Y(
        \div_2/u_div/DP_OP_70_127_3758/n1703 ) );
  inv_x1 U50 ( .A(timestamp_clk_cycles[2]), .Y(n2084) );
  and2_x1 U51 ( .A(timestamp_clk_cycles[1]), .B(timestamp_clk_cycles[0]), .Y(
        n2085) );
  nand2b_x1 U52 ( .AN(n2084), .B(n2085), .Y(n2086) );
  nor2b_x1 U53 ( .AN(timestamp_clk_cycles[3]), .B(n2086), .Y(n2088) );
  aoi21_x1 U54 ( .A0(timestamp_clk_cycles[4]), .A1(n2088), .B0(
        timestamp_clk_cycles[5]), .Y(n3) );
  nand2_x1 U55 ( .A(timestamp_clk_cycles[5]), .B(timestamp_clk_cycles[4]), .Y(
        n2) );
  nand2b_x1 U56 ( .AN(n2), .B(n2088), .Y(n2090) );
  inv_x1 U57 ( .A(n2090), .Y(n5) );
  nor2_x1 U58 ( .A(n3), .B(n5), .Y(N6) );
  inv_x1 U59 ( .A(timestamp_clk_cycles[6]), .Y(n2089) );
  nand2_x1 U60 ( .A(timestamp_clk_cycles[7]), .B(timestamp_clk_cycles[6]), .Y(
        n4) );
  nor2_x1 U61 ( .A(n4), .B(n2090), .Y(n2091) );
  aoi21_x1 U62 ( .A0(timestamp_clk_cycles[6]), .A1(n5), .B0(
        timestamp_clk_cycles[7]), .Y(n6) );
  nor2_x1 U63 ( .A(n2091), .B(n6), .Y(N8) );
  aoi21_x1 U64 ( .A0(timestamp_clk_cycles[8]), .A1(n2091), .B0(
        timestamp_clk_cycles[9]), .Y(n8) );
  nand2_x1 U65 ( .A(timestamp_clk_cycles[9]), .B(timestamp_clk_cycles[8]), .Y(
        n7) );
  nand2b_x1 U66 ( .AN(n7), .B(n2091), .Y(n2093) );
  inv_x1 U67 ( .A(n2093), .Y(n10) );
  nor2_x1 U68 ( .A(n8), .B(n10), .Y(N10) );
  nand2_x1 U69 ( .A(timestamp_clk_cycles[11]), .B(timestamp_clk_cycles[10]), 
        .Y(n9) );
  nor2_x1 U70 ( .A(n9), .B(n2093), .Y(n2094) );
  aoi21_x1 U71 ( .A0(timestamp_clk_cycles[10]), .A1(n10), .B0(
        timestamp_clk_cycles[11]), .Y(n11) );
  nor2_x1 U72 ( .A(n2094), .B(n11), .Y(N12) );
  aoi21_x1 U73 ( .A0(timestamp_clk_cycles[12]), .A1(n2094), .B0(
        timestamp_clk_cycles[13]), .Y(n13) );
  nand2_x1 U74 ( .A(timestamp_clk_cycles[13]), .B(timestamp_clk_cycles[12]), 
        .Y(n12) );
  nand2b_x1 U75 ( .AN(n12), .B(n2094), .Y(n2097) );
  inv_x1 U76 ( .A(n2097), .Y(n15) );
  nor2_x1 U77 ( .A(n13), .B(n15), .Y(N14) );
  inv_x1 U78 ( .A(timestamp_clk_cycles[14]), .Y(n2096) );
  nor2_x1 U79 ( .A(n14), .B(n2097), .Y(n2098) );
  aoi21_x1 U80 ( .A0(timestamp_clk_cycles[14]), .A1(n15), .B0(
        timestamp_clk_cycles[15]), .Y(n16) );
  nor2_x1 U81 ( .A(n2098), .B(n16), .Y(N16) );
  inv_x1 U82 ( .A(timestamp_clk_cycles[16]), .Y(n2099) );
  aoi21_x1 U83 ( .A0(timestamp_clk_cycles[16]), .A1(n2098), .B0(
        timestamp_clk_cycles[17]), .Y(n18) );
  nand2_x1 U84 ( .A(timestamp_clk_cycles[17]), .B(timestamp_clk_cycles[16]), 
        .Y(n17) );
  nand2b_x1 U85 ( .AN(n17), .B(n2098), .Y(n2101) );
  inv_x1 U86 ( .A(n2101), .Y(n20) );
  nor2_x1 U87 ( .A(n18), .B(n20), .Y(N18) );
  nand2_x1 U88 ( .A(timestamp_clk_cycles[19]), .B(timestamp_clk_cycles[18]), 
        .Y(n19) );
  nor2_x1 U89 ( .A(n19), .B(n2101), .Y(n2102) );
  aoi21_x1 U90 ( .A0(timestamp_clk_cycles[18]), .A1(n20), .B0(
        timestamp_clk_cycles[19]), .Y(n21) );
  nor2_x1 U91 ( .A(n2102), .B(n21), .Y(N20) );
  aoi21_x1 U92 ( .A0(timestamp_clk_cycles[20]), .A1(n2102), .B0(
        timestamp_clk_cycles[21]), .Y(n23) );
  nand2_x1 U93 ( .A(timestamp_clk_cycles[21]), .B(timestamp_clk_cycles[20]), 
        .Y(n22) );
  nand2b_x1 U94 ( .AN(n22), .B(n2102), .Y(n2104) );
  inv_x1 U95 ( .A(n2104), .Y(n25) );
  nor2_x1 U96 ( .A(n23), .B(n25), .Y(N22) );
  nand2_x1 U97 ( .A(timestamp_clk_cycles[23]), .B(timestamp_clk_cycles[22]), 
        .Y(n24) );
  nor2_x1 U98 ( .A(n24), .B(n2104), .Y(n2105) );
  aoi21_x1 U99 ( .A0(timestamp_clk_cycles[22]), .A1(n25), .B0(
        timestamp_clk_cycles[23]), .Y(n26) );
  nor2_x1 U100 ( .A(n2105), .B(n26), .Y(N24) );
  aoi21_x1 U101 ( .A0(timestamp_clk_cycles[24]), .A1(n2105), .B0(
        timestamp_clk_cycles[25]), .Y(n28) );
  nand2_x1 U102 ( .A(timestamp_clk_cycles[25]), .B(timestamp_clk_cycles[24]), 
        .Y(n27) );
  nand2b_x1 U103 ( .AN(n27), .B(n2105), .Y(n2107) );
  inv_x1 U104 ( .A(n2107), .Y(n30) );
  nor2_x1 U105 ( .A(n28), .B(n30), .Y(N26) );
  nand2_x1 U106 ( .A(timestamp_clk_cycles[27]), .B(timestamp_clk_cycles[26]), 
        .Y(n29) );
  nor2_x1 U107 ( .A(n29), .B(n2107), .Y(n2108) );
  aoi21_x1 U108 ( .A0(timestamp_clk_cycles[26]), .A1(n30), .B0(
        timestamp_clk_cycles[27]), .Y(n31) );
  nor2_x1 U109 ( .A(n2108), .B(n31), .Y(N28) );
  aoi21_x1 U110 ( .A0(timestamp_clk_cycles[28]), .A1(n2108), .B0(
        timestamp_clk_cycles[29]), .Y(n33) );
  nand2_x1 U111 ( .A(timestamp_clk_cycles[29]), .B(timestamp_clk_cycles[28]), 
        .Y(n32) );
  nand2b_x1 U112 ( .AN(n32), .B(n2108), .Y(n2110) );
  inv_x1 U113 ( .A(n2110), .Y(n35) );
  nor2_x1 U114 ( .A(n33), .B(n35), .Y(N30) );
  nand2_x1 U115 ( .A(timestamp_clk_cycles[31]), .B(timestamp_clk_cycles[30]), 
        .Y(n34) );
  nor2_x1 U116 ( .A(n34), .B(n2110), .Y(n2111) );
  aoi21_x1 U117 ( .A0(timestamp_clk_cycles[30]), .A1(n35), .B0(
        timestamp_clk_cycles[31]), .Y(n36) );
  nor2_x1 U118 ( .A(n2111), .B(n36), .Y(N32) );
  aoi21_x1 U119 ( .A0(timestamp_clk_cycles[32]), .A1(n2111), .B0(
        timestamp_clk_cycles[33]), .Y(n38) );
  nand2_x1 U120 ( .A(timestamp_clk_cycles[33]), .B(timestamp_clk_cycles[32]), 
        .Y(n37) );
  nand2b_x1 U121 ( .AN(n37), .B(n2111), .Y(n2113) );
  inv_x1 U122 ( .A(n2113), .Y(n40) );
  nor2_x1 U123 ( .A(n38), .B(n40), .Y(N34) );
  nand2_x1 U124 ( .A(timestamp_clk_cycles[35]), .B(timestamp_clk_cycles[34]), 
        .Y(n39) );
  nor2_x1 U125 ( .A(n39), .B(n2113), .Y(n2114) );
  aoi21_x1 U126 ( .A0(timestamp_clk_cycles[34]), .A1(n40), .B0(
        timestamp_clk_cycles[35]), .Y(n41) );
  nor2_x1 U127 ( .A(n2114), .B(n41), .Y(N36) );
  aoi21_x1 U128 ( .A0(timestamp_clk_cycles[36]), .A1(n2114), .B0(
        timestamp_clk_cycles[37]), .Y(n43) );
  nand2_x1 U129 ( .A(timestamp_clk_cycles[37]), .B(timestamp_clk_cycles[36]), 
        .Y(n42) );
  nand2b_x1 U130 ( .AN(n42), .B(n2114), .Y(n2116) );
  inv_x1 U131 ( .A(n2116), .Y(n45) );
  nor2_x1 U132 ( .A(n43), .B(n45), .Y(N38) );
  nand2_x1 U133 ( .A(timestamp_clk_cycles[39]), .B(timestamp_clk_cycles[38]), 
        .Y(n44) );
  nor2_x1 U134 ( .A(n44), .B(n2116), .Y(n2117) );
  aoi21_x1 U135 ( .A0(timestamp_clk_cycles[38]), .A1(n45), .B0(
        timestamp_clk_cycles[39]), .Y(n46) );
  nor2_x1 U136 ( .A(n2117), .B(n46), .Y(N40) );
  aoi21_x1 U137 ( .A0(timestamp_clk_cycles[40]), .A1(n2117), .B0(
        timestamp_clk_cycles[41]), .Y(n48) );
  nand2_x1 U138 ( .A(timestamp_clk_cycles[41]), .B(timestamp_clk_cycles[40]), 
        .Y(n47) );
  nand2b_x1 U139 ( .AN(n47), .B(n2117), .Y(n2119) );
  inv_x1 U140 ( .A(n2119), .Y(n50) );
  nor2_x1 U141 ( .A(n48), .B(n50), .Y(N42) );
  nand2_x1 U142 ( .A(timestamp_clk_cycles[43]), .B(timestamp_clk_cycles[42]), 
        .Y(n49) );
  nor2_x1 U143 ( .A(n49), .B(n2119), .Y(n2120) );
  aoi21_x1 U144 ( .A0(timestamp_clk_cycles[42]), .A1(n50), .B0(
        timestamp_clk_cycles[43]), .Y(n51) );
  nor2_x1 U145 ( .A(n2120), .B(n51), .Y(N44) );
  aoi21_x1 U146 ( .A0(timestamp_clk_cycles[44]), .A1(n2120), .B0(
        timestamp_clk_cycles[45]), .Y(n53) );
  nand2_x1 U147 ( .A(timestamp_clk_cycles[45]), .B(timestamp_clk_cycles[44]), 
        .Y(n52) );
  nand2b_x1 U148 ( .AN(n52), .B(n2120), .Y(n2122) );
  inv_x1 U149 ( .A(n2122), .Y(n55) );
  nor2_x1 U150 ( .A(n53), .B(n55), .Y(N46) );
  nand2_x1 U151 ( .A(timestamp_clk_cycles[47]), .B(timestamp_clk_cycles[46]), 
        .Y(n54) );
  nor2_x1 U152 ( .A(n54), .B(n2122), .Y(n2123) );
  aoi21_x1 U153 ( .A0(timestamp_clk_cycles[46]), .A1(n55), .B0(
        timestamp_clk_cycles[47]), .Y(n56) );
  aoi21_x1 U154 ( .A0(timestamp_clk_cycles[48]), .A1(n2123), .B0(
        timestamp_clk_cycles[49]), .Y(n57) );
  and3_x1 U155 ( .A(timestamp_clk_cycles[48]), .B(timestamp_clk_cycles[49]), 
        .C(n2123), .Y(n2126) );
  nor2_x1 U156 ( .A(n57), .B(n2126), .Y(N50) );
  inv_x1 U157 ( .A(timestamp_clk_cycles[50]), .Y(n2125) );
  inv_x1 U158 ( .A(n1824), .Y(n1819) );
  or2_x1 U159 ( .A(timestamp_clk_cycles[50]), .B(timestamp_clk_cycles[49]), 
        .Y(n58) );
  addf_x1 U160 ( .A(timestamp_clk_cycles[51]), .B(timestamp_clk_cycles[49]), 
        .CI(n2125), .CO(n1824), .S(n1816) );
  addf_x1 U161 ( .A(n2125), .B(timestamp_clk_cycles[48]), .CI(n58), .CO(n1817), 
        .S(n1815) );
  xnor2_x1 U162 ( .A(timestamp_clk_cycles[49]), .B(timestamp_clk_cycles[50]), 
        .Y(n60) );
  nor2_x1 U163 ( .A(n1815), .B(n1814), .Y(n1830) );
  addf_x1 U164 ( .A(timestamp_clk_cycles[46]), .B(timestamp_clk_cycles[48]), 
        .CI(n2125), .CO(n59), .S(n61) );
  addf_x1 U165 ( .A(n60), .B(timestamp_clk_cycles[47]), .CI(n59), .CO(n1814), 
        .S(n1811) );
  or2_x1 U166 ( .A(n1812), .B(n1811), .Y(n1835) );
  inv_x1 U167 ( .A(timestamp_clk_cycles[48]), .Y(n666) );
  addf_x1 U168 ( .A(timestamp_clk_cycles[45]), .B(timestamp_clk_cycles[48]), 
        .CI(n2125), .CO(n62), .S(n63) );
  addf_x1 U169 ( .A(n62), .B(timestamp_clk_cycles[51]), .CI(n61), .CO(n1812), 
        .S(n1809) );
  nor2_x1 U170 ( .A(n1810), .B(n1809), .Y(n1839) );
  addf_x1 U171 ( .A(timestamp_clk_cycles[44]), .B(timestamp_clk_cycles[46]), 
        .CI(n666), .CO(n64), .S(n65) );
  addf_x1 U172 ( .A(n64), .B(timestamp_clk_cycles[47]), .CI(n63), .CO(n1810), 
        .S(n1806) );
  or2_x1 U173 ( .A(n1807), .B(n1806), .Y(n1844) );
  inv_x1 U174 ( .A(timestamp_clk_cycles[51]), .Y(n1496) );
  addh_x1 U175 ( .A(timestamp_clk_cycles[42]), .B(timestamp_clk_cycles[44]), 
        .CO(n68), .S(n70) );
  addf_x1 U176 ( .A(timestamp_clk_cycles[43]), .B(timestamp_clk_cycles[45]), 
        .CI(n666), .CO(n66), .S(n67) );
  addf_x1 U177 ( .A(n66), .B(timestamp_clk_cycles[49]), .CI(n65), .CO(n1807), 
        .S(n1804) );
  nor2_x1 U178 ( .A(n1805), .B(n1804), .Y(n1848) );
  addf_x1 U179 ( .A(n69), .B(n68), .CI(n67), .CO(n1805), .S(n1802) );
  addf_x1 U180 ( .A(n1496), .B(timestamp_clk_cycles[47]), .CI(n70), .CO(n69), 
        .S(n73) );
  or2_x1 U181 ( .A(n1802), .B(n1801), .Y(n1853) );
  addf_x1 U182 ( .A(n73), .B(n72), .CI(n71), .CO(n1801), .S(n1800) );
  addf_x1 U183 ( .A(n75), .B(timestamp_clk_cycles[41]), .CI(n74), .CO(n71), 
        .S(n78) );
  addf_x1 U184 ( .A(timestamp_clk_cycles[46]), .B(timestamp_clk_cycles[51]), 
        .CI(timestamp_clk_cycles[43]), .CO(n72), .S(n77) );
  addh_x1 U185 ( .A(timestamp_clk_cycles[40]), .B(timestamp_clk_cycles[42]), 
        .CO(n75), .S(n80) );
  inv_x1 U186 ( .A(timestamp_clk_cycles[49]), .Y(n1476) );
  nor2_x1 U187 ( .A(n1800), .B(n1799), .Y(n1857) );
  addf_x1 U188 ( .A(n78), .B(n77), .CI(n76), .CO(n1799), .S(n1797) );
  addf_x1 U189 ( .A(n2125), .B(timestamp_clk_cycles[41]), .CI(n1476), .CO(n79), 
        .S(n83) );
  addf_x1 U190 ( .A(n2125), .B(timestamp_clk_cycles[45]), .CI(n1496), .CO(n74), 
        .S(n87) );
  addf_x1 U191 ( .A(n81), .B(n80), .CI(n79), .CO(n76), .S(n86) );
  or2_x1 U192 ( .A(n1797), .B(n1796), .Y(n1862) );
  addf_x1 U193 ( .A(timestamp_clk_cycles[40]), .B(timestamp_clk_cycles[50]), 
        .CI(timestamp_clk_cycles[38]), .CO(n84), .S(n93) );
  addf_x1 U194 ( .A(n666), .B(timestamp_clk_cycles[43]), .CI(n82), .CO(n85), 
        .S(n91) );
  addf_x1 U195 ( .A(timestamp_clk_cycles[44]), .B(timestamp_clk_cycles[51]), 
        .CI(timestamp_clk_cycles[39]), .CO(n81), .S(n95) );
  addf_x1 U196 ( .A(n85), .B(n84), .CI(n83), .CO(n88), .S(n94) );
  addf_x1 U197 ( .A(n88), .B(n87), .CI(n86), .CO(n1796), .S(n1794) );
  nor2_x1 U198 ( .A(n1795), .B(n1794), .Y(n1866) );
  addf_x1 U199 ( .A(n1476), .B(timestamp_clk_cycles[37]), .CI(n1496), .CO(n92), 
        .S(n99) );
  inv_x1 U200 ( .A(timestamp_clk_cycles[46]), .Y(n612) );
  addh_x1 U201 ( .A(timestamp_clk_cycles[39]), .B(timestamp_clk_cycles[42]), 
        .CO(n82), .S(n90) );
  inv_x1 U202 ( .A(timestamp_clk_cycles[47]), .Y(n641) );
  addf_x1 U203 ( .A(n90), .B(n641), .CI(n89), .CO(n101), .S(n97) );
  addf_x1 U204 ( .A(n93), .B(n92), .CI(n91), .CO(n96), .S(n100) );
  addf_x1 U205 ( .A(n96), .B(n95), .CI(n94), .CO(n1795), .S(n1791) );
  addf_x1 U206 ( .A(n2125), .B(timestamp_clk_cycles[41]), .CI(n612), .CO(n98), 
        .S(n107) );
  addf_x1 U207 ( .A(timestamp_clk_cycles[36]), .B(timestamp_clk_cycles[51]), 
        .CI(timestamp_clk_cycles[38]), .CO(n89), .S(n106) );
  inv_x1 U208 ( .A(timestamp_clk_cycles[45]), .Y(n610) );
  addf_x1 U209 ( .A(n99), .B(n98), .CI(n97), .CO(n102), .S(n108) );
  addf_x1 U210 ( .A(n102), .B(n101), .CI(n100), .CO(n1792), .S(n1789) );
  nor2_x1 U211 ( .A(n1790), .B(n1789), .Y(n1875) );
  addf_x1 U212 ( .A(n610), .B(timestamp_clk_cycles[35]), .CI(n1476), .CO(n103), 
        .S(n115) );
  addf_x1 U213 ( .A(timestamp_clk_cycles[40]), .B(timestamp_clk_cycles[50]), 
        .CI(timestamp_clk_cycles[37]), .CO(n104), .S(n114) );
  inv_x1 U214 ( .A(timestamp_clk_cycles[44]), .Y(n624) );
  or2_x1 U215 ( .A(timestamp_clk_cycles[32]), .B(timestamp_clk_cycles[34]), 
        .Y(n119) );
  addf_x1 U216 ( .A(n104), .B(n666), .CI(n103), .CO(n109), .S(n117) );
  addf_x1 U217 ( .A(n107), .B(n106), .CI(n105), .CO(n110), .S(n116) );
  addf_x1 U218 ( .A(n110), .B(n109), .CI(n108), .CO(n1790), .S(n1786) );
  or2_x1 U219 ( .A(n1787), .B(n1786), .Y(n1880) );
  addf_x1 U220 ( .A(n612), .B(timestamp_clk_cycles[39]), .CI(n666), .CO(n111), 
        .S(n124) );
  addf_x1 U221 ( .A(timestamp_clk_cycles[34]), .B(timestamp_clk_cycles[49]), 
        .CI(timestamp_clk_cycles[36]), .CO(n112), .S(n123) );
  inv_x1 U222 ( .A(timestamp_clk_cycles[42]), .Y(n689) );
  inv_x1 U223 ( .A(timestamp_clk_cycles[43]), .Y(n706) );
  addf_x1 U224 ( .A(timestamp_clk_cycles[38]), .B(timestamp_clk_cycles[48]), 
        .CI(timestamp_clk_cycles[35]), .CO(n121), .S(n130) );
  addf_x1 U225 ( .A(n112), .B(n641), .CI(n111), .CO(n105), .S(n126) );
  addf_x1 U226 ( .A(n115), .B(n114), .CI(n113), .CO(n118), .S(n125) );
  addf_x1 U227 ( .A(n118), .B(n117), .CI(n116), .CO(n1787), .S(n1784) );
  nor2_x1 U228 ( .A(n1785), .B(n1784), .Y(n1884) );
  addf_x1 U229 ( .A(n610), .B(timestamp_clk_cycles[33]), .CI(n119), .CO(n120), 
        .S(n134) );
  xnor2_x1 U230 ( .A(timestamp_clk_cycles[34]), .B(timestamp_clk_cycles[32]), 
        .Y(n128) );
  or2_x1 U231 ( .A(timestamp_clk_cycles[50]), .B(timestamp_clk_cycles[32]), 
        .Y(n129) );
  addf_x1 U232 ( .A(n689), .B(timestamp_clk_cycles[37]), .CI(n641), .CO(n131), 
        .S(n144) );
  addf_x1 U233 ( .A(n121), .B(n624), .CI(n120), .CO(n113), .S(n136) );
  addf_x1 U234 ( .A(n124), .B(n123), .CI(n122), .CO(n127), .S(n135) );
  addf_x1 U235 ( .A(n127), .B(n126), .CI(n125), .CO(n1785), .S(n1781) );
  or2_x1 U236 ( .A(n1782), .B(n1781), .Y(n1889) );
  addf_x1 U237 ( .A(n612), .B(n624), .CI(n128), .CO(n133), .S(n143) );
  inv_x1 U238 ( .A(timestamp_clk_cycles[41]), .Y(n681) );
  addf_x1 U239 ( .A(timestamp_clk_cycles[36]), .B(timestamp_clk_cycles[46]), 
        .CI(timestamp_clk_cycles[31]), .CO(n145), .S(n156) );
  inv_x1 U240 ( .A(timestamp_clk_cycles[40]), .Y(n680) );
  addf_x1 U241 ( .A(timestamp_clk_cycles[51]), .B(timestamp_clk_cycles[33]), 
        .CI(n129), .CO(n146), .S(n154) );
  addf_x1 U242 ( .A(n131), .B(n706), .CI(n130), .CO(n122), .S(n139) );
  addf_x1 U243 ( .A(n134), .B(n133), .CI(n132), .CO(n137), .S(n138) );
  addf_x1 U244 ( .A(n137), .B(n136), .CI(n135), .CO(n1782), .S(n1775) );
  nor2_x1 U245 ( .A(n1776), .B(n1775), .Y(n1900) );
  addf_x1 U246 ( .A(n140), .B(n139), .CI(n138), .CO(n1776), .S(n1773) );
  addf_x1 U247 ( .A(n143), .B(n142), .CI(n141), .CO(n140), .S(n150) );
  addf_x1 U248 ( .A(n146), .B(n145), .CI(n144), .CO(n132), .S(n149) );
  xnor2_x1 U249 ( .A(timestamp_clk_cycles[32]), .B(timestamp_clk_cycles[50]), 
        .Y(n167) );
  addf_x1 U250 ( .A(timestamp_clk_cycles[35]), .B(timestamp_clk_cycles[30]), 
        .CI(n610), .CO(n147), .S(n166) );
  addf_x1 U251 ( .A(n681), .B(n706), .CI(n147), .CO(n142), .S(n158) );
  inv_x1 U252 ( .A(timestamp_clk_cycles[39]), .Y(n775) );
  addf_x1 U253 ( .A(n624), .B(n689), .CI(n680), .CO(n155), .S(n151) );
  or2_x1 U254 ( .A(n1773), .B(n1772), .Y(n1907) );
  addf_x1 U255 ( .A(n150), .B(n149), .CI(n148), .CO(n1772), .S(n1771) );
  addf_x1 U256 ( .A(timestamp_clk_cycles[34]), .B(timestamp_clk_cycles[44]), 
        .CI(timestamp_clk_cycles[49]), .CO(n168), .S(n165) );
  inv_x1 U257 ( .A(timestamp_clk_cycles[38]), .Y(n776) );
  addf_x1 U258 ( .A(timestamp_clk_cycles[29]), .B(timestamp_clk_cycles[31]), 
        .CI(n681), .CO(n152), .S(n163) );
  or2_x1 U259 ( .A(timestamp_clk_cycles[32]), .B(timestamp_clk_cycles[49]), 
        .Y(n178) );
  addf_x1 U260 ( .A(n775), .B(timestamp_clk_cycles[51]), .CI(n706), .CO(n153), 
        .S(n160) );
  addf_x1 U261 ( .A(n153), .B(n152), .CI(n151), .CO(n157), .S(n169) );
  addf_x1 U262 ( .A(n156), .B(n155), .CI(n154), .CO(n141), .S(n173) );
  addf_x1 U263 ( .A(n159), .B(n158), .CI(n157), .CO(n148), .S(n172) );
  addf_x1 U264 ( .A(n162), .B(n161), .CI(n160), .CO(n170), .S(n184) );
  inv_x1 U265 ( .A(timestamp_clk_cycles[37]), .Y(n1540) );
  addf_x1 U266 ( .A(n680), .B(timestamp_clk_cycles[33]), .CI(n776), .CO(n164), 
        .S(n175) );
  addf_x1 U267 ( .A(n165), .B(n164), .CI(n163), .CO(n171), .S(n182) );
  addf_x1 U268 ( .A(n168), .B(n167), .CI(n166), .CO(n159), .S(n186) );
  addf_x1 U269 ( .A(n171), .B(n170), .CI(n169), .CO(n174), .S(n185) );
  addf_x1 U270 ( .A(n174), .B(n173), .CI(n172), .CO(n1770), .S(n1762) );
  nor2_x1 U271 ( .A(n1763), .B(n1762), .Y(n1928) );
  addf_x1 U272 ( .A(n177), .B(n176), .CI(n175), .CO(n183), .S(n195) );
  inv_x1 U273 ( .A(timestamp_clk_cycles[36]), .Y(n1516) );
  addf_x1 U274 ( .A(n689), .B(timestamp_clk_cycles[47]), .CI(n1540), .CO(n177), 
        .S(n188) );
  addf_x1 U275 ( .A(timestamp_clk_cycles[28]), .B(timestamp_clk_cycles[30]), 
        .CI(n178), .CO(n162), .S(n181) );
  addf_x1 U276 ( .A(timestamp_clk_cycles[50]), .B(timestamp_clk_cycles[43]), 
        .CI(timestamp_clk_cycles[48]), .CO(n161), .S(n180) );
  xnor2_x1 U277 ( .A(timestamp_clk_cycles[49]), .B(timestamp_clk_cycles[32]), 
        .Y(n192) );
  addf_x1 U278 ( .A(n181), .B(n180), .CI(n179), .CO(n197), .S(n193) );
  addf_x1 U279 ( .A(n184), .B(n183), .CI(n182), .CO(n187), .S(n196) );
  addf_x1 U280 ( .A(n187), .B(n186), .CI(n185), .CO(n1763), .S(n1760) );
  nor2_x1 U281 ( .A(n1761), .B(n1760), .Y(n1933) );
  addf_x1 U282 ( .A(n190), .B(n189), .CI(n188), .CO(n194), .S(n208) );
  addf_x1 U283 ( .A(timestamp_clk_cycles[46]), .B(timestamp_clk_cycles[41]), 
        .CI(timestamp_clk_cycles[26]), .CO(n191), .S(n201) );
  addf_x1 U284 ( .A(timestamp_clk_cycles[51]), .B(timestamp_clk_cycles[31]), 
        .CI(n1516), .CO(n190), .S(n199) );
  addf_x1 U285 ( .A(timestamp_clk_cycles[28]), .B(timestamp_clk_cycles[48]), 
        .CI(n680), .CO(n189), .S(n242) );
  inv_x1 U286 ( .A(timestamp_clk_cycles[34]), .Y(n1579) );
  inv_x1 U287 ( .A(timestamp_clk_cycles[35]), .Y(n1541) );
  addf_x1 U288 ( .A(timestamp_clk_cycles[50]), .B(timestamp_clk_cycles[40]), 
        .CI(timestamp_clk_cycles[30]), .CO(n557), .S(n586) );
  addf_x1 U289 ( .A(timestamp_clk_cycles[27]), .B(timestamp_clk_cycles[47]), 
        .CI(n1541), .CO(n202), .S(n231) );
  addf_x1 U290 ( .A(timestamp_clk_cycles[29]), .B(timestamp_clk_cycles[27]), 
        .CI(n681), .CO(n176), .S(n204) );
  addf_x1 U291 ( .A(n192), .B(n775), .CI(n191), .CO(n179), .S(n203) );
  addf_x1 U292 ( .A(n195), .B(n194), .CI(n193), .CO(n198), .S(n209) );
  addf_x1 U293 ( .A(n198), .B(n197), .CI(n196), .CO(n1761), .S(n1758) );
  nor2_x1 U294 ( .A(n1759), .B(n1758), .Y(n1939) );
  addf_x1 U295 ( .A(n201), .B(n200), .CI(n199), .CO(n207), .S(n246) );
  addf_x1 U296 ( .A(n557), .B(n776), .CI(n202), .CO(n205), .S(n245) );
  inv_x1 U297 ( .A(timestamp_clk_cycles[33]), .Y(n1547) );
  addf_x1 U298 ( .A(timestamp_clk_cycles[25]), .B(timestamp_clk_cycles[45]), 
        .CI(n775), .CO(n200), .S(n229) );
  addf_x1 U299 ( .A(timestamp_clk_cycles[44]), .B(timestamp_clk_cycles[39]), 
        .CI(timestamp_clk_cycles[24]), .CO(n234), .S(n217) );
  addf_x1 U300 ( .A(timestamp_clk_cycles[29]), .B(timestamp_clk_cycles[49]), 
        .CI(n1579), .CO(n232), .S(n215) );
  addf_x1 U301 ( .A(n205), .B(n204), .CI(n203), .CO(n210), .S(n248) );
  addf_x1 U302 ( .A(n208), .B(n207), .CI(n206), .CO(n211), .S(n247) );
  addf_x1 U303 ( .A(n211), .B(n210), .CI(n209), .CO(n1759), .S(n1756) );
  nor2_x1 U304 ( .A(n1757), .B(n1756), .Y(n1944) );
  nor2_x1 U305 ( .A(n1939), .B(n1944), .Y(n1927) );
  addf_x1 U306 ( .A(timestamp_clk_cycles[48]), .B(timestamp_clk_cycles[38]), 
        .CI(timestamp_clk_cycles[28]), .CO(n1580), .S(n1586) );
  inv_x1 U307 ( .A(timestamp_clk_cycles[32]), .Y(n1539) );
  addf_x1 U308 ( .A(timestamp_clk_cycles[23]), .B(timestamp_clk_cycles[43]), 
        .CI(n1541), .CO(n216), .S(n213) );
  inv_x1 U309 ( .A(timestamp_clk_cycles[30]), .Y(n1483) );
  addf_x1 U310 ( .A(timestamp_clk_cycles[21]), .B(timestamp_clk_cycles[41]), 
        .CI(n1547), .CO(n257), .S(n273) );
  inv_x1 U311 ( .A(timestamp_clk_cycles[31]), .Y(n1515) );
  addf_x1 U312 ( .A(n1539), .B(n1579), .CI(n212), .CO(n214), .S(n219) );
  addf_x1 U313 ( .A(timestamp_clk_cycles[42]), .B(timestamp_clk_cycles[44]), 
        .CI(n1496), .CO(n224), .S(n258) );
  addh_x1 U314 ( .A(timestamp_clk_cycles[24]), .B(timestamp_clk_cycles[22]), 
        .CO(n223), .S(n212) );
  addf_x1 U315 ( .A(timestamp_clk_cycles[47]), .B(timestamp_clk_cycles[27]), 
        .CI(n1540), .CO(n222), .S(n256) );
  addf_x1 U316 ( .A(timestamp_clk_cycles[26]), .B(timestamp_clk_cycles[46]), 
        .CI(n776), .CO(n233), .S(n236) );
  addf_x1 U317 ( .A(n1586), .B(n214), .CI(n213), .CO(n235), .S(n266) );
  addf_x1 U318 ( .A(n217), .B(n216), .CI(n215), .CO(n228), .S(n227) );
  addf_x1 U319 ( .A(n1580), .B(n1516), .CI(n218), .CO(n230), .S(n226) );
  addf_x1 U320 ( .A(n221), .B(n220), .CI(n219), .CO(n263), .S(n280) );
  addf_x1 U321 ( .A(timestamp_clk_cycles[25]), .B(timestamp_clk_cycles[45]), 
        .CI(n1547), .CO(n218), .S(n262) );
  addf_x1 U322 ( .A(n224), .B(n223), .CI(n222), .CO(n237), .S(n261) );
  addf_x1 U323 ( .A(n227), .B(n226), .CI(n225), .CO(n252), .S(n267) );
  addf_x1 U324 ( .A(n230), .B(n229), .CI(n228), .CO(n244), .S(n251) );
  addf_x1 U325 ( .A(n586), .B(n232), .CI(n231), .CO(n241), .S(n240) );
  addf_x1 U326 ( .A(n234), .B(n1540), .CI(n233), .CO(n243), .S(n239) );
  addf_x1 U327 ( .A(n237), .B(n236), .CI(n235), .CO(n238), .S(n268) );
  nor2_x1 U328 ( .A(n1748), .B(n1747), .Y(n1951) );
  inv_x1 U329 ( .A(n1951), .Y(n1962) );
  addf_x1 U330 ( .A(n240), .B(n239), .CI(n238), .CO(n255), .S(n250) );
  addf_x1 U331 ( .A(n243), .B(n242), .CI(n241), .CO(n206), .S(n254) );
  addf_x1 U332 ( .A(n246), .B(n245), .CI(n244), .CO(n249), .S(n253) );
  addf_x1 U333 ( .A(n249), .B(n248), .CI(n247), .CO(n1757), .S(n1751) );
  addf_x1 U334 ( .A(n252), .B(n251), .CI(n250), .CO(n1750), .S(n1747) );
  addf_x1 U335 ( .A(n255), .B(n254), .CI(n253), .CO(n1752), .S(n1749) );
  nor2_x1 U336 ( .A(n1750), .B(n1749), .Y(n1949) );
  addf_x1 U337 ( .A(n258), .B(n257), .CI(n256), .CO(n265), .S(n285) );
  addf_x1 U338 ( .A(timestamp_clk_cycles[23]), .B(timestamp_clk_cycles[43]), 
        .CI(n1515), .CO(n221), .S(n272) );
  addf_x1 U339 ( .A(timestamp_clk_cycles[46]), .B(timestamp_clk_cycles[51]), 
        .CI(timestamp_clk_cycles[26]), .CO(n220), .S(n271) );
  addf_x1 U340 ( .A(n260), .B(n1516), .CI(n259), .CO(n281), .S(n270) );
  addf_x1 U341 ( .A(n1483), .B(n2125), .CI(n1539), .CO(n275), .S(n292) );
  addh_x1 U342 ( .A(timestamp_clk_cycles[40]), .B(timestamp_clk_cycles[22]), 
        .CO(n260), .S(n277) );
  inv_x1 U343 ( .A(timestamp_clk_cycles[29]), .Y(n858) );
  addf_x1 U344 ( .A(timestamp_clk_cycles[25]), .B(timestamp_clk_cycles[45]), 
        .CI(n1541), .CO(n274), .S(n291) );
  addf_x1 U345 ( .A(timestamp_clk_cycles[20]), .B(timestamp_clk_cycles[42]), 
        .CI(n1496), .CO(n259), .S(n290) );
  addf_x1 U346 ( .A(n1579), .B(n2125), .CI(n1476), .CO(n293), .S(n294) );
  addf_x1 U347 ( .A(n263), .B(n262), .CI(n261), .CO(n225), .S(n287) );
  addf_x1 U348 ( .A(n266), .B(n265), .CI(n264), .CO(n269), .S(n286) );
  addf_x1 U349 ( .A(n269), .B(n268), .CI(n267), .CO(n1748), .S(n1741) );
  or2_x1 U350 ( .A(n1742), .B(n1741), .Y(n1971) );
  addf_x1 U351 ( .A(n272), .B(n271), .CI(n270), .CO(n284), .S(n302) );
  addf_x1 U352 ( .A(n275), .B(n274), .CI(n273), .CO(n282), .S(n301) );
  addf_x1 U353 ( .A(n278), .B(n277), .CI(n276), .CO(n298), .S(n318) );
  inv_x1 U354 ( .A(timestamp_clk_cycles[28]), .Y(n1234) );
  addf_x1 U355 ( .A(timestamp_clk_cycles[21]), .B(timestamp_clk_cycles[41]), 
        .CI(n1515), .CO(n1478), .S(n667) );
  addf_x1 U356 ( .A(timestamp_clk_cycles[19]), .B(timestamp_clk_cycles[39]), 
        .CI(n858), .CO(n276), .S(n308) );
  addf_x1 U357 ( .A(timestamp_clk_cycles[44]), .B(timestamp_clk_cycles[51]), 
        .CI(timestamp_clk_cycles[24]), .CO(n278), .S(n307) );
  addf_x1 U358 ( .A(n1483), .B(n666), .CI(n279), .CO(n310), .S(n311) );
  addf_x1 U359 ( .A(n282), .B(n281), .CI(n280), .CO(n264), .S(n304) );
  addf_x1 U360 ( .A(n285), .B(n284), .CI(n283), .CO(n288), .S(n303) );
  addf_x1 U361 ( .A(n288), .B(n287), .CI(n286), .CO(n1742), .S(n1739) );
  nor2_x1 U362 ( .A(n1740), .B(n1739), .Y(n1970) );
  inv_x1 U363 ( .A(n1970), .Y(n1975) );
  addf_x1 U364 ( .A(n291), .B(n290), .CI(n289), .CO(n297), .S(n321) );
  addf_x1 U365 ( .A(n293), .B(n1478), .CI(n292), .CO(n299), .S(n320) );
  addf_x1 U366 ( .A(n296), .B(n295), .CI(n294), .CO(n289), .S(n411) );
  addf_x1 U367 ( .A(timestamp_clk_cycles[20]), .B(timestamp_clk_cycles[50]), 
        .CI(timestamp_clk_cycles[18]), .CO(n295), .S(n315) );
  inv_x1 U368 ( .A(timestamp_clk_cycles[27]), .Y(n1207) );
  addh_x1 U369 ( .A(timestamp_clk_cycles[22]), .B(timestamp_clk_cycles[42]), 
        .CO(n279), .S(n353) );
  addf_x1 U370 ( .A(timestamp_clk_cycles[23]), .B(timestamp_clk_cycles[43]), 
        .CI(n1234), .CO(n309), .S(n402) );
  addf_x1 U371 ( .A(timestamp_clk_cycles[38]), .B(timestamp_clk_cycles[40]), 
        .CI(n1547), .CO(n296), .S(n401) );
  addf_x1 U372 ( .A(n1476), .B(n1539), .CI(n1207), .CO(n314), .S(n360) );
  addf_x1 U373 ( .A(n299), .B(n298), .CI(n297), .CO(n283), .S(n323) );
  addf_x1 U374 ( .A(n302), .B(n301), .CI(n300), .CO(n305), .S(n322) );
  addf_x1 U375 ( .A(n305), .B(n304), .CI(n303), .CO(n1740), .S(n1735) );
  or2_x1 U376 ( .A(n1736), .B(n1735), .Y(n1981) );
  addf_x1 U377 ( .A(n308), .B(n307), .CI(n306), .CO(n316), .S(n414) );
  addf_x1 U378 ( .A(n310), .B(n309), .CI(n667), .CO(n317), .S(n413) );
  addf_x1 U379 ( .A(n639), .B(n312), .CI(n311), .CO(n306), .S(n396) );
  addf_x1 U380 ( .A(timestamp_clk_cycles[17]), .B(timestamp_clk_cycles[37]), 
        .CI(n858), .CO(n639), .S(n619) );
  inv_x1 U381 ( .A(timestamp_clk_cycles[26]), .Y(n1208) );
  addf_x1 U382 ( .A(timestamp_clk_cycles[19]), .B(timestamp_clk_cycles[39]), 
        .CI(n1496), .CO(n312), .S(n366) );
  addf_x1 U383 ( .A(n315), .B(n314), .CI(n313), .CO(n410), .S(n394) );
  addf_x1 U384 ( .A(n318), .B(n317), .CI(n316), .CO(n300), .S(n416) );
  addf_x1 U385 ( .A(n321), .B(n320), .CI(n319), .CO(n324), .S(n415) );
  addf_x1 U386 ( .A(n324), .B(n323), .CI(n322), .CO(n1736), .S(n1733) );
  nor2_x1 U387 ( .A(n1734), .B(n1733), .Y(n1980) );
  inv_x1 U388 ( .A(n1980), .Y(n1985) );
  nand2_x1 U389 ( .A(n1981), .B(n1985), .Y(n1966) );
  nor2_x1 U390 ( .A(n1746), .B(n1966), .Y(n1922) );
  nand2_x1 U391 ( .A(n1769), .B(n1922), .Y(n1911) );
  nor2_x1 U392 ( .A(n1915), .B(n1911), .Y(n1906) );
  nand2_x1 U393 ( .A(n1907), .B(n1906), .Y(n1893) );
  nor2_x1 U394 ( .A(n1900), .B(n1893), .Y(n1778) );
  inv_x1 U395 ( .A(timestamp_clk_cycles[23]), .Y(n934) );
  or2_x1 U396 ( .A(timestamp_clk_cycles[32]), .B(timestamp_clk_cycles[12]), 
        .Y(n679) );
  inv_x1 U397 ( .A(timestamp_clk_cycles[24]), .Y(n941) );
  xnor2_x1 U398 ( .A(timestamp_clk_cycles[12]), .B(timestamp_clk_cycles[32]), 
        .Y(n797) );
  addf_x1 U399 ( .A(timestamp_clk_cycles[15]), .B(timestamp_clk_cycles[33]), 
        .CI(n934), .CO(n336), .S(n372) );
  inv_x1 U400 ( .A(timestamp_clk_cycles[25]), .Y(n1191) );
  addf_x1 U401 ( .A(timestamp_clk_cycles[13]), .B(timestamp_clk_cycles[35]), 
        .CI(n679), .CO(n334), .S(n371) );
  addf_x1 U402 ( .A(timestamp_clk_cycles[38]), .B(timestamp_clk_cycles[48]), 
        .CI(timestamp_clk_cycles[18]), .CO(n337), .S(n375) );
  inv_x1 U403 ( .A(timestamp_clk_cycles[22]), .Y(n946) );
  addf_x1 U404 ( .A(n610), .B(n1234), .CI(n1191), .CO(n335), .S(n373) );
  addf_x1 U405 ( .A(n327), .B(n326), .CI(n325), .CO(n332), .S(n477) );
  addf_x1 U406 ( .A(timestamp_clk_cycles[14]), .B(timestamp_clk_cycles[49]), 
        .CI(timestamp_clk_cycles[34]), .CO(n329), .S(n326) );
  addf_x1 U407 ( .A(timestamp_clk_cycles[36]), .B(timestamp_clk_cycles[16]), 
        .CI(n858), .CO(n328), .S(n327) );
  addf_x1 U408 ( .A(n666), .B(n624), .CI(n941), .CO(n340), .S(n333) );
  addf_x1 U409 ( .A(timestamp_clk_cycles[19]), .B(timestamp_clk_cycles[39]), 
        .CI(n612), .CO(n339), .S(n325) );
  addf_x1 U410 ( .A(n329), .B(n1207), .CI(n328), .CO(n358), .S(n331) );
  addf_x1 U411 ( .A(timestamp_clk_cycles[38]), .B(timestamp_clk_cycles[18]), 
        .CI(n1515), .CO(n361), .S(n356) );
  addf_x1 U412 ( .A(timestamp_clk_cycles[16]), .B(timestamp_clk_cycles[51]), 
        .CI(timestamp_clk_cycles[36]), .CO(n352), .S(n355) );
  addf_x1 U413 ( .A(timestamp_clk_cycles[21]), .B(timestamp_clk_cycles[41]), 
        .CI(n666), .CO(n362), .S(n354) );
  addf_x1 U414 ( .A(n332), .B(n331), .CI(n330), .CO(n346), .S(n382) );
  addf_x1 U415 ( .A(n335), .B(n334), .CI(n333), .CO(n381), .S(n376) );
  addf_x1 U416 ( .A(n337), .B(n1208), .CI(n336), .CO(n380), .S(n377) );
  addf_x1 U417 ( .A(n340), .B(n339), .CI(n338), .CO(n359), .S(n379) );
  addf_x1 U418 ( .A(n343), .B(n342), .CI(n341), .CO(n349), .S(n330) );
  addf_x1 U419 ( .A(timestamp_clk_cycles[40]), .B(timestamp_clk_cycles[50]), 
        .CI(timestamp_clk_cycles[20]), .CO(n351), .S(n342) );
  addf_x1 U420 ( .A(timestamp_clk_cycles[15]), .B(timestamp_clk_cycles[35]), 
        .CI(n641), .CO(n350), .S(n343) );
  addf_x1 U421 ( .A(n610), .B(n1483), .CI(n1476), .CO(n365), .S(n338) );
  addf_x1 U422 ( .A(timestamp_clk_cycles[17]), .B(timestamp_clk_cycles[37]), 
        .CI(n1191), .CO(n364), .S(n341) );
  addf_x1 U423 ( .A(n1208), .B(n2125), .CI(n1234), .CO(n367), .S(n363) );
  addf_x1 U424 ( .A(n346), .B(n345), .CI(n344), .CO(n390), .S(n385) );
  addf_x1 U425 ( .A(n349), .B(n348), .CI(n347), .CO(n389), .S(n344) );
  addf_x1 U426 ( .A(n351), .B(n612), .CI(n350), .CO(n399), .S(n348) );
  addf_x1 U427 ( .A(n353), .B(n641), .CI(n352), .CO(n313), .S(n398) );
  addf_x1 U428 ( .A(n356), .B(n355), .CI(n354), .CO(n397), .S(n357) );
  addf_x1 U429 ( .A(n359), .B(n358), .CI(n357), .CO(n392), .S(n386) );
  addf_x1 U430 ( .A(n362), .B(n361), .CI(n360), .CO(n400), .S(n405) );
  addf_x1 U431 ( .A(n365), .B(n364), .CI(n363), .CO(n404), .S(n347) );
  addf_x1 U432 ( .A(n619), .B(n367), .CI(n366), .CO(n395), .S(n403) );
  or2_x1 U433 ( .A(n1715), .B(n1714), .Y(n2017) );
  addf_x1 U434 ( .A(timestamp_clk_cycles[17]), .B(timestamp_clk_cycles[37]), 
        .CI(n641), .CO(n368), .S(n446) );
  addf_x1 U435 ( .A(timestamp_clk_cycles[14]), .B(timestamp_clk_cycles[34]), 
        .CI(n1207), .CO(n369), .S(n445) );
  addf_x1 U436 ( .A(n941), .B(n689), .CI(n797), .CO(n370), .S(n444) );
  addf_x1 U437 ( .A(n369), .B(n706), .CI(n368), .CO(n478), .S(n472) );
  addf_x1 U438 ( .A(n372), .B(n371), .CI(n370), .CO(n378), .S(n471) );
  inv_x1 U439 ( .A(timestamp_clk_cycles[21]), .Y(n957) );
  addf_x1 U440 ( .A(n612), .B(n624), .CI(n946), .CO(n374), .S(n450) );
  or2_x1 U441 ( .A(timestamp_clk_cycles[50]), .B(timestamp_clk_cycles[30]), 
        .Y(n431) );
  addf_x1 U442 ( .A(n375), .B(n374), .CI(n373), .CO(n479), .S(n462) );
  addf_x1 U443 ( .A(n378), .B(n377), .CI(n376), .CO(n384), .S(n480) );
  addf_x1 U444 ( .A(n381), .B(n380), .CI(n379), .CO(n345), .S(n484) );
  addf_x1 U445 ( .A(n384), .B(n383), .CI(n382), .CO(n387), .S(n483) );
  addf_x1 U446 ( .A(n387), .B(n386), .CI(n385), .CO(n1715), .S(n1712) );
  inv_x1 U447 ( .A(n2016), .Y(n2021) );
  nand2_x1 U448 ( .A(n2017), .B(n2021), .Y(n1990) );
  addf_x1 U449 ( .A(n390), .B(n389), .CI(n388), .CO(n1719), .S(n1714) );
  addf_x1 U450 ( .A(n393), .B(n392), .CI(n391), .CO(n423), .S(n388) );
  addf_x1 U451 ( .A(n396), .B(n395), .CI(n394), .CO(n412), .S(n422) );
  addf_x1 U452 ( .A(n399), .B(n398), .CI(n397), .CO(n408), .S(n393) );
  addf_x1 U453 ( .A(n402), .B(n401), .CI(n400), .CO(n409), .S(n407) );
  addf_x1 U454 ( .A(n405), .B(n404), .CI(n403), .CO(n406), .S(n391) );
  nor2_x1 U455 ( .A(n1719), .B(n1718), .Y(n2000) );
  inv_x1 U456 ( .A(n2000), .Y(n2011) );
  addf_x1 U457 ( .A(n408), .B(n407), .CI(n406), .CO(n420), .S(n421) );
  addf_x1 U458 ( .A(n411), .B(n410), .CI(n409), .CO(n319), .S(n419) );
  addf_x1 U459 ( .A(n414), .B(n413), .CI(n412), .CO(n417), .S(n418) );
  addf_x1 U460 ( .A(n417), .B(n416), .CI(n415), .CO(n1734), .S(n1722) );
  addf_x1 U461 ( .A(n420), .B(n419), .CI(n418), .CO(n1723), .S(n1721) );
  addf_x1 U462 ( .A(n423), .B(n422), .CI(n421), .CO(n1720), .S(n1718) );
  nor2_x1 U463 ( .A(n1721), .B(n1720), .Y(n1989) );
  nor2_x1 U464 ( .A(n2002), .B(n1989), .Y(n1725) );
  nand2_x1 U465 ( .A(n2011), .B(n1725), .Y(n1728) );
  nor2_x1 U466 ( .A(n1990), .B(n1728), .Y(n1730) );
  inv_x1 U467 ( .A(timestamp_clk_cycles[19]), .Y(n981) );
  inv_x1 U468 ( .A(timestamp_clk_cycles[20]), .Y(n958) );
  addf_x1 U469 ( .A(timestamp_clk_cycles[16]), .B(timestamp_clk_cycles[46]), 
        .CI(timestamp_clk_cycles[36]), .CO(n454), .S(n440) );
  addf_x1 U470 ( .A(n958), .B(n680), .CI(n946), .CO(n439), .S(n427) );
  addf_x1 U471 ( .A(timestamp_clk_cycles[11]), .B(timestamp_clk_cycles[33]), 
        .CI(n957), .CO(n451), .S(n438) );
  xnor2_x1 U472 ( .A(timestamp_clk_cycles[30]), .B(timestamp_clk_cycles[50]), 
        .Y(n433) );
  addf_x1 U473 ( .A(timestamp_clk_cycles[34]), .B(timestamp_clk_cycles[44]), 
        .CI(timestamp_clk_cycles[14]), .CO(n434), .S(n497) );
  addf_x1 U474 ( .A(timestamp_clk_cycles[9]), .B(timestamp_clk_cycles[31]), 
        .CI(n957), .CO(n429), .S(n495) );
  addf_x1 U475 ( .A(n426), .B(n425), .CI(n424), .CO(n449), .S(n511) );
  inv_x1 U476 ( .A(timestamp_clk_cycles[17]), .Y(n1514) );
  addf_x1 U477 ( .A(n958), .B(n680), .CI(n776), .CO(n496), .S(n505) );
  addf_x1 U478 ( .A(timestamp_clk_cycles[29]), .B(timestamp_clk_cycles[49]), 
        .CI(n981), .CO(n428), .S(n524) );
  inv_x1 U479 ( .A(timestamp_clk_cycles[18]), .Y(n1542) );
  addf_x1 U480 ( .A(n429), .B(n428), .CI(n427), .CO(n448), .S(n509) );
  addf_x1 U481 ( .A(n775), .B(n941), .CI(n706), .CO(n426), .S(n492) );
  addf_x1 U482 ( .A(timestamp_clk_cycles[10]), .B(timestamp_clk_cycles[32]), 
        .CI(n1191), .CO(n430), .S(n436) );
  addf_x1 U483 ( .A(timestamp_clk_cycles[13]), .B(timestamp_clk_cycles[33]), 
        .CI(n1542), .CO(n522), .S(n498) );
  addf_x1 U484 ( .A(timestamp_clk_cycles[51]), .B(timestamp_clk_cycles[11]), 
        .CI(n681), .CO(n425), .S(n520) );
  addf_x1 U485 ( .A(n681), .B(n706), .CI(n430), .CO(n453), .S(n458) );
  addf_x1 U486 ( .A(timestamp_clk_cycles[13]), .B(timestamp_clk_cycles[31]), 
        .CI(n431), .CO(n455), .S(n457) );
  addf_x1 U487 ( .A(n434), .B(n433), .CI(n432), .CO(n456), .S(n513) );
  addf_x1 U488 ( .A(n689), .B(timestamp_clk_cycles[15]), .CI(n624), .CO(n443), 
        .S(n424) );
  addf_x1 U489 ( .A(timestamp_clk_cycles[35]), .B(timestamp_clk_cycles[12]), 
        .CI(n610), .CO(n442), .S(n432) );
  addf_x1 U490 ( .A(n1208), .B(timestamp_clk_cycles[51]), .CI(n934), .CO(n452), 
        .S(n441) );
  addf_x1 U491 ( .A(n437), .B(n436), .CI(n435), .CO(n529), .S(n508) );
  addf_x1 U492 ( .A(n440), .B(n439), .CI(n438), .CO(n470), .S(n447) );
  addf_x1 U493 ( .A(n443), .B(n442), .CI(n441), .CO(n469), .S(n530) );
  addf_x1 U494 ( .A(n446), .B(n445), .CI(n444), .CO(n473), .S(n468) );
  addf_x1 U495 ( .A(n449), .B(n448), .CI(n447), .CO(n460), .S(n534) );
  addf_x1 U496 ( .A(n452), .B(n451), .CI(n450), .CO(n464), .S(n467) );
  addf_x1 U497 ( .A(n455), .B(n454), .CI(n453), .CO(n463), .S(n466) );
  addf_x1 U498 ( .A(n458), .B(n457), .CI(n456), .CO(n465), .S(n531) );
  addf_x1 U499 ( .A(n461), .B(n460), .CI(n459), .CO(n488), .S(n538) );
  addf_x1 U500 ( .A(n464), .B(n463), .CI(n462), .CO(n481), .S(n487) );
  addf_x1 U501 ( .A(n467), .B(n466), .CI(n465), .CO(n476), .S(n459) );
  addf_x1 U502 ( .A(n470), .B(n469), .CI(n468), .CO(n475), .S(n461) );
  addf_x1 U503 ( .A(n473), .B(n472), .CI(n471), .CO(n482), .S(n474) );
  nor2_x1 U504 ( .A(n1704), .B(n1703), .Y(n2035) );
  addf_x1 U505 ( .A(n476), .B(n475), .CI(n474), .CO(n491), .S(n486) );
  addf_x1 U506 ( .A(n479), .B(n478), .CI(n477), .CO(n383), .S(n490) );
  addf_x1 U507 ( .A(n482), .B(n481), .CI(n480), .CO(n485), .S(n489) );
  addf_x1 U508 ( .A(n485), .B(n484), .CI(n483), .CO(n1713), .S(n1707) );
  or2_x1 U509 ( .A(n1708), .B(n1707), .Y(n2027) );
  addf_x1 U510 ( .A(n488), .B(n487), .CI(n486), .CO(n1706), .S(n1703) );
  addf_x1 U511 ( .A(n491), .B(n490), .CI(n489), .CO(n1708), .S(n1705) );
  or2_x1 U512 ( .A(n1706), .B(n1705), .Y(n2031) );
  nor2_x1 U513 ( .A(n2035), .B(n1711), .Y(n1996) );
  nand2_x1 U514 ( .A(n1730), .B(n1996), .Y(n1732) );
  addf_x1 U515 ( .A(timestamp_clk_cycles[28]), .B(timestamp_clk_cycles[8]), 
        .CI(n679), .CO(n521), .S(n503) );
  addf_x1 U516 ( .A(timestamp_clk_cycles[50]), .B(timestamp_clk_cycles[43]), 
        .CI(timestamp_clk_cycles[30]), .CO(n493), .S(n502) );
  addf_x1 U517 ( .A(timestamp_clk_cycles[10]), .B(timestamp_clk_cycles[48]), 
        .CI(n934), .CO(n494), .S(n501) );
  addf_x1 U518 ( .A(n494), .B(n493), .CI(n492), .CO(n437), .S(n515) );
  addf_x1 U519 ( .A(n497), .B(n496), .CI(n495), .CO(n512), .S(n514) );
  addf_x1 U520 ( .A(n500), .B(n499), .CI(n498), .CO(n523), .S(n543) );
  addf_x1 U521 ( .A(timestamp_clk_cycles[9]), .B(timestamp_clk_cycles[27]), 
        .CI(n981), .CO(n499), .S(n547) );
  addf_x1 U522 ( .A(n503), .B(n502), .CI(n501), .CO(n516), .S(n541) );
  inv_x1 U523 ( .A(timestamp_clk_cycles[15]), .Y(n1530) );
  addf_x1 U524 ( .A(n1542), .B(timestamp_clk_cycles[51]), .CI(n1516), .CO(n549), .S(n553) );
  addf_x1 U525 ( .A(timestamp_clk_cycles[7]), .B(timestamp_clk_cycles[47]), 
        .CI(n1514), .CO(n507), .S(n552) );
  addf_x1 U526 ( .A(timestamp_clk_cycles[29]), .B(timestamp_clk_cycles[49]), 
        .CI(n681), .CO(n506), .S(n551) );
  addf_x1 U527 ( .A(timestamp_clk_cycles[6]), .B(timestamp_clk_cycles[48]), 
        .CI(n680), .CO(n546), .S(n577) );
  addf_x1 U528 ( .A(timestamp_clk_cycles[46]), .B(timestamp_clk_cycles[26]), 
        .CI(n957), .CO(n545), .S(n578) );
  addf_x1 U529 ( .A(n946), .B(n689), .CI(n1540), .CO(n500), .S(n544) );
  addf_x1 U530 ( .A(n797), .B(n775), .CI(n504), .CO(n518), .S(n574) );
  addf_x1 U531 ( .A(n507), .B(n506), .CI(n505), .CO(n525), .S(n517) );
  addf_x1 U532 ( .A(n510), .B(n509), .CI(n508), .CO(n532), .S(n568) );
  addf_x1 U533 ( .A(n513), .B(n512), .CI(n511), .CO(n533), .S(n528) );
  addf_x1 U534 ( .A(n516), .B(n515), .CI(n514), .CO(n527), .S(n566) );
  addf_x1 U535 ( .A(n519), .B(n518), .CI(n517), .CO(n563), .S(n587) );
  addf_x1 U536 ( .A(n522), .B(n521), .CI(n520), .CO(n435), .S(n562) );
  addf_x1 U537 ( .A(n525), .B(n524), .CI(n523), .CO(n510), .S(n561) );
  addf_x1 U538 ( .A(n528), .B(n527), .CI(n526), .CO(n537), .S(n567) );
  addf_x1 U539 ( .A(n531), .B(n530), .CI(n529), .CO(n539), .S(n536) );
  addf_x1 U540 ( .A(n534), .B(n533), .CI(n532), .CO(n540), .S(n535) );
  nor2_x1 U541 ( .A(n1698), .B(n1697), .Y(n2047) );
  addf_x1 U542 ( .A(n537), .B(n536), .CI(n535), .CO(n1700), .S(n1697) );
  addf_x1 U543 ( .A(n540), .B(n539), .CI(n538), .CO(n1704), .S(n1699) );
  nor2_x1 U544 ( .A(n1700), .B(n1699), .Y(n2042) );
  nor2_x1 U545 ( .A(n2047), .B(n2042), .Y(n1702) );
  addf_x1 U546 ( .A(n543), .B(n542), .CI(n541), .CO(n565), .S(n592) );
  addf_x1 U547 ( .A(n546), .B(n545), .CI(n544), .CO(n519), .S(n572) );
  addf_x1 U548 ( .A(timestamp_clk_cycles[8]), .B(timestamp_clk_cycles[41]), 
        .CI(timestamp_clk_cycles[28]), .CO(n504), .S(n560) );
  addf_x1 U549 ( .A(timestamp_clk_cycles[11]), .B(timestamp_clk_cycles[31]), 
        .CI(n2099), .CO(n548), .S(n558) );
  addf_x1 U550 ( .A(n549), .B(n548), .CI(n547), .CO(n542), .S(n570) );
  addf_x1 U551 ( .A(timestamp_clk_cycles[5]), .B(timestamp_clk_cycles[27]), 
        .CI(n775), .CO(n554), .S(n584) );
  addf_x1 U552 ( .A(n958), .B(timestamp_clk_cycles[25]), .CI(n1541), .CO(n559), 
        .S(n579) );
  addf_x1 U553 ( .A(timestamp_clk_cycles[7]), .B(timestamp_clk_cycles[47]), 
        .CI(n1530), .CO(n555), .S(n1609) );
  addf_x1 U554 ( .A(timestamp_clk_cycles[45]), .B(timestamp_clk_cycles[10]), 
        .CI(n1514), .CO(n556), .S(n1608) );
  inv_x1 U555 ( .A(timestamp_clk_cycles[13]), .Y(n1531) );
  addf_x1 U556 ( .A(n552), .B(n551), .CI(n550), .CO(n588), .S(n1614) );
  addf_x1 U557 ( .A(n555), .B(n554), .CI(n553), .CO(n575), .S(n1600) );
  addf_x1 U558 ( .A(n557), .B(n776), .CI(n556), .CO(n550), .S(n1599) );
  addf_x1 U559 ( .A(n560), .B(n559), .CI(n558), .CO(n571), .S(n1598) );
  addf_x1 U560 ( .A(n563), .B(n562), .CI(n561), .CO(n526), .S(n594) );
  addf_x1 U561 ( .A(n566), .B(n565), .CI(n564), .CO(n569), .S(n593) );
  addf_x1 U562 ( .A(n569), .B(n568), .CI(n567), .CO(n1698), .S(n1695) );
  addf_x1 U563 ( .A(n572), .B(n571), .CI(n570), .CO(n591), .S(n1618) );
  addf_x1 U564 ( .A(n575), .B(n574), .CI(n573), .CO(n589), .S(n1617) );
  addf_x1 U565 ( .A(timestamp_clk_cycles[6]), .B(timestamp_clk_cycles[39]), 
        .CI(timestamp_clk_cycles[26]), .CO(n583), .S(n1583) );
  addf_x1 U566 ( .A(timestamp_clk_cycles[9]), .B(timestamp_clk_cycles[49]), 
        .CI(n2096), .CO(n581), .S(n1581) );
  addf_x1 U567 ( .A(n1516), .B(timestamp_clk_cycles[29]), .CI(n2099), .CO(n585), .S(n1575) );
  addf_x1 U568 ( .A(timestamp_clk_cycles[44]), .B(timestamp_clk_cycles[24]), 
        .CI(n981), .CO(n582), .S(n1571) );
  addf_x1 U569 ( .A(timestamp_clk_cycles[4]), .B(timestamp_clk_cycles[46]), 
        .CI(n776), .CO(n580), .S(n1570) );
  addf_x1 U570 ( .A(n578), .B(n577), .CI(n576), .CO(n573), .S(n1632) );
  addf_x1 U571 ( .A(n581), .B(n580), .CI(n579), .CO(n1602), .S(n1624) );
  addf_x1 U572 ( .A(n583), .B(n1540), .CI(n582), .CO(n576), .S(n1623) );
  addf_x1 U573 ( .A(n586), .B(n585), .CI(n584), .CO(n1603), .S(n1622) );
  addf_x1 U574 ( .A(n589), .B(n588), .CI(n587), .CO(n564), .S(n1620) );
  addf_x1 U575 ( .A(n592), .B(n591), .CI(n590), .CO(n595), .S(n1619) );
  addf_x1 U576 ( .A(n595), .B(n594), .CI(n593), .CO(n1696), .S(n1693) );
  nor2_x1 U577 ( .A(n1694), .B(n1693), .Y(n2052) );
  nor2_x1 U578 ( .A(n2054), .B(n2052), .Y(n2041) );
  nor2_x1 U579 ( .A(n1732), .B(n1991), .Y(n1896) );
  inv_x1 U580 ( .A(timestamp_clk_cycles[10]), .Y(n1475) );
  inv_x1 U581 ( .A(timestamp_clk_cycles[5]), .Y(n1019) );
  inv_x1 U582 ( .A(timestamp_clk_cycles[8]), .Y(n1200) );
  addf_x1 U583 ( .A(timestamp_clk_cycles[17]), .B(timestamp_clk_cycles[37]), 
        .CI(n1019), .CO(n597), .S(n733) );
  addh_x1 U584 ( .A(timestamp_clk_cycles[20]), .B(timestamp_clk_cycles[40]), 
        .CO(n611), .S(n600) );
  inv_x1 U585 ( .A(timestamp_clk_cycles[9]), .Y(n1232) );
  inv_x1 U586 ( .A(timestamp_clk_cycles[3]), .Y(n1008) );
  inv_x1 U587 ( .A(timestamp_clk_cycles[7]), .Y(n1198) );
  addf_x1 U588 ( .A(timestamp_clk_cycles[0]), .B(timestamp_clk_cycles[15]), 
        .CI(n1191), .CO(n622), .S(n734) );
  addf_x1 U589 ( .A(n598), .B(n597), .CI(n596), .CO(n604), .S(n752) );
  inv_x1 U590 ( .A(timestamp_clk_cycles[11]), .Y(n1503) );
  inv_x1 U591 ( .A(timestamp_clk_cycles[12]), .Y(n1546) );
  addf_x1 U592 ( .A(timestamp_clk_cycles[18]), .B(timestamp_clk_cycles[36]), 
        .CI(n1503), .CO(n608), .S(n627) );
  addf_x1 U593 ( .A(timestamp_clk_cycles[38]), .B(timestamp_clk_cycles[16]), 
        .CI(n1515), .CO(n609), .S(n626) );
  addf_x1 U594 ( .A(n600), .B(n1483), .CI(n599), .CO(n625), .S(n732) );
  addf_x1 U595 ( .A(n603), .B(n602), .CI(n601), .CO(n613), .S(n750) );
  addf_x1 U596 ( .A(n606), .B(n605), .CI(n604), .CO(n650), .S(n764) );
  addf_x1 U597 ( .A(n609), .B(n608), .CI(n607), .CO(n633), .S(n615) );
  addf_x1 U598 ( .A(timestamp_clk_cycles[21]), .B(timestamp_clk_cycles[41]), 
        .CI(n2089), .CO(n621), .S(n603) );
  addf_x1 U599 ( .A(timestamp_clk_cycles[1]), .B(timestamp_clk_cycles[47]), 
        .CI(n610), .CO(n620), .S(n602) );
  addf_x1 U600 ( .A(timestamp_clk_cycles[22]), .B(timestamp_clk_cycles[48]), 
        .CI(n1232), .CO(n637), .S(n605) );
  addf_x1 U601 ( .A(timestamp_clk_cycles[42]), .B(timestamp_clk_cycles[2]), 
        .CI(n1198), .CO(n636), .S(n618) );
  addf_x1 U602 ( .A(n1200), .B(n1234), .CI(n611), .CO(n617), .S(n596) );
  addf_x1 U603 ( .A(timestamp_clk_cycles[19]), .B(timestamp_clk_cycles[39]), 
        .CI(n1207), .CO(n640), .S(n616) );
  addf_x1 U604 ( .A(n1546), .B(n612), .CI(n1539), .CO(n643), .S(n607) );
  addf_x1 U605 ( .A(n615), .B(n614), .CI(n613), .CO(n629), .S(n763) );
  addf_x1 U606 ( .A(n618), .B(n617), .CI(n616), .CO(n646), .S(n762) );
  addf_x1 U607 ( .A(n621), .B(n620), .CI(n619), .CO(n631), .S(n761) );
  addf_x1 U608 ( .A(n623), .B(n1208), .CI(n622), .CO(n606), .S(n743) );
  addf_x1 U609 ( .A(timestamp_clk_cycles[35]), .B(timestamp_clk_cycles[46]), 
        .CI(n1198), .CO(n623), .S(n719) );
  inv_x1 U610 ( .A(timestamp_clk_cycles[4]), .Y(n2087) );
  addf_x1 U611 ( .A(n1475), .B(n624), .CI(n1207), .CO(n598), .S(n717) );
  addf_x1 U612 ( .A(n627), .B(n626), .CI(n625), .CO(n614), .S(n741) );
  addf_x1 U613 ( .A(n630), .B(n629), .CI(n628), .CO(n653), .S(n769) );
  addf_x1 U614 ( .A(n633), .B(n632), .CI(n631), .CO(n677), .S(n648) );
  addf_x1 U615 ( .A(n1483), .B(timestamp_clk_cycles[0]), .CI(n1200), .CO(n669), 
        .S(n638) );
  addf_x1 U616 ( .A(n1475), .B(n1234), .CI(n634), .CO(n668), .S(n635) );
  addf_x1 U617 ( .A(n637), .B(n636), .CI(n635), .CO(n659), .S(n647) );
  addh_x1 U618 ( .A(timestamp_clk_cycles[40]), .B(timestamp_clk_cycles[38]), 
        .CO(n674), .S(n634) );
  addf_x1 U619 ( .A(timestamp_clk_cycles[20]), .B(timestamp_clk_cycles[18]), 
        .CI(n1531), .CO(n673), .S(n644) );
  addf_x1 U620 ( .A(n640), .B(n639), .CI(n638), .CO(n657), .S(n649) );
  addf_x1 U621 ( .A(timestamp_clk_cycles[3]), .B(timestamp_clk_cycles[49]), 
        .CI(n641), .CO(n672), .S(n642) );
  addf_x1 U622 ( .A(timestamp_clk_cycles[23]), .B(timestamp_clk_cycles[43]), 
        .CI(n1547), .CO(n671), .S(n632) );
  addf_x1 U623 ( .A(n644), .B(n643), .CI(n642), .CO(n661), .S(n645) );
  addf_x1 U624 ( .A(n647), .B(n646), .CI(n645), .CO(n655), .S(n630) );
  addf_x1 U625 ( .A(n650), .B(n649), .CI(n648), .CO(n654), .S(n770) );
  nor2_x1 U626 ( .A(n1445), .B(n1444), .Y(n678) );
  addf_x1 U627 ( .A(n653), .B(n652), .CI(n651), .CO(n1447), .S(n1444) );
  addf_x1 U628 ( .A(n656), .B(n655), .CI(n654), .CO(n1459), .S(n651) );
  addf_x1 U629 ( .A(n659), .B(n658), .CI(n657), .CO(n1486), .S(n675) );
  addf_x1 U630 ( .A(timestamp_clk_cycles[1]), .B(timestamp_clk_cycles[39]), 
        .CI(n858), .CO(n1482), .S(n663) );
  addf_x1 U631 ( .A(timestamp_clk_cycles[24]), .B(timestamp_clk_cycles[44]), 
        .CI(n1232), .CO(n1481), .S(n665) );
  addf_x1 U632 ( .A(n662), .B(n661), .CI(n660), .CO(n1484), .S(n656) );
  addf_x1 U633 ( .A(n665), .B(n664), .CI(n663), .CO(n1471), .S(n660) );
  addf_x1 U634 ( .A(timestamp_clk_cycles[4]), .B(timestamp_clk_cycles[50]), 
        .CI(n1503), .CO(n1468), .S(n664) );
  xnor2_x1 U635 ( .A(timestamp_clk_cycles[40]), .B(timestamp_clk_cycles[2]), 
        .Y(n1467) );
  addf_x1 U636 ( .A(n666), .B(timestamp_clk_cycles[19]), .CI(n2096), .CO(n1479), .S(n670) );
  addf_x1 U637 ( .A(n669), .B(n668), .CI(n667), .CO(n1465), .S(n676) );
  addf_x1 U638 ( .A(n672), .B(n671), .CI(n670), .CO(n1464), .S(n662) );
  addf_x1 U639 ( .A(n674), .B(n1579), .CI(n673), .CO(n1472), .S(n658) );
  addf_x1 U640 ( .A(n677), .B(n676), .CI(n675), .CO(n1460), .S(n652) );
  nor2_x1 U641 ( .A(n1447), .B(n1446), .Y(n1449) );
  nor2_x1 U642 ( .A(n678), .B(n1449), .Y(n1453) );
  inv_x1 U643 ( .A(timestamp_clk_cycles[1]), .Y(n1130) );
  addf_x1 U644 ( .A(timestamp_clk_cycles[31]), .B(timestamp_clk_cycles[36]), 
        .CI(n957), .CO(n697), .S(n786) );
  addf_x1 U645 ( .A(timestamp_clk_cycles[13]), .B(timestamp_clk_cycles[33]), 
        .CI(n1130), .CO(n698), .S(n784) );
  addf_x1 U646 ( .A(timestamp_clk_cycles[16]), .B(timestamp_clk_cycles[42]), 
        .CI(n679), .CO(n682), .S(n785) );
  addf_x1 U647 ( .A(n2089), .B(n1208), .CI(n934), .CO(n695), .S(n778) );
  addf_x1 U648 ( .A(n680), .B(timestamp_clk_cycles[11]), .CI(n1008), .CO(n694), 
        .S(n799) );
  addf_x1 U649 ( .A(timestamp_clk_cycles[17]), .B(timestamp_clk_cycles[43]), 
        .CI(n1207), .CO(n688), .S(n693) );
  addf_x1 U650 ( .A(timestamp_clk_cycles[12]), .B(timestamp_clk_cycles[14]), 
        .CI(n681), .CO(n687), .S(n684) );
  addf_x1 U651 ( .A(n946), .B(n941), .CI(n682), .CO(n686), .S(n683) );
  addf_x1 U652 ( .A(n685), .B(n684), .CI(n683), .CO(n691), .S(n802) );
  addf_x1 U653 ( .A(timestamp_clk_cycles[32]), .B(timestamp_clk_cycles[34]), 
        .CI(n1198), .CO(n702), .S(n685) );
  addf_x1 U654 ( .A(timestamp_clk_cycles[38]), .B(timestamp_clk_cycles[44]), 
        .CI(n1008), .CO(n707), .S(n701) );
  addf_x1 U655 ( .A(n2084), .B(timestamp_clk_cycles[37]), .CI(n2087), .CO(n700), .S(n696) );
  addf_x1 U656 ( .A(n688), .B(n687), .CI(n686), .CO(n724), .S(n692) );
  addf_x1 U657 ( .A(timestamp_clk_cycles[34]), .B(timestamp_clk_cycles[14]), 
        .CI(n858), .CO(n730), .S(n713) );
  addf_x1 U658 ( .A(n689), .B(timestamp_clk_cycles[15]), .CI(n1191), .CO(n712), 
        .S(n699) );
  addf_x1 U659 ( .A(n1208), .B(timestamp_clk_cycles[19]), .CI(n2087), .CO(n718), .S(n711) );
  addf_x1 U660 ( .A(n692), .B(n691), .CI(n690), .CO(n710), .S(n811) );
  addf_x1 U661 ( .A(n695), .B(n694), .CI(n693), .CO(n810), .S(n787) );
  addf_x1 U662 ( .A(n698), .B(n697), .CI(n696), .CO(n809), .S(n804) );
  addf_x1 U663 ( .A(n701), .B(n700), .CI(n699), .CO(n725), .S(n808) );
  addf_x1 U664 ( .A(timestamp_clk_cycles[13]), .B(timestamp_clk_cycles[33]), 
        .CI(n1019), .CO(n716), .S(n705) );
  addf_x1 U665 ( .A(timestamp_clk_cycles[35]), .B(timestamp_clk_cycles[18]), 
        .CI(n934), .CO(n715), .S(n704) );
  addf_x1 U666 ( .A(n1200), .B(n1234), .CI(n702), .CO(n714), .S(n703) );
  addf_x1 U667 ( .A(n705), .B(n704), .CI(n703), .CO(n721), .S(n690) );
  addf_x1 U668 ( .A(timestamp_clk_cycles[39]), .B(timestamp_clk_cycles[45]), 
        .CI(n706), .CO(n731), .S(n728) );
  addf_x1 U669 ( .A(timestamp_clk_cycles[16]), .B(timestamp_clk_cycles[36]), 
        .CI(n1232), .CO(n599), .S(n727) );
  addf_x1 U670 ( .A(n2089), .B(n941), .CI(n707), .CO(n729), .S(n726) );
  addf_x1 U671 ( .A(n710), .B(n709), .CI(n708), .CO(n737), .S(n817) );
  addf_x1 U672 ( .A(n713), .B(n712), .CI(n711), .CO(n749), .S(n723) );
  addf_x1 U673 ( .A(n716), .B(n715), .CI(n714), .CO(n748), .S(n722) );
  addf_x1 U674 ( .A(n719), .B(n718), .CI(n717), .CO(n742), .S(n747) );
  addf_x1 U675 ( .A(n722), .B(n721), .CI(n720), .CO(n740), .S(n708) );
  addf_x1 U676 ( .A(n725), .B(n724), .CI(n723), .CO(n739), .S(n818) );
  addf_x1 U677 ( .A(n728), .B(n727), .CI(n726), .CO(n746), .S(n720) );
  addf_x1 U678 ( .A(n731), .B(n730), .CI(n729), .CO(n601), .S(n745) );
  addf_x1 U679 ( .A(n734), .B(n733), .CI(n732), .CO(n751), .S(n744) );
  or2_x1 U680 ( .A(n1428), .B(n1427), .Y(n753) );
  addf_x1 U681 ( .A(n737), .B(n736), .CI(n735), .CO(n1430), .S(n1427) );
  addf_x1 U682 ( .A(n740), .B(n739), .CI(n738), .CO(n756), .S(n735) );
  addf_x1 U683 ( .A(n743), .B(n742), .CI(n741), .CO(n760), .S(n755) );
  addf_x1 U684 ( .A(n746), .B(n745), .CI(n744), .CO(n759), .S(n738) );
  addf_x1 U685 ( .A(n749), .B(n748), .CI(n747), .CO(n758), .S(n736) );
  addf_x1 U686 ( .A(n752), .B(n751), .CI(n750), .CO(n765), .S(n757) );
  or2_x1 U687 ( .A(n1430), .B(n1429), .Y(n1432) );
  nand2_x1 U688 ( .A(n753), .B(n1432), .Y(n773) );
  addf_x1 U689 ( .A(n756), .B(n755), .CI(n754), .CO(n1435), .S(n1429) );
  addf_x1 U690 ( .A(n759), .B(n758), .CI(n757), .CO(n768), .S(n754) );
  addf_x1 U691 ( .A(n762), .B(n761), .CI(n760), .CO(n628), .S(n767) );
  addf_x1 U692 ( .A(n765), .B(n764), .CI(n763), .CO(n771), .S(n766) );
  or2_x1 U693 ( .A(n1435), .B(n1434), .Y(n772) );
  addf_x1 U694 ( .A(n768), .B(n767), .CI(n766), .CO(n1437), .S(n1434) );
  addf_x1 U695 ( .A(n771), .B(n770), .CI(n769), .CO(n1445), .S(n1436) );
  or2_x1 U696 ( .A(n1437), .B(n1436), .Y(n1439) );
  nand2_x1 U697 ( .A(n772), .B(n1439), .Y(n1443) );
  nor2_x1 U698 ( .A(n773), .B(n1443), .Y(n774) );
  nand2_x1 U699 ( .A(n1453), .B(n774), .Y(n1456) );
  addf_x1 U700 ( .A(timestamp_clk_cycles[31]), .B(timestamp_clk_cycles[34]), 
        .CI(n957), .CO(n794), .S(n826) );
  or2_x1 U701 ( .A(timestamp_clk_cycles[8]), .B(timestamp_clk_cycles[28]), .Y(
        n777) );
  addf_x1 U702 ( .A(timestamp_clk_cycles[11]), .B(timestamp_clk_cycles[29]), 
        .CI(n981), .CO(n795), .S(n824) );
  addf_x1 U703 ( .A(timestamp_clk_cycles[30]), .B(timestamp_clk_cycles[10]), 
        .CI(\div_2/u_div/DP_OP_70_127_3758/n1703 ), .CO(n779), .S(n783) );
  addf_x1 U704 ( .A(n958), .B(n946), .CI(n775), .CO(n801), .S(n781) );
  addf_x1 U705 ( .A(n776), .B(timestamp_clk_cycles[9]), .CI(n1130), .CO(n782), 
        .S(n821) );
  addf_x1 U706 ( .A(n2084), .B(timestamp_clk_cycles[15]), .CI(n1019), .CO(n800), .S(n829) );
  addf_x1 U707 ( .A(timestamp_clk_cycles[14]), .B(timestamp_clk_cycles[40]), 
        .CI(n777), .CO(n798), .S(n825) );
  addf_x1 U708 ( .A(timestamp_clk_cycles[41]), .B(timestamp_clk_cycles[35]), 
        .CI(n1191), .CO(n780), .S(n796) );
  addf_x1 U709 ( .A(n780), .B(n779), .CI(n778), .CO(n788), .S(n792) );
  addf_x1 U710 ( .A(n783), .B(n782), .CI(n781), .CO(n791), .S(n847) );
  addf_x1 U711 ( .A(n786), .B(n785), .CI(n784), .CO(n803), .S(n790) );
  addf_x1 U712 ( .A(n789), .B(n788), .CI(n787), .CO(n812), .S(n838) );
  addf_x1 U713 ( .A(n792), .B(n791), .CI(n790), .CO(n807), .S(n834) );
  addf_x1 U714 ( .A(n795), .B(n794), .CI(n793), .CO(n833), .S(n849) );
  addf_x1 U715 ( .A(n798), .B(n797), .CI(n796), .CO(n832), .S(n828) );
  addf_x1 U716 ( .A(n801), .B(n800), .CI(n799), .CO(n789), .S(n831) );
  addf_x1 U717 ( .A(n804), .B(n803), .CI(n802), .CO(n813), .S(n805) );
  addf_x1 U718 ( .A(n807), .B(n806), .CI(n805), .CO(n816), .S(n837) );
  addf_x1 U719 ( .A(n810), .B(n809), .CI(n808), .CO(n709), .S(n815) );
  addf_x1 U720 ( .A(n813), .B(n812), .CI(n811), .CO(n819), .S(n814) );
  or2_x1 U721 ( .A(n1415), .B(n1414), .Y(n820) );
  addf_x1 U722 ( .A(n816), .B(n815), .CI(n814), .CO(n1417), .S(n1414) );
  addf_x1 U723 ( .A(n819), .B(n818), .CI(n817), .CO(n1428), .S(n1416) );
  or2_x1 U724 ( .A(n1417), .B(n1416), .Y(n1419) );
  nand2_x1 U725 ( .A(n820), .B(n1419), .Y(n1423) );
  addf_x1 U726 ( .A(n823), .B(n822), .CI(n821), .CO(n830), .S(n1375) );
  addf_x1 U727 ( .A(timestamp_clk_cycles[13]), .B(timestamp_clk_cycles[39]), 
        .CI(n1008), .CO(n822), .S(n1360) );
  addf_x1 U728 ( .A(n826), .B(n825), .CI(n824), .CO(n848), .S(n1373) );
  addf_x1 U729 ( .A(n2087), .B(n941), .CI(n827), .CO(n793), .S(n842) );
  xnor2_x1 U730 ( .A(timestamp_clk_cycles[28]), .B(timestamp_clk_cycles[8]), 
        .Y(n843) );
  addf_x1 U731 ( .A(n958), .B(timestamp_clk_cycles[33]), .CI(
        \div_2/u_div/DP_OP_70_127_3758/n1703 ), .CO(n823), .S(n844) );
  addf_x1 U732 ( .A(n830), .B(n829), .CI(n828), .CO(n835), .S(n850) );
  addf_x1 U733 ( .A(n833), .B(n832), .CI(n831), .CO(n806), .S(n854) );
  addf_x1 U734 ( .A(n836), .B(n835), .CI(n834), .CO(n839), .S(n853) );
  addf_x1 U735 ( .A(n839), .B(n838), .CI(n837), .CO(n1415), .S(n1409) );
  or2_x1 U736 ( .A(n1410), .B(n1409), .Y(n1412) );
  addf_x1 U737 ( .A(n842), .B(n841), .CI(n840), .CO(n851), .S(n1378) );
  addf_x1 U738 ( .A(n1540), .B(n1542), .CI(n843), .CO(n841), .S(n1359) );
  addf_x1 U739 ( .A(timestamp_clk_cycles[30]), .B(timestamp_clk_cycles[10]), 
        .CI(n934), .CO(n827), .S(n1358) );
  or2_x1 U740 ( .A(timestamp_clk_cycles[36]), .B(timestamp_clk_cycles[30]), 
        .Y(n917) );
  addf_x1 U741 ( .A(n2084), .B(timestamp_clk_cycles[7]), .CI(n1516), .CO(n1362), .S(n1330) );
  addf_x1 U742 ( .A(n846), .B(n845), .CI(n844), .CO(n840), .S(n1356) );
  addf_x1 U743 ( .A(timestamp_clk_cycles[9]), .B(timestamp_clk_cycles[29]), 
        .CI(n946), .CO(n1361), .S(n1336) );
  addf_x1 U744 ( .A(timestamp_clk_cycles[27]), .B(timestamp_clk_cycles[32]), 
        .CI(n1514), .CO(n846), .S(n1341) );
  addf_x1 U745 ( .A(timestamp_clk_cycles[12]), .B(timestamp_clk_cycles[38]), 
        .CI(n981), .CO(n845), .S(n1340) );
  addf_x1 U746 ( .A(n849), .B(n848), .CI(n847), .CO(n836), .S(n1383) );
  addf_x1 U747 ( .A(n852), .B(n851), .CI(n850), .CO(n855), .S(n1382) );
  addf_x1 U748 ( .A(n855), .B(n854), .CI(n853), .CO(n1410), .S(n1407) );
  or2_x1 U749 ( .A(n1408), .B(n1407), .Y(n856) );
  nand2_x1 U750 ( .A(n1412), .B(n856), .Y(n857) );
  nor2_x1 U751 ( .A(n1423), .B(n857), .Y(n1426) );
  addf_x1 U752 ( .A(timestamp_clk_cycles[0]), .B(timestamp_clk_cycles[5]), 
        .CI(n858), .CO(n861), .S(n1252) );
  addh_x1 U753 ( .A(timestamp_clk_cycles[18]), .B(timestamp_clk_cycles[20]), 
        .CO(n1235), .S(n1199) );
  addf_x1 U754 ( .A(n861), .B(n860), .CI(n859), .CO(n878), .S(n1274) );
  addf_x1 U755 ( .A(timestamp_clk_cycles[6]), .B(timestamp_clk_cycles[32]), 
        .CI(n1503), .CO(n875), .S(n864) );
  addf_x1 U756 ( .A(n864), .B(n863), .CI(n862), .CO(n876), .S(n1275) );
  addf_x1 U757 ( .A(n1483), .B(timestamp_clk_cycles[3]), .CI(n865), .CO(n873), 
        .S(n859) );
  addf_x1 U758 ( .A(timestamp_clk_cycles[21]), .B(timestamp_clk_cycles[23]), 
        .CI(n2099), .CO(n871), .S(n862) );
  addh_x1 U759 ( .A(timestamp_clk_cycles[20]), .B(timestamp_clk_cycles[2]), 
        .CO(n865), .S(n1258) );
  addf_x1 U760 ( .A(timestamp_clk_cycles[1]), .B(timestamp_clk_cycles[26]), 
        .CI(n1531), .CO(n870), .S(n1271) );
  addf_x1 U761 ( .A(timestamp_clk_cycles[31]), .B(timestamp_clk_cycles[22]), 
        .CI(n1530), .CO(n860), .S(n1262) );
  addf_x1 U762 ( .A(timestamp_clk_cycles[21]), .B(timestamp_clk_cycles[1]), 
        .CI(n2096), .CO(n1261), .S(n1242) );
  addf_x1 U763 ( .A(n1546), .B(timestamp_clk_cycles[25]), .CI(n1475), .CO(n863), .S(n1260) );
  addf_x1 U764 ( .A(n868), .B(n867), .CI(n866), .CO(n881), .S(n1279) );
  addf_x1 U765 ( .A(n871), .B(n870), .CI(n869), .CO(n894), .S(n867) );
  addf_x1 U766 ( .A(timestamp_clk_cycles[22]), .B(timestamp_clk_cycles[2]), 
        .CI(n1514), .CO(n891), .S(n874) );
  addf_x1 U767 ( .A(n874), .B(n873), .CI(n872), .CO(n892), .S(n868) );
  addf_x1 U768 ( .A(timestamp_clk_cycles[7]), .B(timestamp_clk_cycles[33]), 
        .CI(n1546), .CO(n887), .S(n869) );
  addf_x1 U769 ( .A(timestamp_clk_cycles[4]), .B(timestamp_clk_cycles[24]), 
        .CI(n1515), .CO(n886), .S(n872) );
  addf_x1 U770 ( .A(n2096), .B(timestamp_clk_cycles[27]), .CI(n875), .CO(n885), 
        .S(n877) );
  addf_x1 U771 ( .A(n878), .B(n877), .CI(n876), .CO(n882), .S(n1280) );
  addf_x1 U772 ( .A(n881), .B(n880), .CI(n879), .CO(n1307), .S(n1304) );
  addf_x1 U773 ( .A(n884), .B(n883), .CI(n882), .CO(n928), .S(n879) );
  addf_x1 U774 ( .A(n887), .B(n886), .CI(n885), .CO(n908), .S(n883) );
  addf_x1 U775 ( .A(timestamp_clk_cycles[8]), .B(timestamp_clk_cycles[34]), 
        .CI(n1531), .CO(n902), .S(n889) );
  addf_x1 U776 ( .A(n890), .B(n889), .CI(n888), .CO(n906), .S(n884) );
  addf_x1 U777 ( .A(timestamp_clk_cycles[23]), .B(timestamp_clk_cycles[5]), 
        .CI(n1542), .CO(n901), .S(n888) );
  addf_x1 U778 ( .A(timestamp_clk_cycles[25]), .B(timestamp_clk_cycles[28]), 
        .CI(n1530), .CO(n900), .S(n890) );
  addf_x1 U779 ( .A(n1539), .B(timestamp_clk_cycles[3]), .CI(n891), .CO(n899), 
        .S(n893) );
  addf_x1 U780 ( .A(n894), .B(n893), .CI(n892), .CO(n896), .S(n880) );
  or2_x1 U781 ( .A(n1307), .B(n1306), .Y(n1309) );
  nand2_x1 U782 ( .A(n895), .B(n1309), .Y(n933) );
  addf_x1 U783 ( .A(n898), .B(n897), .CI(n896), .CO(n931), .S(n926) );
  addf_x1 U784 ( .A(n901), .B(n900), .CI(n899), .CO(n925), .S(n897) );
  xnor2_x1 U785 ( .A(timestamp_clk_cycles[30]), .B(timestamp_clk_cycles[36]), 
        .Y(n919) );
  addf_x1 U786 ( .A(timestamp_clk_cycles[24]), .B(timestamp_clk_cycles[4]), 
        .CI(n981), .CO(n918), .S(n905) );
  addf_x1 U787 ( .A(timestamp_clk_cycles[7]), .B(timestamp_clk_cycles[25]), 
        .CI(\div_2/u_div/DP_OP_70_127_3758/n1703 ), .CO(n912), .S(n922) );
  addf_x1 U788 ( .A(timestamp_clk_cycles[27]), .B(timestamp_clk_cycles[10]), 
        .CI(n1514), .CO(n913), .S(n921) );
  addf_x1 U789 ( .A(timestamp_clk_cycles[9]), .B(timestamp_clk_cycles[35]), 
        .CI(n2096), .CO(n916), .S(n903) );
  addf_x1 U790 ( .A(timestamp_clk_cycles[6]), .B(timestamp_clk_cycles[26]), 
        .CI(n1547), .CO(n915), .S(n904) );
  addf_x1 U791 ( .A(n2099), .B(timestamp_clk_cycles[29]), .CI(n902), .CO(n914), 
        .S(n907) );
  addf_x1 U792 ( .A(n905), .B(n904), .CI(n903), .CO(n910), .S(n898) );
  addf_x1 U793 ( .A(n908), .B(n907), .CI(n906), .CO(n909), .S(n927) );
  addf_x1 U794 ( .A(n911), .B(n910), .CI(n909), .CO(n1326), .S(n929) );
  addf_x1 U795 ( .A(n913), .B(n1542), .CI(n912), .CO(n1339), .S(n1347) );
  addf_x1 U796 ( .A(n916), .B(n915), .CI(n914), .CO(n1346), .S(n911) );
  addf_x1 U797 ( .A(timestamp_clk_cycles[8]), .B(timestamp_clk_cycles[26]), 
        .CI(n917), .CO(n1331), .S(n1335) );
  addf_x1 U798 ( .A(n1579), .B(timestamp_clk_cycles[5]), .CI(n1530), .CO(n1334), .S(n920) );
  addf_x1 U799 ( .A(n2099), .B(timestamp_clk_cycles[11]), .CI(n1541), .CO(
        n1338), .S(n1333) );
  addf_x1 U800 ( .A(timestamp_clk_cycles[31]), .B(timestamp_clk_cycles[37]), 
        .CI(n1130), .CO(n1337), .S(n1344) );
  addf_x1 U801 ( .A(timestamp_clk_cycles[28]), .B(timestamp_clk_cycles[6]), 
        .CI(n957), .CO(n1332), .S(n1343) );
  addf_x1 U802 ( .A(n919), .B(n958), .CI(n918), .CO(n1342), .S(n924) );
  addf_x1 U803 ( .A(n922), .B(n921), .CI(n920), .CO(n1328), .S(n923) );
  addf_x1 U804 ( .A(n925), .B(n924), .CI(n923), .CO(n1327), .S(n930) );
  or2_x1 U805 ( .A(n1314), .B(n1313), .Y(n1316) );
  addf_x1 U806 ( .A(n928), .B(n927), .CI(n926), .CO(n1312), .S(n1306) );
  addf_x1 U807 ( .A(n931), .B(n930), .CI(n929), .CO(n1314), .S(n1311) );
  or2_x1 U808 ( .A(n1312), .B(n1311), .Y(n932) );
  nand2_x1 U809 ( .A(n1316), .B(n932), .Y(n1320) );
  nor2_x1 U810 ( .A(n933), .B(n1320), .Y(n1323) );
  addf_x1 U811 ( .A(timestamp_clk_cycles[18]), .B(timestamp_clk_cycles[24]), 
        .CI(n1008), .CO(n935), .S(n961) );
  or2_x1 U812 ( .A(timestamp_clk_cycles[10]), .B(timestamp_clk_cycles[12]), 
        .Y(n1131) );
  addf_x1 U813 ( .A(timestamp_clk_cycles[19]), .B(timestamp_clk_cycles[25]), 
        .CI(n934), .CO(n943), .S(n951) );
  addf_x1 U814 ( .A(n2087), .B(n2089), .CI(n935), .CO(n942), .S(n952) );
  addf_x1 U815 ( .A(timestamp_clk_cycles[16]), .B(timestamp_clk_cycles[14]), 
        .CI(n1232), .CO(n939), .S(n949) );
  addf_x1 U816 ( .A(n938), .B(n937), .CI(n936), .CO(n1211), .S(n953) );
  addf_x1 U817 ( .A(n940), .B(n1475), .CI(n939), .CO(n1188), .S(n938) );
  addf_x1 U818 ( .A(timestamp_clk_cycles[17]), .B(timestamp_clk_cycles[0]), 
        .CI(n1198), .CO(n1194), .S(n944) );
  addh_x1 U819 ( .A(timestamp_clk_cycles[20]), .B(timestamp_clk_cycles[26]), 
        .CO(n1193), .S(n940) );
  addf_x1 U820 ( .A(n941), .B(timestamp_clk_cycles[15]), .CI(n1019), .CO(n1192), .S(n937) );
  addf_x1 U821 ( .A(n944), .B(n943), .CI(n942), .CO(n1185), .S(n954) );
  or2_x1 U822 ( .A(n1178), .B(n1177), .Y(n1180) );
  addf_x1 U823 ( .A(n1200), .B(n946), .CI(n945), .CO(n947), .S(n964) );
  addf_x1 U824 ( .A(timestamp_clk_cycles[13]), .B(timestamp_clk_cycles[15]), 
        .CI(n1019), .CO(n948), .S(n963) );
  addf_x1 U825 ( .A(timestamp_clk_cycles[17]), .B(timestamp_clk_cycles[23]), 
        .CI(n1198), .CO(n960), .S(n1141) );
  addf_x1 U826 ( .A(n949), .B(n948), .CI(n947), .CO(n936), .S(n966) );
  addf_x1 U827 ( .A(n952), .B(n951), .CI(n950), .CO(n955), .S(n965) );
  addf_x1 U828 ( .A(n955), .B(n954), .CI(n953), .CO(n1178), .S(n1172) );
  nor2_x1 U829 ( .A(n1173), .B(n1172), .Y(n1175) );
  addf_x1 U830 ( .A(n2087), .B(n2084), .CI(n956), .CO(n959), .S(n1146) );
  addf_x1 U831 ( .A(timestamp_clk_cycles[14]), .B(timestamp_clk_cycles[12]), 
        .CI(n957), .CO(n945), .S(n1145) );
  addf_x1 U832 ( .A(n2089), .B(n958), .CI(n1008), .CO(n1143), .S(n1124) );
  addf_x1 U833 ( .A(n961), .B(n960), .CI(n959), .CO(n950), .S(n1152) );
  addf_x1 U834 ( .A(n964), .B(n963), .CI(n962), .CO(n967), .S(n1151) );
  addf_x1 U835 ( .A(n967), .B(n966), .CI(n965), .CO(n1173), .S(n1170) );
  nor2_x1 U836 ( .A(n1171), .B(n1170), .Y(n968) );
  nor2_x1 U837 ( .A(n1175), .B(n968), .Y(n969) );
  nand2_x1 U838 ( .A(n1180), .B(n969), .Y(n1184) );
  or2_x1 U839 ( .A(timestamp_clk_cycles[16]), .B(timestamp_clk_cycles[10]), 
        .Y(n990) );
  xnor2_x1 U840 ( .A(timestamp_clk_cycles[10]), .B(timestamp_clk_cycles[8]), 
        .Y(n973) );
  addf_x1 U841 ( .A(timestamp_clk_cycles[7]), .B(timestamp_clk_cycles[9]), 
        .CI(n2084), .CO(n972), .S(n1091) );
  addf_x1 U842 ( .A(n972), .B(n971), .CI(n970), .CO(n976), .S(n1097) );
  addf_x1 U843 ( .A(timestamp_clk_cycles[19]), .B(timestamp_clk_cycles[13]), 
        .CI(n1514), .CO(n982), .S(n970) );
  addf_x1 U844 ( .A(n1008), .B(\div_2/u_div/DP_OP_70_127_3758/n1703 ), .CI(
        n973), .CO(n979), .S(n1098) );
  or2_x1 U845 ( .A(timestamp_clk_cycles[8]), .B(timestamp_clk_cycles[10]), .Y(
        n980) );
  or2_x1 U846 ( .A(n1112), .B(n1111), .Y(n983) );
  addf_x1 U847 ( .A(n976), .B(n975), .CI(n974), .CO(n1114), .S(n1111) );
  addf_x1 U848 ( .A(n979), .B(n978), .CI(n977), .CO(n1123), .S(n974) );
  addf_x1 U849 ( .A(timestamp_clk_cycles[14]), .B(timestamp_clk_cycles[20]), 
        .CI(n980), .CO(n1134), .S(n978) );
  xnor2_x1 U850 ( .A(timestamp_clk_cycles[12]), .B(timestamp_clk_cycles[10]), 
        .Y(n1133) );
  addf_x1 U851 ( .A(timestamp_clk_cycles[21]), .B(timestamp_clk_cycles[15]), 
        .CI(n981), .CO(n1125), .S(n1132) );
  addf_x1 U852 ( .A(n1019), .B(n2084), .CI(
        \div_2/u_div/DP_OP_70_127_3758/n1703 ), .CO(n1126), .S(n1129) );
  addf_x1 U853 ( .A(timestamp_clk_cycles[11]), .B(timestamp_clk_cycles[9]), 
        .CI(n1130), .CO(n1128), .S(n977) );
  addf_x1 U854 ( .A(n2087), .B(n1542), .CI(n982), .CO(n1127), .S(n975) );
  or2_x1 U855 ( .A(n1114), .B(n1113), .Y(n1116) );
  nand2_x1 U856 ( .A(n983), .B(n1116), .Y(n1120) );
  addf_x1 U857 ( .A(timestamp_clk_cycles[9]), .B(timestamp_clk_cycles[15]), 
        .CI(n984), .CO(n987), .S(n993) );
  xnor2_x1 U858 ( .A(timestamp_clk_cycles[10]), .B(timestamp_clk_cycles[16]), 
        .Y(n989) );
  addf_x1 U859 ( .A(timestamp_clk_cycles[6]), .B(timestamp_clk_cycles[4]), 
        .CI(n1531), .CO(n988), .S(n994) );
  or2_x1 U860 ( .A(n1077), .B(n1076), .Y(n991) );
  addf_x1 U861 ( .A(n987), .B(n986), .CI(n985), .CO(n1079), .S(n1076) );
  addf_x1 U862 ( .A(n989), .B(n2096), .CI(n988), .CO(n1088), .S(n985) );
  addf_x1 U863 ( .A(timestamp_clk_cycles[11]), .B(timestamp_clk_cycles[17]), 
        .CI(n1130), .CO(n1093), .S(n1087) );
  addf_x1 U864 ( .A(timestamp_clk_cycles[7]), .B(timestamp_clk_cycles[5]), 
        .CI(\div_2/u_div/DP_OP_70_127_3758/n1703 ), .CO(n1090), .S(n986) );
  addf_x1 U865 ( .A(timestamp_clk_cycles[8]), .B(timestamp_clk_cycles[6]), 
        .CI(n990), .CO(n1092), .S(n1089) );
  or2_x1 U866 ( .A(n1079), .B(n1078), .Y(n1081) );
  nand2_x1 U867 ( .A(n991), .B(n1081), .Y(n1085) );
  addf_x1 U868 ( .A(timestamp_clk_cycles[8]), .B(timestamp_clk_cycles[14]), 
        .CI(n1546), .CO(n984), .S(n998) );
  addf_x1 U869 ( .A(timestamp_clk_cycles[3]), .B(timestamp_clk_cycles[5]), 
        .CI(n992), .CO(n995), .S(n997) );
  addf_x1 U870 ( .A(n995), .B(n994), .CI(n993), .CO(n1077), .S(n1068) );
  nor2_x1 U871 ( .A(n1069), .B(n1068), .Y(n1071) );
  addf_x1 U872 ( .A(timestamp_clk_cycles[4]), .B(timestamp_clk_cycles[2]), 
        .CI(n1503), .CO(n992), .S(n1054) );
  addf_x1 U873 ( .A(timestamp_clk_cycles[7]), .B(timestamp_clk_cycles[13]), 
        .CI(n996), .CO(n999), .S(n1052) );
  addf_x1 U874 ( .A(n999), .B(n998), .CI(n997), .CO(n1069), .S(n1066) );
  addh_x1 U875 ( .A(timestamp_clk_cycles[3]), .B(timestamp_clk_cycles[0]), 
        .CO(n1002), .S(n1003) );
  addh_x1 U876 ( .A(timestamp_clk_cycles[0]), .B(timestamp_clk_cycles[2]), 
        .CO(n1048), .S(n1046) );
  or2_x1 U877 ( .A(n1041), .B(n1040), .Y(n1044) );
  addf_x1 U878 ( .A(timestamp_clk_cycles[4]), .B(timestamp_clk_cycles[10]), 
        .CI(n1200), .CO(n1047), .S(n1036) );
  addf_x1 U879 ( .A(n1002), .B(timestamp_clk_cycles[1]), .CI(n1001), .CO(n1041), .S(n1035) );
  nor2_x1 U880 ( .A(n1036), .B(n1035), .Y(n1039) );
  addf_x1 U881 ( .A(n1198), .B(timestamp_clk_cycles[9]), .CI(n1003), .CO(n1001), .S(n1030) );
  or2_x1 U882 ( .A(n1031), .B(n1030), .Y(n1034) );
  addf_x1 U883 ( .A(timestamp_clk_cycles[8]), .B(timestamp_clk_cycles[2]), 
        .CI(n2089), .CO(n1031), .S(n1025) );
  nor2_x1 U884 ( .A(n1026), .B(n1025), .Y(n1029) );
  nor2_x1 U885 ( .A(n2087), .B(n1015), .Y(n1018) );
  nor2_x1 U886 ( .A(timestamp_clk_cycles[2]), .B(
        \div_2/u_div/DP_OP_70_127_3758/n1703 ), .Y(n1006) );
  nor2_x1 U887 ( .A(timestamp_clk_cycles[3]), .B(n1130), .Y(n1005) );
  nand2_x1 U888 ( .A(timestamp_clk_cycles[3]), .B(n1130), .Y(n1004) );
  oai21_x1 U889 ( .A0(n1006), .A1(n1005), .B0(n1004), .Y(n1014) );
  nor2_x1 U890 ( .A(timestamp_clk_cycles[4]), .B(n2084), .Y(n1007) );
  nor2_x1 U891 ( .A(timestamp_clk_cycles[5]), .B(n1008), .Y(n1010) );
  nor2_x1 U892 ( .A(n1007), .B(n1010), .Y(n1013) );
  nand2_x1 U893 ( .A(timestamp_clk_cycles[4]), .B(n2084), .Y(n1011) );
  nand2_x1 U894 ( .A(timestamp_clk_cycles[5]), .B(n1008), .Y(n1009) );
  oai21_x1 U895 ( .A0(n1011), .A1(n1010), .B0(n1009), .Y(n1012) );
  aoi21_x1 U896 ( .A0(n1014), .A1(n1013), .B0(n1012), .Y(n1017) );
  nand2_x1 U897 ( .A(n2087), .B(n1015), .Y(n1016) );
  oai21_x1 U898 ( .A0(n1018), .A1(n1017), .B0(n1016), .Y(n1024) );
  addh_x1 U899 ( .A(timestamp_clk_cycles[0]), .B(timestamp_clk_cycles[6]), 
        .CO(n1021), .S(n1015) );
  addf_x1 U900 ( .A(timestamp_clk_cycles[1]), .B(timestamp_clk_cycles[7]), 
        .CI(n1019), .CO(n1026), .S(n1020) );
  or2_x1 U901 ( .A(n1021), .B(n1020), .Y(n1023) );
  and2_x1 U902 ( .A(n1021), .B(n1020), .Y(n1022) );
  aoi21_x1 U903 ( .A0(n1024), .A1(n1023), .B0(n1022), .Y(n1028) );
  nand2_x1 U904 ( .A(n1026), .B(n1025), .Y(n1027) );
  oai21_x1 U905 ( .A0(n1029), .A1(n1028), .B0(n1027), .Y(n1033) );
  and2_x1 U906 ( .A(n1031), .B(n1030), .Y(n1032) );
  aoi21_x1 U907 ( .A0(n1034), .A1(n1033), .B0(n1032), .Y(n1038) );
  nand2_x1 U908 ( .A(n1036), .B(n1035), .Y(n1037) );
  oai21_x1 U909 ( .A0(n1039), .A1(n1038), .B0(n1037), .Y(n1043) );
  and2_x1 U910 ( .A(n1041), .B(n1040), .Y(n1042) );
  aoi21_x1 U911 ( .A0(n1044), .A1(n1043), .B0(n1042), .Y(n1065) );
  addf_x1 U912 ( .A(n1047), .B(n1046), .CI(n1045), .CO(n1057), .S(n1040) );
  addf_x1 U913 ( .A(timestamp_clk_cycles[6]), .B(timestamp_clk_cycles[12]), 
        .CI(n1475), .CO(n996), .S(n1051) );
  addf_x1 U914 ( .A(timestamp_clk_cycles[11]), .B(timestamp_clk_cycles[5]), 
        .CI(n1232), .CO(n1050), .S(n1045) );
  addf_x1 U915 ( .A(timestamp_clk_cycles[1]), .B(timestamp_clk_cycles[3]), 
        .CI(n1048), .CO(n1053), .S(n1049) );
  or2_x1 U916 ( .A(n1057), .B(n1056), .Y(n1055) );
  addf_x1 U917 ( .A(n1051), .B(n1050), .CI(n1049), .CO(n1059), .S(n1056) );
  addf_x1 U918 ( .A(n1054), .B(n1053), .CI(n1052), .CO(n1067), .S(n1058) );
  or2_x1 U919 ( .A(n1059), .B(n1058), .Y(n1061) );
  nand2_x1 U920 ( .A(n1055), .B(n1061), .Y(n1064) );
  and2_x1 U921 ( .A(n1057), .B(n1056), .Y(n1062) );
  aoi21_x1 U922 ( .A0(n1062), .A1(n1061), .B0(n1060), .Y(n1063) );
  oai21_x1 U923 ( .A0(n1065), .A1(n1064), .B0(n1063), .Y(n1074) );
  nand2_x1 U924 ( .A(n1067), .B(n1066), .Y(n1072) );
  nand2_x1 U925 ( .A(n1069), .B(n1068), .Y(n1070) );
  oai21_x1 U926 ( .A0(n1072), .A1(n1071), .B0(n1070), .Y(n1073) );
  aoi21_x1 U927 ( .A0(n1075), .A1(n1074), .B0(n1073), .Y(n1084) );
  and2_x1 U928 ( .A(n1077), .B(n1076), .Y(n1082) );
  and2_x1 U929 ( .A(n1079), .B(n1078), .Y(n1080) );
  aoi21_x1 U930 ( .A0(n1082), .A1(n1081), .B0(n1080), .Y(n1083) );
  oai21_x1 U931 ( .A0(n1085), .A1(n1084), .B0(n1083), .Y(n1110) );
  addf_x1 U932 ( .A(n1088), .B(n1087), .CI(n1086), .CO(n1102), .S(n1078) );
  addf_x1 U933 ( .A(n1090), .B(n1530), .CI(n1089), .CO(n1096), .S(n1086) );
  addf_x1 U934 ( .A(timestamp_clk_cycles[12]), .B(timestamp_clk_cycles[18]), 
        .CI(n2099), .CO(n971), .S(n1095) );
  addf_x1 U935 ( .A(n1093), .B(n1092), .CI(n1091), .CO(n1099), .S(n1094) );
  nor2_x1 U936 ( .A(n1102), .B(n1101), .Y(n1100) );
  addf_x1 U937 ( .A(n1096), .B(n1095), .CI(n1094), .CO(n1104), .S(n1101) );
  addf_x1 U938 ( .A(n1099), .B(n1098), .CI(n1097), .CO(n1112), .S(n1103) );
  nor2_x1 U939 ( .A(n1104), .B(n1103), .Y(n1106) );
  nor2_x1 U940 ( .A(n1100), .B(n1106), .Y(n1109) );
  nand2_x1 U941 ( .A(n1102), .B(n1101), .Y(n1107) );
  nand2_x1 U942 ( .A(n1104), .B(n1103), .Y(n1105) );
  oai21_x1 U943 ( .A0(n1107), .A1(n1106), .B0(n1105), .Y(n1108) );
  aoi21_x1 U944 ( .A0(n1110), .A1(n1109), .B0(n1108), .Y(n1119) );
  and2_x1 U945 ( .A(n1112), .B(n1111), .Y(n1117) );
  aoi21_x1 U946 ( .A0(n1117), .A1(n1116), .B0(n1115), .Y(n1118) );
  oai21_x1 U947 ( .A0(n1120), .A1(n1119), .B0(n1118), .Y(n1169) );
  addf_x1 U948 ( .A(n1123), .B(n1122), .CI(n1121), .CO(n1156), .S(n1113) );
  addf_x1 U949 ( .A(n1126), .B(n1125), .CI(n1124), .CO(n1144), .S(n1137) );
  addf_x1 U950 ( .A(n1129), .B(n1128), .CI(n1127), .CO(n1136), .S(n1121) );
  addf_x1 U951 ( .A(timestamp_clk_cycles[11]), .B(timestamp_clk_cycles[13]), 
        .CI(n1130), .CO(n1142), .S(n1140) );
  addf_x1 U952 ( .A(timestamp_clk_cycles[16]), .B(timestamp_clk_cycles[22]), 
        .CI(n1131), .CO(n956), .S(n1139) );
  addf_x1 U953 ( .A(n1134), .B(n1133), .CI(n1132), .CO(n1138), .S(n1122) );
  or2_x1 U954 ( .A(n1156), .B(n1155), .Y(n1147) );
  addf_x1 U955 ( .A(n1137), .B(n1136), .CI(n1135), .CO(n1158), .S(n1155) );
  addf_x1 U956 ( .A(n1140), .B(n1139), .CI(n1138), .CO(n1150), .S(n1135) );
  addf_x1 U957 ( .A(n1143), .B(n1142), .CI(n1141), .CO(n962), .S(n1149) );
  addf_x1 U958 ( .A(n1146), .B(n1145), .CI(n1144), .CO(n1153), .S(n1148) );
  or2_x1 U959 ( .A(n1158), .B(n1157), .Y(n1160) );
  nand2_x1 U960 ( .A(n1147), .B(n1160), .Y(n1154) );
  addf_x1 U961 ( .A(n1150), .B(n1149), .CI(n1148), .CO(n1163), .S(n1157) );
  addf_x1 U962 ( .A(n1153), .B(n1152), .CI(n1151), .CO(n1171), .S(n1162) );
  nor2_x1 U963 ( .A(n1154), .B(n1166), .Y(n1168) );
  and2_x1 U964 ( .A(n1156), .B(n1155), .Y(n1161) );
  aoi21_x1 U965 ( .A0(n1161), .A1(n1160), .B0(n1159), .Y(n1165) );
  nand2_x1 U966 ( .A(n1163), .B(n1162), .Y(n1164) );
  oai21_x1 U967 ( .A0(n1166), .A1(n1165), .B0(n1164), .Y(n1167) );
  aoi21_x1 U968 ( .A0(n1169), .A1(n1168), .B0(n1167), .Y(n1183) );
  nand2_x1 U969 ( .A(n1171), .B(n1170), .Y(n1176) );
  oai21_x1 U970 ( .A0(n1176), .A1(n1175), .B0(n1174), .Y(n1181) );
  aoi21_x1 U971 ( .A0(n1181), .A1(n1180), .B0(n1179), .Y(n1182) );
  oai21_x1 U972 ( .A0(n1184), .A1(n1183), .B0(n1182), .Y(n1225) );
  addf_x1 U973 ( .A(n1187), .B(n1186), .CI(n1185), .CO(n1214), .S(n1209) );
  addf_x1 U974 ( .A(n1190), .B(n1189), .CI(n1188), .CO(n1213), .S(n1210) );
  addf_x1 U975 ( .A(timestamp_clk_cycles[1]), .B(timestamp_clk_cycles[27]), 
        .CI(n1191), .CO(n1206), .S(n1190) );
  addf_x1 U976 ( .A(timestamp_clk_cycles[18]), .B(timestamp_clk_cycles[16]), 
        .CI(n1503), .CO(n1205), .S(n1189) );
  addf_x1 U977 ( .A(n1194), .B(n1193), .CI(n1192), .CO(n1196), .S(n1187) );
  addf_x1 U978 ( .A(n1200), .B(timestamp_clk_cycles[21]), .CI(n2089), .CO(
        n1202), .S(n1186) );
  addf_x1 U979 ( .A(n1197), .B(n1196), .CI(n1195), .CO(n1228), .S(n1212) );
  addf_x1 U980 ( .A(timestamp_clk_cycles[17]), .B(timestamp_clk_cycles[28]), 
        .CI(n1232), .CO(n1241), .S(n1201) );
  addf_x1 U981 ( .A(timestamp_clk_cycles[22]), .B(timestamp_clk_cycles[2]), 
        .CI(n1198), .CO(n1240), .S(n1203) );
  addf_x1 U982 ( .A(n1200), .B(n1475), .CI(n1199), .CO(n1244), .S(n1239) );
  addf_x1 U983 ( .A(n1203), .B(n1202), .CI(n1201), .CO(n1231), .S(n1195) );
  addf_x1 U984 ( .A(n1206), .B(n1205), .CI(n1204), .CO(n1230), .S(n1197) );
  addf_x1 U985 ( .A(timestamp_clk_cycles[23]), .B(timestamp_clk_cycles[0]), 
        .CI(n1207), .CO(n1243), .S(n1238) );
  addf_x1 U986 ( .A(n1208), .B(timestamp_clk_cycles[19]), .CI(n1546), .CO(
        n1237), .S(n1204) );
  addf_x1 U987 ( .A(timestamp_clk_cycles[3]), .B(timestamp_clk_cycles[29]), 
        .CI(n1531), .CO(n1233), .S(n1236) );
  nor2_x1 U988 ( .A(n1219), .B(n1218), .Y(n1221) );
  addf_x1 U989 ( .A(n1211), .B(n1210), .CI(n1209), .CO(n1217), .S(n1177) );
  addf_x1 U990 ( .A(n1214), .B(n1213), .CI(n1212), .CO(n1219), .S(n1216) );
  nor2_x1 U991 ( .A(n1217), .B(n1216), .Y(n1215) );
  nor2_x1 U992 ( .A(n1221), .B(n1215), .Y(n1224) );
  nand2_x1 U993 ( .A(n1217), .B(n1216), .Y(n1222) );
  nand2_x1 U994 ( .A(n1219), .B(n1218), .Y(n1220) );
  oai21_x1 U995 ( .A0(n1222), .A1(n1221), .B0(n1220), .Y(n1223) );
  aoi21_x1 U996 ( .A0(n1225), .A1(n1224), .B0(n1223), .Y(n1303) );
  addf_x1 U997 ( .A(n1228), .B(n1227), .CI(n1226), .CO(n1285), .S(n1218) );
  addf_x1 U998 ( .A(n1231), .B(n1230), .CI(n1229), .CO(n1247), .S(n1226) );
  addf_x1 U999 ( .A(timestamp_clk_cycles[19]), .B(timestamp_clk_cycles[30]), 
        .CI(n1232), .CO(n1257), .S(n1256) );
  addf_x1 U1000 ( .A(timestamp_clk_cycles[24]), .B(timestamp_clk_cycles[4]), 
        .CI(n1503), .CO(n1259), .S(n1255) );
  addf_x1 U1001 ( .A(n1235), .B(n1234), .CI(n1233), .CO(n1253), .S(n1254) );
  addf_x1 U1002 ( .A(n1238), .B(n1237), .CI(n1236), .CO(n1250), .S(n1229) );
  addf_x1 U1003 ( .A(n1241), .B(n1240), .CI(n1239), .CO(n1249), .S(n1227) );
  addf_x1 U1004 ( .A(n1244), .B(n1243), .CI(n1242), .CO(n1251), .S(n1248) );
  addf_x1 U1005 ( .A(n1247), .B(n1246), .CI(n1245), .CO(n1287), .S(n1284) );
  addf_x1 U1006 ( .A(n1250), .B(n1249), .CI(n1248), .CO(n1266), .S(n1245) );
  addf_x1 U1007 ( .A(n1253), .B(n1252), .CI(n1251), .CO(n1273), .S(n1265) );
  addf_x1 U1008 ( .A(n1256), .B(n1255), .CI(n1254), .CO(n1269), .S(n1246) );
  addf_x1 U1009 ( .A(n1259), .B(n1258), .CI(n1257), .CO(n1272), .S(n1268) );
  addf_x1 U1010 ( .A(n1262), .B(n1261), .CI(n1260), .CO(n1270), .S(n1267) );
  nor2_x1 U1011 ( .A(n1287), .B(n1286), .Y(n1289) );
  nor2_x1 U1012 ( .A(n1263), .B(n1289), .Y(n1283) );
  addf_x1 U1013 ( .A(n1266), .B(n1265), .CI(n1264), .CO(n1292), .S(n1286) );
  addf_x1 U1014 ( .A(n1269), .B(n1268), .CI(n1267), .CO(n1278), .S(n1264) );
  addf_x1 U1015 ( .A(n1272), .B(n1271), .CI(n1270), .CO(n866), .S(n1277) );
  addf_x1 U1016 ( .A(n1275), .B(n1274), .CI(n1273), .CO(n1281), .S(n1276) );
  nor2_x1 U1017 ( .A(n1292), .B(n1291), .Y(n1282) );
  addf_x1 U1018 ( .A(n1278), .B(n1277), .CI(n1276), .CO(n1294), .S(n1291) );
  addf_x1 U1019 ( .A(n1281), .B(n1280), .CI(n1279), .CO(n1305), .S(n1293) );
  nor2_x1 U1020 ( .A(n1294), .B(n1293), .Y(n1296) );
  nor2_x1 U1021 ( .A(n1282), .B(n1296), .Y(n1299) );
  nand2_x1 U1022 ( .A(n1283), .B(n1299), .Y(n1302) );
  nand2_x1 U1023 ( .A(n1285), .B(n1284), .Y(n1290) );
  nand2_x1 U1024 ( .A(n1287), .B(n1286), .Y(n1288) );
  oai21_x1 U1025 ( .A0(n1290), .A1(n1289), .B0(n1288), .Y(n1300) );
  nand2_x1 U1026 ( .A(n1292), .B(n1291), .Y(n1297) );
  oai21_x1 U1027 ( .A0(n1297), .A1(n1296), .B0(n1295), .Y(n1298) );
  aoi21_x1 U1028 ( .A0(n1300), .A1(n1299), .B0(n1298), .Y(n1301) );
  oai21_x1 U1029 ( .A0(n1303), .A1(n1302), .B0(n1301), .Y(n1322) );
  and2_x1 U1030 ( .A(n1305), .B(n1304), .Y(n1310) );
  and2_x1 U1031 ( .A(n1307), .B(n1306), .Y(n1308) );
  aoi21_x1 U1032 ( .A0(n1310), .A1(n1309), .B0(n1308), .Y(n1319) );
  and2_x1 U1033 ( .A(n1312), .B(n1311), .Y(n1317) );
  aoi21_x1 U1034 ( .A0(n1317), .A1(n1316), .B0(n1315), .Y(n1318) );
  oai21_x1 U1035 ( .A0(n1320), .A1(n1319), .B0(n1318), .Y(n1321) );
  aoi21_x1 U1036 ( .A0(n1323), .A1(n1322), .B0(n1321), .Y(n1406) );
  addf_x1 U1037 ( .A(n1326), .B(n1325), .CI(n1324), .CO(n1388), .S(n1313) );
  addf_x1 U1038 ( .A(n1329), .B(n1328), .CI(n1327), .CO(n1350), .S(n1324) );
  addf_x1 U1039 ( .A(n1332), .B(n1331), .CI(n1330), .CO(n1357), .S(n1365) );
  addf_x1 U1040 ( .A(n1335), .B(n1334), .CI(n1333), .CO(n1364), .S(n1345) );
  addf_x1 U1041 ( .A(n1338), .B(n1337), .CI(n1336), .CO(n1355), .S(n1363) );
  addf_x1 U1042 ( .A(n1341), .B(n1340), .CI(n1339), .CO(n1354), .S(n1353) );
  addf_x1 U1043 ( .A(n1344), .B(n1343), .CI(n1342), .CO(n1352), .S(n1329) );
  addf_x1 U1044 ( .A(n1347), .B(n1346), .CI(n1345), .CO(n1351), .S(n1325) );
  nor2_x1 U1045 ( .A(n1388), .B(n1387), .Y(n1366) );
  addf_x1 U1046 ( .A(n1350), .B(n1349), .CI(n1348), .CO(n1390), .S(n1387) );
  addf_x1 U1047 ( .A(n1353), .B(n1352), .CI(n1351), .CO(n1369), .S(n1348) );
  addf_x1 U1048 ( .A(n1356), .B(n1355), .CI(n1354), .CO(n1376), .S(n1368) );
  addf_x1 U1049 ( .A(n1359), .B(n1358), .CI(n1357), .CO(n1377), .S(n1372) );
  addf_x1 U1050 ( .A(n1362), .B(n1361), .CI(n1360), .CO(n1374), .S(n1371) );
  addf_x1 U1051 ( .A(n1365), .B(n1364), .CI(n1363), .CO(n1370), .S(n1349) );
  nor2_x1 U1052 ( .A(n1390), .B(n1389), .Y(n1392) );
  nor2_x1 U1053 ( .A(n1366), .B(n1392), .Y(n1386) );
  addf_x1 U1054 ( .A(n1369), .B(n1368), .CI(n1367), .CO(n1395), .S(n1389) );
  addf_x1 U1055 ( .A(n1372), .B(n1371), .CI(n1370), .CO(n1381), .S(n1367) );
  addf_x1 U1056 ( .A(n1375), .B(n1374), .CI(n1373), .CO(n852), .S(n1380) );
  addf_x1 U1057 ( .A(n1378), .B(n1377), .CI(n1376), .CO(n1384), .S(n1379) );
  nor2_x1 U1058 ( .A(n1395), .B(n1394), .Y(n1385) );
  addf_x1 U1059 ( .A(n1381), .B(n1380), .CI(n1379), .CO(n1397), .S(n1394) );
  addf_x1 U1060 ( .A(n1384), .B(n1383), .CI(n1382), .CO(n1408), .S(n1396) );
  nor2_x1 U1061 ( .A(n1397), .B(n1396), .Y(n1399) );
  nor2_x1 U1062 ( .A(n1385), .B(n1399), .Y(n1402) );
  nand2_x1 U1063 ( .A(n1386), .B(n1402), .Y(n1405) );
  nand2_x1 U1064 ( .A(n1388), .B(n1387), .Y(n1393) );
  nand2_x1 U1065 ( .A(n1390), .B(n1389), .Y(n1391) );
  oai21_x1 U1066 ( .A0(n1393), .A1(n1392), .B0(n1391), .Y(n1403) );
  oai21_x1 U1067 ( .A0(n1400), .A1(n1399), .B0(n1398), .Y(n1401) );
  aoi21_x1 U1068 ( .A0(n1403), .A1(n1402), .B0(n1401), .Y(n1404) );
  oai21_x1 U1069 ( .A0(n1406), .A1(n1405), .B0(n1404), .Y(n1425) );
  and2_x1 U1070 ( .A(n1408), .B(n1407), .Y(n1413) );
  and2_x1 U1071 ( .A(n1410), .B(n1409), .Y(n1411) );
  aoi21_x1 U1072 ( .A0(n1413), .A1(n1412), .B0(n1411), .Y(n1422) );
  and2_x1 U1073 ( .A(n1415), .B(n1414), .Y(n1420) );
  and2_x1 U1074 ( .A(n1417), .B(n1416), .Y(n1418) );
  aoi21_x1 U1075 ( .A0(n1420), .A1(n1419), .B0(n1418), .Y(n1421) );
  oai21_x1 U1076 ( .A0(n1423), .A1(n1422), .B0(n1421), .Y(n1424) );
  aoi21_x1 U1077 ( .A0(n1426), .A1(n1425), .B0(n1424), .Y(n1455) );
  and2_x1 U1078 ( .A(n1428), .B(n1427), .Y(n1433) );
  and2_x1 U1079 ( .A(n1430), .B(n1429), .Y(n1431) );
  aoi21_x1 U1080 ( .A0(n1433), .A1(n1432), .B0(n1431), .Y(n1442) );
  and2_x1 U1081 ( .A(n1435), .B(n1434), .Y(n1440) );
  aoi21_x1 U1082 ( .A0(n1440), .A1(n1439), .B0(n1438), .Y(n1441) );
  oai21_x1 U1083 ( .A0(n1443), .A1(n1442), .B0(n1441), .Y(n1452) );
  nand2_x1 U1084 ( .A(n1445), .B(n1444), .Y(n1450) );
  nand2_x1 U1085 ( .A(n1447), .B(n1446), .Y(n1448) );
  oai21_x1 U1086 ( .A0(n1450), .A1(n1449), .B0(n1448), .Y(n1451) );
  aoi21_x1 U1087 ( .A0(n1453), .A1(n1452), .B0(n1451), .Y(n1454) );
  oai21_x1 U1088 ( .A0(n1456), .A1(n1455), .B0(n1454), .Y(n2065) );
  addf_x1 U1089 ( .A(n1459), .B(n1458), .CI(n1457), .CO(n1660), .S(n1446) );
  addf_x1 U1090 ( .A(n1462), .B(n1461), .CI(n1460), .CO(n1489), .S(n1457) );
  addf_x1 U1091 ( .A(n1465), .B(n1464), .CI(n1463), .CO(n1519), .S(n1461) );
  addf_x1 U1092 ( .A(n1468), .B(n1467), .CI(n1466), .CO(n1505), .S(n1470) );
  addf_x1 U1093 ( .A(n1471), .B(n1470), .CI(n1469), .CO(n1517), .S(n1462) );
  addf_x1 U1094 ( .A(n1474), .B(n1473), .CI(n1472), .CO(n1502), .S(n1463) );
  addf_x1 U1095 ( .A(timestamp_clk_cycles[22]), .B(timestamp_clk_cycles[42]), 
        .CI(n1530), .CO(n1499), .S(n1473) );
  addf_x1 U1096 ( .A(timestamp_clk_cycles[25]), .B(timestamp_clk_cycles[0]), 
        .CI(n1541), .CO(n1497), .S(n1474) );
  addf_x1 U1097 ( .A(timestamp_clk_cycles[51]), .B(timestamp_clk_cycles[5]), 
        .CI(n1475), .CO(n1513), .S(n1477) );
  addf_x1 U1098 ( .A(timestamp_clk_cycles[45]), .B(timestamp_clk_cycles[20]), 
        .CI(n1476), .CO(n1512), .S(n1466) );
  addf_x1 U1099 ( .A(n1479), .B(n1478), .CI(n1477), .CO(n1495), .S(n1469) );
  addf_x1 U1100 ( .A(n1482), .B(n1481), .CI(n1480), .CO(n1494), .S(n1485) );
  or2_x1 U1101 ( .A(timestamp_clk_cycles[2]), .B(timestamp_clk_cycles[40]), 
        .Y(n1504) );
  addf_x1 U1102 ( .A(n1546), .B(n1539), .CI(n1483), .CO(n1509), .S(n1480) );
  addf_x1 U1103 ( .A(n1486), .B(n1485), .CI(n1484), .CO(n1490), .S(n1458) );
  nor2_x1 U1104 ( .A(n1660), .B(n1659), .Y(n1520) );
  addf_x1 U1105 ( .A(n1489), .B(n1488), .CI(n1487), .CO(n1662), .S(n1659) );
  addf_x1 U1106 ( .A(n1492), .B(n1491), .CI(n1490), .CO(n1523), .S(n1487) );
  addf_x1 U1107 ( .A(n1495), .B(n1494), .CI(n1493), .CO(n1559), .S(n1491) );
  addf_x1 U1108 ( .A(timestamp_clk_cycles[42]), .B(timestamp_clk_cycles[24]), 
        .CI(n1496), .CO(n1550), .S(n1555) );
  addf_x1 U1109 ( .A(n1499), .B(n1498), .CI(n1497), .CO(n1554), .S(n1501) );
  addf_x1 U1110 ( .A(n1502), .B(n1501), .CI(n1500), .CO(n1557), .S(n1492) );
  addf_x1 U1111 ( .A(n2125), .B(timestamp_clk_cycles[3]), .CI(n1547), .CO(
        n1553), .S(n1508) );
  addf_x1 U1112 ( .A(timestamp_clk_cycles[21]), .B(timestamp_clk_cycles[41]), 
        .CI(n1503), .CO(n1552), .S(n1506) );
  addh_x1 U1113 ( .A(timestamp_clk_cycles[6]), .B(timestamp_clk_cycles[46]), 
        .CO(n1538), .S(n1498) );
  addf_x1 U1114 ( .A(timestamp_clk_cycles[43]), .B(timestamp_clk_cycles[26]), 
        .CI(n1504), .CO(n1534), .S(n1510) );
  addh_x1 U1115 ( .A(timestamp_clk_cycles[44]), .B(timestamp_clk_cycles[2]), 
        .CO(n1549), .S(n1533) );
  addf_x1 U1116 ( .A(timestamp_clk_cycles[23]), .B(timestamp_clk_cycles[1]), 
        .CI(n1531), .CO(n1532), .S(n1507) );
  addf_x1 U1117 ( .A(n1507), .B(n1506), .CI(n1505), .CO(n1535), .S(n1518) );
  addf_x1 U1118 ( .A(n1510), .B(n1509), .CI(n1508), .CO(n1529), .S(n1493) );
  addf_x1 U1119 ( .A(n1513), .B(n1512), .CI(n1511), .CO(n1528), .S(n1500) );
  addf_x1 U1120 ( .A(timestamp_clk_cycles[22]), .B(timestamp_clk_cycles[4]), 
        .CI(n1514), .CO(n1548), .S(n1545) );
  addf_x1 U1121 ( .A(n2099), .B(n1516), .CI(n1515), .CO(n1544), .S(n1511) );
  addf_x1 U1122 ( .A(n1519), .B(n1518), .CI(n1517), .CO(n1524), .S(n1488) );
  nor2_x1 U1123 ( .A(n1662), .B(n1661), .Y(n1664) );
  nor2_x1 U1124 ( .A(n1520), .B(n1664), .Y(n1597) );
  addf_x1 U1125 ( .A(n1523), .B(n1522), .CI(n1521), .CO(n1667), .S(n1661) );
  addf_x1 U1126 ( .A(n1526), .B(n1525), .CI(n1524), .CO(n1562), .S(n1521) );
  addf_x1 U1127 ( .A(n1529), .B(n1528), .CI(n1527), .CO(n1595), .S(n1525) );
  addf_x1 U1128 ( .A(timestamp_clk_cycles[3]), .B(timestamp_clk_cycles[43]), 
        .CI(n1530), .CO(n1576), .S(n1592) );
  addf_x1 U1129 ( .A(timestamp_clk_cycles[45]), .B(timestamp_clk_cycles[8]), 
        .CI(n1531), .CO(n1578), .S(n1591) );
  addf_x1 U1130 ( .A(n1534), .B(n1533), .CI(n1532), .CO(n1590), .S(n1536) );
  addf_x1 U1131 ( .A(n1537), .B(n1536), .CI(n1535), .CO(n1593), .S(n1526) );
  addf_x1 U1132 ( .A(n2096), .B(n1539), .CI(n1538), .CO(n1589), .S(n1551) );
  addf_x1 U1133 ( .A(timestamp_clk_cycles[7]), .B(timestamp_clk_cycles[27]), 
        .CI(n1540), .CO(n1588), .S(n1556) );
  addf_x1 U1134 ( .A(n1542), .B(timestamp_clk_cycles[5]), .CI(n1541), .CO(
        n1582), .S(n1587) );
  addf_x1 U1135 ( .A(n1545), .B(n1544), .CI(n1543), .CO(n1573), .S(n1527) );
  addf_x1 U1136 ( .A(n1579), .B(timestamp_clk_cycles[47]), .CI(n1546), .CO(
        n1585), .S(n1543) );
  addf_x1 U1137 ( .A(timestamp_clk_cycles[23]), .B(timestamp_clk_cycles[25]), 
        .CI(n1547), .CO(n1577), .S(n1584) );
  addf_x1 U1138 ( .A(n1550), .B(n1549), .CI(n1548), .CO(n1569), .S(n1568) );
  addf_x1 U1139 ( .A(n1553), .B(n1552), .CI(n1551), .CO(n1567), .S(n1537) );
  addf_x1 U1140 ( .A(n1556), .B(n1555), .CI(n1554), .CO(n1566), .S(n1558) );
  addf_x1 U1141 ( .A(n1559), .B(n1558), .CI(n1557), .CO(n1563), .S(n1522) );
  nor2_x1 U1142 ( .A(n1667), .B(n1666), .Y(n1596) );
  addf_x1 U1143 ( .A(n1562), .B(n1561), .CI(n1560), .CO(n1669), .S(n1666) );
  addf_x1 U1144 ( .A(n1565), .B(n1564), .CI(n1563), .CO(n1654), .S(n1560) );
  addf_x1 U1145 ( .A(n1568), .B(n1567), .CI(n1566), .CO(n1630), .S(n1564) );
  addf_x1 U1146 ( .A(n1571), .B(n1570), .CI(n1569), .CO(n1625), .S(n1629) );
  addf_x1 U1147 ( .A(n1574), .B(n1573), .CI(n1572), .CO(n1628), .S(n1565) );
  addf_x1 U1148 ( .A(n1577), .B(n1576), .CI(n1575), .CO(n1626), .S(n1612) );
  addf_x1 U1149 ( .A(n1580), .B(n1579), .CI(n1578), .CO(n1607), .S(n1611) );
  addf_x1 U1150 ( .A(n1583), .B(n1582), .CI(n1581), .CO(n1627), .S(n1610) );
  addf_x1 U1151 ( .A(n1586), .B(n1585), .CI(n1584), .CO(n1606), .S(n1572) );
  addf_x1 U1152 ( .A(n1589), .B(n1588), .CI(n1587), .CO(n1605), .S(n1574) );
  addf_x1 U1153 ( .A(n1592), .B(n1591), .CI(n1590), .CO(n1604), .S(n1594) );
  addf_x1 U1154 ( .A(n1595), .B(n1594), .CI(n1593), .CO(n1640), .S(n1561) );
  nor2_x1 U1155 ( .A(n1669), .B(n1668), .Y(n1671) );
  nor2_x1 U1156 ( .A(n1596), .B(n1671), .Y(n1674) );
  nand2_x1 U1157 ( .A(n1597), .B(n1674), .Y(n2068) );
  addf_x1 U1158 ( .A(n1600), .B(n1599), .CI(n1598), .CO(n1613), .S(n1636) );
  addf_x1 U1159 ( .A(n1603), .B(n1602), .CI(n1601), .CO(n1615), .S(n1635) );
  addf_x1 U1160 ( .A(n1606), .B(n1605), .CI(n1604), .CO(n1645), .S(n1641) );
  addf_x1 U1161 ( .A(n1609), .B(n1608), .CI(n1607), .CO(n1601), .S(n1644) );
  addf_x1 U1162 ( .A(n1612), .B(n1611), .CI(n1610), .CO(n1643), .S(n1642) );
  addf_x1 U1163 ( .A(n1615), .B(n1614), .CI(n1613), .CO(n590), .S(n1638) );
  addf_x1 U1164 ( .A(n1618), .B(n1617), .CI(n1616), .CO(n1621), .S(n1637) );
  addf_x1 U1165 ( .A(n1621), .B(n1620), .CI(n1619), .CO(n1694), .S(n1685) );
  nor2_x1 U1166 ( .A(n1686), .B(n1685), .Y(n2075) );
  addf_x1 U1167 ( .A(n1624), .B(n1623), .CI(n1622), .CO(n1631), .S(n1648) );
  addf_x1 U1168 ( .A(n1627), .B(n1626), .CI(n1625), .CO(n1633), .S(n1647) );
  addf_x1 U1169 ( .A(n1630), .B(n1629), .CI(n1628), .CO(n1646), .S(n1653) );
  addf_x1 U1170 ( .A(n1633), .B(n1632), .CI(n1631), .CO(n1616), .S(n1650) );
  addf_x1 U1171 ( .A(n1636), .B(n1635), .CI(n1634), .CO(n1639), .S(n1649) );
  addf_x1 U1172 ( .A(n1639), .B(n1638), .CI(n1637), .CO(n1686), .S(n1683) );
  nor2_x1 U1173 ( .A(n1684), .B(n1683), .Y(n2063) );
  nor2_x1 U1174 ( .A(n2075), .B(n2063), .Y(n1688) );
  addf_x1 U1175 ( .A(n1642), .B(n1641), .CI(n1640), .CO(n1657), .S(n1652) );
  addf_x1 U1176 ( .A(n1645), .B(n1644), .CI(n1643), .CO(n1634), .S(n1656) );
  addf_x1 U1177 ( .A(n1648), .B(n1647), .CI(n1646), .CO(n1651), .S(n1655) );
  addf_x1 U1178 ( .A(n1651), .B(n1650), .CI(n1649), .CO(n1684), .S(n1678) );
  addf_x1 U1179 ( .A(n1654), .B(n1653), .CI(n1652), .CO(n1677), .S(n1668) );
  addf_x1 U1180 ( .A(n1657), .B(n1656), .CI(n1655), .CO(n1679), .S(n1676) );
  nor2_x1 U1181 ( .A(n1677), .B(n1676), .Y(n1658) );
  nand2_x1 U1182 ( .A(n1688), .B(n2064), .Y(n1690) );
  nor2_x1 U1183 ( .A(n2068), .B(n1690), .Y(n1692) );
  nand2_x1 U1184 ( .A(n1660), .B(n1659), .Y(n1665) );
  nand2_x1 U1185 ( .A(n1662), .B(n1661), .Y(n1663) );
  oai21_x1 U1186 ( .A0(n1665), .A1(n1664), .B0(n1663), .Y(n1675) );
  nand2_x1 U1187 ( .A(n1669), .B(n1668), .Y(n1670) );
  oai21_x1 U1188 ( .A0(n1672), .A1(n1671), .B0(n1670), .Y(n1673) );
  aoi21_x1 U1189 ( .A0(n1675), .A1(n1674), .B0(n1673), .Y(n2066) );
  nand2_x1 U1190 ( .A(n1677), .B(n1676), .Y(n1682) );
  nand2_x1 U1191 ( .A(n1679), .B(n1678), .Y(n1680) );
  oai21_x1 U1192 ( .A0(n1682), .A1(n1681), .B0(n1680), .Y(n2070) );
  nand2_x1 U1193 ( .A(n1684), .B(n1683), .Y(n2081) );
  oai21_x1 U1194 ( .A0(n2081), .A1(n2075), .B0(n2077), .Y(n1687) );
  aoi21_x1 U1195 ( .A0(n2070), .A1(n1688), .B0(n1687), .Y(n1689) );
  oai21_x1 U1196 ( .A0(n2066), .A1(n1690), .B0(n1689), .Y(n1691) );
  aoi21_x1 U1197 ( .A0(n2065), .A1(n1692), .B0(n1691), .Y(n1894) );
  nand2_x1 U1198 ( .A(n1694), .B(n1693), .Y(n2060) );
  nand2_x1 U1199 ( .A(n1696), .B(n1695), .Y(n2056) );
  oai21_x1 U1200 ( .A0(n2054), .A1(n2060), .B0(n2056), .Y(n2040) );
  nand2_x1 U1201 ( .A(n1700), .B(n1699), .Y(n2044) );
  oai21_x1 U1202 ( .A0(n2049), .A1(n2042), .B0(n2044), .Y(n1701) );
  aoi21_x1 U1203 ( .A0(n1702), .A1(n2040), .B0(n1701), .Y(n1992) );
  nand2_x1 U1204 ( .A(n1704), .B(n1703), .Y(n2037) );
  nand2_x1 U1205 ( .A(n1706), .B(n1705), .Y(n2032) );
  inv_x1 U1206 ( .A(n2032), .Y(n2026) );
  nand2_x1 U1207 ( .A(n1708), .B(n1707), .Y(n2028) );
  inv_x1 U1208 ( .A(n2028), .Y(n1709) );
  aoi21_x1 U1209 ( .A0(n2026), .A1(n2027), .B0(n1709), .Y(n1710) );
  oai21_x1 U1210 ( .A0(n2037), .A1(n1711), .B0(n1710), .Y(n1995) );
  nand2_x1 U1211 ( .A(n1713), .B(n1712), .Y(n2022) );
  inv_x1 U1212 ( .A(n2022), .Y(n1717) );
  nand2_x1 U1213 ( .A(n1715), .B(n1714), .Y(n2018) );
  inv_x1 U1214 ( .A(n2018), .Y(n1716) );
  aoi21_x1 U1215 ( .A0(n1717), .A1(n2017), .B0(n1716), .Y(n1997) );
  nand2_x1 U1216 ( .A(n1719), .B(n1718), .Y(n2012) );
  inv_x1 U1217 ( .A(n2012), .Y(n1726) );
  nand2_x1 U1218 ( .A(n1721), .B(n1720), .Y(n2008) );
  nand2_x1 U1219 ( .A(n1723), .B(n1722), .Y(n2004) );
  oai21_x1 U1220 ( .A0(n2002), .A1(n2008), .B0(n2004), .Y(n1724) );
  aoi21_x1 U1221 ( .A0(n1726), .A1(n1725), .B0(n1724), .Y(n1727) );
  oai21_x1 U1222 ( .A0(n1728), .A1(n1997), .B0(n1727), .Y(n1729) );
  aoi21_x1 U1223 ( .A0(n1995), .A1(n1730), .B0(n1729), .Y(n1731) );
  oai21_x1 U1224 ( .A0(n1732), .A1(n1992), .B0(n1731), .Y(n1895) );
  inv_x1 U1225 ( .A(n1986), .Y(n1738) );
  nand2_x1 U1226 ( .A(n1736), .B(n1735), .Y(n1982) );
  inv_x1 U1227 ( .A(n1982), .Y(n1737) );
  aoi21_x1 U1228 ( .A0(n1738), .A1(n1981), .B0(n1737), .Y(n1967) );
  nand2_x1 U1229 ( .A(n1740), .B(n1739), .Y(n1976) );
  inv_x1 U1230 ( .A(n1976), .Y(n1744) );
  nand2_x1 U1231 ( .A(n1742), .B(n1741), .Y(n1972) );
  inv_x1 U1232 ( .A(n1972), .Y(n1743) );
  aoi21_x1 U1233 ( .A0(n1744), .A1(n1971), .B0(n1743), .Y(n1745) );
  oai21_x1 U1234 ( .A0(n1746), .A1(n1967), .B0(n1745), .Y(n1921) );
  nand2_x1 U1235 ( .A(n1748), .B(n1747), .Y(n1963) );
  inv_x1 U1236 ( .A(n1963), .Y(n1755) );
  nand2_x1 U1237 ( .A(n1750), .B(n1749), .Y(n1959) );
  oai21_x1 U1238 ( .A0(n1959), .A1(n1953), .B0(n1955), .Y(n1753) );
  aoi21_x1 U1239 ( .A0(n1755), .A1(n1754), .B0(n1753), .Y(n1923) );
  nand2_x1 U1240 ( .A(n1757), .B(n1756), .Y(n1946) );
  nand2_x1 U1241 ( .A(n1759), .B(n1758), .Y(n1941) );
  oai21_x1 U1242 ( .A0(n1939), .A1(n1946), .B0(n1941), .Y(n1926) );
  nand2_x1 U1243 ( .A(n1763), .B(n1762), .Y(n1930) );
  oai21_x1 U1244 ( .A0(n1935), .A1(n1928), .B0(n1930), .Y(n1764) );
  aoi21_x1 U1245 ( .A0(n1765), .A1(n1926), .B0(n1764), .Y(n1766) );
  oai21_x1 U1246 ( .A0(n1767), .A1(n1923), .B0(n1766), .Y(n1768) );
  aoi21_x1 U1247 ( .A0(n1769), .A1(n1921), .B0(n1768), .Y(n1912) );
  nand2_x1 U1248 ( .A(n1771), .B(n1770), .Y(n1917) );
  oai21_x1 U1249 ( .A0(n1915), .A1(n1912), .B0(n1917), .Y(n1905) );
  nand2_x1 U1250 ( .A(n1773), .B(n1772), .Y(n1908) );
  inv_x1 U1251 ( .A(n1908), .Y(n1774) );
  aoi21_x1 U1252 ( .A0(n1907), .A1(n1905), .B0(n1774), .Y(n1897) );
  nand2_x1 U1253 ( .A(n1776), .B(n1775), .Y(n1902) );
  oai21_x1 U1254 ( .A0(n1900), .A1(n1897), .B0(n1902), .Y(n1777) );
  aoi21_x1 U1255 ( .A0(n1778), .A1(n1895), .B0(n1777), .Y(n1779) );
  oai21_x1 U1256 ( .A0(n1780), .A1(n1894), .B0(n1779), .Y(n1892) );
  nand2_x1 U1257 ( .A(n1782), .B(n1781), .Y(n1890) );
  inv_x1 U1258 ( .A(n1890), .Y(n1783) );
  aoi21_x1 U1259 ( .A0(n1889), .A1(n1892), .B0(n1783), .Y(n1888) );
  nand2_x1 U1260 ( .A(n1785), .B(n1784), .Y(n1886) );
  oai21_x1 U1261 ( .A0(n1884), .A1(n1888), .B0(n1886), .Y(n1883) );
  nand2_x1 U1262 ( .A(n1787), .B(n1786), .Y(n1881) );
  inv_x1 U1263 ( .A(n1881), .Y(n1788) );
  aoi21_x1 U1264 ( .A0(n1880), .A1(n1883), .B0(n1788), .Y(n1879) );
  nand2_x1 U1265 ( .A(n1790), .B(n1789), .Y(n1877) );
  oai21_x1 U1266 ( .A0(n1875), .A1(n1879), .B0(n1877), .Y(n1874) );
  nand2_x1 U1267 ( .A(n1792), .B(n1791), .Y(n1872) );
  inv_x1 U1268 ( .A(n1872), .Y(n1793) );
  aoi21_x1 U1269 ( .A0(n1871), .A1(n1874), .B0(n1793), .Y(n1870) );
  nand2_x1 U1270 ( .A(n1795), .B(n1794), .Y(n1868) );
  oai21_x1 U1271 ( .A0(n1866), .A1(n1870), .B0(n1868), .Y(n1865) );
  nand2_x1 U1272 ( .A(n1797), .B(n1796), .Y(n1863) );
  inv_x1 U1273 ( .A(n1863), .Y(n1798) );
  aoi21_x1 U1274 ( .A0(n1862), .A1(n1865), .B0(n1798), .Y(n1861) );
  nand2_x1 U1275 ( .A(n1800), .B(n1799), .Y(n1859) );
  oai21_x1 U1276 ( .A0(n1857), .A1(n1861), .B0(n1859), .Y(n1856) );
  nand2_x1 U1277 ( .A(n1802), .B(n1801), .Y(n1854) );
  inv_x1 U1278 ( .A(n1854), .Y(n1803) );
  aoi21_x1 U1279 ( .A0(n1853), .A1(n1856), .B0(n1803), .Y(n1852) );
  nand2_x1 U1280 ( .A(n1805), .B(n1804), .Y(n1850) );
  oai21_x1 U1281 ( .A0(n1848), .A1(n1852), .B0(n1850), .Y(n1847) );
  inv_x1 U1282 ( .A(n1845), .Y(n1808) );
  aoi21_x1 U1283 ( .A0(n1844), .A1(n1847), .B0(n1808), .Y(n1843) );
  nand2_x1 U1284 ( .A(n1810), .B(n1809), .Y(n1841) );
  oai21_x1 U1285 ( .A0(n1839), .A1(n1843), .B0(n1841), .Y(n1838) );
  nand2_x1 U1286 ( .A(n1812), .B(n1811), .Y(n1836) );
  inv_x1 U1287 ( .A(n1836), .Y(n1813) );
  aoi21_x1 U1288 ( .A0(n1835), .A1(n1838), .B0(n1813), .Y(n1834) );
  nand2_x1 U1289 ( .A(n1815), .B(n1814), .Y(n1832) );
  oai21_x1 U1290 ( .A0(n1830), .A1(n1834), .B0(n1832), .Y(n1829) );
  nand2_x1 U1291 ( .A(n1817), .B(n1816), .Y(n1827) );
  inv_x1 U1292 ( .A(n1827), .Y(n1818) );
  aoi21_x1 U1293 ( .A0(n1826), .A1(n1829), .B0(n1818), .Y(n1825) );
  nand2_x1 U1294 ( .A(n1819), .B(n1825), .Y(n1823) );
  nand2_x1 U1295 ( .A(timestamp_clk_cycles[51]), .B(n2125), .Y(n1821) );
  or2_x1 U1296 ( .A(timestamp_clk_cycles[51]), .B(n2125), .Y(n1820) );
  nand2_x1 U1297 ( .A(n1821), .B(n1820), .Y(n1822) );
  xnor2_x1 U1298 ( .A(n1823), .B(n1822), .Y(time_us[44]) );
  xor2_x1 U1299 ( .A(n1825), .B(n1824), .Y(time_us[43]) );
  nand2_x1 U1300 ( .A(n1827), .B(n1826), .Y(n1828) );
  xnor2_x1 U1301 ( .A(n1829), .B(n1828), .Y(time_us[42]) );
  inv_x1 U1302 ( .A(n1830), .Y(n1831) );
  nand2_x1 U1303 ( .A(n1832), .B(n1831), .Y(n1833) );
  xor2_x1 U1304 ( .A(n1834), .B(n1833), .Y(time_us[41]) );
  xnor2_x1 U1305 ( .A(n1838), .B(n1837), .Y(time_us[40]) );
  inv_x1 U1306 ( .A(n1839), .Y(n1840) );
  nand2_x1 U1307 ( .A(n1841), .B(n1840), .Y(n1842) );
  xor2_x1 U1308 ( .A(n1843), .B(n1842), .Y(time_us[39]) );
  nand2_x1 U1309 ( .A(n1845), .B(n1844), .Y(n1846) );
  xnor2_x1 U1310 ( .A(n1847), .B(n1846), .Y(time_us[38]) );
  inv_x1 U1311 ( .A(n1848), .Y(n1849) );
  nand2_x1 U1312 ( .A(n1850), .B(n1849), .Y(n1851) );
  xor2_x1 U1313 ( .A(n1852), .B(n1851), .Y(time_us[37]) );
  nand2_x1 U1314 ( .A(n1854), .B(n1853), .Y(n1855) );
  xnor2_x1 U1315 ( .A(n1856), .B(n1855), .Y(time_us[36]) );
  inv_x1 U1316 ( .A(n1857), .Y(n1858) );
  nand2_x1 U1317 ( .A(n1859), .B(n1858), .Y(n1860) );
  xor2_x1 U1318 ( .A(n1861), .B(n1860), .Y(time_us[35]) );
  nand2_x1 U1319 ( .A(n1863), .B(n1862), .Y(n1864) );
  xnor2_x1 U1320 ( .A(n1865), .B(n1864), .Y(time_us[34]) );
  inv_x1 U1321 ( .A(n1866), .Y(n1867) );
  nand2_x1 U1322 ( .A(n1868), .B(n1867), .Y(n1869) );
  xor2_x1 U1323 ( .A(n1870), .B(n1869), .Y(time_us[33]) );
  nand2_x1 U1324 ( .A(n1872), .B(n1871), .Y(n1873) );
  xnor2_x1 U1325 ( .A(n1874), .B(n1873), .Y(time_us[32]) );
  inv_x1 U1326 ( .A(n1875), .Y(n1876) );
  nand2_x1 U1327 ( .A(n1877), .B(n1876), .Y(n1878) );
  xor2_x1 U1328 ( .A(n1879), .B(n1878), .Y(time_us[31]) );
  nand2_x1 U1329 ( .A(n1881), .B(n1880), .Y(n1882) );
  xnor2_x1 U1330 ( .A(n1883), .B(n1882), .Y(time_us[30]) );
  inv_x1 U1331 ( .A(n1884), .Y(n1885) );
  nand2_x1 U1332 ( .A(n1886), .B(n1885), .Y(n1887) );
  xor2_x1 U1333 ( .A(n1888), .B(n1887), .Y(time_us[29]) );
  nand2_x1 U1334 ( .A(n1890), .B(n1889), .Y(n1891) );
  xnor2_x1 U1335 ( .A(n1892), .B(n1891), .Y(time_us[28]) );
  inv_x1 U1336 ( .A(n1893), .Y(n1899) );
  inv_x1 U1337 ( .A(n1894), .Y(n2062) );
  aoi21_x1 U1338 ( .A0(n1896), .A1(n2062), .B0(n1895), .Y(n1979) );
  inv_x1 U1339 ( .A(n1979), .Y(n1988) );
  inv_x1 U1340 ( .A(n1897), .Y(n1898) );
  aoi21_x1 U1341 ( .A0(n1899), .A1(n1988), .B0(n1898), .Y(n1904) );
  inv_x1 U1342 ( .A(n1900), .Y(n1901) );
  nand2_x1 U1343 ( .A(n1902), .B(n1901), .Y(n1903) );
  xor2_x1 U1344 ( .A(n1904), .B(n1903), .Y(time_us[27]) );
  aoi21_x1 U1345 ( .A0(n1906), .A1(n1988), .B0(n1905), .Y(n1910) );
  nand2_x1 U1346 ( .A(n1908), .B(n1907), .Y(n1909) );
  xor2_x1 U1347 ( .A(n1910), .B(n1909), .Y(time_us[26]) );
  inv_x1 U1348 ( .A(n1911), .Y(n1914) );
  inv_x1 U1349 ( .A(n1912), .Y(n1913) );
  aoi21_x1 U1350 ( .A0(n1914), .A1(n1988), .B0(n1913), .Y(n1919) );
  inv_x1 U1351 ( .A(n1915), .Y(n1916) );
  nand2_x1 U1352 ( .A(n1917), .B(n1916), .Y(n1918) );
  xor2_x1 U1353 ( .A(n1919), .B(n1918), .Y(time_us[25]) );
  inv_x1 U1354 ( .A(n1920), .Y(n1925) );
  aoi21_x1 U1355 ( .A0(n1922), .A1(n1988), .B0(n1921), .Y(n1950) );
  inv_x1 U1356 ( .A(n1950), .Y(n1965) );
  inv_x1 U1357 ( .A(n1923), .Y(n1924) );
  aoi21_x1 U1358 ( .A0(n1925), .A1(n1965), .B0(n1924), .Y(n1938) );
  inv_x1 U1359 ( .A(n1938), .Y(n1948) );
  aoi21_x1 U1360 ( .A0(n1927), .A1(n1948), .B0(n1926), .Y(n1937) );
  oai21_x1 U1361 ( .A0(n1933), .A1(n1937), .B0(n1935), .Y(n1932) );
  inv_x1 U1362 ( .A(n1928), .Y(n1929) );
  nand2_x1 U1363 ( .A(n1930), .B(n1929), .Y(n1931) );
  xnor2_x1 U1364 ( .A(n1932), .B(n1931), .Y(time_us[24]) );
  inv_x1 U1365 ( .A(n1933), .Y(n1934) );
  nand2_x1 U1366 ( .A(n1935), .B(n1934), .Y(n1936) );
  xor2_x1 U1367 ( .A(n1937), .B(n1936), .Y(time_us[23]) );
  oai21_x1 U1368 ( .A0(n1944), .A1(n1938), .B0(n1946), .Y(n1943) );
  inv_x1 U1369 ( .A(n1939), .Y(n1940) );
  nand2_x1 U1370 ( .A(n1941), .B(n1940), .Y(n1942) );
  xnor2_x1 U1371 ( .A(n1943), .B(n1942), .Y(time_us[22]) );
  inv_x1 U1372 ( .A(n1944), .Y(n1945) );
  nand2_x1 U1373 ( .A(n1946), .B(n1945), .Y(n1947) );
  xnor2_x1 U1374 ( .A(n1948), .B(n1947), .Y(time_us[21]) );
  inv_x1 U1375 ( .A(n1949), .Y(n1958) );
  oai21_x1 U1376 ( .A0(n1951), .A1(n1950), .B0(n1963), .Y(n1961) );
  inv_x1 U1377 ( .A(n1959), .Y(n1952) );
  aoi21_x1 U1378 ( .A0(n1958), .A1(n1961), .B0(n1952), .Y(n1957) );
  inv_x1 U1379 ( .A(n1953), .Y(n1954) );
  nand2_x1 U1380 ( .A(n1955), .B(n1954), .Y(n1956) );
  xor2_x1 U1381 ( .A(n1957), .B(n1956), .Y(time_us[20]) );
  nand2_x1 U1382 ( .A(n1959), .B(n1958), .Y(n1960) );
  xnor2_x1 U1383 ( .A(n1961), .B(n1960), .Y(time_us[19]) );
  xnor2_x1 U1384 ( .A(n1965), .B(n1964), .Y(time_us[18]) );
  inv_x1 U1385 ( .A(n1966), .Y(n1969) );
  inv_x1 U1386 ( .A(n1967), .Y(n1968) );
  aoi21_x1 U1387 ( .A0(n1969), .A1(n1988), .B0(n1968), .Y(n1978) );
  oai21_x1 U1388 ( .A0(n1970), .A1(n1978), .B0(n1976), .Y(n1974) );
  nand2_x1 U1389 ( .A(n1972), .B(n1971), .Y(n1973) );
  xnor2_x1 U1390 ( .A(n1974), .B(n1973), .Y(time_us[17]) );
  nand2_x1 U1391 ( .A(n1976), .B(n1975), .Y(n1977) );
  xor2_x1 U1392 ( .A(n1978), .B(n1977), .Y(time_us[16]) );
  oai21_x1 U1393 ( .A0(n1980), .A1(n1979), .B0(n1986), .Y(n1984) );
  nand2_x1 U1394 ( .A(n1982), .B(n1981), .Y(n1983) );
  xnor2_x1 U1395 ( .A(n1984), .B(n1983), .Y(time_us[15]) );
  nand2_x1 U1396 ( .A(n1986), .B(n1985), .Y(n1987) );
  xnor2_x1 U1397 ( .A(n1988), .B(n1987), .Y(time_us[14]) );
  inv_x1 U1398 ( .A(n1989), .Y(n2007) );
  inv_x1 U1399 ( .A(n1990), .Y(n1999) );
  inv_x1 U1400 ( .A(n1991), .Y(n1994) );
  inv_x1 U1401 ( .A(n1992), .Y(n1993) );
  aoi21_x1 U1402 ( .A0(n1994), .A1(n2062), .B0(n1993), .Y(n2025) );
  inv_x1 U1403 ( .A(n2025), .Y(n2039) );
  aoi21_x1 U1404 ( .A0(n1996), .A1(n2039), .B0(n1995), .Y(n2015) );
  inv_x1 U1405 ( .A(n2015), .Y(n2024) );
  inv_x1 U1406 ( .A(n1997), .Y(n1998) );
  aoi21_x1 U1407 ( .A0(n1999), .A1(n2024), .B0(n1998), .Y(n2014) );
  oai21_x1 U1408 ( .A0(n2000), .A1(n2014), .B0(n2012), .Y(n2010) );
  inv_x1 U1409 ( .A(n2008), .Y(n2001) );
  aoi21_x1 U1410 ( .A0(n2007), .A1(n2010), .B0(n2001), .Y(n2006) );
  inv_x1 U1411 ( .A(n2002), .Y(n2003) );
  nand2_x1 U1412 ( .A(n2004), .B(n2003), .Y(n2005) );
  xor2_x1 U1413 ( .A(n2006), .B(n2005), .Y(time_us[13]) );
  nand2_x1 U1414 ( .A(n2008), .B(n2007), .Y(n2009) );
  xnor2_x1 U1415 ( .A(n2010), .B(n2009), .Y(time_us[12]) );
  nand2_x1 U1416 ( .A(n2012), .B(n2011), .Y(n2013) );
  xor2_x1 U1417 ( .A(n2014), .B(n2013), .Y(time_us[11]) );
  oai21_x1 U1418 ( .A0(n2016), .A1(n2015), .B0(n2022), .Y(n2020) );
  xnor2_x1 U1419 ( .A(n2020), .B(n2019), .Y(time_us[10]) );
  nand2_x1 U1420 ( .A(n2022), .B(n2021), .Y(n2023) );
  xnor2_x1 U1421 ( .A(n2024), .B(n2023), .Y(time_us[9]) );
  oai21_x1 U1422 ( .A0(n2035), .A1(n2025), .B0(n2037), .Y(n2034) );
  aoi21_x1 U1423 ( .A0(n2031), .A1(n2034), .B0(n2026), .Y(n2030) );
  nand2_x1 U1424 ( .A(n2028), .B(n2027), .Y(n2029) );
  xor2_x1 U1425 ( .A(n2030), .B(n2029), .Y(time_us[8]) );
  nand2_x1 U1426 ( .A(n2032), .B(n2031), .Y(n2033) );
  xnor2_x1 U1427 ( .A(n2034), .B(n2033), .Y(time_us[7]) );
  inv_x1 U1428 ( .A(n2035), .Y(n2036) );
  nand2_x1 U1429 ( .A(n2037), .B(n2036), .Y(n2038) );
  xnor2_x1 U1430 ( .A(n2039), .B(n2038), .Y(time_us[6]) );
  aoi21_x1 U1431 ( .A0(n2041), .A1(n2062), .B0(n2040), .Y(n2051) );
  oai21_x1 U1432 ( .A0(n2047), .A1(n2051), .B0(n2049), .Y(n2046) );
  inv_x1 U1433 ( .A(n2042), .Y(n2043) );
  nand2_x1 U1434 ( .A(n2044), .B(n2043), .Y(n2045) );
  xnor2_x1 U1435 ( .A(n2046), .B(n2045), .Y(time_us[5]) );
  inv_x1 U1436 ( .A(n2047), .Y(n2048) );
  nand2_x1 U1437 ( .A(n2049), .B(n2048), .Y(n2050) );
  xor2_x1 U1438 ( .A(n2051), .B(n2050), .Y(time_us[4]) );
  inv_x1 U1439 ( .A(n2052), .Y(n2059) );
  inv_x1 U1440 ( .A(n2060), .Y(n2053) );
  aoi21_x1 U1441 ( .A0(n2059), .A1(n2062), .B0(n2053), .Y(n2058) );
  inv_x1 U1442 ( .A(n2054), .Y(n2055) );
  nand2_x1 U1443 ( .A(n2056), .B(n2055), .Y(n2057) );
  xor2_x1 U1444 ( .A(n2058), .B(n2057), .Y(time_us[3]) );
  nand2_x1 U1445 ( .A(n2060), .B(n2059), .Y(n2061) );
  xnor2_x1 U1446 ( .A(n2062), .B(n2061), .Y(time_us[2]) );
  inv_x1 U1447 ( .A(n2063), .Y(n2080) );
  inv_x1 U1448 ( .A(n2064), .Y(n2073) );
  inv_x1 U1449 ( .A(n2065), .Y(n2067) );
  oai21_x1 U1450 ( .A0(n2068), .A1(n2067), .B0(n2066), .Y(n2069) );
  inv_x1 U1451 ( .A(n2069), .Y(n2072) );
  inv_x1 U1452 ( .A(n2070), .Y(n2071) );
  oai21_x1 U1453 ( .A0(n2073), .A1(n2072), .B0(n2071), .Y(n2083) );
  inv_x1 U1454 ( .A(n2081), .Y(n2074) );
  aoi21_x1 U1455 ( .A0(n2080), .A1(n2083), .B0(n2074), .Y(n2079) );
  inv_x1 U1456 ( .A(n2075), .Y(n2076) );
  nand2_x1 U1457 ( .A(n2077), .B(n2076), .Y(n2078) );
  xor2_x1 U1458 ( .A(n2079), .B(n2078), .Y(time_us[1]) );
  nand2_x1 U1459 ( .A(n2081), .B(n2080), .Y(n2082) );
  xnor2_x1 U1460 ( .A(n2083), .B(n2082), .Y(time_us[0]) );
  xnor2_x1 U1461 ( .A(n2085), .B(n2084), .Y(N3) );
  aoi21_x1 U1462 ( .A0(n2086), .A1(n1008), .B0(n2088), .Y(N4) );
  xnor2_x1 U1463 ( .A(n2088), .B(n2087), .Y(N5) );
  xnor2_x1 U1464 ( .A(n2090), .B(timestamp_clk_cycles[6]), .Y(N7) );
  inv_x1 U1465 ( .A(n2091), .Y(n2092) );
  xnor2_x1 U1466 ( .A(n2092), .B(timestamp_clk_cycles[8]), .Y(N9) );
  xnor2_x1 U1467 ( .A(n2093), .B(timestamp_clk_cycles[10]), .Y(N11) );
  inv_x1 U1468 ( .A(n2094), .Y(n2095) );
  xnor2_x1 U1469 ( .A(n2095), .B(timestamp_clk_cycles[12]), .Y(N13) );
  xnor2_x1 U1470 ( .A(n2097), .B(timestamp_clk_cycles[14]), .Y(N15) );
  inv_x1 U1471 ( .A(n2098), .Y(n2100) );
  xnor2_x1 U1472 ( .A(n2100), .B(timestamp_clk_cycles[16]), .Y(N17) );
  xnor2_x1 U1473 ( .A(n2101), .B(timestamp_clk_cycles[18]), .Y(N19) );
  inv_x1 U1474 ( .A(n2102), .Y(n2103) );
  xnor2_x1 U1475 ( .A(n2103), .B(timestamp_clk_cycles[20]), .Y(N21) );
  xnor2_x1 U1476 ( .A(n2104), .B(timestamp_clk_cycles[22]), .Y(N23) );
  inv_x1 U1477 ( .A(n2105), .Y(n2106) );
  xnor2_x1 U1478 ( .A(n2106), .B(timestamp_clk_cycles[24]), .Y(N25) );
  xnor2_x1 U1479 ( .A(n2107), .B(timestamp_clk_cycles[26]), .Y(N27) );
  inv_x1 U1480 ( .A(n2108), .Y(n2109) );
  xnor2_x1 U1481 ( .A(n2109), .B(timestamp_clk_cycles[28]), .Y(N29) );
  xnor2_x1 U1482 ( .A(n2110), .B(timestamp_clk_cycles[30]), .Y(N31) );
  inv_x1 U1483 ( .A(n2111), .Y(n2112) );
  xnor2_x1 U1484 ( .A(n2112), .B(timestamp_clk_cycles[32]), .Y(N33) );
  xnor2_x1 U1485 ( .A(n2113), .B(timestamp_clk_cycles[34]), .Y(N35) );
  inv_x1 U1486 ( .A(n2114), .Y(n2115) );
  xnor2_x1 U1487 ( .A(n2115), .B(timestamp_clk_cycles[36]), .Y(N37) );
  xnor2_x1 U1488 ( .A(n2116), .B(timestamp_clk_cycles[38]), .Y(N39) );
  inv_x1 U1489 ( .A(n2117), .Y(n2118) );
  xnor2_x1 U1490 ( .A(n2118), .B(timestamp_clk_cycles[40]), .Y(N41) );
  xnor2_x1 U1491 ( .A(n2119), .B(timestamp_clk_cycles[42]), .Y(N43) );
  inv_x1 U1492 ( .A(n2120), .Y(n2121) );
  xnor2_x1 U1493 ( .A(n2121), .B(timestamp_clk_cycles[44]), .Y(N45) );
  xnor2_x1 U1494 ( .A(n2122), .B(timestamp_clk_cycles[46]), .Y(N47) );
  inv_x1 U1495 ( .A(n2123), .Y(n2124) );
  xnor2_x1 U1496 ( .A(n2124), .B(timestamp_clk_cycles[48]), .Y(N49) );
  xnor2_x1 U1497 ( .A(n2126), .B(n2125), .Y(N51) );
  nand2_x1 U1498 ( .A(timestamp_clk_cycles[50]), .B(n2126), .Y(n2127) );
  xnor2_x1 U1499 ( .A(n2127), .B(timestamp_clk_cycles[51]), .Y(N52) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net246, net248, net249, net252, n1;
  assign net246 = CLK;
  assign ENCLK = net248;
  assign net249 = EN;

  latchgd_x1 latch ( .G(n1), .D(net249), .Q(net252) );
  and2_x2 main_gate ( .A(net252), .B(net246), .Y(net248) );
  inv_x1 U2 ( .A(net246), .Y(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net246, net248, net249, net252, n2;
  assign net246 = CLK;
  assign ENCLK = net248;
  assign net249 = EN;

  latchgd_x1 latch ( .G(n2), .D(net249), .Q(net252) );
  and2_x2 main_gate ( .A(net252), .B(net246), .Y(net248) );
  inv_x1 U2 ( .A(net246), .Y(n2) );
endmodule


module dvs_fifo_event_queue ( clk, rst_n, event_in, wr_en, rd_en, event_out, 
        empty, full );
  input [63:0] event_in;
  output [63:0] event_out;
  input clk, rst_n, wr_en, rd_en;
  output empty, full;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, net258, net263, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62;
  wire   [9:0] addr;
  wire   [9:0] read_ptr;
  wire   [9:0] write_ptr;

  sram_compiled_array SRAM_COMPILED_ARRAY_INST ( .addr0(addr[0]), .addr1(
        addr[1]), .addr2(addr[2]), .addr3(addr[3]), .addr4(addr[4]), .addr5(
        addr[5]), .addr6(addr[6]), .addr7(addr[7]), .addr8(addr[8]), .addr9(
        addr[9]), .din0(event_in[0]), .din1(event_in[1]), .din2(event_in[2]), 
        .din3(event_in[3]), .din4(event_in[4]), .din5(event_in[5]), .din6(
        event_in[6]), .din7(event_in[7]), .din8(event_in[8]), .din9(
        event_in[9]), .din10(event_in[10]), .din11(event_in[11]), .din12(
        event_in[12]), .din13(event_in[13]), .din14(event_in[14]), .din15(
        event_in[15]), .din16(event_in[16]), .din17(event_in[17]), .din18(
        event_in[18]), .din19(event_in[19]), .din20(event_in[20]), .din21(
        event_in[21]), .din22(event_in[22]), .din23(event_in[23]), .din24(
        event_in[24]), .din25(event_in[25]), .din26(event_in[26]), .din27(
        event_in[27]), .din28(event_in[28]), .din29(event_in[29]), .din30(
        event_in[30]), .din31(event_in[31]), .din32(event_in[32]), .din33(
        event_in[33]), .din34(event_in[34]), .din35(event_in[35]), .din36(
        event_in[36]), .din37(event_in[37]), .din38(event_in[38]), .din39(
        event_in[39]), .din40(event_in[40]), .din41(event_in[41]), .din42(
        event_in[42]), .din43(event_in[43]), .din44(event_in[44]), .din45(
        event_in[45]), .din46(event_in[46]), .din47(event_in[47]), .din48(
        event_in[48]), .din49(event_in[49]), .din50(event_in[50]), .din51(
        event_in[51]), .din52(event_in[52]), .din53(event_in[53]), .din54(
        event_in[54]), .din55(event_in[55]), .din56(event_in[56]), .din57(
        event_in[57]), .din58(event_in[58]), .din59(event_in[59]), .din60(
        event_in[60]), .din61(event_in[61]), .din62(event_in[62]), .din63(
        event_in[63]), .dout0(event_out[0]), .dout1(event_out[1]), .dout2(
        event_out[2]), .dout3(event_out[3]), .dout4(event_out[4]), .dout5(
        event_out[5]), .dout6(event_out[6]), .dout7(event_out[7]), .dout8(
        event_out[8]), .dout9(event_out[9]), .dout10(event_out[10]), .dout11(
        event_out[11]), .dout12(event_out[12]), .dout13(event_out[13]), 
        .dout14(event_out[14]), .dout15(event_out[15]), .dout16(event_out[16]), 
        .dout17(event_out[17]), .dout18(event_out[18]), .dout19(event_out[19]), 
        .dout20(event_out[20]), .dout21(event_out[21]), .dout22(event_out[22]), 
        .dout23(event_out[23]), .dout24(event_out[24]), .dout25(event_out[25]), 
        .dout26(event_out[26]), .dout27(event_out[27]), .dout28(event_out[28]), 
        .dout29(event_out[29]), .dout30(event_out[30]), .dout31(event_out[31]), 
        .dout32(event_out[32]), .dout33(event_out[33]), .dout34(event_out[34]), 
        .dout35(event_out[35]), .dout36(event_out[36]), .dout37(event_out[37]), 
        .dout38(event_out[38]), .dout39(event_out[39]), .dout40(event_out[40]), 
        .dout41(event_out[41]), .dout42(event_out[42]), .dout43(event_out[43]), 
        .dout44(event_out[44]), .dout46(event_out[46]), .dout47(event_out[47]), 
        .dout48(event_out[48]), .dout49(event_out[49]), .dout50(event_out[50]), 
        .dout51(event_out[51]), .dout52(event_out[52]), .dout55(event_out[55]), 
        .dout56(event_out[56]), .dout57(event_out[57]), .dout58(event_out[58]), 
        .dout59(event_out[59]), .dout60(event_out[60]), .dout61(event_out[61]), 
        .dout62(event_out[62]), .clk(clk), .write_en(wr_en), .sense_en(rd_en)
         );
  SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_0 clk_gate_write_ptr_reg ( .CLK(
        clk), .EN(N3), .ENCLK(net258) );
  SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_1 clk_gate_read_ptr_reg ( .CLK(clk), .EN(N14), .ENCLK(net263) );
  ffr_x1 \write_ptr_reg[8]  ( .D(N12), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[8]) );
  ffr_x1 \read_ptr_reg[4]  ( .D(N19), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[4]) );
  ffr_x1 \write_ptr_reg[9]  ( .D(N13), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[9]) );
  ffr_x1 \write_ptr_reg[7]  ( .D(N11), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[7]) );
  ffr_x1 \write_ptr_reg[6]  ( .D(N10), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[6]) );
  ffr_x1 \write_ptr_reg[5]  ( .D(N9), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[5]) );
  ffr_x1 \write_ptr_reg[4]  ( .D(N8), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[4]) );
  ffr_x1 \write_ptr_reg[3]  ( .D(N7), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[3]) );
  ffr_x1 \write_ptr_reg[2]  ( .D(N6), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[2]) );
  ffr_x1 \write_ptr_reg[1]  ( .D(N5), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[1]) );
  ffr_x1 \write_ptr_reg[0]  ( .D(N4), .CLK(net258), .RSTN(rst_n), .Q(
        write_ptr[0]) );
  ffr_x1 \read_ptr_reg[0]  ( .D(N15), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[0]) );
  ffr_x1 \read_ptr_reg[9]  ( .D(N24), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[9]) );
  ffr_x1 \read_ptr_reg[8]  ( .D(N23), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[8]) );
  ffr_x1 \read_ptr_reg[7]  ( .D(N22), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[7]) );
  ffr_x1 \read_ptr_reg[6]  ( .D(N21), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[6]) );
  ffr_x1 \read_ptr_reg[3]  ( .D(N18), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[3]) );
  ffr_x1 \read_ptr_reg[2]  ( .D(N17), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[2]) );
  ffr_x1 \read_ptr_reg[1]  ( .D(N16), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[1]) );
  ffrhq_x1 \read_ptr_reg[5]  ( .D(N20), .CLK(net263), .RSTN(rst_n), .Q(
        read_ptr[5]) );
  nor2_x1 U3 ( .A(n46), .B(n43), .Y(n42) );
  nor2_x1 U4 ( .A(n58), .B(n37), .Y(n44) );
  nor2_x1 U5 ( .A(n57), .B(n2), .Y(n3) );
  inv_x1 U6 ( .A(write_ptr[9]), .Y(n62) );
  inv_x1 U7 ( .A(write_ptr[7]), .Y(n57) );
  inv_x1 U8 ( .A(write_ptr[5]), .Y(n53) );
  inv_x1 U9 ( .A(write_ptr[3]), .Y(n49) );
  nand3_x1 U10 ( .A(write_ptr[2]), .B(write_ptr[1]), .C(write_ptr[0]), .Y(n9)
         );
  nor2_x1 U11 ( .A(n49), .B(n9), .Y(n8) );
  nand2_x1 U12 ( .A(write_ptr[4]), .B(n8), .Y(n5) );
  nor2_x1 U13 ( .A(n53), .B(n5), .Y(n4) );
  nand2_x1 U14 ( .A(write_ptr[6]), .B(n4), .Y(n2) );
  nand2_x1 U15 ( .A(write_ptr[8]), .B(n3), .Y(n1) );
  mxi2_x1 U16 ( .A0(write_ptr[9]), .A1(n62), .S(n1), .YN(N13) );
  aoi21_x1 U17 ( .A0(n57), .A1(n2), .B0(n3), .Y(N11) );
  inv_x1 U18 ( .A(write_ptr[8]), .Y(n59) );
  mxi2_x1 U19 ( .A0(n59), .A1(write_ptr[8]), .S(n3), .YN(N12) );
  inv_x1 U20 ( .A(write_ptr[6]), .Y(n55) );
  mxi2_x1 U21 ( .A0(n55), .A1(write_ptr[6]), .S(n4), .YN(N10) );
  inv_x1 U22 ( .A(write_ptr[4]), .Y(n51) );
  mxi2_x1 U23 ( .A0(n51), .A1(write_ptr[4]), .S(n8), .YN(N8) );
  aoi21_x1 U24 ( .A0(n53), .A1(n5), .B0(n4), .Y(N9) );
  inv_x1 U25 ( .A(read_ptr[0]), .Y(N15) );
  inv_x1 U26 ( .A(write_ptr[0]), .Y(N4) );
  inv_x1 U27 ( .A(write_ptr[2]), .Y(n47) );
  nand2_x1 U28 ( .A(write_ptr[1]), .B(write_ptr[0]), .Y(n7) );
  inv_x1 U29 ( .A(n9), .Y(n6) );
  aoi21_x1 U30 ( .A0(n47), .A1(n7), .B0(n6), .Y(N6) );
  aoi21_x1 U31 ( .A0(n49), .A1(n9), .B0(n8), .Y(N7) );
  mxi2_x1 U32 ( .A0(N4), .A1(write_ptr[0]), .S(write_ptr[1]), .YN(N5) );
  inv_x1 U33 ( .A(read_ptr[9]), .Y(n61) );
  inv_x1 U34 ( .A(read_ptr[7]), .Y(n56) );
  inv_x1 U35 ( .A(read_ptr[8]), .Y(n58) );
  inv_x1 U36 ( .A(read_ptr[6]), .Y(n54) );
  inv_x1 U37 ( .A(read_ptr[4]), .Y(n50) );
  mxi2_x1 U38 ( .A0(n50), .A1(read_ptr[4]), .S(N8), .YN(n15) );
  inv_x1 U39 ( .A(read_ptr[5]), .Y(n52) );
  mxi2_x1 U40 ( .A0(n52), .A1(read_ptr[5]), .S(N9), .YN(n14) );
  aoi22_x1 U41 ( .A0(write_ptr[0]), .A1(read_ptr[0]), .B0(N15), .B1(N4), .Y(
        n26) );
  inv_x1 U42 ( .A(read_ptr[2]), .Y(n46) );
  mxi2_x1 U43 ( .A0(read_ptr[2]), .A1(n46), .S(N6), .YN(n12) );
  inv_x1 U44 ( .A(read_ptr[3]), .Y(n48) );
  mxi2_x1 U45 ( .A0(read_ptr[3]), .A1(n48), .S(N7), .YN(n11) );
  inv_x1 U46 ( .A(read_ptr[1]), .Y(n45) );
  mxi2_x1 U47 ( .A0(read_ptr[1]), .A1(n45), .S(N5), .YN(n10) );
  nand4_x1 U48 ( .A(n26), .B(n12), .C(n11), .D(n10), .Y(n13) );
  nor3_x1 U49 ( .A(n15), .B(n14), .C(n13), .Y(n16) );
  oai21_x1 U50 ( .A0(N10), .A1(n54), .B0(n16), .Y(n17) );
  aoi21_x1 U51 ( .A0(N10), .A1(n54), .B0(n17), .Y(n18) );
  oai21_x1 U52 ( .A0(N12), .A1(n58), .B0(n18), .Y(n19) );
  aoi21_x1 U53 ( .A0(N12), .A1(n58), .B0(n19), .Y(n20) );
  oai21_x1 U54 ( .A0(N11), .A1(n56), .B0(n20), .Y(n21) );
  aoi21_x1 U55 ( .A0(N11), .A1(n56), .B0(n21), .Y(n22) );
  oai21_x1 U56 ( .A0(N13), .A1(n61), .B0(n22), .Y(n23) );
  aoi21_x1 U57 ( .A0(N13), .A1(n61), .B0(n23), .Y(full) );
  inv_x1 U58 ( .A(wr_en), .Y(n60) );
  nor2_x1 U59 ( .A(full), .B(n60), .Y(N3) );
  aoi22_x1 U60 ( .A0(write_ptr[6]), .A1(read_ptr[6]), .B0(n54), .B1(n55), .Y(
        n25) );
  aoi22_x1 U61 ( .A0(write_ptr[8]), .A1(read_ptr[8]), .B0(n58), .B1(n59), .Y(
        n24) );
  nor3_x1 U62 ( .A(n26), .B(n25), .C(n24), .Y(n30) );
  aoi22_x1 U63 ( .A0(write_ptr[4]), .A1(n50), .B0(read_ptr[4]), .B1(n51), .Y(
        n29) );
  mxi2_x1 U64 ( .A0(read_ptr[1]), .A1(n45), .S(write_ptr[1]), .YN(n28) );
  aoi22_x1 U65 ( .A0(write_ptr[2]), .A1(n46), .B0(read_ptr[2]), .B1(n47), .Y(
        n27) );
  nand4_x1 U66 ( .A(n30), .B(n29), .C(n28), .D(n27), .Y(n36) );
  aoi22_x1 U67 ( .A0(write_ptr[7]), .A1(n56), .B0(read_ptr[7]), .B1(n57), .Y(
        n34) );
  aoi22_x1 U68 ( .A0(write_ptr[5]), .A1(n52), .B0(read_ptr[5]), .B1(n53), .Y(
        n33) );
  aoi22_x1 U69 ( .A0(write_ptr[3]), .A1(n48), .B0(read_ptr[3]), .B1(n49), .Y(
        n32) );
  aoi22_x1 U70 ( .A0(read_ptr[9]), .A1(n62), .B0(write_ptr[9]), .B1(n61), .Y(
        n31) );
  nand4_x1 U71 ( .A(n34), .B(n33), .C(n32), .D(n31), .Y(n35) );
  nor2_x1 U72 ( .A(n36), .B(n35), .Y(empty) );
  nor2b_x1 U73 ( .AN(rd_en), .B(empty), .Y(N14) );
  nand2_x1 U74 ( .A(read_ptr[0]), .B(read_ptr[1]), .Y(n43) );
  nand2_x1 U75 ( .A(read_ptr[3]), .B(n42), .Y(n41) );
  nor2_x1 U76 ( .A(n50), .B(n41), .Y(n40) );
  nand2_x1 U77 ( .A(read_ptr[5]), .B(n40), .Y(n39) );
  nor2_x1 U78 ( .A(n54), .B(n39), .Y(n38) );
  nand2_x1 U79 ( .A(read_ptr[7]), .B(n38), .Y(n37) );
  aoi21_x1 U80 ( .A0(n58), .A1(n37), .B0(n44), .Y(N23) );
  mxi2_x1 U81 ( .A0(n56), .A1(read_ptr[7]), .S(n38), .YN(N22) );
  aoi21_x1 U82 ( .A0(n54), .A1(n39), .B0(n38), .Y(N21) );
  mxi2_x1 U83 ( .A0(n52), .A1(read_ptr[5]), .S(n40), .YN(N20) );
  aoi21_x1 U84 ( .A0(n50), .A1(n41), .B0(n40), .Y(N19) );
  mxi2_x1 U85 ( .A0(n48), .A1(read_ptr[3]), .S(n42), .YN(N18) );
  aoi21_x1 U86 ( .A0(n46), .A1(n43), .B0(n42), .Y(N17) );
  aoi22_x1 U87 ( .A0(read_ptr[0]), .A1(read_ptr[1]), .B0(n45), .B1(N15), .Y(
        N16) );
  mxi2_x1 U88 ( .A0(n61), .A1(read_ptr[9]), .S(n44), .YN(N24) );
  aoi22_x1 U89 ( .A0(wr_en), .A1(N4), .B0(N15), .B1(n60), .Y(addr[0]) );
  aoi2bb2_x1 U90 ( .B0(n45), .B1(n60), .A0N(n60), .A1N(write_ptr[1]), .Y(
        addr[1]) );
  aoi22_x1 U91 ( .A0(wr_en), .A1(n47), .B0(n46), .B1(n60), .Y(addr[2]) );
  aoi22_x1 U92 ( .A0(wr_en), .A1(n49), .B0(n48), .B1(n60), .Y(addr[3]) );
  aoi22_x1 U93 ( .A0(wr_en), .A1(n51), .B0(n50), .B1(n60), .Y(addr[4]) );
  aoi22_x1 U94 ( .A0(wr_en), .A1(n53), .B0(n52), .B1(n60), .Y(addr[5]) );
  aoi22_x1 U95 ( .A0(wr_en), .A1(n55), .B0(n54), .B1(n60), .Y(addr[6]) );
  aoi22_x1 U96 ( .A0(wr_en), .A1(n57), .B0(n56), .B1(n60), .Y(addr[7]) );
  aoi22_x1 U97 ( .A0(wr_en), .A1(n59), .B0(n58), .B1(n60), .Y(addr[8]) );
  aoi22_x1 U98 ( .A0(wr_en), .A1(n62), .B0(n61), .B1(n60), .Y(addr[9]) );
endmodule


module dvs_event_to_ravens_spike ( dvs_event, ravens_spike );
  input [63:0] dvs_event;
  output [31:0] ravens_spike;
  wire   \dvs_event[55] , N1, N2, N3, \mult_x_1/n17 , \mult_x_1/n16 ,
         \mult_x_1/n12 , \mult_x_1/n11 , \intadd_0/B[4] , \intadd_0/B[3] ,
         \intadd_0/B[2] , \intadd_0/CI , \intadd_0/n5 , \intadd_0/n4 ,
         \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14;
  assign ravens_spike[5] = \dvs_event[55] ;
  assign \dvs_event[55]  = dvs_event[55];
  assign N1 = dvs_event[46];
  assign N2 = dvs_event[47];

  addfi_x1 \mult_x_1/U15  ( .A(N2), .B(dvs_event[50]), .CI(dvs_event[48]), 
        .CON(\mult_x_1/n16 ), .SN(\mult_x_1/n17 ) );
  addfi_x1 \mult_x_1/U12  ( .A(dvs_event[49]), .B(dvs_event[51]), .CI(N3), 
        .CON(\mult_x_1/n11 ), .SN(\mult_x_1/n12 ) );
  addf_x1 \intadd_0/U6  ( .A(N2), .B(dvs_event[57]), .CI(\intadd_0/CI ), .CO(
        \intadd_0/n5 ), .S(ravens_spike[7]) );
  addf_x1 \intadd_0/U5  ( .A(N3), .B(dvs_event[58]), .CI(\intadd_0/n5 ), .CO(
        \intadd_0/n4 ), .S(ravens_spike[8]) );
  addf_x1 \intadd_0/U4  ( .A(\intadd_0/B[2] ), .B(dvs_event[59]), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(ravens_spike[9]) );
  addf_x1 \intadd_0/U3  ( .A(\intadd_0/B[3] ), .B(dvs_event[60]), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(ravens_spike[10]) );
  addf_x1 \intadd_0/U2  ( .A(\intadd_0/B[4] ), .B(dvs_event[61]), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(ravens_spike[11]) );
  nand2_x1 U3 ( .A(dvs_event[48]), .B(N1), .Y(n9) );
  aoi2bb1_x1 U4 ( .A0N(N1), .A1N(dvs_event[56]), .B0(\intadd_0/CI ), .Y(
        ravens_spike[6]) );
  and2_x1 U5 ( .A(N1), .B(dvs_event[56]), .Y(\intadd_0/CI ) );
  inv_x1 U6 ( .A(n9), .Y(n8) );
  aoi2bb1_x1 U7 ( .A0N(dvs_event[48]), .A1N(N1), .B0(n8), .Y(N3) );
  nand2_x1 U8 ( .A(dvs_event[49]), .B(N2), .Y(n4) );
  oai21_x1 U9 ( .A0(dvs_event[49]), .A1(N2), .B0(n4), .Y(n10) );
  inv_x1 U10 ( .A(n10), .Y(n2) );
  nand2_x1 U11 ( .A(N1), .B(n9), .Y(n1) );
  mxi2_x1 U12 ( .A0(n2), .A1(n10), .S(n1), .YN(\intadd_0/B[2] ) );
  oai21_x1 U13 ( .A0(n2), .A1(dvs_event[48]), .B0(N1), .Y(n5) );
  inv_x1 U14 ( .A(n3), .Y(\intadd_0/B[3] ) );
  addf_x1 U15 ( .A(\mult_x_1/n17 ), .B(n5), .CI(n4), .CO(n7), .S(n3) );
  inv_x1 U16 ( .A(n6), .Y(\intadd_0/B[4] ) );
  addf_x1 U17 ( .A(\mult_x_1/n12 ), .B(\mult_x_1/n16 ), .CI(n7), .CO(n14), .S(
        n6) );
  mxi2_x1 U18 ( .A0(n9), .A1(n8), .S(\intadd_0/n1 ), .YN(n11) );
  xnor3_alt_x1 U19 ( .A(dvs_event[50]), .B(n11), .C(n10), .Y(n12) );
  xnor3_alt_x1 U20 ( .A(\mult_x_1/n11 ), .B(dvs_event[62]), .C(n12), .Y(n13)
         );
  xnor3_alt_x1 U21 ( .A(n14), .B(dvs_event[52]), .C(n13), .Y(ravens_spike[12])
         );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net213, net215, net216, net219, n1;
  assign net213 = CLK;
  assign ENCLK = net215;
  assign net216 = EN;

  latchgd_x1 latch ( .G(n1), .D(net216), .Q(net219) );
  and2_x2 main_gate ( .A(net219), .B(net213), .Y(net215) );
  inv_x1 U2 ( .A(net213), .Y(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_2 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net213, net215, net216, net219, n2;
  assign net213 = CLK;
  assign ENCLK = net215;
  assign net216 = EN;

  latchgd_x1 latch ( .G(n2), .D(net216), .Q(net219) );
  and2_x2 main_gate ( .A(net219), .B(net213), .Y(net215) );
  inv_x1 U2 ( .A(net213), .Y(n2) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net213, net215, net216, net219, n2;
  assign net213 = CLK;
  assign ENCLK = net215;
  assign net216 = EN;

  latchgd_x1 latch ( .G(n2), .D(net216), .Q(net219) );
  and2_x2 main_gate ( .A(net219), .B(net213), .Y(net215) );
  inv_x1 U2 ( .A(net213), .Y(n2) );
endmodule


module dvs_ravens_transmitter ( clk, rst_n, new_spike, 
        ravens_spike_timestamp_us, ravens_spike, time_us, sent_spike, 
        rdy_for_next_spike, ravens_pkt );
  input [44:0] ravens_spike_timestamp_us;
  input [31:0] ravens_spike;
  input [44:0] time_us;
  output [31:0] ravens_pkt;
  input clk, rst_n, new_spike;
  output sent_spike, rdy_for_next_spike;
  wire   \next_fsm_state[1] , N73, N74, N75, N76, N77, N78, N79, N80, N81, N82,
         N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96,
         N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108,
         N109, N110, N111, N112, N113, N114, N115, N116, N117, N118, N126,
         N127, N128, N129, N361, N140, net225, net228, net229, net230, net231,
         net232, net233, net234, net235, net238, net243, n108, n109, n111,
         \intadd_1/A[1] , \intadd_1/A[0] , \intadd_1/B[2] , \intadd_1/CI ,
         \intadd_1/SUM[2] , \intadd_1/SUM[1] , \intadd_1/SUM[0] ,
         \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 , n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n110, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n657, n658, n659, n660, n661, n662, n663,
         n664, n665, n666, n667, n668, n669, n670, n671, n672, n673, n674,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718,
         n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729,
         n730, n731, n732, n733, n734, n735, n736, n737, n738, n739, n740,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, n811, n812, n813, n814, n815, n816, n817,
         n818, n819, n820, n821, n822, n823, n824, n825, n826, n827, n828,
         n829, n830, n831, n832, n833, n834, n835, n836, n837, n838, n839,
         n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850,
         n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861,
         n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872,
         n873, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n892, n893, n894,
         n895, n896, n897, n898, n899, n900, n901, n902, n903, n904, n905,
         n906, n907, n908, n909, n910, n911, n912, n913, n914, n915, n916,
         n917, n918, n919, n920, n921, n922, n923, n924, n925, n926, n927,
         n928, n929, n930, n931, n932, n933, n934, n935, n936, n937, n938,
         n939, n940, n941, n942, n943, n944, n945, n946, n947, n948, n949,
         n950, n951, n952, n953, n954, n955, n956, n957, n958, n959, n960,
         n961, n962, n963, n964, n965, n966, n967, n968, n969, n970, n971,
         n972, n973, n974, n975, n976, n977, n978, n979, n980, n981, n982,
         n983, n984, n985, n986, n987, n988, n989, n990, n991, n992, n993,
         n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004,
         n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014,
         n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024,
         n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034,
         n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044,
         n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054,
         n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064,
         n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074,
         n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084,
         n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094,
         n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104,
         n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114,
         n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124,
         n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134,
         n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144,
         n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154,
         n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164,
         n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174,
         n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184,
         n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194,
         n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204,
         n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214,
         n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224,
         n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234,
         n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244,
         n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254,
         n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264,
         n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274,
         n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284,
         n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294,
         n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304,
         n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314,
         n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324,
         n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334,
         n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344,
         n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354,
         n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364,
         n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374,
         n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384,
         n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394,
         n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404,
         n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414,
         n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424,
         n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434,
         n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444,
         n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454;
  wire   [2:0] cur_fsm_state;
  wire   [44:0] segment_last_timestamp_us;
  wire   [3:0] cur_sim_time_timestep;
  wire   [44:0] time_us_start_looking_for_new_sim_time;
  assign rdy_for_next_spike = N361;

  SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_0 clk_gate_segment_last_timestamp_us_reg ( 
        .CLK(clk), .EN(N73), .ENCLK(net225) );
  SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_2 clk_gate_ravens_pkt_reg ( 
        .CLK(clk), .EN(N140), .ENCLK(net238) );
  SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_1 clk_gate_time_us_start_looking_for_new_sim_time_reg ( 
        .CLK(clk), .EN(n108), .ENCLK(net243) );
  ffrhq_x1 \segment_last_timestamp_us_reg[0]  ( .D(N74), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[0]) );
  addf_x1 \intadd_1/U4  ( .A(ravens_spike_timestamp_us[1]), .B(\intadd_1/A[0] ), .CI(\intadd_1/CI ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[0] ) );
  addf_x1 \intadd_1/U3  ( .A(ravens_spike_timestamp_us[2]), .B(\intadd_1/A[1] ), .CI(\intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[1] ) );
  addf_x1 \intadd_1/U2  ( .A(\intadd_1/B[2] ), .B(ravens_spike_timestamp_us[3]), .CI(\intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\intadd_1/SUM[2] ) );
  ffrhq_x1 \segment_last_timestamp_us_reg[1]  ( .D(N75), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[1]) );
  ffr_x1 \segment_last_timestamp_us_reg[16]  ( .D(N90), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[16]) );
  ffr_x1 \ravens_pkt_reg[29]  ( .D(n1454), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[29]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[38]  ( .D(time_us[38]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[38]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[23]  ( .D(time_us[23]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[23]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[8]  ( .D(time_us[8]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[8]) );
  ffr_x1 \segment_last_timestamp_us_reg[2]  ( .D(N76), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[2]) );
  ffr_x1 \segment_last_timestamp_us_reg[3]  ( .D(N77), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[3]) );
  ffr_x1 \segment_last_timestamp_us_reg[44]  ( .D(N118), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[44]) );
  ffr_x1 \segment_last_timestamp_us_reg[43]  ( .D(N117), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[43]) );
  ffr_x1 \segment_last_timestamp_us_reg[19]  ( .D(N93), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[19]) );
  ffr_x1 \segment_last_timestamp_us_reg[18]  ( .D(N92), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[18]) );
  ffr_x1 \segment_last_timestamp_us_reg[17]  ( .D(N91), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[17]) );
  ffr_x1 \segment_last_timestamp_us_reg[14]  ( .D(N88), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[14]) );
  ffr_x1 \segment_last_timestamp_us_reg[13]  ( .D(N87), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[13]) );
  ffr_x1 \segment_last_timestamp_us_reg[12]  ( .D(N86), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[12]) );
  ffr_x1 \segment_last_timestamp_us_reg[11]  ( .D(N85), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[11]) );
  ffr_x1 \segment_last_timestamp_us_reg[10]  ( .D(N84), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[10]) );
  ffr_x1 \segment_last_timestamp_us_reg[9]  ( .D(N83), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[9]) );
  ffr_x1 \segment_last_timestamp_us_reg[8]  ( .D(N82), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[8]) );
  ffr_x1 \segment_last_timestamp_us_reg[7]  ( .D(N81), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[7]) );
  ffr_x1 \segment_last_timestamp_us_reg[6]  ( .D(N80), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[6]) );
  ffr_x1 \cur_fsm_state_reg[1]  ( .D(\next_fsm_state[1] ), .CLK(clk), .RSTN(
        rst_n), .Q(cur_fsm_state[1]) );
  ffr_x1 \cur_fsm_state_reg[2]  ( .D(n111), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[2]) );
  ffr_x1 \cur_fsm_state_reg[0]  ( .D(n109), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[0]) );
  ffr_x1 \cur_sim_time_timestep_reg[2]  ( .D(N128), .CLK(net225), .RSTN(rst_n), 
        .Q(cur_sim_time_timestep[2]) );
  ffr_x1 \cur_sim_time_timestep_reg[3]  ( .D(N129), .CLK(net225), .RSTN(rst_n), 
        .Q(cur_sim_time_timestep[3]) );
  ffr_x1 \segment_last_timestamp_us_reg[4]  ( .D(N78), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[4]) );
  ffr_x1 \segment_last_timestamp_us_reg[5]  ( .D(N79), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[5]) );
  ffr_x1 \segment_last_timestamp_us_reg[41]  ( .D(N115), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[41]) );
  ffr_x1 \segment_last_timestamp_us_reg[42]  ( .D(N116), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[42]) );
  ffr_x1 \ravens_pkt_reg[30]  ( .D(n1453), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[30]) );
  ffr_x1 \ravens_pkt_reg[12]  ( .D(net228), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[12]) );
  ffr_x1 \ravens_pkt_reg[11]  ( .D(net229), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[11]) );
  ffr_x1 \ravens_pkt_reg[10]  ( .D(net230), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[10]) );
  ffr_x1 \ravens_pkt_reg[9]  ( .D(net231), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[9]) );
  ffr_x1 \ravens_pkt_reg[8]  ( .D(net232), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[8]) );
  ffr_x1 \ravens_pkt_reg[7]  ( .D(net233), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[7]) );
  ffr_x1 \ravens_pkt_reg[6]  ( .D(net234), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[6]) );
  ffr_x1 \ravens_pkt_reg[5]  ( .D(net235), .CLK(net238), .RSTN(rst_n), .Q(
        ravens_pkt[5]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[44]  ( .D(time_us[44]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[44]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[43]  ( .D(time_us[43]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[43]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[42]  ( .D(time_us[42]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[42]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[41]  ( .D(time_us[41]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[41]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[40]  ( .D(time_us[40]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[40]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[39]  ( .D(time_us[39]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[39]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[37]  ( .D(time_us[37]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[37]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[36]  ( .D(time_us[36]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[36]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[35]  ( .D(time_us[35]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[35]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[34]  ( .D(time_us[34]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[34]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[33]  ( .D(time_us[33]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[33]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[32]  ( .D(time_us[32]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[32]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[31]  ( .D(time_us[31]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[31]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[30]  ( .D(time_us[30]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[30]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[29]  ( .D(time_us[29]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[29]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[28]  ( .D(time_us[28]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[28]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[27]  ( .D(time_us[27]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[27]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[26]  ( .D(time_us[26]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[26]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[25]  ( .D(time_us[25]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[25]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[24]  ( .D(time_us[24]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[24]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[21]  ( .D(time_us[21]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[21]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[20]  ( .D(time_us[20]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[20]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[19]  ( .D(time_us[19]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[19]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[18]  ( .D(time_us[18]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[18]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[16]  ( .D(time_us[16]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[16]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[15]  ( .D(time_us[15]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[15]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[14]  ( .D(time_us[14]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[14]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[13]  ( .D(time_us[13]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[13]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[12]  ( .D(time_us[12]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[12]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[11]  ( .D(time_us[11]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[11]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[9]  ( .D(time_us[9]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[9]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[7]  ( .D(time_us[7]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[7]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[6]  ( .D(time_us[6]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[6]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[5]  ( .D(time_us[5]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[5]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[4]  ( .D(time_us[4]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[4]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[3]  ( .D(time_us[3]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[3]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[2]  ( .D(time_us[2]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[2]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[1]  ( .D(time_us[1]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[1]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[0]  ( .D(time_us[0]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[0]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[15]  ( .D(N89), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[15]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[20]  ( .D(N94), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[20]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[21]  ( .D(N95), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[21]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[22]  ( .D(N96), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[22]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[23]  ( .D(N97), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[23]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[24]  ( .D(N98), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[24]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[25]  ( .D(N99), .CLK(net225), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[25]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[26]  ( .D(N100), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[26]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[27]  ( .D(N101), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[27]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[28]  ( .D(N102), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[28]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[29]  ( .D(N103), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[29]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[30]  ( .D(N104), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[30]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[31]  ( .D(N105), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[31]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[32]  ( .D(N106), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[32]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[33]  ( .D(N107), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[33]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[34]  ( .D(N108), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[34]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[35]  ( .D(N109), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[35]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[36]  ( .D(N110), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[36]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[37]  ( .D(N111), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[37]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[38]  ( .D(N112), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[38]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[39]  ( .D(N113), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[39]) );
  ffrhq_x1 \segment_last_timestamp_us_reg[40]  ( .D(N114), .CLK(net225), 
        .RSTN(rst_n), .Q(segment_last_timestamp_us[40]) );
  ffrhq_x1 \cur_sim_time_timestep_reg[0]  ( .D(N126), .CLK(net225), .RSTN(
        rst_n), .Q(cur_sim_time_timestep[0]) );
  ffrhq_x1 \cur_sim_time_timestep_reg[1]  ( .D(N127), .CLK(net225), .RSTN(
        rst_n), .Q(cur_sim_time_timestep[1]) );
  ffrhq_x1 \time_us_start_looking_for_new_sim_time_reg[10]  ( .D(time_us[10]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[10]) );
  ffrhq_x1 \time_us_start_looking_for_new_sim_time_reg[22]  ( .D(time_us[22]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[22]) );
  ffrhq_x1 \time_us_start_looking_for_new_sim_time_reg[17]  ( .D(time_us[17]), 
        .CLK(net243), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[17]) );
  inv_x4 U3 ( .A(n1315), .Y(n1443) );
  inv_x1 U4 ( .A(n1281), .Y(n1286) );
  oai21_x1 U5 ( .A0(n1258), .A1(n1271), .B0(n1257), .Y(n1259) );
  nor2_x2 U6 ( .A(n977), .B(n1218), .Y(n1256) );
  oai21_x1 U7 ( .A0(n730), .A1(n729), .B0(n728), .Y(n731) );
  oai21_x1 U8 ( .A0(n597), .A1(n596), .B0(n595), .Y(n628) );
  inv_x1 U9 ( .A(n568), .Y(n761) );
  inv_x1 U10 ( .A(n547), .Y(n715) );
  inv_x1 U11 ( .A(n528), .Y(n689) );
  addf_x1 U12 ( .A(ravens_spike_timestamp_us[35]), .B(n459), .CI(n458), .CO(
        n478), .S(n587) );
  addf_x1 U13 ( .A(ravens_spike_timestamp_us[34]), .B(n438), .CI(n437), .CO(
        n458), .S(n568) );
  addf_x1 U14 ( .A(ravens_spike_timestamp_us[33]), .B(n421), .CI(n420), .CO(
        n437), .S(n547) );
  addf_x1 U15 ( .A(ravens_spike_timestamp_us[32]), .B(n403), .CI(n402), .CO(
        n420), .S(n528) );
  inv_x1 U16 ( .A(n809), .Y(n525) );
  addf_x1 U17 ( .A(ravens_spike_timestamp_us[31]), .B(n385), .CI(n384), .CO(
        n402), .S(n818) );
  addf_x1 U18 ( .A(ravens_spike_timestamp_us[29]), .B(n955), .CI(n349), .CO(
        n364), .S(n758) );
  addf_x1 U19 ( .A(ravens_spike_timestamp_us[28]), .B(n333), .CI(n332), .CO(
        n349), .S(n814) );
  addf_x1 U20 ( .A(ravens_spike_timestamp_us[26]), .B(n299), .CI(n298), .CO(
        n315), .S(n809) );
  inv_x1 U21 ( .A(n538), .Y(n742) );
  addf_x1 U22 ( .A(ravens_spike_timestamp_us[24]), .B(n266), .CI(n265), .CO(
        n280), .S(n756) );
  addf_x1 U23 ( .A(ravens_spike_timestamp_us[23]), .B(n250), .CI(n249), .CO(
        n265), .S(n708) );
  addf_x1 U24 ( .A(ravens_spike_timestamp_us[21]), .B(n233), .CI(n232), .CO(
        n239), .S(n645) );
  inv_x1 U25 ( .A(n461), .Y(n794) );
  addf_x1 U26 ( .A(ravens_spike_timestamp_us[19]), .B(n122), .CI(n121), .CO(
        n67), .S(n538) );
  addf_x1 U27 ( .A(ravens_spike_timestamp_us[18]), .B(n126), .CI(n125), .CO(
        n121), .S(n519) );
  addf_x1 U28 ( .A(ravens_spike_timestamp_us[13]), .B(n110), .CI(n107), .CO(
        n102), .S(n423) );
  inv_x2 U29 ( .A(n698), .Y(n154) );
  inv_x1 U30 ( .A(n756), .Y(n487) );
  inv_x1 U31 ( .A(n407), .Y(n682) );
  addf_x1 U32 ( .A(ravens_spike_timestamp_us[17]), .B(n130), .CI(n129), .CO(
        n125), .S(n502) );
  inv_x1 U33 ( .A(n440), .Y(n754) );
  addf_x1 U34 ( .A(ravens_spike_timestamp_us[20]), .B(n68), .CI(n67), .CO(n232), .S(n602) );
  addf_x1 U35 ( .A(ravens_spike_timestamp_us[22]), .B(n942), .CI(n239), .CO(
        n249), .S(n675) );
  inv_x1 U36 ( .A(n823), .Y(n619) );
  addf_x1 U37 ( .A(ravens_spike_timestamp_us[25]), .B(n281), .CI(n280), .CO(
        n298), .S(n777) );
  inv_x1 U38 ( .A(n818), .Y(n654) );
  addf_x1 U39 ( .A(ravens_spike_timestamp_us[27]), .B(n316), .CI(n315), .CO(
        n332), .S(n816) );
  addf_x1 U40 ( .A(ravens_spike_timestamp_us[30]), .B(n365), .CI(n364), .CO(
        n384), .S(n823) );
  inv_x1 U41 ( .A(n587), .Y(n827) );
  addf_x1 U42 ( .A(n737), .B(n736), .CI(n735), .CO(n776), .S(n766) );
  nand2_x1 U43 ( .A(n727), .B(n726), .Y(n728) );
  nand2_x1 U44 ( .A(cur_sim_time_timestep[1]), .B(n846), .Y(n847) );
  nand2_x1 U45 ( .A(n768), .B(n767), .Y(n771) );
  nor2_x1 U46 ( .A(n1256), .B(n1272), .Y(n1265) );
  nor2_x1 U47 ( .A(n1272), .B(n1271), .Y(n1273) );
  nand2_x1 U48 ( .A(segment_last_timestamp_us[4]), .B(n1259), .Y(n1276) );
  nand2_x1 U49 ( .A(segment_last_timestamp_us[3]), .B(n1256), .Y(n1251) );
  inv_x1 U50 ( .A(n1258), .Y(n1272) );
  nand2_x1 U51 ( .A(segment_last_timestamp_us[0]), .B(n1256), .Y(n1240) );
  and2_x1 U52 ( .A(cur_fsm_state[0]), .B(N73), .Y(n1454) );
  nand2_x2 U53 ( .A(n980), .B(n978), .Y(n1217) );
  addf_x1 U54 ( .A(n766), .B(n765), .CI(n764), .CO(n767), .S(n726) );
  inv_x1 U55 ( .A(n722), .Y(n765) );
  addf_x1 U56 ( .A(n721), .B(n720), .CI(n830), .CO(n735), .S(n697) );
  inv_x1 U57 ( .A(n692), .Y(n830) );
  inv_x1 U58 ( .A(n622), .Y(n824) );
  addf_x1 U59 ( .A(n719), .B(n718), .CI(n827), .CO(n736), .S(n721) );
  addf_x1 U60 ( .A(ravens_spike_timestamp_us[36]), .B(n479), .CI(n478), .CO(
        n497), .S(n622) );
  addf_x1 U61 ( .A(n489), .B(n525), .CI(n488), .CO(n507), .S(n491) );
  oai21_x1 U62 ( .A0(n971), .A1(n975), .B0(n974), .Y(n978) );
  aoi21_x1 U63 ( .A0(n733), .A1(n732), .B0(n731), .Y(n734) );
  nor2_x1 U64 ( .A(n725), .B(n724), .Y(n723) );
  nand2_x1 U65 ( .A(n764), .B(n662), .Y(n663) );
  xor2_x1 U66 ( .A(n633), .B(n632), .Y(n764) );
  addf_x1 U67 ( .A(n657), .B(n551), .CI(n550), .CO(n571), .S(n533) );
  addf_x1 U68 ( .A(ravens_spike_timestamp_us[39]), .B(n536), .CI(n535), .CO(
        n557), .S(n722) );
  addf_x1 U69 ( .A(n659), .B(n824), .CI(n658), .CO(n693), .S(n661) );
  addf_x1 U70 ( .A(n762), .B(n761), .CI(n824), .CO(n833), .S(n737) );
  addf_x1 U71 ( .A(n624), .B(n827), .CI(n623), .CO(n658), .S(n626) );
  addf_x1 U72 ( .A(n691), .B(n761), .CI(n690), .CO(n720), .S(n694) );
  addf_x1 U73 ( .A(n656), .B(n715), .CI(n655), .CO(n690), .S(n659) );
  addf_x1 U74 ( .A(n589), .B(n761), .CI(n588), .CO(n623), .S(n591) );
  addf_x1 U75 ( .A(n689), .B(n688), .CI(n687), .CO(n718), .S(n691) );
  addf_x1 U76 ( .A(n621), .B(n689), .CI(n620), .CO(n655), .S(n624) );
  addf_x1 U77 ( .A(n654), .B(n653), .CI(n652), .CO(n687), .S(n656) );
  addf_x1 U78 ( .A(n586), .B(n654), .CI(n585), .CO(n620), .S(n589) );
  addf_x1 U79 ( .A(n619), .B(n618), .CI(n617), .CO(n652), .S(n621) );
  addf_x1 U80 ( .A(n584), .B(n583), .CI(n582), .CO(n617), .S(n586) );
  addf_x1 U81 ( .A(n567), .B(n619), .CI(n566), .CO(n585), .S(n570) );
  addf_x1 U82 ( .A(n565), .B(n564), .CI(n563), .CO(n582), .S(n567) );
  addf_x1 U83 ( .A(n758), .B(n397), .CI(n396), .CO(n415), .S(n379) );
  addf_x1 U84 ( .A(n546), .B(n584), .CI(n545), .CO(n566), .S(n549) );
  addf_x1 U85 ( .A(n527), .B(n565), .CI(n526), .CO(n545), .S(n530) );
  addf_x1 U86 ( .A(n544), .B(n543), .CI(n542), .CO(n563), .S(n546) );
  addf_x1 U87 ( .A(n814), .B(n378), .CI(n377), .CO(n396), .S(n362) );
  addf_x1 U88 ( .A(n816), .B(n361), .CI(n360), .CO(n377), .S(n346) );
  addf_x1 U89 ( .A(n508), .B(n544), .CI(n507), .CO(n526), .S(n510) );
  addf_x1 U90 ( .A(n525), .B(n524), .CI(n523), .CO(n542), .S(n527) );
  addf_x1 U91 ( .A(n809), .B(n345), .CI(n344), .CO(n360), .S(n329) );
  addf_x1 U92 ( .A(n506), .B(n505), .CI(n504), .CO(n523), .S(n508) );
  addf_x1 U93 ( .A(n487), .B(n486), .CI(n485), .CO(n504), .S(n489) );
  addf_x1 U94 ( .A(n469), .B(n506), .CI(n468), .CO(n488), .S(n471) );
  addf_x1 U95 ( .A(n777), .B(n328), .CI(n327), .CO(n344), .S(n311) );
  addf_x1 U96 ( .A(n756), .B(n310), .CI(n309), .CO(n327), .S(n293) );
  addf_x1 U97 ( .A(n467), .B(n466), .CI(n465), .CO(n485), .S(n469) );
  addf_x1 U98 ( .A(n448), .B(n487), .CI(n447), .CO(n468), .S(n450) );
  addf_x1 U99 ( .A(n708), .B(n292), .CI(n291), .CO(n309), .S(n278) );
  addf_x1 U100 ( .A(n395), .B(n487), .CI(n394), .CO(n413), .S(n397) );
  addf_x1 U101 ( .A(n430), .B(n467), .CI(n429), .CO(n447), .S(n432) );
  addf_x1 U102 ( .A(n675), .B(n277), .CI(n276), .CO(n291), .S(n262) );
  addf_x1 U103 ( .A(n428), .B(n427), .CI(n810), .CO(n444), .S(n430) );
  addf_x1 U104 ( .A(n467), .B(n376), .CI(n375), .CO(n394), .S(n378) );
  addf_x1 U105 ( .A(n261), .B(n260), .CI(n645), .CO(n276), .S(n245) );
  addf_x1 U106 ( .A(n446), .B(n359), .CI(n358), .CO(n375), .S(n361) );
  addf_x1 U107 ( .A(n343), .B(n342), .CI(n810), .CO(n358), .S(n345) );
  addf_x1 U108 ( .A(n602), .B(n240), .CI(n600), .CO(n261), .S(n237) );
  addf_x1 U109 ( .A(n742), .B(n391), .CI(n390), .CO(n404), .S(n393) );
  addf_x1 U110 ( .A(n538), .B(n231), .CI(n230), .CO(n600), .S(n579) );
  addf_x1 U111 ( .A(n275), .B(n801), .CI(n274), .CO(n289), .S(n277) );
  addf_x1 U112 ( .A(n791), .B(n259), .CI(n258), .CO(n274), .S(n260) );
  addf_x1 U113 ( .A(n273), .B(n754), .CI(n272), .CO(n287), .S(n275) );
  addf_x1 U114 ( .A(ravens_spike_timestamp_us[3]), .B(n81), .CI(n80), .CO(n76), 
        .S(n698) );
  addf_x1 U115 ( .A(ravens_spike_timestamp_us[2]), .B(n74), .CI(n73), .CO(n80), 
        .S(n677) );
  addf_x1 U116 ( .A(ravens_spike_timestamp_us[1]), .B(n79), .CI(n78), .CO(n73), 
        .S(n634) );
  inv_x2 U117 ( .A(segment_last_timestamp_us[1]), .Y(n79) );
  nor2b_x2 U118 ( .AN(cur_fsm_state[1]), .B(cur_fsm_state[2]), .Y(N73) );
  nor2_x2 U119 ( .A(n1278), .B(n1275), .Y(n1287) );
  nor2_x2 U120 ( .A(segment_last_timestamp_us[4]), .B(n1259), .Y(n1275) );
  nand2_x2 U121 ( .A(segment_last_timestamp_us[6]), .B(n1273), .Y(n1306) );
  nor2_x2 U122 ( .A(segment_last_timestamp_us[6]), .B(n1273), .Y(n1307) );
  nor2_x2 U123 ( .A(segment_last_timestamp_us[5]), .B(n1265), .Y(n1278) );
  nand4_x2 U124 ( .A(cur_sim_time_timestep[3]), .B(cur_fsm_state[0]), .C(
        cur_sim_time_timestep[2]), .D(n1217), .Y(n1219) );
  aoi2bb1_x2 U125 ( .A0N(n972), .A1N(n980), .B0(n978), .Y(n1258) );
  nor2b_x2 U126 ( .AN(n1218), .B(cur_sim_time_timestep[0]), .Y(n1228) );
  oai21_x2 U127 ( .A0(n976), .A1(n975), .B0(n974), .Y(n1218) );
  inv_x1 U128 ( .A(n975), .Y(n972) );
  inv_x1 U129 ( .A(n851), .Y(n971) );
  aoi21_x1 U130 ( .A0(n769), .A1(n773), .B0(n772), .Y(n844) );
  inv_x2 U131 ( .A(n734), .Y(n773) );
  oai21_x2 U132 ( .A0(n665), .A1(n664), .B0(n663), .Y(n733) );
  aoi21_x1 U133 ( .A0(n628), .A1(n64), .B0(n63), .Y(n665) );
  nand2_x2 U134 ( .A(n771), .B(n769), .Y(n770) );
  nor2_x2 U135 ( .A(n723), .B(n729), .Y(n732) );
  nand2_x2 U136 ( .A(n725), .B(n724), .Y(n730) );
  or2_x2 U137 ( .A(n768), .B(n767), .Y(n769) );
  nor2_x2 U138 ( .A(n727), .B(n726), .Y(n729) );
  nor2_x1 U139 ( .A(n764), .B(n662), .Y(n664) );
  addf_x1 U140 ( .A(n668), .B(n667), .CI(n666), .CO(n725), .S(n662) );
  addf_x1 U141 ( .A(n722), .B(n591), .CI(n590), .CO(n625), .S(n573) );
  addf_x1 U142 ( .A(n692), .B(n572), .CI(n571), .CO(n590), .S(n552) );
  addf_x1 U143 ( .A(n622), .B(n532), .CI(n531), .CO(n550), .S(n513) );
  addf_x1 U144 ( .A(n587), .B(n512), .CI(n511), .CO(n531), .S(n494) );
  addf_x1 U145 ( .A(n568), .B(n493), .CI(n492), .CO(n511), .S(n474) );
  addf_x1 U146 ( .A(n547), .B(n473), .CI(n472), .CO(n492), .S(n453) );
  addf_x1 U147 ( .A(n528), .B(n452), .CI(n451), .CO(n472), .S(n435) );
  addf_x1 U148 ( .A(n570), .B(n715), .CI(n569), .CO(n588), .S(n572) );
  addf_x1 U149 ( .A(n549), .B(n689), .CI(n548), .CO(n569), .S(n551) );
  addf_x1 U150 ( .A(n818), .B(n434), .CI(n433), .CO(n451), .S(n417) );
  addf_x1 U151 ( .A(n823), .B(n416), .CI(n415), .CO(n433), .S(n398) );
  addf_x1 U152 ( .A(n530), .B(n654), .CI(n529), .CO(n548), .S(n532) );
  addf_x1 U153 ( .A(n510), .B(n619), .CI(n509), .CO(n529), .S(n512) );
  addf_x1 U154 ( .A(n491), .B(n584), .CI(n490), .CO(n509), .S(n493) );
  addf_x1 U155 ( .A(n471), .B(n565), .CI(n470), .CO(n490), .S(n473) );
  addf_x1 U156 ( .A(n450), .B(n544), .CI(n449), .CO(n470), .S(n452) );
  addf_x1 U157 ( .A(n432), .B(n525), .CI(n431), .CO(n449), .S(n434) );
  addf_x1 U158 ( .A(n414), .B(n506), .CI(n413), .CO(n431), .S(n416) );
  addf_x1 U159 ( .A(n412), .B(n446), .CI(n411), .CO(n429), .S(n414) );
  addf_x1 U160 ( .A(n810), .B(n393), .CI(n392), .CO(n411), .S(n395) );
  addf_x1 U161 ( .A(n710), .B(n709), .CI(n708), .CO(n741), .S(n711) );
  nand2b_x2 U162 ( .AN(cur_fsm_state[0]), .B(N73), .Y(n65) );
  inv_x1 U163 ( .A(n519), .Y(n797) );
  addf_x1 U164 ( .A(n796), .B(n795), .CI(n794), .CO(n798), .S(n802) );
  addf_x1 U165 ( .A(ravens_spike_timestamp_us[38]), .B(n517), .CI(n516), .CO(
        n535), .S(n692) );
  inv_x1 U166 ( .A(n602), .Y(n803) );
  addf_x1 U167 ( .A(n746), .B(n745), .CI(n744), .CO(n805), .S(n743) );
  inv_x1 U168 ( .A(n502), .Y(n801) );
  addf_x1 U169 ( .A(n743), .B(n742), .CI(n741), .CO(n779), .S(n757) );
  addf_x1 U170 ( .A(n757), .B(n756), .CI(n809), .CO(n815), .S(n760) );
  addf_x1 U171 ( .A(n805), .B(n804), .CI(n803), .CO(n806), .S(n778) );
  addf_x1 U172 ( .A(n802), .B(n801), .CI(n800), .CO(n807), .S(n804) );
  addf_x1 U173 ( .A(n799), .B(n798), .CI(n797), .S(n808) );
  inv_x1 U174 ( .A(n645), .Y(n810) );
  addf_x1 U175 ( .A(n779), .B(n778), .CI(n777), .CO(n813), .S(n817) );
  addf_x1 U176 ( .A(n763), .B(n626), .CI(n625), .CO(n660), .S(n594) );
  addf_x1 U177 ( .A(n694), .B(n835), .CI(n693), .CO(n696), .S(n667) );
  inv_x1 U178 ( .A(n836), .Y(n837) );
  addf_x1 U179 ( .A(n832), .B(n831), .CI(n830), .S(n839) );
  addf_x1 U180 ( .A(n826), .B(n825), .CI(n824), .S(n832) );
  addf_x1 U181 ( .A(n836), .B(n661), .CI(n660), .CO(n666), .S(n627) );
  addf_x1 U182 ( .A(n697), .B(n696), .CI(n695), .CO(n727), .S(n724) );
  inv_x1 U183 ( .A(n771), .Y(n772) );
  nand2_x1 U184 ( .A(n841), .B(n840), .Y(n842) );
  addf_x1 U185 ( .A(n776), .B(n775), .CI(n774), .CO(n841), .S(n768) );
  inv_x1 U186 ( .A(n763), .Y(n774) );
  oai22_x1 U187 ( .A0(n847), .A1(n851), .B0(n852), .B1(
        cur_sim_time_timestep[1]), .Y(n848) );
  nor2_x1 U188 ( .A(segment_last_timestamp_us[3]), .B(n1256), .Y(n1252) );
  inv_x1 U189 ( .A(n1265), .Y(n1257) );
  and2_x2 U190 ( .A(cur_sim_time_timestep[0]), .B(n975), .Y(n977) );
  nand2_x1 U191 ( .A(cur_sim_time_timestep[0]), .B(n1256), .Y(n1225) );
  addf_x1 U192 ( .A(n251), .B(n634), .CI(n698), .CO(n267), .S(n253) );
  addf_x1 U193 ( .A(n783), .B(n698), .CI(n282), .CO(n300), .S(n284) );
  addf_x1 U194 ( .A(n780), .B(n253), .CI(n252), .CO(n268), .S(n255) );
  addf_x1 U195 ( .A(n750), .B(n677), .CI(n267), .CO(n282), .S(n269) );
  xnor2_x1 U196 ( .A(n783), .B(n167), .Y(n320) );
  nand2_x1 U197 ( .A(n603), .B(n677), .Y(n155) );
  addf_x1 U198 ( .A(n780), .B(n750), .CI(n300), .CO(n319), .S(n302) );
  addf_x1 U199 ( .A(n781), .B(n284), .CI(n283), .CO(n301), .S(n286) );
  addf_x1 U200 ( .A(n608), .B(n242), .CI(n606), .CO(n254), .S(n243) );
  addf_x1 U201 ( .A(n640), .B(n255), .CI(n254), .CO(n270), .S(n257) );
  addf_x1 U202 ( .A(n784), .B(n269), .CI(n268), .CO(n283), .S(n271) );
  addf_x1 U203 ( .A(n784), .B(n320), .CI(n319), .CO(n334), .S(n322) );
  inv_x1 U204 ( .A(n634), .Y(n170) );
  inv_x1 U205 ( .A(n603), .Y(n167) );
  addf_x1 U206 ( .A(n171), .B(n170), .CI(n780), .CO(n173), .S(n335) );
  or2_x1 U207 ( .A(n167), .B(n783), .Y(n171) );
  inv_x1 U208 ( .A(n677), .Y(n174) );
  addf_x1 U209 ( .A(n152), .B(n174), .CI(n120), .CO(n119), .S(n145) );
  addf_x1 U210 ( .A(n155), .B(n170), .CI(n154), .CO(n120), .S(n148) );
  addf_x1 U211 ( .A(n151), .B(n605), .CI(n150), .CO(n147), .S(n187) );
  addf_x1 U212 ( .A(n748), .B(n302), .CI(n301), .CO(n321), .S(n304) );
  addf_x1 U213 ( .A(n701), .B(n286), .CI(n285), .CO(n303), .S(n288) );
  addf_x1 U214 ( .A(n243), .B(n682), .CI(n609), .CO(n256), .S(n244) );
  addf_x1 U215 ( .A(n257), .B(n701), .CI(n256), .CO(n272), .S(n259) );
  addf_x1 U216 ( .A(n682), .B(n271), .CI(n270), .CO(n285), .S(n273) );
  addf_x1 U217 ( .A(n322), .B(n789), .CI(n321), .CO(n336), .S(n324) );
  addf_x1 U218 ( .A(n335), .B(n781), .CI(n334), .CO(n350), .S(n337) );
  addf_x1 U219 ( .A(n153), .B(n170), .CI(n152), .CO(n150), .S(n181) );
  or2_x1 U220 ( .A(n167), .B(n154), .Y(n153) );
  addf_x1 U221 ( .A(n781), .B(n175), .CI(n789), .CO(n180), .S(n368) );
  xnor2_x1 U222 ( .A(n154), .B(n167), .Y(n175) );
  addf_x1 U223 ( .A(n784), .B(n174), .CI(n173), .CO(n367), .S(n351) );
  inv_x1 U224 ( .A(n750), .Y(n152) );
  inv_x1 U225 ( .A(n783), .Y(n151) );
  addf_x1 U226 ( .A(n151), .B(n154), .CI(n119), .CO(n118), .S(n142) );
  addf_x1 U227 ( .A(n146), .B(n145), .CI(n144), .CO(n141), .S(n199) );
  addf_x1 U228 ( .A(n149), .B(n148), .CI(n147), .CO(n144), .S(n193) );
  addf_x1 U229 ( .A(n789), .B(n187), .CI(n186), .CO(n192), .S(n408) );
  addf_x1 U230 ( .A(n351), .B(n748), .CI(n350), .CO(n366), .S(n353) );
  addf_x1 U231 ( .A(n754), .B(n304), .CI(n303), .CO(n323), .S(n306) );
  addf_x1 U232 ( .A(n288), .B(n794), .CI(n287), .CO(n305), .S(n290) );
  addf_x1 U233 ( .A(n244), .B(n794), .CI(n611), .CO(n258), .S(n240) );
  addf_x1 U234 ( .A(n794), .B(n324), .CI(n323), .CO(n338), .S(n326) );
  addf_x1 U235 ( .A(n785), .B(n337), .CI(n336), .CO(n352), .S(n339) );
  addf_x1 U236 ( .A(n748), .B(n181), .CI(n180), .CO(n186), .S(n387) );
  addf_x1 U237 ( .A(n368), .B(n367), .CI(n366), .CO(n386), .S(n370) );
  addf_x1 U238 ( .A(n149), .B(n152), .CI(n118), .CO(n116), .S(n139) );
  inv_x1 U239 ( .A(n780), .Y(n149) );
  addf_x1 U240 ( .A(n143), .B(n142), .CI(n141), .CO(n138), .S(n204) );
  addf_x1 U241 ( .A(n407), .B(n199), .CI(n198), .CO(n203), .S(n441) );
  addf_x1 U242 ( .A(n785), .B(n193), .CI(n192), .CO(n198), .S(n424) );
  addf_x1 U243 ( .A(n408), .B(n407), .CI(n406), .CO(n422), .S(n410) );
  addf_x1 U244 ( .A(n353), .B(n407), .CI(n352), .CO(n369), .S(n355) );
  addf_x1 U245 ( .A(n306), .B(n791), .CI(n305), .CO(n325), .S(n308) );
  addf_x1 U246 ( .A(n290), .B(n797), .CI(n289), .CO(n307), .S(n292) );
  addf_x1 U247 ( .A(n326), .B(n801), .CI(n325), .CO(n340), .S(n318) );
  addf_x1 U248 ( .A(n791), .B(n339), .CI(n338), .CO(n354), .S(n341) );
  addf_x1 U249 ( .A(n423), .B(n370), .CI(n369), .CO(n388), .S(n372) );
  addf_x1 U250 ( .A(n387), .B(n785), .CI(n386), .CO(n406), .S(n389) );
  addf_x1 U251 ( .A(n146), .B(n117), .CI(n116), .CO(n114), .S(n137) );
  addf_x1 U252 ( .A(n140), .B(n139), .CI(n138), .CO(n136), .S(n208) );
  inv_x1 U253 ( .A(n784), .Y(n146) );
  addf_x1 U254 ( .A(n149), .B(n634), .CI(n97), .CO(n96), .S(n115) );
  addf_x1 U255 ( .A(n115), .B(n143), .CI(n114), .CO(n112), .S(n135) );
  addf_x1 U256 ( .A(n423), .B(n204), .CI(n203), .CO(n207), .S(n462) );
  addf_x1 U257 ( .A(n441), .B(n440), .CI(n439), .CO(n460), .S(n443) );
  addf_x1 U258 ( .A(n424), .B(n423), .CI(n422), .CO(n439), .S(n426) );
  addf_x1 U259 ( .A(n410), .B(n461), .CI(n409), .CO(n425), .S(n405) );
  addf_x1 U260 ( .A(n801), .B(n355), .CI(n354), .CO(n371), .S(n357) );
  addf_x1 U261 ( .A(n308), .B(n742), .CI(n307), .CO(n317), .S(n310) );
  addf_x1 U262 ( .A(n318), .B(n803), .CI(n317), .CO(n343), .S(n328) );
  addf_x1 U263 ( .A(n341), .B(n797), .CI(n340), .CO(n356), .S(n342) );
  addf_x1 U264 ( .A(n797), .B(n372), .CI(n371), .CO(n390), .S(n374) );
  addf_x1 U265 ( .A(n440), .B(n389), .CI(n388), .CO(n409), .S(n391) );
  addf_x1 U266 ( .A(n137), .B(n608), .CI(n136), .CO(n134), .S(n211) );
  addf_x1 U267 ( .A(n440), .B(n208), .CI(n207), .CO(n210), .S(n482) );
  inv_x1 U268 ( .A(n781), .Y(n143) );
  addf_x1 U269 ( .A(n146), .B(n677), .CI(n96), .CO(n105), .S(n113) );
  addf_x1 U270 ( .A(n113), .B(n140), .CI(n112), .CO(n104), .S(n132) );
  addf_x1 U271 ( .A(n132), .B(n682), .CI(n131), .CO(n127), .S(n223) );
  addf_x1 U272 ( .A(n640), .B(n135), .CI(n134), .CO(n131), .S(n217) );
  addf_x1 U273 ( .A(n462), .B(n461), .CI(n460), .CO(n480), .S(n464) );
  addf_x1 U274 ( .A(n443), .B(n502), .CI(n442), .CO(n463), .S(n445) );
  addf_x1 U275 ( .A(n481), .B(n426), .CI(n425), .CO(n442), .S(n427) );
  addf_x1 U276 ( .A(n803), .B(n405), .CI(n404), .CO(n428), .S(n412) );
  addf_x1 U277 ( .A(n357), .B(n742), .CI(n356), .CO(n373), .S(n359) );
  inv_x1 U278 ( .A(n675), .Y(n446) );
  addf_x1 U279 ( .A(n374), .B(n803), .CI(n373), .CO(n392), .S(n376) );
  addf_x1 U280 ( .A(n461), .B(n211), .CI(n210), .CO(n216), .S(n503) );
  addf_x1 U281 ( .A(n482), .B(n481), .CI(n480), .CO(n501), .S(n484) );
  inv_x1 U282 ( .A(n748), .Y(n140) );
  addf_x1 U283 ( .A(n143), .B(n92), .CI(n608), .CO(n89), .S(n106) );
  addf_x1 U284 ( .A(n106), .B(n105), .CI(n104), .CO(n100), .S(n128) );
  xnor2_x1 U285 ( .A(n677), .B(n603), .Y(n605) );
  addf_x1 U286 ( .A(n750), .B(n634), .CI(n84), .CO(n604), .S(n90) );
  addf_x1 U287 ( .A(n128), .B(n701), .CI(n127), .CO(n123), .S(n228) );
  addf_x1 U288 ( .A(n502), .B(n223), .CI(n222), .CO(n227), .S(n539) );
  addf_x1 U289 ( .A(n464), .B(n519), .CI(n463), .CO(n483), .S(n466) );
  addf_x1 U290 ( .A(n446), .B(n445), .CI(n444), .CO(n465), .S(n448) );
  inv_x1 U291 ( .A(n708), .Y(n467) );
  addf_x1 U292 ( .A(n484), .B(n538), .CI(n483), .CO(n499), .S(n486) );
  addf_x1 U293 ( .A(n503), .B(n502), .CI(n501), .CO(n518), .S(n500) );
  inv_x2 U294 ( .A(n789), .Y(n608) );
  addf_x1 U295 ( .A(n140), .B(n90), .CI(n89), .CO(n606), .S(n101) );
  addf_x1 U296 ( .A(n101), .B(n640), .CI(n100), .CO(n609), .S(n124) );
  addf_x1 U297 ( .A(n783), .B(n605), .CI(n604), .CO(n636), .S(n607) );
  addf_x1 U298 ( .A(n124), .B(n754), .CI(n123), .CO(n611), .S(n231) );
  addf_x1 U299 ( .A(n519), .B(n228), .CI(n227), .CO(n230), .S(n560) );
  addf_x1 U300 ( .A(n539), .B(n538), .CI(n537), .CO(n559), .S(n541) );
  addf_x1 U301 ( .A(n520), .B(n519), .CI(n518), .CO(n537), .S(n521) );
  inv_x1 U302 ( .A(n777), .Y(n506) );
  addf_x1 U303 ( .A(n500), .B(n602), .CI(n499), .CO(n522), .S(n505) );
  inv_x1 U304 ( .A(n785), .Y(n640) );
  addf_x1 U305 ( .A(n608), .B(n607), .CI(n606), .CO(n638), .S(n610) );
  addf_x1 U306 ( .A(n610), .B(n682), .CI(n609), .CO(n641), .S(n612) );
  addf_x1 U307 ( .A(n635), .B(n634), .CI(n698), .CO(n676), .S(n637) );
  or2_x1 U308 ( .A(n603), .B(n677), .Y(n635) );
  addf_x1 U309 ( .A(n780), .B(n637), .CI(n636), .CO(n678), .S(n639) );
  addf_x1 U310 ( .A(n612), .B(n794), .CI(n611), .CO(n643), .S(n601) );
  addf_x1 U311 ( .A(n560), .B(n602), .CI(n559), .CO(n578), .S(n562) );
  addf_x1 U312 ( .A(n675), .B(n541), .CI(n540), .CO(n561), .S(n543) );
  addf_x1 U313 ( .A(n522), .B(n521), .CI(n645), .CO(n540), .S(n524) );
  inv_x1 U314 ( .A(n816), .Y(n544) );
  addf_x1 U315 ( .A(n642), .B(n701), .CI(n641), .CO(n683), .S(n644) );
  addf_x1 U316 ( .A(n750), .B(n677), .CI(n676), .CO(n699), .S(n679) );
  inv_x2 U317 ( .A(n423), .Y(n701) );
  addf_x1 U318 ( .A(n784), .B(n679), .CI(n678), .CO(n702), .S(n681) );
  addf_x1 U319 ( .A(n602), .B(n601), .CI(n600), .CO(n647), .S(n614) );
  addf_x1 U320 ( .A(n791), .B(n644), .CI(n643), .CO(n685), .S(n646) );
  addf_x1 U321 ( .A(n645), .B(n579), .CI(n578), .CO(n613), .S(n581) );
  addf_x1 U322 ( .A(n708), .B(n562), .CI(n561), .CO(n580), .S(n564) );
  inv_x1 U323 ( .A(n814), .Y(n565) );
  addf_x1 U324 ( .A(n682), .B(n681), .CI(n680), .CO(n704), .S(n684) );
  addf_x1 U325 ( .A(n684), .B(n754), .CI(n683), .CO(n706), .S(n686) );
  addf_x1 U326 ( .A(n700), .B(n699), .CI(n781), .CO(n751), .S(n703) );
  addf_x1 U327 ( .A(n703), .B(n702), .CI(n701), .CO(n747), .S(n705) );
  addf_x1 U328 ( .A(n647), .B(n646), .CI(n645), .CO(n673), .S(n649) );
  addf_x1 U329 ( .A(n686), .B(n801), .CI(n685), .CO(n709), .S(n674) );
  inv_x1 U330 ( .A(n758), .Y(n584) );
  addf_x1 U331 ( .A(n581), .B(n756), .CI(n580), .CO(n615), .S(n583) );
  addf_x1 U332 ( .A(n616), .B(n777), .CI(n615), .CO(n650), .S(n618) );
  addf_x1 U333 ( .A(n649), .B(n708), .CI(n648), .CO(n671), .S(n651) );
  addf_x1 U334 ( .A(n705), .B(n704), .CI(n794), .CO(n745), .S(n707) );
  addf_x1 U335 ( .A(n707), .B(n706), .CI(n797), .CO(n744), .S(n710) );
  addf_x1 U336 ( .A(n753), .B(n752), .CI(n751), .CO(n788), .S(n749) );
  addf_x1 U337 ( .A(n749), .B(n748), .CI(n747), .CO(n796), .S(n755) );
  addf_x1 U338 ( .A(n675), .B(n674), .CI(n673), .CO(n712), .S(n672) );
  addf_x1 U339 ( .A(n672), .B(n756), .CI(n671), .CO(n714), .S(n670) );
  addf_x1 U340 ( .A(n651), .B(n809), .CI(n650), .CO(n669), .S(n653) );
  nand2b_x1 U341 ( .AN(segment_last_timestamp_us[13]), .B(
        ravens_spike_timestamp_us[13]), .Y(n914) );
  inv_x1 U342 ( .A(n481), .Y(n791) );
  addf_x1 U343 ( .A(n784), .B(n783), .CI(n782), .CO(n786), .S(n790) );
  addf_x1 U344 ( .A(n790), .B(n789), .CI(n788), .CO(n792), .S(n795) );
  addf_x1 U345 ( .A(n712), .B(n711), .CI(n777), .CO(n759), .S(n713) );
  addf_x1 U346 ( .A(n670), .B(n816), .CI(n669), .CO(n717), .S(n688) );
  addf_x1 U347 ( .A(n714), .B(n713), .CI(n814), .CO(n739), .S(n716) );
  addf_x1 U348 ( .A(n760), .B(n759), .CI(n758), .CO(n821), .S(n740) );
  addf_x1 U349 ( .A(n717), .B(n716), .CI(n715), .CO(n738), .S(n719) );
  addf_x1 U350 ( .A(ravens_spike_timestamp_us[37]), .B(n498), .CI(n497), .CO(
        n516), .S(n657) );
  addf_x1 U351 ( .A(n740), .B(n739), .CI(n738), .CO(n829), .S(n762) );
  addf_x1 U352 ( .A(n820), .B(n819), .CI(n818), .S(n826) );
  addf_x1 U353 ( .A(n811), .B(n810), .CI(n809), .S(n812) );
  addf_x1 U354 ( .A(n823), .B(n822), .CI(n821), .CO(n825), .S(n828) );
  inv_x1 U355 ( .A(n657), .Y(n835) );
  addf_x1 U356 ( .A(n829), .B(n828), .CI(n827), .CO(n831), .S(n834) );
  addf_x1 U357 ( .A(ravens_spike_timestamp_us[40]), .B(n558), .CI(n557), .CO(
        n592), .S(n763) );
  nor2_x1 U358 ( .A(n594), .B(n668), .Y(n596) );
  nand2_x1 U359 ( .A(n594), .B(n668), .Y(n595) );
  inv_x1 U360 ( .A(n577), .Y(n597) );
  oai21_x1 U361 ( .A0(n576), .A1(n575), .B0(n574), .Y(n577) );
  nand2_x1 U362 ( .A(n836), .B(n573), .Y(n574) );
  nor2_x1 U363 ( .A(n836), .B(n573), .Y(n575) );
  and2_x1 U364 ( .A(n695), .B(n627), .Y(n63) );
  or2_x1 U365 ( .A(n695), .B(n627), .Y(n64) );
  nand2_x2 U366 ( .A(n842), .B(n25), .Y(n843) );
  nor2_x1 U367 ( .A(n83), .B(n1419), .Y(n1381) );
  nor2_x1 U368 ( .A(n1387), .B(n1386), .Y(n1366) );
  nand2_x1 U369 ( .A(segment_last_timestamp_us[12]), .B(n1366), .Y(n1391) );
  nor2_x1 U370 ( .A(n110), .B(n1391), .Y(n1335) );
  nand2_x1 U371 ( .A(segment_last_timestamp_us[14]), .B(n1335), .Y(n1427) );
  nand2_x1 U372 ( .A(segment_last_timestamp_us[16]), .B(n1345), .Y(n1435) );
  nor2_x1 U373 ( .A(n130), .B(n1435), .Y(n1356) );
  nand2_x1 U374 ( .A(segment_last_timestamp_us[18]), .B(n1356), .Y(n1431) );
  nor2_x1 U375 ( .A(n122), .B(n1431), .Y(n1361) );
  nand2_x1 U376 ( .A(segment_last_timestamp_us[20]), .B(n1361), .Y(n1423) );
  nor2_x1 U377 ( .A(n233), .B(n1423), .Y(n1320) );
  nand2_x1 U378 ( .A(segment_last_timestamp_us[22]), .B(n1320), .Y(n1395) );
  nor2_x1 U379 ( .A(n250), .B(n1395), .Y(n1340) );
  nor2_x1 U380 ( .A(n281), .B(n1407), .Y(n1376) );
  nand2_x1 U381 ( .A(segment_last_timestamp_us[26]), .B(n1376), .Y(n1439) );
  nor2_x1 U382 ( .A(n316), .B(n1439), .Y(n1314) );
  nand2_x1 U383 ( .A(segment_last_timestamp_us[28]), .B(n1314), .Y(n1403) );
  nor2_x1 U384 ( .A(n955), .B(n1403), .Y(n1330) );
  nor2_x1 U385 ( .A(n385), .B(n1411), .Y(n1325) );
  nand2_x1 U386 ( .A(segment_last_timestamp_us[32]), .B(n1325), .Y(n1399) );
  nand2_x1 U387 ( .A(segment_last_timestamp_us[34]), .B(n1371), .Y(n1415) );
  nor2_x1 U388 ( .A(n459), .B(n1415), .Y(n1351) );
  nand2_x1 U389 ( .A(segment_last_timestamp_us[30]), .B(n1330), .Y(n1411) );
  nor2_x1 U390 ( .A(n99), .B(n1427), .Y(n1345) );
  nor2_x1 U391 ( .A(segment_last_timestamp_us[1]), .B(n1258), .Y(n1242) );
  nand2_x1 U392 ( .A(segment_last_timestamp_us[5]), .B(n1265), .Y(n1277) );
  nand2_x1 U393 ( .A(new_spike), .B(n1223), .Y(n1229) );
  nand2b_x1 U394 ( .AN(n1216), .B(cur_fsm_state[0]), .Y(n1232) );
  nor2_x1 U395 ( .A(n1258), .B(n1256), .Y(n1223) );
  oai2bb2_x1 U396 ( .B0(n1452), .B1(n65), .A0N(n1454), .A1N(n1451), .Y(N118)
         );
  nor2_x1 U397 ( .A(n902), .B(n1245), .Y(n1248) );
  nand2_x1 U398 ( .A(n1276), .B(n1263), .Y(n1260) );
  or2_x1 U399 ( .A(segment_last_timestamp_us[0]), .B(n1256), .Y(n1233) );
  nor2_x1 U400 ( .A(n1227), .B(n984), .Y(N128) );
  nor2_x1 U401 ( .A(n1227), .B(n982), .Y(N127) );
  or2_x1 U402 ( .A(n841), .B(n840), .Y(n25) );
  and2_x1 U403 ( .A(n156), .B(n155), .Y(n26) );
  or2_x1 U404 ( .A(n750), .B(n780), .Y(n27) );
  and2_x1 U405 ( .A(n750), .B(n780), .Y(n28) );
  or2_x1 U406 ( .A(n320), .B(n784), .Y(n29) );
  and2_x1 U407 ( .A(n320), .B(n784), .Y(n30) );
  or2_x1 U408 ( .A(n781), .B(n335), .Y(n31) );
  and2_x1 U409 ( .A(n781), .B(n335), .Y(n32) );
  or2_x1 U410 ( .A(n748), .B(n351), .Y(n33) );
  and2_x1 U411 ( .A(n748), .B(n351), .Y(n34) );
  or2_x1 U412 ( .A(n461), .B(n462), .Y(n35) );
  and2_x1 U413 ( .A(n461), .B(n462), .Y(n36) );
  or2_x1 U414 ( .A(n481), .B(n482), .Y(n37) );
  and2_x1 U415 ( .A(n481), .B(n482), .Y(n38) );
  or2_x1 U416 ( .A(n602), .B(n560), .Y(n39) );
  and2_x1 U417 ( .A(n602), .B(n560), .Y(n40) );
  or2_x1 U418 ( .A(n675), .B(n237), .Y(n41) );
  and2_x1 U419 ( .A(n675), .B(n237), .Y(n42) );
  or2_x1 U420 ( .A(n756), .B(n262), .Y(n43) );
  and2_x1 U421 ( .A(n756), .B(n262), .Y(n44) );
  or2_x1 U422 ( .A(n777), .B(n278), .Y(n45) );
  and2_x1 U423 ( .A(n777), .B(n278), .Y(n46) );
  or2_x1 U424 ( .A(n814), .B(n329), .Y(n47) );
  and2_x1 U425 ( .A(n814), .B(n329), .Y(n48) );
  and2_x1 U426 ( .A(n758), .B(n346), .Y(n49) );
  or2_x1 U427 ( .A(n758), .B(n346), .Y(n50) );
  and2_x1 U428 ( .A(n823), .B(n362), .Y(n51) );
  or2_x1 U429 ( .A(n823), .B(n362), .Y(n52) );
  and2_x1 U430 ( .A(n547), .B(n417), .Y(n53) );
  or2_x1 U431 ( .A(n547), .B(n417), .Y(n54) );
  and2_x1 U432 ( .A(n568), .B(n435), .Y(n55) );
  or2_x1 U433 ( .A(n568), .B(n435), .Y(n56) );
  and2_x1 U434 ( .A(n657), .B(n494), .Y(n57) );
  or2_x1 U435 ( .A(n657), .B(n494), .Y(n58) );
  and2_x1 U436 ( .A(n692), .B(n513), .Y(n59) );
  or2_x1 U437 ( .A(n692), .B(n513), .Y(n60) );
  and2_x1 U438 ( .A(n722), .B(n533), .Y(n61) );
  or2_x1 U439 ( .A(n722), .B(n533), .Y(n62) );
  nand2_x1 U440 ( .A(n634), .B(n698), .Y(n156) );
  nand2_x1 U441 ( .A(n677), .B(n750), .Y(n157) );
  oai21_x1 U442 ( .A0(n26), .A1(n158), .B0(n157), .Y(n159) );
  nand2_x1 U443 ( .A(n367), .B(n368), .Y(n176) );
  oai21_x1 U444 ( .A0(n178), .A1(n177), .B0(n176), .Y(n179) );
  nand2_x1 U445 ( .A(n785), .B(n387), .Y(n182) );
  oai21_x1 U446 ( .A0(n184), .A1(n183), .B0(n182), .Y(n185) );
  nand2_x1 U447 ( .A(n407), .B(n408), .Y(n188) );
  oai21_x1 U448 ( .A0(n190), .A1(n189), .B0(n188), .Y(n191) );
  nand2_x1 U449 ( .A(n423), .B(n424), .Y(n194) );
  oai21_x1 U450 ( .A0(n196), .A1(n195), .B0(n194), .Y(n197) );
  nand2_x1 U451 ( .A(n502), .B(n503), .Y(n212) );
  oai21_x1 U452 ( .A0(n214), .A1(n213), .B0(n212), .Y(n215) );
  nand2_x1 U453 ( .A(n519), .B(n520), .Y(n218) );
  oai21_x1 U454 ( .A0(n220), .A1(n219), .B0(n218), .Y(n221) );
  nand2_x1 U455 ( .A(n809), .B(n293), .Y(n294) );
  oai21_x1 U456 ( .A0(n296), .A1(n295), .B0(n294), .Y(n297) );
  addf_x1 U457 ( .A(n783), .B(n241), .CI(n604), .CO(n252), .S(n242) );
  nor2_x1 U458 ( .A(ravens_spike_timestamp_us[1]), .B(n79), .Y(n901) );
  aoi2bb1_x1 U459 ( .A0N(n905), .A1N(n904), .B0(n903), .Y(n908) );
  nand2_x1 U460 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(n1310), 
        .Y(n997) );
  nor2_x1 U461 ( .A(time_us_start_looking_for_new_sim_time[9]), .B(n1422), .Y(
        n998) );
  addf_x1 U462 ( .A(n481), .B(n217), .CI(n216), .CO(n222), .S(n520) );
  addf_x1 U463 ( .A(n787), .B(n786), .CI(n785), .S(n793) );
  addf_x1 U464 ( .A(n793), .B(n792), .CI(n791), .S(n799) );
  nor2_x1 U465 ( .A(segment_last_timestamp_us[12]), .B(n1370), .Y(n899) );
  addf_x1 U466 ( .A(n640), .B(n639), .CI(n638), .CO(n680), .S(n642) );
  nand2_x1 U467 ( .A(ravens_spike_timestamp_us[9]), .B(n1193), .Y(n994) );
  addf_x1 U468 ( .A(n808), .B(n807), .CI(n806), .S(n811) );
  addf_x1 U469 ( .A(n755), .B(n754), .CI(n791), .CO(n800), .S(n746) );
  nor2_x1 U470 ( .A(n1107), .B(n1080), .Y(n1004) );
  addf_x1 U471 ( .A(n614), .B(n675), .CI(n613), .CO(n648), .S(n616) );
  aoi21_x1 U472 ( .A0(n534), .A1(n62), .B0(n61), .Y(n555) );
  nand2_x1 U473 ( .A(time_us_start_looking_for_new_sim_time[17]), .B(n1438), 
        .Y(n1014) );
  addf_x1 U474 ( .A(n814), .B(n813), .CI(n812), .S(n820) );
  and2_x1 U475 ( .A(time_us_start_looking_for_new_sim_time[18]), .B(n1360), 
        .Y(n1016) );
  nor2_x1 U476 ( .A(n1091), .B(n1191), .Y(n1018) );
  addf_x1 U477 ( .A(n817), .B(n816), .CI(n815), .CO(n819), .S(n822) );
  nor2_x1 U478 ( .A(n1106), .B(n1124), .Y(n986) );
  nor2_x1 U479 ( .A(n947), .B(n945), .Y(n950) );
  nand2_x1 U480 ( .A(time_us_start_looking_for_new_sim_time[10]), .B(n1385), 
        .Y(n1192) );
  addf_x1 U481 ( .A(n839), .B(n838), .CI(n837), .S(n840) );
  nand2_x1 U482 ( .A(n1194), .B(n1193), .Y(n1195) );
  nor2_x1 U483 ( .A(time_us_start_looking_for_new_sim_time[35]), .B(n1418), 
        .Y(n1106) );
  addf_x1 U484 ( .A(n835), .B(n834), .CI(n833), .CO(n838), .S(n775) );
  nand3_x1 U485 ( .A(time_us_start_looking_for_new_sim_time[14]), .B(n1339), 
        .C(n1116), .Y(n1117) );
  nand2_x1 U486 ( .A(time_us_start_looking_for_new_sim_time[20]), .B(n1365), 
        .Y(n1092) );
  nor2_x1 U487 ( .A(time_us_start_looking_for_new_sim_time[18]), .B(n1360), 
        .Y(n1191) );
  nand2_x1 U488 ( .A(time_us_start_looking_for_new_sim_time[40]), .B(n1301), 
        .Y(n1060) );
  nand2_x1 U489 ( .A(segment_last_timestamp_us[38]), .B(n1295), .Y(n864) );
  nand2_x1 U490 ( .A(n1152), .B(n1151), .Y(n1108) );
  nand2_x1 U491 ( .A(segment_last_timestamp_us[36]), .B(n1351), .Y(n1274) );
  xnor2_x1 U492 ( .A(n973), .B(n845), .Y(n851) );
  nor2_x1 U493 ( .A(n421), .B(n1399), .Y(n1371) );
  nand2_x1 U494 ( .A(segment_last_timestamp_us[1]), .B(n1258), .Y(n1241) );
  mxi2_x1 U495 ( .A0(n1280), .A1(n1279), .S(n1287), .YN(n1283) );
  nand2_x1 U496 ( .A(segment_last_timestamp_us[24]), .B(n1340), .Y(n1407) );
  nand2_x1 U497 ( .A(segment_last_timestamp_us[10]), .B(n1381), .Y(n1386) );
  mxi2_x1 U498 ( .A0(n1283), .A1(n1282), .S(n1281), .YN(n1293) );
  addh_x1 U499 ( .A(n1293), .B(segment_last_timestamp_us[37]), .CO(n1296), .S(
        n1284) );
  and2_x1 U500 ( .A(n1240), .B(n1233), .Y(n1234) );
  nor2_x1 U501 ( .A(n1227), .B(n981), .Y(N129) );
  inv_x1 U502 ( .A(n65), .Y(n1453) );
  nor2_x1 U503 ( .A(cur_fsm_state[0]), .B(cur_fsm_state[1]), .Y(n1214) );
  and2_x1 U504 ( .A(cur_fsm_state[2]), .B(n1214), .Y(sent_spike) );
  and2_x1 U505 ( .A(sent_spike), .B(ravens_spike[6]), .Y(net234) );
  and2_x1 U506 ( .A(sent_spike), .B(ravens_spike[5]), .Y(net235) );
  and2_x1 U507 ( .A(sent_spike), .B(ravens_spike[7]), .Y(net233) );
  and2_x1 U508 ( .A(sent_spike), .B(ravens_spike[8]), .Y(net232) );
  and2_x1 U509 ( .A(sent_spike), .B(ravens_spike[9]), .Y(net231) );
  and2_x1 U510 ( .A(sent_spike), .B(ravens_spike[10]), .Y(net230) );
  and2_x1 U511 ( .A(sent_spike), .B(ravens_spike[11]), .Y(net229) );
  and2_x1 U512 ( .A(sent_spike), .B(ravens_spike[12]), .Y(net228) );
  inv_x1 U513 ( .A(N73), .Y(n66) );
  nand2_x1 U514 ( .A(cur_fsm_state[2]), .B(n1214), .Y(n1230) );
  nand2_x1 U515 ( .A(n66), .B(n1230), .Y(N140) );
  inv_x1 U516 ( .A(n1454), .Y(n1227) );
  inv_x1 U517 ( .A(cur_sim_time_timestep[1]), .Y(n980) );
  inv_x1 U518 ( .A(cur_sim_time_timestep[3]), .Y(n857) );
  inv_x1 U519 ( .A(segment_last_timestamp_us[21]), .Y(n233) );
  inv_x1 U520 ( .A(segment_last_timestamp_us[20]), .Y(n68) );
  inv_x1 U521 ( .A(segment_last_timestamp_us[19]), .Y(n122) );
  inv_x1 U522 ( .A(segment_last_timestamp_us[18]), .Y(n126) );
  inv_x1 U523 ( .A(segment_last_timestamp_us[17]), .Y(n130) );
  inv_x1 U524 ( .A(segment_last_timestamp_us[15]), .Y(n99) );
  inv_x1 U525 ( .A(segment_last_timestamp_us[14]), .Y(n103) );
  inv_x1 U526 ( .A(segment_last_timestamp_us[13]), .Y(n110) );
  inv_x1 U527 ( .A(segment_last_timestamp_us[12]), .Y(n88) );
  inv_x1 U528 ( .A(segment_last_timestamp_us[10]), .Y(n70) );
  inv_x1 U529 ( .A(segment_last_timestamp_us[9]), .Y(n83) );
  inv_x1 U530 ( .A(segment_last_timestamp_us[8]), .Y(n86) );
  inv_x1 U531 ( .A(segment_last_timestamp_us[6]), .Y(n95) );
  inv_x1 U532 ( .A(segment_last_timestamp_us[5]), .Y(n72) );
  inv_x1 U533 ( .A(segment_last_timestamp_us[4]), .Y(n77) );
  inv_x1 U534 ( .A(segment_last_timestamp_us[3]), .Y(n81) );
  inv_x1 U535 ( .A(segment_last_timestamp_us[2]), .Y(n74) );
  inv_x1 U536 ( .A(segment_last_timestamp_us[0]), .Y(n75) );
  addf_x2 U537 ( .A(ravens_spike_timestamp_us[10]), .B(n70), .CI(n69), .CO(n91), .S(n789) );
  addf_x2 U538 ( .A(ravens_spike_timestamp_us[5]), .B(n72), .CI(n71), .CO(n94), 
        .S(n783) );
  addh_x1 U539 ( .A(n75), .B(ravens_spike_timestamp_us[0]), .CO(n78), .S(n603)
         );
  addf_x2 U540 ( .A(ravens_spike_timestamp_us[4]), .B(n77), .CI(n76), .CO(n71), 
        .S(n750) );
  addf_x2 U541 ( .A(ravens_spike_timestamp_us[9]), .B(n83), .CI(n82), .CO(n69), 
        .S(n748) );
  addf_x2 U542 ( .A(ravens_spike_timestamp_us[8]), .B(n86), .CI(n85), .CO(n82), 
        .S(n781) );
  addh_x1 U543 ( .A(n698), .B(n603), .CO(n84), .S(n92) );
  addf_x2 U544 ( .A(ravens_spike_timestamp_us[12]), .B(n88), .CI(n87), .CO(
        n107), .S(n407) );
  addf_x2 U545 ( .A(ravens_spike_timestamp_us[11]), .B(n1387), .CI(n91), .CO(
        n87), .S(n785) );
  addf_x2 U546 ( .A(ravens_spike_timestamp_us[7]), .B(n913), .CI(n93), .CO(n85), .S(n784) );
  addf_x2 U547 ( .A(ravens_spike_timestamp_us[6]), .B(n95), .CI(n94), .CO(n93), 
        .S(n780) );
  addh_x1 U548 ( .A(n151), .B(n603), .CO(n97), .S(n117) );
  addf_x2 U549 ( .A(ravens_spike_timestamp_us[15]), .B(n99), .CI(n98), .CO(
        n133), .S(n461) );
  addf_x2 U550 ( .A(ravens_spike_timestamp_us[14]), .B(n103), .CI(n102), .CO(
        n98), .S(n440) );
  addf_x2 U551 ( .A(ravens_spike_timestamp_us[16]), .B(n1347), .CI(n133), .CO(
        n129), .S(n481) );
  nor2_x1 U552 ( .A(n677), .B(n750), .Y(n158) );
  inv_x1 U553 ( .A(n159), .Y(n162) );
  nor2_x1 U554 ( .A(n698), .B(n783), .Y(n161) );
  nand2_x1 U555 ( .A(n698), .B(n783), .Y(n160) );
  oai21_x1 U556 ( .A0(n162), .A1(n161), .B0(n160), .Y(n163) );
  aoi21_x1 U557 ( .A0(n163), .A1(n27), .B0(n28), .Y(n164) );
  inv_x1 U558 ( .A(n164), .Y(n165) );
  aoi21_x1 U559 ( .A0(n165), .A1(n29), .B0(n30), .Y(n166) );
  inv_x1 U560 ( .A(n166), .Y(n168) );
  aoi21_x1 U561 ( .A0(n168), .A1(n31), .B0(n32), .Y(n169) );
  inv_x1 U562 ( .A(n169), .Y(n172) );
  aoi21_x1 U563 ( .A0(n172), .A1(n33), .B0(n34), .Y(n178) );
  nor2_x1 U564 ( .A(n367), .B(n368), .Y(n177) );
  inv_x1 U565 ( .A(n179), .Y(n184) );
  nor2_x1 U566 ( .A(n785), .B(n387), .Y(n183) );
  inv_x1 U567 ( .A(n185), .Y(n190) );
  nor2_x1 U568 ( .A(n407), .B(n408), .Y(n189) );
  inv_x1 U569 ( .A(n191), .Y(n196) );
  nor2_x1 U570 ( .A(n423), .B(n424), .Y(n195) );
  inv_x1 U571 ( .A(n197), .Y(n202) );
  nor2_x1 U572 ( .A(n440), .B(n441), .Y(n201) );
  nand2_x1 U573 ( .A(n440), .B(n441), .Y(n200) );
  oai21_x1 U574 ( .A0(n202), .A1(n201), .B0(n200), .Y(n205) );
  aoi21_x1 U575 ( .A0(n205), .A1(n35), .B0(n36), .Y(n206) );
  inv_x1 U576 ( .A(n206), .Y(n209) );
  aoi21_x1 U577 ( .A0(n209), .A1(n37), .B0(n38), .Y(n214) );
  nor2_x1 U578 ( .A(n502), .B(n503), .Y(n213) );
  inv_x1 U579 ( .A(n215), .Y(n220) );
  nor2_x1 U580 ( .A(n519), .B(n520), .Y(n219) );
  inv_x1 U581 ( .A(n221), .Y(n226) );
  nor2_x1 U582 ( .A(n538), .B(n539), .Y(n225) );
  nand2_x1 U583 ( .A(n538), .B(n539), .Y(n224) );
  oai21_x1 U584 ( .A0(n226), .A1(n225), .B0(n224), .Y(n229) );
  aoi21_x1 U585 ( .A0(n229), .A1(n39), .B0(n40), .Y(n236) );
  nor2_x1 U586 ( .A(n579), .B(n645), .Y(n235) );
  nand2_x1 U587 ( .A(n579), .B(n645), .Y(n234) );
  oai21_x1 U588 ( .A0(n236), .A1(n235), .B0(n234), .Y(n238) );
  aoi21_x1 U589 ( .A0(n41), .A1(n238), .B0(n42), .Y(n248) );
  inv_x1 U590 ( .A(segment_last_timestamp_us[23]), .Y(n250) );
  addh_x1 U591 ( .A(n677), .B(n603), .CO(n251), .S(n241) );
  nor2_x1 U592 ( .A(n708), .B(n245), .Y(n247) );
  nand2_x1 U593 ( .A(n708), .B(n245), .Y(n246) );
  oai21_x1 U594 ( .A0(n248), .A1(n247), .B0(n246), .Y(n263) );
  inv_x1 U595 ( .A(segment_last_timestamp_us[24]), .Y(n266) );
  aoi21_x1 U596 ( .A0(n263), .A1(n43), .B0(n44), .Y(n264) );
  inv_x1 U597 ( .A(n264), .Y(n279) );
  inv_x1 U598 ( .A(segment_last_timestamp_us[25]), .Y(n281) );
  aoi21_x1 U599 ( .A0(n279), .A1(n45), .B0(n46), .Y(n296) );
  inv_x1 U600 ( .A(segment_last_timestamp_us[26]), .Y(n299) );
  nor2_x1 U601 ( .A(n809), .B(n293), .Y(n295) );
  inv_x1 U602 ( .A(n297), .Y(n314) );
  inv_x1 U603 ( .A(segment_last_timestamp_us[27]), .Y(n316) );
  nor2_x1 U604 ( .A(n816), .B(n311), .Y(n313) );
  nand2_x1 U605 ( .A(n816), .B(n311), .Y(n312) );
  oai21_x1 U606 ( .A0(n314), .A1(n313), .B0(n312), .Y(n330) );
  inv_x1 U607 ( .A(segment_last_timestamp_us[28]), .Y(n333) );
  aoi21_x1 U608 ( .A0(n330), .A1(n47), .B0(n48), .Y(n331) );
  inv_x1 U609 ( .A(n331), .Y(n347) );
  aoi21_x1 U610 ( .A0(n347), .A1(n50), .B0(n49), .Y(n348) );
  inv_x1 U611 ( .A(n348), .Y(n363) );
  inv_x1 U612 ( .A(segment_last_timestamp_us[30]), .Y(n365) );
  aoi21_x1 U613 ( .A0(n363), .A1(n52), .B0(n51), .Y(n382) );
  inv_x1 U614 ( .A(segment_last_timestamp_us[31]), .Y(n385) );
  nor2_x1 U615 ( .A(n818), .B(n379), .Y(n381) );
  nand2_x1 U616 ( .A(n818), .B(n379), .Y(n380) );
  oai21_x1 U617 ( .A0(n382), .A1(n381), .B0(n380), .Y(n383) );
  inv_x1 U618 ( .A(n383), .Y(n401) );
  inv_x1 U619 ( .A(segment_last_timestamp_us[32]), .Y(n403) );
  nor2_x1 U620 ( .A(n528), .B(n398), .Y(n400) );
  nand2_x1 U621 ( .A(n528), .B(n398), .Y(n399) );
  oai21_x1 U622 ( .A0(n401), .A1(n400), .B0(n399), .Y(n418) );
  inv_x1 U623 ( .A(segment_last_timestamp_us[33]), .Y(n421) );
  aoi21_x1 U624 ( .A0(n418), .A1(n54), .B0(n53), .Y(n419) );
  inv_x1 U625 ( .A(n419), .Y(n436) );
  inv_x1 U626 ( .A(segment_last_timestamp_us[34]), .Y(n438) );
  aoi21_x1 U627 ( .A0(n436), .A1(n56), .B0(n55), .Y(n456) );
  inv_x1 U628 ( .A(segment_last_timestamp_us[35]), .Y(n459) );
  nor2_x1 U629 ( .A(n587), .B(n453), .Y(n455) );
  nand2_x1 U630 ( .A(n587), .B(n453), .Y(n454) );
  oai21_x1 U631 ( .A0(n456), .A1(n455), .B0(n454), .Y(n457) );
  inv_x1 U632 ( .A(n457), .Y(n477) );
  inv_x1 U633 ( .A(segment_last_timestamp_us[36]), .Y(n479) );
  nor2_x1 U634 ( .A(n622), .B(n474), .Y(n476) );
  nand2_x1 U635 ( .A(n622), .B(n474), .Y(n475) );
  oai21_x1 U636 ( .A0(n477), .A1(n476), .B0(n475), .Y(n495) );
  inv_x1 U637 ( .A(segment_last_timestamp_us[37]), .Y(n498) );
  aoi21_x1 U638 ( .A0(n495), .A1(n58), .B0(n57), .Y(n496) );
  inv_x1 U639 ( .A(n496), .Y(n514) );
  inv_x1 U640 ( .A(segment_last_timestamp_us[38]), .Y(n517) );
  aoi21_x1 U641 ( .A0(n514), .A1(n60), .B0(n59), .Y(n515) );
  inv_x1 U642 ( .A(n515), .Y(n534) );
  inv_x1 U643 ( .A(segment_last_timestamp_us[39]), .Y(n536) );
  inv_x1 U644 ( .A(segment_last_timestamp_us[40]), .Y(n558) );
  nor2_x1 U645 ( .A(n763), .B(n552), .Y(n554) );
  nand2_x1 U646 ( .A(n763), .B(n552), .Y(n553) );
  oai21_x1 U647 ( .A0(n555), .A1(n554), .B0(n553), .Y(n556) );
  inv_x1 U648 ( .A(n556), .Y(n576) );
  inv_x1 U649 ( .A(segment_last_timestamp_us[41]), .Y(n593) );
  inv_x1 U650 ( .A(segment_last_timestamp_us[42]), .Y(n599) );
  addf_x1 U651 ( .A(ravens_spike_timestamp_us[41]), .B(n593), .CI(n592), .CO(
        n598), .S(n836) );
  inv_x1 U652 ( .A(segment_last_timestamp_us[43]), .Y(n631) );
  addf_x1 U653 ( .A(ravens_spike_timestamp_us[42]), .B(n599), .CI(n598), .CO(
        n630), .S(n668) );
  inv_x1 U654 ( .A(segment_last_timestamp_us[44]), .Y(n629) );
  xor2_x1 U655 ( .A(ravens_spike_timestamp_us[44]), .B(n629), .Y(n633) );
  addf_x1 U656 ( .A(ravens_spike_timestamp_us[43]), .B(n631), .CI(n630), .CO(
        n632), .S(n695) );
  addh_x1 U657 ( .A(n783), .B(n698), .CO(n752), .S(n700) );
  addh_x1 U658 ( .A(n780), .B(n750), .CO(n782), .S(n753) );
  xnor2_x1 U659 ( .A(n773), .B(n770), .Y(n973) );
  nand2b_x2 U660 ( .AN(n973), .B(cur_sim_time_timestep[0]), .Y(n846) );
  inv_x1 U661 ( .A(n846), .Y(n853) );
  addh_x1 U662 ( .A(n781), .B(n780), .S(n787) );
  xor2_x1 U663 ( .A(n844), .B(n843), .Y(n845) );
  xnor2_x1 U664 ( .A(n851), .B(cur_sim_time_timestep[1]), .Y(n849) );
  nand2_x2 U665 ( .A(n846), .B(n851), .Y(n852) );
  aoi21_x2 U666 ( .A0(n853), .A1(n849), .B0(n848), .Y(n850) );
  nor2_x2 U667 ( .A(cur_sim_time_timestep[2]), .B(n850), .Y(n856) );
  aoi21_x2 U668 ( .A0(cur_sim_time_timestep[2]), .A1(n850), .B0(
        cur_sim_time_timestep[3]), .Y(n855) );
  aoi22_x1 U669 ( .A0(n971), .A1(n853), .B0(n852), .B1(
        cur_sim_time_timestep[1]), .Y(n854) );
  oai22_x4 U670 ( .A0(n857), .A1(n856), .B0(n855), .B1(n854), .Y(n975) );
  nand2b_x1 U671 ( .AN(segment_last_timestamp_us[44]), .B(
        ravens_spike_timestamp_us[44]), .Y(n970) );
  oai22_x1 U672 ( .A0(ravens_spike_timestamp_us[44]), .A1(n629), .B0(
        ravens_spike_timestamp_us[43]), .B1(n631), .Y(n863) );
  inv_x1 U673 ( .A(ravens_spike_timestamp_us[41]), .Y(n1304) );
  inv_x1 U674 ( .A(ravens_spike_timestamp_us[42]), .Y(n1313) );
  aoi22_x1 U675 ( .A0(segment_last_timestamp_us[41]), .A1(n1304), .B0(
        segment_last_timestamp_us[42]), .B1(n1313), .Y(n861) );
  nand2b_x1 U676 ( .AN(segment_last_timestamp_us[41]), .B(
        ravens_spike_timestamp_us[41]), .Y(n878) );
  nand3b_x1 U677 ( .AN(ravens_spike_timestamp_us[40]), .B(
        segment_last_timestamp_us[40]), .C(n878), .Y(n860) );
  nand2b_x1 U678 ( .AN(segment_last_timestamp_us[42]), .B(
        ravens_spike_timestamp_us[42]), .Y(n859) );
  nand2b_x1 U679 ( .AN(segment_last_timestamp_us[43]), .B(
        ravens_spike_timestamp_us[43]), .Y(n858) );
  nand2_x1 U680 ( .A(n859), .B(n858), .Y(n880) );
  aoi21_x1 U681 ( .A0(n861), .A1(n860), .B0(n880), .Y(n862) );
  nor2_x1 U682 ( .A(n863), .B(n862), .Y(n884) );
  inv_x1 U683 ( .A(ravens_spike_timestamp_us[39]), .Y(n1298) );
  nor2_x1 U684 ( .A(segment_last_timestamp_us[39]), .B(n1298), .Y(n872) );
  inv_x1 U685 ( .A(ravens_spike_timestamp_us[38]), .Y(n1295) );
  oai22_x1 U686 ( .A0(ravens_spike_timestamp_us[39]), .A1(n536), .B0(n872), 
        .B1(n864), .Y(n882) );
  oai22_x1 U687 ( .A0(ravens_spike_timestamp_us[32]), .A1(n403), .B0(
        ravens_spike_timestamp_us[33]), .B1(n421), .Y(n871) );
  nand2b_x1 U688 ( .AN(segment_last_timestamp_us[33]), .B(
        ravens_spike_timestamp_us[33]), .Y(n866) );
  nand2b_x1 U689 ( .AN(segment_last_timestamp_us[34]), .B(
        ravens_spike_timestamp_us[34]), .Y(n865) );
  nand2b_x1 U690 ( .AN(segment_last_timestamp_us[35]), .B(
        ravens_spike_timestamp_us[35]), .Y(n867) );
  nand3_x2 U691 ( .A(n866), .B(n865), .C(n867), .Y(n966) );
  inv_x1 U692 ( .A(n966), .Y(n870) );
  inv_x1 U693 ( .A(ravens_spike_timestamp_us[34]), .Y(n1375) );
  nand3_x1 U694 ( .A(segment_last_timestamp_us[34]), .B(n1375), .C(n867), .Y(
        n868) );
  oai21_x1 U695 ( .A0(ravens_spike_timestamp_us[35]), .A1(n459), .B0(n868), 
        .Y(n869) );
  aoi21_x1 U696 ( .A0(n871), .A1(n870), .B0(n869), .Y(n877) );
  inv_x1 U697 ( .A(ravens_spike_timestamp_us[36]), .Y(n1355) );
  inv_x1 U698 ( .A(ravens_spike_timestamp_us[37]), .Y(n1285) );
  oai22_x1 U699 ( .A0(segment_last_timestamp_us[37]), .A1(n1285), .B0(
        segment_last_timestamp_us[38]), .B1(n1295), .Y(n873) );
  nor2_x1 U700 ( .A(n873), .B(n872), .Y(n874) );
  oai21_x1 U701 ( .A0(segment_last_timestamp_us[36]), .A1(n1355), .B0(n874), 
        .Y(n960) );
  aoi22_x1 U702 ( .A0(segment_last_timestamp_us[36]), .A1(n1355), .B0(
        segment_last_timestamp_us[37]), .B1(n1285), .Y(n876) );
  inv_x1 U703 ( .A(n874), .Y(n875) );
  oai22_x1 U704 ( .A0(n877), .A1(n960), .B0(n876), .B1(n875), .Y(n881) );
  inv_x1 U705 ( .A(ravens_spike_timestamp_us[40]), .Y(n1301) );
  oai21_x1 U706 ( .A0(segment_last_timestamp_us[40]), .A1(n1301), .B0(n878), 
        .Y(n879) );
  nor2_x1 U707 ( .A(n880), .B(n879), .Y(n964) );
  oai21_x1 U708 ( .A0(n882), .A1(n881), .B0(n964), .Y(n883) );
  nand2_x1 U709 ( .A(n884), .B(n883), .Y(n969) );
  nand2b_x1 U710 ( .AN(segment_last_timestamp_us[31]), .B(
        ravens_spike_timestamp_us[31]), .Y(n886) );
  oai22_x1 U711 ( .A0(ravens_spike_timestamp_us[30]), .A1(n365), .B0(
        ravens_spike_timestamp_us[31]), .B1(n385), .Y(n885) );
  nand2_x1 U712 ( .A(n886), .B(n885), .Y(n962) );
  nand2b_x1 U713 ( .AN(segment_last_timestamp_us[29]), .B(
        ravens_spike_timestamp_us[29]), .Y(n888) );
  nand2b_x1 U714 ( .AN(segment_last_timestamp_us[30]), .B(
        ravens_spike_timestamp_us[30]), .Y(n887) );
  nand3_x1 U715 ( .A(n888), .B(n887), .C(n886), .Y(n954) );
  aoi21_x1 U716 ( .A0(ravens_spike_timestamp_us[28]), .A1(n333), .B0(n954), 
        .Y(n959) );
  inv_x1 U717 ( .A(ravens_spike_timestamp_us[23]), .Y(n1398) );
  nand2_x1 U718 ( .A(ravens_spike_timestamp_us[23]), .B(n250), .Y(n944) );
  inv_x1 U719 ( .A(segment_last_timestamp_us[22]), .Y(n942) );
  inv_x1 U720 ( .A(ravens_spike_timestamp_us[22]), .Y(n1324) );
  oai22_x1 U721 ( .A0(ravens_spike_timestamp_us[14]), .A1(n103), .B0(
        ravens_spike_timestamp_us[15]), .B1(n99), .Y(n923) );
  nand2b_x1 U722 ( .AN(segment_last_timestamp_us[15]), .B(
        ravens_spike_timestamp_us[15]), .Y(n922) );
  inv_x1 U723 ( .A(ravens_spike_timestamp_us[13]), .Y(n1394) );
  inv_x1 U724 ( .A(ravens_spike_timestamp_us[12]), .Y(n1370) );
  inv_x1 U725 ( .A(ravens_spike_timestamp_us[10]), .Y(n1385) );
  nand2_x1 U726 ( .A(ravens_spike_timestamp_us[11]), .B(n1387), .Y(n890) );
  oai21_x1 U727 ( .A0(segment_last_timestamp_us[10]), .A1(n1385), .B0(n890), 
        .Y(n898) );
  inv_x1 U728 ( .A(n898), .Y(n895) );
  inv_x1 U729 ( .A(ravens_spike_timestamp_us[9]), .Y(n1422) );
  nor2_x1 U730 ( .A(segment_last_timestamp_us[9]), .B(n1422), .Y(n900) );
  inv_x1 U731 ( .A(ravens_spike_timestamp_us[8]), .Y(n1310) );
  nand2_x1 U732 ( .A(segment_last_timestamp_us[8]), .B(n1310), .Y(n889) );
  oai22_x1 U733 ( .A0(n900), .A1(n889), .B0(ravens_spike_timestamp_us[9]), 
        .B1(n83), .Y(n894) );
  inv_x1 U734 ( .A(n890), .Y(n892) );
  nand2_x1 U735 ( .A(segment_last_timestamp_us[10]), .B(n1385), .Y(n891) );
  oai22_x1 U736 ( .A0(n892), .A1(n891), .B0(ravens_spike_timestamp_us[11]), 
        .B1(n1387), .Y(n893) );
  aoi21_x1 U737 ( .A0(n895), .A1(n894), .B0(n893), .Y(n896) );
  oai22_x1 U738 ( .A0(n899), .A1(n896), .B0(ravens_spike_timestamp_us[12]), 
        .B1(n88), .Y(n897) );
  aoi22_x1 U739 ( .A0(segment_last_timestamp_us[13]), .A1(n1394), .B0(n914), 
        .B1(n897), .Y(n920) );
  inv_x1 U740 ( .A(ravens_spike_timestamp_us[7]), .Y(n1445) );
  oai22_x1 U741 ( .A0(segment_last_timestamp_us[7]), .A1(n1445), .B0(
        segment_last_timestamp_us[8]), .B1(n1310), .Y(n917) );
  nor3_x1 U742 ( .A(n900), .B(n899), .C(n898), .Y(n916) );
  inv_x1 U743 ( .A(segment_last_timestamp_us[7]), .Y(n913) );
  inv_x1 U744 ( .A(ravens_spike_timestamp_us[6]), .Y(n1292) );
  inv_x1 U745 ( .A(ravens_spike_timestamp_us[5]), .Y(n1270) );
  inv_x1 U746 ( .A(ravens_spike_timestamp_us[0]), .Y(n1235) );
  nor3_x1 U747 ( .A(n901), .B(segment_last_timestamp_us[0]), .C(n1235), .Y(
        n905) );
  inv_x1 U748 ( .A(ravens_spike_timestamp_us[1]), .Y(n1239) );
  inv_x1 U749 ( .A(ravens_spike_timestamp_us[2]), .Y(n1244) );
  oai22_x1 U750 ( .A0(segment_last_timestamp_us[1]), .A1(n1239), .B0(
        segment_last_timestamp_us[2]), .B1(n1244), .Y(n904) );
  inv_x1 U751 ( .A(segment_last_timestamp_us[2]), .Y(n902) );
  oai22_x1 U752 ( .A0(ravens_spike_timestamp_us[2]), .A1(n902), .B0(
        ravens_spike_timestamp_us[3]), .B1(n81), .Y(n903) );
  inv_x1 U753 ( .A(ravens_spike_timestamp_us[3]), .Y(n1250) );
  inv_x1 U754 ( .A(ravens_spike_timestamp_us[4]), .Y(n1262) );
  oai22_x1 U755 ( .A0(segment_last_timestamp_us[3]), .A1(n1250), .B0(
        segment_last_timestamp_us[4]), .B1(n1262), .Y(n907) );
  aoi22_x1 U756 ( .A0(segment_last_timestamp_us[4]), .A1(n1262), .B0(
        segment_last_timestamp_us[5]), .B1(n1270), .Y(n906) );
  oai21_x1 U757 ( .A0(n908), .A1(n907), .B0(n906), .Y(n909) );
  oai21_x1 U758 ( .A0(segment_last_timestamp_us[5]), .A1(n1270), .B0(n909), 
        .Y(n910) );
  oai21_x1 U759 ( .A0(ravens_spike_timestamp_us[6]), .A1(n95), .B0(n910), .Y(
        n911) );
  oai21_x1 U760 ( .A0(segment_last_timestamp_us[6]), .A1(n1292), .B0(n911), 
        .Y(n912) );
  oai21_x1 U761 ( .A0(ravens_spike_timestamp_us[7]), .A1(n913), .B0(n912), .Y(
        n915) );
  nand4b_x1 U762 ( .AN(n917), .B(n916), .C(n915), .D(n914), .Y(n919) );
  inv_x1 U763 ( .A(ravens_spike_timestamp_us[14]), .Y(n1339) );
  oai21_x1 U764 ( .A0(segment_last_timestamp_us[14]), .A1(n1339), .B0(n922), 
        .Y(n918) );
  aoi21_x1 U765 ( .A0(n920), .A1(n919), .B0(n918), .Y(n921) );
  aoi21_x1 U766 ( .A0(n923), .A1(n922), .B0(n921), .Y(n939) );
  inv_x1 U767 ( .A(ravens_spike_timestamp_us[17]), .Y(n1438) );
  nor2_x1 U768 ( .A(segment_last_timestamp_us[17]), .B(n1438), .Y(n927) );
  aoi21_x1 U769 ( .A0(ravens_spike_timestamp_us[16]), .A1(n1347), .B0(n927), 
        .Y(n925) );
  inv_x1 U770 ( .A(ravens_spike_timestamp_us[19]), .Y(n1434) );
  nor2_x1 U771 ( .A(segment_last_timestamp_us[19]), .B(n1434), .Y(n929) );
  aoi21_x1 U772 ( .A0(ravens_spike_timestamp_us[18]), .A1(n126), .B0(n929), 
        .Y(n932) );
  inv_x1 U773 ( .A(ravens_spike_timestamp_us[20]), .Y(n1365) );
  nor2_x1 U774 ( .A(segment_last_timestamp_us[20]), .B(n1365), .Y(n934) );
  inv_x1 U775 ( .A(n934), .Y(n924) );
  nand2b_x1 U776 ( .AN(segment_last_timestamp_us[21]), .B(
        ravens_spike_timestamp_us[21]), .Y(n936) );
  nand4_x1 U777 ( .A(n925), .B(n932), .C(n924), .D(n936), .Y(n938) );
  inv_x1 U778 ( .A(ravens_spike_timestamp_us[21]), .Y(n1426) );
  inv_x1 U779 ( .A(ravens_spike_timestamp_us[16]), .Y(n1350) );
  nand2_x1 U780 ( .A(segment_last_timestamp_us[16]), .B(n1350), .Y(n926) );
  oai22_x1 U781 ( .A0(n927), .A1(n926), .B0(ravens_spike_timestamp_us[17]), 
        .B1(n130), .Y(n931) );
  inv_x1 U782 ( .A(ravens_spike_timestamp_us[18]), .Y(n1360) );
  nand2_x1 U783 ( .A(segment_last_timestamp_us[18]), .B(n1360), .Y(n928) );
  oai22_x1 U784 ( .A0(n929), .A1(n928), .B0(ravens_spike_timestamp_us[19]), 
        .B1(n122), .Y(n930) );
  aoi21_x1 U785 ( .A0(n932), .A1(n931), .B0(n930), .Y(n933) );
  oai22_x1 U786 ( .A0(n934), .A1(n933), .B0(ravens_spike_timestamp_us[20]), 
        .B1(n68), .Y(n935) );
  aoi22_x1 U787 ( .A0(segment_last_timestamp_us[21]), .A1(n1426), .B0(n936), 
        .B1(n935), .Y(n937) );
  oai21_x1 U788 ( .A0(n939), .A1(n938), .B0(n937), .Y(n940) );
  oai21_x1 U789 ( .A0(segment_last_timestamp_us[22]), .A1(n1324), .B0(n940), 
        .Y(n941) );
  oai21_x1 U790 ( .A0(ravens_spike_timestamp_us[22]), .A1(n942), .B0(n941), 
        .Y(n943) );
  aoi22_x1 U791 ( .A0(segment_last_timestamp_us[23]), .A1(n1398), .B0(n944), 
        .B1(n943), .Y(n953) );
  inv_x1 U792 ( .A(ravens_spike_timestamp_us[24]), .Y(n1344) );
  inv_x1 U793 ( .A(ravens_spike_timestamp_us[27]), .Y(n1442) );
  nor2_x1 U794 ( .A(segment_last_timestamp_us[27]), .B(n1442), .Y(n947) );
  inv_x1 U795 ( .A(ravens_spike_timestamp_us[26]), .Y(n1380) );
  inv_x1 U796 ( .A(ravens_spike_timestamp_us[25]), .Y(n1410) );
  oai22_x1 U797 ( .A0(segment_last_timestamp_us[26]), .A1(n1380), .B0(
        segment_last_timestamp_us[25]), .B1(n1410), .Y(n945) );
  oai21_x1 U798 ( .A0(segment_last_timestamp_us[24]), .A1(n1344), .B0(n950), 
        .Y(n952) );
  oai22_x1 U799 ( .A0(ravens_spike_timestamp_us[24]), .A1(n266), .B0(
        ravens_spike_timestamp_us[25]), .B1(n281), .Y(n949) );
  nand2_x1 U800 ( .A(segment_last_timestamp_us[26]), .B(n1380), .Y(n946) );
  oai22_x1 U801 ( .A0(n947), .A1(n946), .B0(ravens_spike_timestamp_us[27]), 
        .B1(n316), .Y(n948) );
  aoi21_x1 U802 ( .A0(n950), .A1(n949), .B0(n948), .Y(n951) );
  oai21_x1 U803 ( .A0(n953), .A1(n952), .B0(n951), .Y(n958) );
  inv_x1 U804 ( .A(n954), .Y(n957) );
  inv_x1 U805 ( .A(segment_last_timestamp_us[29]), .Y(n955) );
  oai22_x1 U806 ( .A0(ravens_spike_timestamp_us[28]), .A1(n333), .B0(
        ravens_spike_timestamp_us[29]), .B1(n955), .Y(n956) );
  aoi22_x1 U807 ( .A0(n959), .A1(n958), .B0(n957), .B1(n956), .Y(n961) );
  aoi21_x1 U808 ( .A0(n962), .A1(n961), .B0(n960), .Y(n965) );
  nand2b_x1 U809 ( .AN(segment_last_timestamp_us[32]), .B(
        ravens_spike_timestamp_us[32]), .Y(n963) );
  nand4_x2 U810 ( .A(n965), .B(n964), .C(n963), .D(n970), .Y(n967) );
  nor2_x2 U811 ( .A(n967), .B(n966), .Y(n968) );
  aoi21_x1 U812 ( .A0(n970), .A1(n969), .B0(n968), .Y(n974) );
  inv_x1 U813 ( .A(n973), .Y(n976) );
  inv_x1 U814 ( .A(n1217), .Y(n979) );
  oai22_x1 U815 ( .A0(n980), .A1(n1272), .B0(n1225), .B1(n979), .Y(n983) );
  aoi21_x1 U816 ( .A0(cur_sim_time_timestep[2]), .A1(n983), .B0(
        cur_sim_time_timestep[3]), .Y(n981) );
  xnor3_alt_x1 U817 ( .A(n1225), .B(cur_sim_time_timestep[1]), .C(n1272), .Y(
        n982) );
  xnor2_x1 U818 ( .A(n983), .B(cur_sim_time_timestep[2]), .Y(n984) );
  nor2_x1 U819 ( .A(cur_fsm_state[2]), .B(cur_fsm_state[1]), .Y(N361) );
  inv_x1 U820 ( .A(time_us_start_looking_for_new_sim_time[44]), .Y(n1056) );
  nor2_x1 U821 ( .A(n1056), .B(ravens_spike_timestamp_us[44]), .Y(n1212) );
  nor2_x1 U822 ( .A(time_us_start_looking_for_new_sim_time[39]), .B(n1298), 
        .Y(n1130) );
  nand2_x1 U823 ( .A(time_us_start_looking_for_new_sim_time[38]), .B(n1295), 
        .Y(n1142) );
  nand2_x1 U824 ( .A(time_us_start_looking_for_new_sim_time[39]), .B(n1298), 
        .Y(n985) );
  oai21_x1 U825 ( .A0(n1130), .A1(n1142), .B0(n985), .Y(n1050) );
  nor2_x1 U826 ( .A(time_us_start_looking_for_new_sim_time[37]), .B(n1285), 
        .Y(n1141) );
  nor2_x1 U827 ( .A(time_us_start_looking_for_new_sim_time[38]), .B(n1295), 
        .Y(n1140) );
  nor3_x1 U828 ( .A(n1141), .B(n1140), .C(n1130), .Y(n1040) );
  nor2_x1 U829 ( .A(time_us_start_looking_for_new_sim_time[36]), .B(n1355), 
        .Y(n991) );
  inv_x1 U830 ( .A(ravens_spike_timestamp_us[35]), .Y(n1418) );
  inv_x1 U831 ( .A(ravens_spike_timestamp_us[32]), .Y(n1329) );
  inv_x1 U832 ( .A(ravens_spike_timestamp_us[33]), .Y(n1402) );
  aoi22_x1 U833 ( .A0(time_us_start_looking_for_new_sim_time[32]), .A1(n1329), 
        .B0(time_us_start_looking_for_new_sim_time[33]), .B1(n1402), .Y(n987)
         );
  nor2_x1 U834 ( .A(time_us_start_looking_for_new_sim_time[34]), .B(n1375), 
        .Y(n1124) );
  nand2b_x1 U835 ( .AN(time_us_start_looking_for_new_sim_time[33]), .B(
        ravens_spike_timestamp_us[33]), .Y(n1128) );
  nand2_x1 U836 ( .A(n986), .B(n1128), .Y(n1042) );
  nand2_x1 U837 ( .A(time_us_start_looking_for_new_sim_time[34]), .B(n1375), 
        .Y(n1126) );
  oai22_x1 U838 ( .A0(n987), .A1(n1042), .B0(n1106), .B1(n1126), .Y(n988) );
  aoi21_x1 U839 ( .A0(time_us_start_looking_for_new_sim_time[35]), .A1(n1418), 
        .B0(n988), .Y(n990) );
  aoi22_x1 U840 ( .A0(time_us_start_looking_for_new_sim_time[37]), .A1(n1285), 
        .B0(time_us_start_looking_for_new_sim_time[36]), .B1(n1355), .Y(n989)
         );
  oai21_x1 U841 ( .A0(n991), .A1(n990), .B0(n989), .Y(n992) );
  nand2_x1 U842 ( .A(n1040), .B(n992), .Y(n1047) );
  nor2_x1 U843 ( .A(time_us_start_looking_for_new_sim_time[23]), .B(n1398), 
        .Y(n1186) );
  nor2_x1 U844 ( .A(time_us_start_looking_for_new_sim_time[22]), .B(n1324), 
        .Y(n1076) );
  nor2_x1 U845 ( .A(n1186), .B(n1076), .Y(n1010) );
  nor2_x1 U846 ( .A(time_us_start_looking_for_new_sim_time[21]), .B(n1426), 
        .Y(n1100) );
  nand2_x1 U847 ( .A(time_us_start_looking_for_new_sim_time[21]), .B(n1426), 
        .Y(n1151) );
  oai21_x1 U848 ( .A0(n1100), .A1(n1092), .B0(n1151), .Y(n993) );
  aoi22_x1 U849 ( .A0(n1010), .A1(n993), .B0(
        time_us_start_looking_for_new_sim_time[23]), .B1(n1398), .Y(n1028) );
  nand2_x1 U850 ( .A(time_us_start_looking_for_new_sim_time[22]), .B(n1324), 
        .Y(n1109) );
  inv_x1 U851 ( .A(ravens_spike_timestamp_us[15]), .Y(n1430) );
  nor2_x1 U852 ( .A(time_us_start_looking_for_new_sim_time[15]), .B(n1430), 
        .Y(n1107) );
  nand2_x1 U853 ( .A(time_us_start_looking_for_new_sim_time[14]), .B(n1339), 
        .Y(n1008) );
  nor2_x1 U854 ( .A(time_us_start_looking_for_new_sim_time[13]), .B(n1394), 
        .Y(n1094) );
  nor2_x1 U855 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(n1310), .Y(
        n996) );
  nor2b_x1 U856 ( .AN(time_us_start_looking_for_new_sim_time[7]), .B(
        ravens_spike_timestamp_us[7]), .Y(n1164) );
  inv_x1 U857 ( .A(ravens_spike_timestamp_us[11]), .Y(n1390) );
  nor2_x1 U858 ( .A(time_us_start_looking_for_new_sim_time[11]), .B(n1390), 
        .Y(n1099) );
  nor2_x1 U859 ( .A(time_us_start_looking_for_new_sim_time[10]), .B(n1385), 
        .Y(n1197) );
  nor2_x1 U860 ( .A(n1099), .B(n1197), .Y(n1000) );
  nand2b_x1 U861 ( .AN(time_us_start_looking_for_new_sim_time[12]), .B(
        ravens_spike_timestamp_us[12]), .Y(n1073) );
  inv_x1 U862 ( .A(time_us_start_looking_for_new_sim_time[9]), .Y(n1193) );
  nand4_x1 U863 ( .A(n1164), .B(n1000), .C(n1073), .D(n994), .Y(n995) );
  nor3_x1 U864 ( .A(n1094), .B(n996), .C(n995), .Y(n1006) );
  oai22_x1 U865 ( .A0(ravens_spike_timestamp_us[9]), .A1(n1193), .B0(n998), 
        .B1(n997), .Y(n999) );
  aoi22_x1 U866 ( .A0(n1000), .A1(n999), .B0(
        time_us_start_looking_for_new_sim_time[11]), .B1(n1390), .Y(n1001) );
  oai21_x1 U867 ( .A0(n1099), .A1(n1192), .B0(n1001), .Y(n1002) );
  aoi22_x1 U868 ( .A0(time_us_start_looking_for_new_sim_time[12]), .A1(n1370), 
        .B0(n1073), .B1(n1002), .Y(n1003) );
  nand2_x1 U869 ( .A(time_us_start_looking_for_new_sim_time[13]), .B(n1394), 
        .Y(n1156) );
  oai21_x1 U870 ( .A0(n1094), .A1(n1003), .B0(n1156), .Y(n1005) );
  nor2_x1 U871 ( .A(time_us_start_looking_for_new_sim_time[14]), .B(n1339), 
        .Y(n1080) );
  oai21_x1 U872 ( .A0(n1006), .A1(n1005), .B0(n1004), .Y(n1007) );
  oai21_x1 U873 ( .A0(n1107), .A1(n1008), .B0(n1007), .Y(n1009) );
  aoi21_x1 U874 ( .A0(time_us_start_looking_for_new_sim_time[15]), .A1(n1430), 
        .B0(n1009), .Y(n1013) );
  nand2b_x1 U875 ( .AN(time_us_start_looking_for_new_sim_time[20]), .B(
        ravens_spike_timestamp_us[20]), .Y(n1093) );
  oai21_x1 U876 ( .A0(time_us_start_looking_for_new_sim_time[21]), .A1(n1426), 
        .B0(n1093), .Y(n1011) );
  nand2b_x1 U877 ( .AN(n1011), .B(n1010), .Y(n1019) );
  nor2_x1 U878 ( .A(time_us_start_looking_for_new_sim_time[19]), .B(n1434), 
        .Y(n1091) );
  nand2b_x1 U879 ( .AN(time_us_start_looking_for_new_sim_time[16]), .B(
        ravens_spike_timestamp_us[16]), .Y(n1064) );
  nand2b_x1 U880 ( .AN(time_us_start_looking_for_new_sim_time[17]), .B(
        ravens_spike_timestamp_us[17]), .Y(n1190) );
  nand4b_x1 U881 ( .AN(n1019), .B(n1018), .C(n1064), .D(n1190), .Y(n1012) );
  oai22_x1 U882 ( .A0(n1186), .A1(n1109), .B0(n1013), .B1(n1012), .Y(n1023) );
  inv_x1 U883 ( .A(n1190), .Y(n1065) );
  nand2_x1 U884 ( .A(time_us_start_looking_for_new_sim_time[16]), .B(n1350), 
        .Y(n1062) );
  oai21_x1 U885 ( .A0(n1065), .A1(n1062), .B0(n1014), .Y(n1017) );
  inv_x1 U886 ( .A(n1091), .Y(n1015) );
  aoi22_x1 U887 ( .A0(n1018), .A1(n1017), .B0(n1016), .B1(n1015), .Y(n1021) );
  nand2_x1 U888 ( .A(time_us_start_looking_for_new_sim_time[19]), .B(n1434), 
        .Y(n1020) );
  aoi21_x1 U889 ( .A0(n1021), .A1(n1020), .B0(n1019), .Y(n1022) );
  nor2_x1 U890 ( .A(n1023), .B(n1022), .Y(n1027) );
  nor2_x1 U891 ( .A(time_us_start_looking_for_new_sim_time[27]), .B(n1442), 
        .Y(n1105) );
  nor2_x1 U892 ( .A(time_us_start_looking_for_new_sim_time[25]), .B(n1410), 
        .Y(n1137) );
  nor2_x1 U893 ( .A(time_us_start_looking_for_new_sim_time[26]), .B(n1380), 
        .Y(n1189) );
  nor3_x1 U894 ( .A(n1105), .B(n1137), .C(n1189), .Y(n1029) );
  inv_x1 U895 ( .A(ravens_spike_timestamp_us[28]), .Y(n1319) );
  nor2_x1 U896 ( .A(time_us_start_looking_for_new_sim_time[28]), .B(n1319), 
        .Y(n1024) );
  nand2b_x1 U897 ( .AN(time_us_start_looking_for_new_sim_time[29]), .B(
        ravens_spike_timestamp_us[29]), .Y(n1153) );
  nand2b_x1 U898 ( .AN(time_us_start_looking_for_new_sim_time[30]), .B(
        ravens_spike_timestamp_us[30]), .Y(n1131) );
  nand2b_x1 U899 ( .AN(time_us_start_looking_for_new_sim_time[31]), .B(
        ravens_spike_timestamp_us[31]), .Y(n1143) );
  nand3_x1 U900 ( .A(n1153), .B(n1131), .C(n1143), .Y(n1034) );
  nor2_x1 U901 ( .A(n1024), .B(n1034), .Y(n1033) );
  or2_x1 U902 ( .A(time_us_start_looking_for_new_sim_time[24]), .B(n1344), .Y(
        n1025) );
  nand3_x1 U903 ( .A(n1029), .B(n1033), .C(n1025), .Y(n1026) );
  aoi21_x1 U904 ( .A0(n1028), .A1(n1027), .B0(n1026), .Y(n1045) );
  aoi22_x1 U905 ( .A0(time_us_start_looking_for_new_sim_time[24]), .A1(n1344), 
        .B0(time_us_start_looking_for_new_sim_time[25]), .B1(n1410), .Y(n1031)
         );
  inv_x1 U906 ( .A(n1029), .Y(n1030) );
  nand2_x1 U907 ( .A(time_us_start_looking_for_new_sim_time[26]), .B(n1380), 
        .Y(n1136) );
  oai22_x1 U908 ( .A0(n1031), .A1(n1030), .B0(n1105), .B1(n1136), .Y(n1032) );
  aoi21_x1 U909 ( .A0(time_us_start_looking_for_new_sim_time[27]), .A1(n1442), 
        .B0(n1032), .Y(n1039) );
  inv_x1 U910 ( .A(n1033), .Y(n1038) );
  inv_x1 U911 ( .A(ravens_spike_timestamp_us[31]), .Y(n1414) );
  inv_x1 U912 ( .A(n1143), .Y(n1085) );
  inv_x1 U913 ( .A(ravens_spike_timestamp_us[30]), .Y(n1334) );
  nand2_x1 U914 ( .A(time_us_start_looking_for_new_sim_time[30]), .B(n1334), 
        .Y(n1154) );
  inv_x1 U915 ( .A(ravens_spike_timestamp_us[29]), .Y(n1406) );
  aoi22_x1 U916 ( .A0(time_us_start_looking_for_new_sim_time[29]), .A1(n1406), 
        .B0(time_us_start_looking_for_new_sim_time[28]), .B1(n1319), .Y(n1035)
         );
  oai22_x1 U917 ( .A0(n1085), .A1(n1154), .B0(n1035), .B1(n1034), .Y(n1036) );
  aoi21_x1 U918 ( .A0(time_us_start_looking_for_new_sim_time[31]), .A1(n1414), 
        .B0(n1036), .Y(n1037) );
  oai21_x1 U919 ( .A0(n1039), .A1(n1038), .B0(n1037), .Y(n1044) );
  nor2_x1 U920 ( .A(time_us_start_looking_for_new_sim_time[32]), .B(n1329), 
        .Y(n1144) );
  oai21_x1 U921 ( .A0(time_us_start_looking_for_new_sim_time[36]), .A1(n1355), 
        .B0(n1040), .Y(n1041) );
  nor3_x1 U922 ( .A(n1144), .B(n1042), .C(n1041), .Y(n1043) );
  oai21_x1 U923 ( .A0(n1045), .A1(n1044), .B0(n1043), .Y(n1046) );
  nand2_x1 U924 ( .A(n1047), .B(n1046), .Y(n1049) );
  nor2_x1 U925 ( .A(time_us_start_looking_for_new_sim_time[41]), .B(n1304), 
        .Y(n1148) );
  nor2_x1 U926 ( .A(time_us_start_looking_for_new_sim_time[40]), .B(n1301), 
        .Y(n1134) );
  inv_x1 U927 ( .A(ravens_spike_timestamp_us[43]), .Y(n1448) );
  oai22_x1 U928 ( .A0(time_us_start_looking_for_new_sim_time[42]), .A1(n1313), 
        .B0(time_us_start_looking_for_new_sim_time[43]), .B1(n1448), .Y(n1051)
         );
  nor3_x1 U929 ( .A(n1148), .B(n1134), .C(n1051), .Y(n1048) );
  oai21_x1 U930 ( .A0(n1050), .A1(n1049), .B0(n1048), .Y(n1055) );
  inv_x1 U931 ( .A(n1051), .Y(n1090) );
  aoi22_x1 U932 ( .A0(time_us_start_looking_for_new_sim_time[41]), .A1(n1304), 
        .B0(time_us_start_looking_for_new_sim_time[42]), .B1(n1313), .Y(n1052)
         );
  oai21_x1 U933 ( .A0(n1148), .A1(n1060), .B0(n1052), .Y(n1053) );
  aoi22_x1 U934 ( .A0(n1090), .A1(n1053), .B0(
        time_us_start_looking_for_new_sim_time[43]), .B1(n1448), .Y(n1054) );
  aoi22_x1 U935 ( .A0(ravens_spike_timestamp_us[44]), .A1(n1056), .B0(n1055), 
        .B1(n1054), .Y(n1211) );
  inv_x1 U936 ( .A(n1093), .Y(n1152) );
  aoi21_x1 U937 ( .A0(time_us_start_looking_for_new_sim_time[41]), .A1(n1304), 
        .B0(n1148), .Y(n1058) );
  aoi21_x1 U938 ( .A0(time_us_start_looking_for_new_sim_time[27]), .A1(n1442), 
        .B0(n1105), .Y(n1057) );
  oai22_x1 U939 ( .A0(n1134), .A1(n1058), .B0(n1189), .B1(n1057), .Y(n1059) );
  aoi21_x1 U940 ( .A0(n1076), .A1(n1108), .B0(n1059), .Y(n1089) );
  nand2_x1 U941 ( .A(time_us_start_looking_for_new_sim_time[32]), .B(n1329), 
        .Y(n1061) );
  oai22_x1 U942 ( .A0(n1085), .A1(n1061), .B0(n1130), .B1(n1060), .Y(n1070) );
  nand2_x1 U943 ( .A(time_us_start_looking_for_new_sim_time[18]), .B(n1360), 
        .Y(n1063) );
  oai22_x1 U944 ( .A0(n1065), .A1(n1063), .B0(n1107), .B1(n1062), .Y(n1069) );
  inv_x1 U945 ( .A(n1064), .Y(n1115) );
  aoi21_x1 U946 ( .A0(time_us_start_looking_for_new_sim_time[17]), .A1(n1438), 
        .B0(n1065), .Y(n1067) );
  aoi21_x1 U947 ( .A0(time_us_start_looking_for_new_sim_time[19]), .A1(n1434), 
        .B0(n1091), .Y(n1066) );
  oai22_x1 U948 ( .A0(n1115), .A1(n1067), .B0(n1191), .B1(n1066), .Y(n1068) );
  nor3_x1 U949 ( .A(n1070), .B(n1069), .C(n1068), .Y(n1088) );
  aoi21_x1 U950 ( .A0(time_us_start_looking_for_new_sim_time[39]), .A1(n1298), 
        .B0(n1130), .Y(n1071) );
  nor2b_x1 U951 ( .AN(n1186), .B(time_us_start_looking_for_new_sim_time[24]), 
        .Y(n1102) );
  inv_x1 U952 ( .A(n1137), .Y(n1188) );
  oai22_x1 U953 ( .A0(n1140), .A1(n1071), .B0(n1102), .B1(n1188), .Y(n1083) );
  aoi21_x1 U954 ( .A0(time_us_start_looking_for_new_sim_time[35]), .A1(n1418), 
        .B0(n1106), .Y(n1072) );
  nor2b_x1 U955 ( .AN(n1106), .B(time_us_start_looking_for_new_sim_time[36]), 
        .Y(n1112) );
  inv_x1 U956 ( .A(n1141), .Y(n1139) );
  oai22_x1 U957 ( .A0(n1124), .A1(n1072), .B0(n1112), .B1(n1139), .Y(n1082) );
  aoi21_x1 U958 ( .A0(time_us_start_looking_for_new_sim_time[15]), .A1(n1430), 
        .B0(n1107), .Y(n1079) );
  inv_x1 U959 ( .A(n1073), .Y(n1157) );
  nand2_x1 U960 ( .A(n1157), .B(n1156), .Y(n1116) );
  aoi21_x1 U961 ( .A0(time_us_start_looking_for_new_sim_time[23]), .A1(n1398), 
        .B0(n1186), .Y(n1075) );
  aoi21_x1 U962 ( .A0(time_us_start_looking_for_new_sim_time[11]), .A1(n1390), 
        .B0(n1099), .Y(n1074) );
  oai22_x1 U963 ( .A0(n1076), .A1(n1075), .B0(n1197), .B1(n1074), .Y(n1077) );
  aoi21_x1 U964 ( .A0(n1116), .A1(n1080), .B0(n1077), .Y(n1078) );
  oai21_x1 U965 ( .A0(n1080), .A1(n1079), .B0(n1078), .Y(n1081) );
  nor3_x1 U966 ( .A(n1083), .B(n1082), .C(n1081), .Y(n1087) );
  and2_x1 U967 ( .A(time_us_start_looking_for_new_sim_time[31]), .B(n1414), 
        .Y(n1084) );
  oai22_x1 U968 ( .A0(time_us_start_looking_for_new_sim_time[30]), .A1(n1334), 
        .B0(n1085), .B1(n1084), .Y(n1086) );
  nand4_x1 U969 ( .A(n1089), .B(n1088), .C(n1087), .D(n1086), .Y(n1210) );
  nor2_x1 U970 ( .A(time_us_start_looking_for_new_sim_time[42]), .B(n1313), 
        .Y(n1146) );
  aoi21_x1 U971 ( .A0(n1146), .A1(n1148), .B0(n1090), .Y(n1097) );
  aoi21_x1 U972 ( .A0(n1093), .A1(n1092), .B0(n1091), .Y(n1096) );
  nor2b_x1 U973 ( .AN(n1105), .B(time_us_start_looking_for_new_sim_time[28]), 
        .Y(n1104) );
  oai22_x1 U974 ( .A0(n1104), .A1(n1153), .B0(n1094), .B1(n1116), .Y(n1095) );
  nor3_x1 U975 ( .A(n1097), .B(n1096), .C(n1095), .Y(n1208) );
  aoi21_x1 U976 ( .A0(time_us_start_looking_for_new_sim_time[12]), .A1(n1370), 
        .B0(n1157), .Y(n1098) );
  oai22_x1 U977 ( .A0(n1100), .A1(n1108), .B0(n1099), .B1(n1098), .Y(n1123) );
  nand2_x1 U978 ( .A(time_us_start_looking_for_new_sim_time[29]), .B(n1406), 
        .Y(n1103) );
  nand2_x1 U979 ( .A(time_us_start_looking_for_new_sim_time[25]), .B(n1410), 
        .Y(n1101) );
  oai22_x1 U980 ( .A0(n1104), .A1(n1103), .B0(n1102), .B1(n1101), .Y(n1122) );
  xnor3_alt_x1 U981 ( .A(ravens_spike_timestamp_us[28]), .B(n1105), .C(
        time_us_start_looking_for_new_sim_time[28]), .Y(n1120) );
  xnor3_alt_x1 U982 ( .A(ravens_spike_timestamp_us[36]), .B(n1106), .C(
        time_us_start_looking_for_new_sim_time[36]), .Y(n1119) );
  inv_x1 U983 ( .A(n1107), .Y(n1114) );
  nand2_x1 U984 ( .A(time_us_start_looking_for_new_sim_time[37]), .B(n1285), 
        .Y(n1111) );
  inv_x1 U985 ( .A(n1108), .Y(n1110) );
  oai22_x1 U986 ( .A0(n1112), .A1(n1111), .B0(n1110), .B1(n1109), .Y(n1113) );
  aoi21_x1 U987 ( .A0(n1115), .A1(n1114), .B0(n1113), .Y(n1118) );
  nand4_x1 U988 ( .A(n1120), .B(n1119), .C(n1118), .D(n1117), .Y(n1121) );
  nor3_x1 U989 ( .A(n1123), .B(n1122), .C(n1121), .Y(n1207) );
  inv_x1 U990 ( .A(n1124), .Y(n1127) );
  inv_x1 U991 ( .A(n1128), .Y(n1125) );
  aoi21_x1 U992 ( .A0(n1127), .A1(n1126), .B0(n1125), .Y(n1173) );
  nand2_x1 U993 ( .A(time_us_start_looking_for_new_sim_time[33]), .B(n1402), 
        .Y(n1129) );
  aoi21_x1 U994 ( .A0(n1129), .A1(n1128), .B0(n1144), .Y(n1172) );
  inv_x1 U995 ( .A(n1130), .Y(n1133) );
  inv_x1 U996 ( .A(n1131), .Y(n1132) );
  aoi22_x1 U997 ( .A0(n1134), .A1(n1133), .B0(n1132), .B1(n1153), .Y(n1135) );
  oai21_x1 U998 ( .A0(n1137), .A1(n1136), .B0(n1135), .Y(n1138) );
  aoi21_x1 U999 ( .A0(n1140), .A1(n1139), .B0(n1138), .Y(n1170) );
  aoi2bb2_x1 U1000 ( .B0(n1144), .B1(n1143), .A0N(n1142), .A1N(n1141), .Y(
        n1169) );
  nand2_x1 U1001 ( .A(time_us_start_looking_for_new_sim_time[42]), .B(n1313), 
        .Y(n1147) );
  nand2_x1 U1002 ( .A(time_us_start_looking_for_new_sim_time[43]), .B(n1448), 
        .Y(n1145) );
  oai22_x1 U1003 ( .A0(n1148), .A1(n1147), .B0(n1146), .B1(n1145), .Y(n1160)
         );
  nor2_x1 U1004 ( .A(time_us_start_looking_for_new_sim_time[43]), .B(n1448), 
        .Y(n1150) );
  inv_x1 U1005 ( .A(ravens_spike_timestamp_us[44]), .Y(n1452) );
  nand2_x1 U1006 ( .A(time_us_start_looking_for_new_sim_time[44]), .B(n1452), 
        .Y(n1149) );
  oai22_x1 U1007 ( .A0(n1152), .A1(n1151), .B0(n1150), .B1(n1149), .Y(n1159)
         );
  inv_x1 U1008 ( .A(n1153), .Y(n1155) );
  oai22_x1 U1009 ( .A0(n1157), .A1(n1156), .B0(n1155), .B1(n1154), .Y(n1158)
         );
  nor3_x1 U1010 ( .A(n1160), .B(n1159), .C(n1158), .Y(n1168) );
  nor2_x1 U1011 ( .A(time_us_start_looking_for_new_sim_time[7]), .B(n1445), 
        .Y(n1165) );
  inv_x1 U1012 ( .A(time_us_start_looking_for_new_sim_time[6]), .Y(n1179) );
  inv_x1 U1013 ( .A(time_us_start_looking_for_new_sim_time[5]), .Y(n1175) );
  nand2_x1 U1014 ( .A(ravens_spike_timestamp_us[4]), .B(\intadd_1/n1 ), .Y(
        n1163) );
  inv_x1 U1015 ( .A(time_us_start_looking_for_new_sim_time[4]), .Y(n1161) );
  oai21_x1 U1016 ( .A0(ravens_spike_timestamp_us[4]), .A1(\intadd_1/n1 ), .B0(
        n1161), .Y(n1162) );
  nand2_x1 U1017 ( .A(n1163), .B(n1162), .Y(n1174) );
  inv_x1 U1018 ( .A(n1164), .Y(n1177) );
  oai21_x1 U1019 ( .A0(n1165), .A1(n1185), .B0(n1177), .Y(n1187) );
  nor2_x1 U1020 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(n1187), 
        .Y(n1194) );
  aoi21_x1 U1021 ( .A0(time_us_start_looking_for_new_sim_time[9]), .A1(n1194), 
        .B0(ravens_spike_timestamp_us[9]), .Y(n1166) );
  oai21_x1 U1022 ( .A0(time_us_start_looking_for_new_sim_time[9]), .A1(n1194), 
        .B0(n1166), .Y(n1167) );
  nand4_x1 U1023 ( .A(n1170), .B(n1169), .C(n1168), .D(n1167), .Y(n1171) );
  nor3_x1 U1024 ( .A(n1173), .B(n1172), .C(n1171), .Y(n1206) );
  addf_x1 U1025 ( .A(n1175), .B(ravens_spike_timestamp_us[5]), .CI(n1174), 
        .CO(n1178), .S(n1176) );
  aoi21_x1 U1026 ( .A0(\intadd_1/SUM[1] ), .A1(\intadd_1/SUM[0] ), .B0(n1176), 
        .Y(n1204) );
  oai21_x1 U1027 ( .A0(time_us_start_looking_for_new_sim_time[7]), .A1(n1445), 
        .B0(n1177), .Y(n1184) );
  addf_x1 U1028 ( .A(n1179), .B(ravens_spike_timestamp_us[6]), .CI(n1178), 
        .CO(n1185), .S(n1180) );
  nor2_x1 U1029 ( .A(\intadd_1/SUM[2] ), .B(n1180), .Y(n1182) );
  xnor3_alt_x1 U1030 ( .A(time_us_start_looking_for_new_sim_time[4]), .B(
        \intadd_1/n1 ), .C(n1262), .Y(n1181) );
  nand2_x1 U1031 ( .A(n1182), .B(n1181), .Y(n1183) );
  aoi21_x1 U1032 ( .A0(n1185), .A1(n1184), .B0(n1183), .Y(n1203) );
  xnor3_alt_x1 U1033 ( .A(ravens_spike_timestamp_us[24]), .B(n1186), .C(
        time_us_start_looking_for_new_sim_time[24]), .Y(n1201) );
  xnor3_alt_x1 U1034 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(n1310), .C(n1187), .Y(n1200) );
  aoi22_x1 U1035 ( .A0(n1191), .A1(n1190), .B0(n1189), .B1(n1188), .Y(n1199)
         );
  inv_x1 U1036 ( .A(n1192), .Y(n1196) );
  oai21_x1 U1037 ( .A0(n1197), .A1(n1196), .B0(n1195), .Y(n1198) );
  nand4_x1 U1038 ( .A(n1201), .B(n1200), .C(n1199), .D(n1198), .Y(n1202) );
  aoi21_x1 U1039 ( .A0(n1204), .A1(n1203), .B0(n1202), .Y(n1205) );
  nand4_x1 U1040 ( .A(n1208), .B(n1207), .C(n1206), .D(n1205), .Y(n1209) );
  oai22_x1 U1041 ( .A0(n1212), .A1(n1211), .B0(n1210), .B1(n1209), .Y(n1213)
         );
  oai21_x1 U1042 ( .A0(cur_fsm_state[0]), .A1(n1213), .B0(new_spike), .Y(n1221) );
  inv_x1 U1043 ( .A(n1221), .Y(n1215) );
  oai21_x1 U1044 ( .A0(cur_fsm_state[2]), .A1(n1215), .B0(n1214), .Y(n1220) );
  inv_x1 U1045 ( .A(N361), .Y(n1216) );
  oai21_x1 U1046 ( .A0(n1219), .A1(n1228), .B0(N73), .Y(n1224) );
  and3_x2 U1047 ( .A(n1220), .B(n1232), .C(n1224), .Y(n108) );
  nor2_x1 U1048 ( .A(time_us_start_looking_for_new_sim_time[0]), .B(n1235), 
        .Y(\intadd_1/CI ) );
  nand2b_x1 U1049 ( .AN(n1221), .B(N361), .Y(n1222) );
  aoi21_x1 U1050 ( .A0(cur_fsm_state[0]), .A1(n1223), .B0(n1222), .Y(
        \next_fsm_state[1] ) );
  oai21_x1 U1051 ( .A0(n1232), .A1(n1229), .B0(n1224), .Y(n111) );
  inv_x1 U1052 ( .A(n1225), .Y(n1226) );
  nor3_x1 U1053 ( .A(n1228), .B(n1227), .C(n1226), .Y(N126) );
  inv_x1 U1054 ( .A(n1229), .Y(n1231) );
  oai21_x1 U1055 ( .A0(n1232), .A1(n1231), .B0(n1230), .Y(n109) );
  oai2bb2_x1 U1056 ( .B0(n65), .B1(n1235), .A0N(n1454), .A1N(n1234), .Y(N74)
         );
  inv_x1 U1057 ( .A(n1242), .Y(n1236) );
  nand2_x2 U1058 ( .A(n1241), .B(n1236), .Y(n1237) );
  xor2_x1 U1059 ( .A(n1237), .B(n1240), .Y(n1238) );
  oai2bb2_x1 U1060 ( .B0(n65), .B1(n1239), .A0N(n1454), .A1N(n1238), .Y(N75)
         );
  mxi2_x1 U1061 ( .A0(n1242), .A1(n1241), .S(n1240), .YN(n1253) );
  inv_x1 U1062 ( .A(n1253), .Y(n1245) );
  xor2_x1 U1063 ( .A(n1245), .B(n902), .Y(n1243) );
  oai2bb2_x1 U1064 ( .B0(n65), .B1(n1244), .A0N(n1454), .A1N(n1243), .Y(N76)
         );
  inv_x1 U1065 ( .A(n1252), .Y(n1246) );
  nand2_x2 U1066 ( .A(n1251), .B(n1246), .Y(n1247) );
  xnor2_x1 U1067 ( .A(n1248), .B(n1247), .Y(n1249) );
  oai2bb2_x1 U1068 ( .B0(n65), .B1(n1250), .A0N(n1454), .A1N(n1249), .Y(N77)
         );
  inv_x1 U1069 ( .A(n1251), .Y(n1255) );
  mxi2_x1 U1070 ( .A0(n1252), .A1(n1251), .S(n902), .YN(n1254) );
  mxi2_x1 U1071 ( .A0(n1255), .A1(n1254), .S(n1253), .YN(n1281) );
  inv_x1 U1072 ( .A(n1256), .Y(n1271) );
  inv_x1 U1073 ( .A(n1275), .Y(n1263) );
  xnor2_x1 U1074 ( .A(n1286), .B(n1260), .Y(n1261) );
  oai2bb2_x1 U1075 ( .B0(n65), .B1(n1262), .A0N(n1454), .A1N(n1261), .Y(N78)
         );
  inv_x1 U1076 ( .A(n1276), .Y(n1264) );
  mxi2_x1 U1077 ( .A0(n1264), .A1(n1263), .S(n1286), .YN(n1268) );
  inv_x1 U1078 ( .A(n1278), .Y(n1266) );
  nand2_x2 U1079 ( .A(n1277), .B(n1266), .Y(n1267) );
  xor2_x1 U1080 ( .A(n1268), .B(n1267), .Y(n1269) );
  oai2bb2_x1 U1081 ( .B0(n65), .B1(n1270), .A0N(n1454), .A1N(n1269), .Y(N79)
         );
  inv_x1 U1082 ( .A(segment_last_timestamp_us[11]), .Y(n1387) );
  nand2_x1 U1083 ( .A(segment_last_timestamp_us[8]), .B(
        segment_last_timestamp_us[7]), .Y(n1419) );
  nor2_x1 U1084 ( .A(n1274), .B(n1306), .Y(n1280) );
  nor2_x1 U1085 ( .A(n1274), .B(n1307), .Y(n1279) );
  mxi2_x1 U1086 ( .A0(n1278), .A1(n1277), .S(n1276), .YN(n1288) );
  mxi2_x1 U1087 ( .A0(n1280), .A1(n1279), .S(n1288), .YN(n1282) );
  oai2bb2_x1 U1088 ( .B0(n65), .B1(n1285), .A0N(n1454), .A1N(n1284), .Y(N111)
         );
  mxi2_x1 U1089 ( .A0(n1288), .A1(n1287), .S(n1286), .YN(n1305) );
  inv_x1 U1090 ( .A(n1307), .Y(n1289) );
  nand2_x1 U1091 ( .A(n1306), .B(n1289), .Y(n1290) );
  xor2_x1 U1092 ( .A(n1305), .B(n1290), .Y(n1291) );
  oai2bb2_x1 U1093 ( .B0(n65), .B1(n1292), .A0N(n1454), .A1N(n1291), .Y(N80)
         );
  oai2bb2_x1 U1094 ( .B0(n65), .B1(n1295), .A0N(n1454), .A1N(n1294), .Y(N112)
         );
  addh_x1 U1095 ( .A(n1296), .B(segment_last_timestamp_us[38]), .CO(n1299), 
        .S(n1294) );
  oai2bb2_x1 U1096 ( .B0(n65), .B1(n1298), .A0N(n1454), .A1N(n1297), .Y(N113)
         );
  addh_x1 U1097 ( .A(n1299), .B(segment_last_timestamp_us[39]), .CO(n1302), 
        .S(n1297) );
  oai2bb2_x1 U1098 ( .B0(n65), .B1(n1301), .A0N(n1454), .A1N(n1300), .Y(N114)
         );
  addh_x1 U1099 ( .A(n1302), .B(segment_last_timestamp_us[40]), .CO(n1311), 
        .S(n1300) );
  oai2bb2_x1 U1100 ( .B0(n65), .B1(n1304), .A0N(n1454), .A1N(n1303), .Y(N115)
         );
  mxi2_x1 U1101 ( .A0(n1307), .A1(n1306), .S(n1305), .YN(n1315) );
  nand2_x1 U1102 ( .A(segment_last_timestamp_us[7]), .B(n1315), .Y(n1308) );
  xor2_x1 U1103 ( .A(n1308), .B(n86), .Y(n1309) );
  oai2bb2_x1 U1104 ( .B0(n65), .B1(n1310), .A0N(n1454), .A1N(n1309), .Y(N82)
         );
  addh_x1 U1105 ( .A(n1311), .B(segment_last_timestamp_us[41]), .CO(n1446), 
        .S(n1303) );
  oai2bb2_x1 U1106 ( .B0(n65), .B1(n1313), .A0N(n1454), .A1N(n1312), .Y(N116)
         );
  inv_x1 U1107 ( .A(n1314), .Y(n1316) );
  nor2_x1 U1108 ( .A(n1316), .B(n1443), .Y(n1317) );
  xnor2_x1 U1109 ( .A(n1317), .B(n333), .Y(n1318) );
  oai2bb2_x1 U1110 ( .B0(n65), .B1(n1319), .A0N(n1454), .A1N(n1318), .Y(N102)
         );
  inv_x1 U1111 ( .A(n1320), .Y(n1321) );
  nor2_x1 U1112 ( .A(n1321), .B(n1443), .Y(n1322) );
  xnor2_x1 U1113 ( .A(n1322), .B(n942), .Y(n1323) );
  oai2bb2_x1 U1114 ( .B0(n65), .B1(n1324), .A0N(n1454), .A1N(n1323), .Y(N96)
         );
  inv_x1 U1115 ( .A(n1325), .Y(n1326) );
  nor2_x1 U1116 ( .A(n1326), .B(n1443), .Y(n1327) );
  xnor2_x1 U1117 ( .A(n1327), .B(n403), .Y(n1328) );
  oai2bb2_x1 U1118 ( .B0(n65), .B1(n1329), .A0N(n1454), .A1N(n1328), .Y(N106)
         );
  inv_x1 U1119 ( .A(n1330), .Y(n1331) );
  nor2_x1 U1120 ( .A(n1331), .B(n1443), .Y(n1332) );
  xnor2_x1 U1121 ( .A(n1332), .B(n365), .Y(n1333) );
  oai2bb2_x1 U1122 ( .B0(n65), .B1(n1334), .A0N(n1454), .A1N(n1333), .Y(N104)
         );
  inv_x1 U1123 ( .A(n1335), .Y(n1336) );
  nor2_x1 U1124 ( .A(n1336), .B(n1443), .Y(n1337) );
  xnor2_x1 U1125 ( .A(n1337), .B(n103), .Y(n1338) );
  oai2bb2_x1 U1126 ( .B0(n65), .B1(n1339), .A0N(n1454), .A1N(n1338), .Y(N88)
         );
  inv_x1 U1127 ( .A(n1340), .Y(n1341) );
  nor2_x1 U1128 ( .A(n1341), .B(n1443), .Y(n1342) );
  xnor2_x1 U1129 ( .A(n1342), .B(n266), .Y(n1343) );
  oai2bb2_x1 U1130 ( .B0(n65), .B1(n1344), .A0N(n1454), .A1N(n1343), .Y(N98)
         );
  inv_x1 U1131 ( .A(n1345), .Y(n1346) );
  nor2_x1 U1132 ( .A(n1346), .B(n1443), .Y(n1348) );
  inv_x1 U1133 ( .A(segment_last_timestamp_us[16]), .Y(n1347) );
  xnor2_x1 U1134 ( .A(n1348), .B(n1347), .Y(n1349) );
  oai2bb2_x1 U1135 ( .B0(n65), .B1(n1350), .A0N(n1454), .A1N(n1349), .Y(N90)
         );
  inv_x1 U1136 ( .A(n1351), .Y(n1352) );
  nor2_x1 U1137 ( .A(n1352), .B(n1443), .Y(n1353) );
  xnor2_x1 U1138 ( .A(n1353), .B(n479), .Y(n1354) );
  oai2bb2_x1 U1139 ( .B0(n65), .B1(n1355), .A0N(n1454), .A1N(n1354), .Y(N110)
         );
  inv_x1 U1140 ( .A(n1356), .Y(n1357) );
  nor2_x1 U1141 ( .A(n1357), .B(n1443), .Y(n1358) );
  xnor2_x1 U1142 ( .A(n1358), .B(n126), .Y(n1359) );
  oai2bb2_x1 U1143 ( .B0(n65), .B1(n1360), .A0N(n1454), .A1N(n1359), .Y(N92)
         );
  inv_x1 U1144 ( .A(n1361), .Y(n1362) );
  nor2_x1 U1145 ( .A(n1362), .B(n1443), .Y(n1363) );
  xnor2_x1 U1146 ( .A(n1363), .B(n68), .Y(n1364) );
  oai2bb2_x1 U1147 ( .B0(n65), .B1(n1365), .A0N(n1454), .A1N(n1364), .Y(N94)
         );
  inv_x1 U1148 ( .A(n1366), .Y(n1367) );
  nor2_x1 U1149 ( .A(n1367), .B(n1443), .Y(n1368) );
  xnor2_x1 U1150 ( .A(n1368), .B(n88), .Y(n1369) );
  oai2bb2_x1 U1151 ( .B0(n65), .B1(n1370), .A0N(n1454), .A1N(n1369), .Y(N86)
         );
  inv_x1 U1152 ( .A(n1371), .Y(n1372) );
  nor2_x1 U1153 ( .A(n1372), .B(n1443), .Y(n1373) );
  xnor2_x1 U1154 ( .A(n1373), .B(n438), .Y(n1374) );
  oai2bb2_x1 U1155 ( .B0(n65), .B1(n1375), .A0N(n1454), .A1N(n1374), .Y(N108)
         );
  inv_x1 U1156 ( .A(n1376), .Y(n1377) );
  nor2_x1 U1157 ( .A(n1377), .B(n1443), .Y(n1378) );
  xnor2_x1 U1158 ( .A(n1378), .B(n299), .Y(n1379) );
  oai2bb2_x1 U1159 ( .B0(n65), .B1(n1380), .A0N(n1454), .A1N(n1379), .Y(N100)
         );
  inv_x1 U1160 ( .A(n1381), .Y(n1382) );
  nor2_x1 U1161 ( .A(n1382), .B(n1443), .Y(n1383) );
  xnor2_x1 U1162 ( .A(n1383), .B(n70), .Y(n1384) );
  oai2bb2_x1 U1163 ( .B0(n65), .B1(n1385), .A0N(n1454), .A1N(n1384), .Y(N84)
         );
  nor2_x1 U1164 ( .A(n1386), .B(n1443), .Y(n1388) );
  xnor2_x1 U1165 ( .A(n1388), .B(n1387), .Y(n1389) );
  oai2bb2_x1 U1166 ( .B0(n65), .B1(n1390), .A0N(n1454), .A1N(n1389), .Y(N85)
         );
  nor2_x1 U1167 ( .A(n1391), .B(n1443), .Y(n1392) );
  xnor2_x1 U1168 ( .A(n1392), .B(n110), .Y(n1393) );
  oai2bb2_x1 U1169 ( .B0(n65), .B1(n1394), .A0N(n1454), .A1N(n1393), .Y(N87)
         );
  nor2_x1 U1170 ( .A(n1395), .B(n1443), .Y(n1396) );
  xnor2_x1 U1171 ( .A(n1396), .B(n250), .Y(n1397) );
  oai2bb2_x1 U1172 ( .B0(n65), .B1(n1398), .A0N(n1454), .A1N(n1397), .Y(N97)
         );
  nor2_x1 U1173 ( .A(n1399), .B(n1443), .Y(n1400) );
  xnor2_x1 U1174 ( .A(n1400), .B(n421), .Y(n1401) );
  oai2bb2_x1 U1175 ( .B0(n65), .B1(n1402), .A0N(n1454), .A1N(n1401), .Y(N107)
         );
  nor2_x1 U1176 ( .A(n1403), .B(n1443), .Y(n1404) );
  xnor2_x1 U1177 ( .A(n1404), .B(n955), .Y(n1405) );
  oai2bb2_x1 U1178 ( .B0(n65), .B1(n1406), .A0N(n1454), .A1N(n1405), .Y(N103)
         );
  nor2_x1 U1179 ( .A(n1407), .B(n1443), .Y(n1408) );
  xnor2_x1 U1180 ( .A(n1408), .B(n281), .Y(n1409) );
  oai2bb2_x1 U1181 ( .B0(n65), .B1(n1410), .A0N(n1454), .A1N(n1409), .Y(N99)
         );
  nor2_x1 U1182 ( .A(n1411), .B(n1443), .Y(n1412) );
  xnor2_x1 U1183 ( .A(n1412), .B(n385), .Y(n1413) );
  oai2bb2_x1 U1184 ( .B0(n65), .B1(n1414), .A0N(n1454), .A1N(n1413), .Y(N105)
         );
  nor2_x1 U1185 ( .A(n1415), .B(n1443), .Y(n1416) );
  xnor2_x1 U1186 ( .A(n1416), .B(n459), .Y(n1417) );
  oai2bb2_x1 U1187 ( .B0(n65), .B1(n1418), .A0N(n1454), .A1N(n1417), .Y(N109)
         );
  nor2_x1 U1188 ( .A(n1419), .B(n1443), .Y(n1420) );
  xnor2_x1 U1189 ( .A(n1420), .B(n83), .Y(n1421) );
  oai2bb2_x1 U1190 ( .B0(n65), .B1(n1422), .A0N(n1454), .A1N(n1421), .Y(N83)
         );
  nor2_x1 U1191 ( .A(n1423), .B(n1443), .Y(n1424) );
  xnor2_x1 U1192 ( .A(n1424), .B(n233), .Y(n1425) );
  oai2bb2_x1 U1193 ( .B0(n65), .B1(n1426), .A0N(n1454), .A1N(n1425), .Y(N95)
         );
  nor2_x1 U1194 ( .A(n1427), .B(n1443), .Y(n1428) );
  xnor2_x1 U1195 ( .A(n1428), .B(n99), .Y(n1429) );
  oai2bb2_x1 U1196 ( .B0(n65), .B1(n1430), .A0N(n1454), .A1N(n1429), .Y(N89)
         );
  nor2_x1 U1197 ( .A(n1431), .B(n1443), .Y(n1432) );
  xnor2_x1 U1198 ( .A(n1432), .B(n122), .Y(n1433) );
  oai2bb2_x1 U1199 ( .B0(n65), .B1(n1434), .A0N(n1454), .A1N(n1433), .Y(N93)
         );
  nor2_x1 U1200 ( .A(n1435), .B(n1443), .Y(n1436) );
  xnor2_x1 U1201 ( .A(n1436), .B(n130), .Y(n1437) );
  oai2bb2_x1 U1202 ( .B0(n65), .B1(n1438), .A0N(n1454), .A1N(n1437), .Y(N91)
         );
  nor2_x1 U1203 ( .A(n1439), .B(n1443), .Y(n1440) );
  xnor2_x1 U1204 ( .A(n1440), .B(n316), .Y(n1441) );
  oai2bb2_x1 U1205 ( .B0(n65), .B1(n1442), .A0N(n1454), .A1N(n1441), .Y(N101)
         );
  xor2_x1 U1206 ( .A(n1443), .B(n913), .Y(n1444) );
  oai2bb2_x1 U1207 ( .B0(n65), .B1(n1445), .A0N(n1454), .A1N(n1444), .Y(N81)
         );
  addh_x1 U1208 ( .A(n1446), .B(segment_last_timestamp_us[42]), .CO(n1449), 
        .S(n1312) );
  oai2bb2_x1 U1209 ( .B0(n65), .B1(n1448), .A0N(n1454), .A1N(n1447), .Y(N117)
         );
  addh_x1 U1210 ( .A(n1449), .B(segment_last_timestamp_us[43]), .CO(n1450), 
        .S(n1447) );
  xor2_x1 U1211 ( .A(n1450), .B(segment_last_timestamp_us[44]), .Y(n1451) );
  inv_x1 U1212 ( .A(time_us_start_looking_for_new_sim_time[3]), .Y(
        \intadd_1/B[2] ) );
  inv_x1 U1213 ( .A(time_us_start_looking_for_new_sim_time[2]), .Y(
        \intadd_1/A[1] ) );
  inv_x1 U1214 ( .A(time_us_start_looking_for_new_sim_time[1]), .Y(
        \intadd_1/A[0] ) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_event_to_ravens ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net198, net200, net201, net204, n1;
  assign net198 = CLK;
  assign ENCLK = net200;
  assign net201 = EN;

  latchgd_x1 latch ( .G(n1), .D(net201), .Q(net204) );
  and2_x2 main_gate ( .A(net204), .B(net198), .Y(net200) );
  inv_x1 U2 ( .A(net198), .Y(n1) );
endmodule


module dvs_event_to_ravens ( clk, rst_n, fifo_grant, fifo_event, time_us, 
        fifo_req, fifo_rd_en, ravens_pkt );
  input [63:0] fifo_event;
  input [44:0] time_us;
  output [31:0] ravens_pkt;
  input clk, rst_n, fifo_grant;
  output fifo_req, fifo_rd_en;
  wire   new_spike, sent_spike, \next_fsm_state[0] , net210, n4, n5, n49, n50,
         n51;
  wire   [63:0] dvs_event;
  wire   [31:0] ravens_spike;
  wire   [1:0] cur_fsm_state;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45;

  dvs_event_to_ravens_spike DVS_EVENT_TO_RAVENS_SPIKE_INST ( .dvs_event({n51, 
        dvs_event[62:55], n51, n51, dvs_event[52:46], n51, n51, n51, n51, n51, 
        n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, 
        n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, 
        n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51}), 
        .ravens_spike({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, ravens_spike[12:5], SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23}) );
  dvs_ravens_transmitter DVS_RAVENS_TRANSMITTER_INST ( .clk(clk), .rst_n(rst_n), .new_spike(new_spike), .ravens_spike_timestamp_us(dvs_event[44:0]), 
        .ravens_spike({n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, n51, 
        n51, n51, n51, n51, n51, n51, n51, n51, ravens_spike[12:5], n51, n51, 
        n51, n51, n51}), .time_us(time_us), .sent_spike(sent_spike), 
        .rdy_for_next_spike(fifo_req), .ravens_pkt({SYNOPSYS_UNCONNECTED__24, 
        ravens_pkt[30:29], SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29, SYNOPSYS_UNCONNECTED__30, 
        SYNOPSYS_UNCONNECTED__31, SYNOPSYS_UNCONNECTED__32, 
        SYNOPSYS_UNCONNECTED__33, SYNOPSYS_UNCONNECTED__34, 
        SYNOPSYS_UNCONNECTED__35, SYNOPSYS_UNCONNECTED__36, 
        SYNOPSYS_UNCONNECTED__37, SYNOPSYS_UNCONNECTED__38, 
        SYNOPSYS_UNCONNECTED__39, SYNOPSYS_UNCONNECTED__40, ravens_pkt[12:5], 
        SYNOPSYS_UNCONNECTED__41, SYNOPSYS_UNCONNECTED__42, 
        SYNOPSYS_UNCONNECTED__43, SYNOPSYS_UNCONNECTED__44, 
        SYNOPSYS_UNCONNECTED__45}) );
  SNPS_CLOCK_GATE_HIGH_dvs_event_to_ravens clk_gate_dvs_event_reg ( .CLK(clk), 
        .EN(n5), .ENCLK(net210) );
  ffrhq_x1 \dvs_event_reg[2]  ( .D(fifo_event[2]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[2]) );
  ffrhq_x1 \dvs_event_reg[1]  ( .D(fifo_event[1]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[1]) );
  ffrhq_x1 \dvs_event_reg[0]  ( .D(fifo_event[0]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[0]) );
  ffr_x1 \dvs_event_reg[51]  ( .D(fifo_event[51]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[51]) );
  ffr_x1 \dvs_event_reg[5]  ( .D(fifo_event[5]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[5]) );
  ffr_x1 \cur_fsm_state_reg[1]  ( .D(fifo_rd_en), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[1]) );
  ffr_x1 \dvs_event_reg[62]  ( .D(fifo_event[62]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[62]) );
  ffr_x1 \dvs_event_reg[61]  ( .D(fifo_event[61]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[61]) );
  ffr_x1 \dvs_event_reg[60]  ( .D(fifo_event[60]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[60]) );
  ffr_x1 \dvs_event_reg[59]  ( .D(fifo_event[59]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[59]) );
  ffr_x1 \dvs_event_reg[58]  ( .D(fifo_event[58]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[58]) );
  ffr_x1 \dvs_event_reg[57]  ( .D(fifo_event[57]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[57]) );
  ffr_x1 \dvs_event_reg[56]  ( .D(fifo_event[56]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[56]) );
  ffr_x1 \dvs_event_reg[55]  ( .D(fifo_event[55]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[55]) );
  ffr_x1 \dvs_event_reg[52]  ( .D(fifo_event[52]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[52]) );
  ffr_x1 \dvs_event_reg[50]  ( .D(fifo_event[50]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[50]) );
  ffr_x1 \dvs_event_reg[49]  ( .D(fifo_event[49]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[49]) );
  ffr_x1 \dvs_event_reg[48]  ( .D(fifo_event[48]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[48]) );
  ffr_x1 \dvs_event_reg[47]  ( .D(fifo_event[47]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[47]) );
  ffr_x1 \dvs_event_reg[46]  ( .D(fifo_event[46]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[46]) );
  ffr_x1 \dvs_event_reg[44]  ( .D(fifo_event[44]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[44]) );
  ffr_x1 \dvs_event_reg[43]  ( .D(fifo_event[43]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[43]) );
  ffr_x1 \dvs_event_reg[42]  ( .D(fifo_event[42]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[42]) );
  ffr_x1 \dvs_event_reg[41]  ( .D(fifo_event[41]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[41]) );
  ffr_x1 \dvs_event_reg[40]  ( .D(fifo_event[40]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[40]) );
  ffr_x1 \dvs_event_reg[18]  ( .D(fifo_event[18]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[18]) );
  ffr_x1 \dvs_event_reg[17]  ( .D(fifo_event[17]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[17]) );
  ffr_x1 \dvs_event_reg[16]  ( .D(fifo_event[16]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[16]) );
  ffr_x1 \dvs_event_reg[13]  ( .D(fifo_event[13]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[13]) );
  ffr_x1 \dvs_event_reg[12]  ( .D(fifo_event[12]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[12]) );
  ffr_x1 \dvs_event_reg[11]  ( .D(fifo_event[11]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[11]) );
  ffr_x1 \dvs_event_reg[9]  ( .D(fifo_event[9]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[9]) );
  ffr_x1 \dvs_event_reg[8]  ( .D(fifo_event[8]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[8]) );
  ffr_x1 \dvs_event_reg[7]  ( .D(fifo_event[7]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[7]) );
  ffr_x1 \dvs_event_reg[6]  ( .D(fifo_event[6]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[6]) );
  ffr_x1 \dvs_event_reg[4]  ( .D(fifo_event[4]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[4]) );
  ffr_x1 \dvs_event_reg[3]  ( .D(fifo_event[3]), .CLK(net210), .RSTN(rst_n), 
        .Q(dvs_event[3]) );
  ffr_x1 new_spike_reg ( .D(n4), .CLK(clk), .RSTN(rst_n), .Q(new_spike) );
  ffrhq_x1 \dvs_event_reg[10]  ( .D(fifo_event[10]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[10]) );
  ffrhq_x1 \dvs_event_reg[14]  ( .D(fifo_event[14]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[14]) );
  ffrhq_x1 \dvs_event_reg[15]  ( .D(fifo_event[15]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[15]) );
  ffrhq_x1 \dvs_event_reg[19]  ( .D(fifo_event[19]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[19]) );
  ffrhq_x1 \dvs_event_reg[20]  ( .D(fifo_event[20]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[20]) );
  ffrhq_x1 \dvs_event_reg[21]  ( .D(fifo_event[21]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[21]) );
  ffrhq_x1 \dvs_event_reg[22]  ( .D(fifo_event[22]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[22]) );
  ffrhq_x1 \dvs_event_reg[23]  ( .D(fifo_event[23]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[23]) );
  ffrhq_x1 \dvs_event_reg[24]  ( .D(fifo_event[24]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[24]) );
  ffrhq_x1 \dvs_event_reg[25]  ( .D(fifo_event[25]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[25]) );
  ffrhq_x1 \dvs_event_reg[26]  ( .D(fifo_event[26]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[26]) );
  ffrhq_x1 \dvs_event_reg[27]  ( .D(fifo_event[27]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[27]) );
  ffrhq_x1 \dvs_event_reg[28]  ( .D(fifo_event[28]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[28]) );
  ffrhq_x1 \dvs_event_reg[29]  ( .D(fifo_event[29]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[29]) );
  ffrhq_x1 \dvs_event_reg[30]  ( .D(fifo_event[30]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[30]) );
  ffrhq_x1 \dvs_event_reg[31]  ( .D(fifo_event[31]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[31]) );
  ffrhq_x1 \dvs_event_reg[32]  ( .D(fifo_event[32]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[32]) );
  ffrhq_x1 \dvs_event_reg[33]  ( .D(fifo_event[33]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[33]) );
  ffrhq_x1 \dvs_event_reg[34]  ( .D(fifo_event[34]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[34]) );
  ffrhq_x1 \dvs_event_reg[35]  ( .D(fifo_event[35]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[35]) );
  ffrhq_x1 \dvs_event_reg[36]  ( .D(fifo_event[36]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[36]) );
  ffrhq_x1 \dvs_event_reg[37]  ( .D(fifo_event[37]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[37]) );
  ffrhq_x1 \dvs_event_reg[38]  ( .D(fifo_event[38]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[38]) );
  ffrhq_x1 \dvs_event_reg[39]  ( .D(fifo_event[39]), .CLK(net210), .RSTN(rst_n), .Q(dvs_event[39]) );
  ffrhq_x1 \cur_fsm_state_reg[0]  ( .D(\next_fsm_state[0] ), .CLK(clk), .RSTN(
        rst_n), .Q(cur_fsm_state[0]) );
  tielo U3 ( .L(n51) );
  inv_x1 U4 ( .A(cur_fsm_state[1]), .Y(n50) );
  and2_x1 U5 ( .A(cur_fsm_state[0]), .B(n50), .Y(fifo_rd_en) );
  nor3b_x1 U6 ( .AN(fifo_grant), .B(cur_fsm_state[0]), .C(cur_fsm_state[1]), 
        .Y(\next_fsm_state[0] ) );
  nor2_x1 U7 ( .A(cur_fsm_state[0]), .B(n50), .Y(n5) );
  inv_x1 U8 ( .A(new_spike), .Y(n49) );
  oai22_x1 U9 ( .A0(cur_fsm_state[0]), .A1(n50), .B0(sent_spike), .B1(n49), 
        .Y(n4) );
endmodule


module dvs_ravens ( clk, rst_n, aer, xsel, req, ack, ravens_pkt );
  input [9:0] aer;
  output [31:0] ravens_pkt;
  input clk, rst_n, xsel, req;
  output ack;
  wire   fifo_grant_write, fifo_req_write, fifo_wr_en, fifo_req_read,
         fifo_empty, fifo_full, fifo_grant_read, fifo_rd_en, net307, net59052;
  wire   [44:0] time_us;
  wire   [63:0] fifo_write_event;
  wire   [63:0] fifo_read_event;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25;
  assign ravens_pkt[31] = net307;
  assign ravens_pkt[28] = net307;
  assign ravens_pkt[27] = net307;
  assign ravens_pkt[26] = net307;
  assign ravens_pkt[25] = net307;
  assign ravens_pkt[24] = net307;
  assign ravens_pkt[23] = net307;
  assign ravens_pkt[22] = net307;
  assign ravens_pkt[21] = net307;
  assign ravens_pkt[20] = net307;
  assign ravens_pkt[19] = net307;
  assign ravens_pkt[18] = net307;
  assign ravens_pkt[17] = net307;
  assign ravens_pkt[16] = net307;
  assign ravens_pkt[15] = net307;
  assign ravens_pkt[14] = net307;
  assign ravens_pkt[13] = net307;
  assign ravens_pkt[4] = net307;
  assign ravens_pkt[3] = net307;
  assign ravens_pkt[2] = net307;
  assign ravens_pkt[1] = net307;
  assign ravens_pkt[0] = net307;

  dvs_aer_to_event_interface DVS_AER_TO_EVENT_INTERFACE_INST ( .clk(clk), 
        .rst_n(rst_n), .aer(aer), .xsel(xsel), .req(req), .fifo_grant(
        fifo_grant_write), .time_us(time_us), .ack(ack), .fifo_req(
        fifo_req_write), .fifo_wr_en(fifo_wr_en), .fifo_event(fifo_write_event) );
  timer_us TIMER_US_INST ( .clk(clk), .rst_n(rst_n), .time_us(time_us) );
  dvs_ravens_arbiter DVS_RAVENS_ARBITER_INST ( .req_m1(fifo_req_write), 
        .req_m2(fifo_req_read), .fifo_empty(fifo_empty), .fifo_full(fifo_full), 
        .grant_m1(fifo_grant_write), .grant_m2(fifo_grant_read) );
  dvs_fifo_event_queue DVS_FIFO_EVENT_QUEUE_INST ( .clk(clk), .rst_n(rst_n), 
        .event_in(fifo_write_event), .wr_en(fifo_wr_en), .rd_en(fifo_rd_en), 
        .event_out({SYNOPSYS_UNCONNECTED__0, fifo_read_event[62:55], 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        fifo_read_event[52:46], SYNOPSYS_UNCONNECTED__3, fifo_read_event[44:0]}), .empty(fifo_empty), .full(fifo_full) );
  dvs_event_to_ravens DVS_EVENT_TO_RAVENS_INST ( .clk(clk), .rst_n(rst_n), 
        .fifo_grant(fifo_grant_read), .fifo_event({net307, 
        fifo_read_event[62:55], net307, net59052, fifo_read_event[52:46], 
        net307, fifo_read_event[44:0]}), .time_us(time_us), .fifo_req(
        fifo_req_read), .fifo_rd_en(fifo_rd_en), .ravens_pkt({
        SYNOPSYS_UNCONNECTED__4, ravens_pkt[30:29], SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, ravens_pkt[12:5], SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25}) );
  tielo U2 ( .L(net307) );
endmodule


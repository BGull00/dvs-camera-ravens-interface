/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Mon May  6 23:10:54 2024
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
  wire   net274, net276, net277, net280, n1;
  assign net274 = CLK;
  assign ENCLK = net276;
  assign net277 = EN;

  latchgd_x1 latch ( .G(n1), .D(net277), .Q(net280) );
  and2_x2 main_gate ( .A(net280), .B(net274), .Y(net276) );
  inv_x1 U2 ( .A(net274), .Y(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net274, net276, net277, net280, n2;
  assign net274 = CLK;
  assign ENCLK = net276;
  assign net277 = EN;

  latchgd_x1 latch ( .G(n2), .D(net277), .Q(net280) );
  and2_x2 main_gate ( .A(net280), .B(net274), .Y(net276) );
  inv_x1 U2 ( .A(net274), .Y(n2) );
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
  wire   xsel_mid_sync, req_mid_sync, xsel_synced, req_synced, N9, N10, net286,
         net291, n7, n8, n1, n2, n3, n4, n5, n6;
  wire   [9:0] aer_mid_sync;
  wire   [9:0] aer_synced;
  wire   [1:0] cur_fsm_state;
  wire   [8:0] y_addr;
  wire   [44:0] timestamp_us;
  assign ack = cur_fsm_state[1];

  SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_0 clk_gate_y_addr_reg ( .CLK(clk), 
        .EN(N10), .ENCLK(net286) );
  SNPS_CLOCK_GATE_HIGH_dvs_aer_receiver_1 clk_gate_event_x_reg ( .CLK(clk), 
        .EN(N9), .ENCLK(net291) );
  ffr_x1 xsel_mid_sync_reg ( .D(xsel), .CLK(clk), .RSTN(rst_n), .Q(
        xsel_mid_sync) );
  ffr_x1 \cur_fsm_state_reg[1]  ( .D(n7), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[1]) );
  ffr_x1 \timestamp_us_reg[40]  ( .D(time_us[40]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[40]) );
  ffr_x1 \timestamp_us_reg[25]  ( .D(time_us[25]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[25]) );
  ffr_x1 \timestamp_us_reg[10]  ( .D(time_us[10]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[10]) );
  ffr_x1 \event_x_reg[4]  ( .D(aer_synced[5]), .CLK(net291), .RSTN(rst_n), .Q(
        event_x[4]) );
  ffr_x1 \event_timestamp_reg[43]  ( .D(timestamp_us[43]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[43]) );
  ffr_x1 \event_timestamp_reg[28]  ( .D(timestamp_us[28]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[28]) );
  ffr_x1 \event_timestamp_reg[13]  ( .D(timestamp_us[13]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[13]) );
  ffr_x1 event_polarity_reg ( .D(aer_synced[0]), .CLK(net291), .RSTN(rst_n), 
        .Q(event_polarity) );
  ffr_x1 \cur_fsm_state_reg[0]  ( .D(n8), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[0]) );
  ffr_x1 new_event_reg ( .D(N9), .CLK(clk), .RSTN(rst_n), .Q(new_event) );
  ffr_x1 \y_addr_reg[8]  ( .D(aer_synced[8]), .CLK(net286), .RSTN(rst_n), .Q(
        y_addr[8]) );
  ffr_x1 \y_addr_reg[7]  ( .D(aer_synced[7]), .CLK(net286), .RSTN(rst_n), .Q(
        y_addr[7]) );
  ffr_x1 \y_addr_reg[6]  ( .D(aer_synced[6]), .CLK(net286), .RSTN(rst_n), .Q(
        y_addr[6]) );
  ffr_x1 \y_addr_reg[5]  ( .D(aer_synced[5]), .CLK(net286), .RSTN(rst_n), .Q(
        y_addr[5]) );
  ffr_x1 \y_addr_reg[4]  ( .D(aer_synced[4]), .CLK(net286), .RSTN(rst_n), .Q(
        y_addr[4]) );
  ffr_x1 \y_addr_reg[3]  ( .D(aer_synced[3]), .CLK(net286), .RSTN(rst_n), .Q(
        y_addr[3]) );
  ffr_x1 \y_addr_reg[2]  ( .D(aer_synced[2]), .CLK(net286), .RSTN(rst_n), .Q(
        y_addr[2]) );
  ffr_x1 \y_addr_reg[1]  ( .D(aer_synced[1]), .CLK(net286), .RSTN(rst_n), .Q(
        y_addr[1]) );
  ffr_x1 \y_addr_reg[0]  ( .D(aer_synced[0]), .CLK(net286), .RSTN(rst_n), .Q(
        y_addr[0]) );
  ffr_x1 \timestamp_us_reg[44]  ( .D(time_us[44]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[44]) );
  ffr_x1 \timestamp_us_reg[43]  ( .D(time_us[43]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[43]) );
  ffr_x1 \timestamp_us_reg[42]  ( .D(time_us[42]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[42]) );
  ffr_x1 \timestamp_us_reg[41]  ( .D(time_us[41]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[41]) );
  ffr_x1 \timestamp_us_reg[39]  ( .D(time_us[39]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[39]) );
  ffr_x1 \timestamp_us_reg[38]  ( .D(time_us[38]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[38]) );
  ffr_x1 \timestamp_us_reg[37]  ( .D(time_us[37]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[37]) );
  ffr_x1 \timestamp_us_reg[36]  ( .D(time_us[36]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[36]) );
  ffr_x1 \timestamp_us_reg[35]  ( .D(time_us[35]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[35]) );
  ffr_x1 \timestamp_us_reg[34]  ( .D(time_us[34]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[34]) );
  ffr_x1 \timestamp_us_reg[33]  ( .D(time_us[33]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[33]) );
  ffr_x1 \timestamp_us_reg[32]  ( .D(time_us[32]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[32]) );
  ffr_x1 \timestamp_us_reg[31]  ( .D(time_us[31]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[31]) );
  ffr_x1 \timestamp_us_reg[30]  ( .D(time_us[30]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[30]) );
  ffr_x1 \timestamp_us_reg[29]  ( .D(time_us[29]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[29]) );
  ffr_x1 \timestamp_us_reg[28]  ( .D(time_us[28]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[28]) );
  ffr_x1 \timestamp_us_reg[27]  ( .D(time_us[27]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[27]) );
  ffr_x1 \timestamp_us_reg[26]  ( .D(time_us[26]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[26]) );
  ffr_x1 \timestamp_us_reg[24]  ( .D(time_us[24]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[24]) );
  ffr_x1 \timestamp_us_reg[23]  ( .D(time_us[23]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[23]) );
  ffr_x1 \timestamp_us_reg[22]  ( .D(time_us[22]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[22]) );
  ffr_x1 \timestamp_us_reg[21]  ( .D(time_us[21]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[21]) );
  ffr_x1 \timestamp_us_reg[20]  ( .D(time_us[20]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[20]) );
  ffr_x1 \timestamp_us_reg[19]  ( .D(time_us[19]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[19]) );
  ffr_x1 \timestamp_us_reg[18]  ( .D(time_us[18]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[18]) );
  ffr_x1 \timestamp_us_reg[17]  ( .D(time_us[17]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[17]) );
  ffr_x1 \timestamp_us_reg[16]  ( .D(time_us[16]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[16]) );
  ffr_x1 \timestamp_us_reg[15]  ( .D(time_us[15]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[15]) );
  ffr_x1 \timestamp_us_reg[14]  ( .D(time_us[14]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[14]) );
  ffr_x1 \timestamp_us_reg[13]  ( .D(time_us[13]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[13]) );
  ffr_x1 \timestamp_us_reg[12]  ( .D(time_us[12]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[12]) );
  ffr_x1 \timestamp_us_reg[11]  ( .D(time_us[11]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[11]) );
  ffr_x1 \timestamp_us_reg[9]  ( .D(time_us[9]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[9]) );
  ffr_x1 \timestamp_us_reg[8]  ( .D(time_us[8]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[8]) );
  ffr_x1 \timestamp_us_reg[7]  ( .D(time_us[7]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[7]) );
  ffr_x1 \timestamp_us_reg[6]  ( .D(time_us[6]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[6]) );
  ffr_x1 \timestamp_us_reg[5]  ( .D(time_us[5]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[5]) );
  ffr_x1 \timestamp_us_reg[4]  ( .D(time_us[4]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[4]) );
  ffr_x1 \timestamp_us_reg[3]  ( .D(time_us[3]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[3]) );
  ffr_x1 \timestamp_us_reg[2]  ( .D(time_us[2]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[2]) );
  ffr_x1 \timestamp_us_reg[1]  ( .D(time_us[1]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[1]) );
  ffr_x1 \timestamp_us_reg[0]  ( .D(time_us[0]), .CLK(net286), .RSTN(rst_n), 
        .Q(timestamp_us[0]) );
  ffr_x1 \event_x_reg[8]  ( .D(aer_synced[9]), .CLK(net291), .RSTN(rst_n), .Q(
        event_x[8]) );
  ffr_x1 \event_x_reg[7]  ( .D(aer_synced[8]), .CLK(net291), .RSTN(rst_n), .Q(
        event_x[7]) );
  ffr_x1 \event_x_reg[6]  ( .D(aer_synced[7]), .CLK(net291), .RSTN(rst_n), .Q(
        event_x[6]) );
  ffr_x1 \event_x_reg[5]  ( .D(aer_synced[6]), .CLK(net291), .RSTN(rst_n), .Q(
        event_x[5]) );
  ffr_x1 \event_x_reg[3]  ( .D(aer_synced[4]), .CLK(net291), .RSTN(rst_n), .Q(
        event_x[3]) );
  ffr_x1 \event_x_reg[2]  ( .D(aer_synced[3]), .CLK(net291), .RSTN(rst_n), .Q(
        event_x[2]) );
  ffr_x1 \event_x_reg[1]  ( .D(aer_synced[2]), .CLK(net291), .RSTN(rst_n), .Q(
        event_x[1]) );
  ffr_x1 \event_x_reg[0]  ( .D(aer_synced[1]), .CLK(net291), .RSTN(rst_n), .Q(
        event_x[0]) );
  ffr_x1 \event_y_reg[8]  ( .D(y_addr[8]), .CLK(net291), .RSTN(rst_n), .Q(
        event_y[8]) );
  ffr_x1 \event_y_reg[7]  ( .D(y_addr[7]), .CLK(net291), .RSTN(rst_n), .Q(
        event_y[7]) );
  ffr_x1 \event_y_reg[6]  ( .D(y_addr[6]), .CLK(net291), .RSTN(rst_n), .Q(
        event_y[6]) );
  ffr_x1 \event_y_reg[5]  ( .D(y_addr[5]), .CLK(net291), .RSTN(rst_n), .Q(
        event_y[5]) );
  ffr_x1 \event_y_reg[4]  ( .D(y_addr[4]), .CLK(net291), .RSTN(rst_n), .Q(
        event_y[4]) );
  ffr_x1 \event_y_reg[3]  ( .D(y_addr[3]), .CLK(net291), .RSTN(rst_n), .Q(
        event_y[3]) );
  ffr_x1 \event_y_reg[2]  ( .D(y_addr[2]), .CLK(net291), .RSTN(rst_n), .Q(
        event_y[2]) );
  ffr_x1 \event_y_reg[1]  ( .D(y_addr[1]), .CLK(net291), .RSTN(rst_n), .Q(
        event_y[1]) );
  ffr_x1 \event_y_reg[0]  ( .D(y_addr[0]), .CLK(net291), .RSTN(rst_n), .Q(
        event_y[0]) );
  ffr_x1 \event_timestamp_reg[44]  ( .D(timestamp_us[44]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[44]) );
  ffr_x1 \event_timestamp_reg[42]  ( .D(timestamp_us[42]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[42]) );
  ffr_x1 \event_timestamp_reg[41]  ( .D(timestamp_us[41]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[41]) );
  ffr_x1 \event_timestamp_reg[40]  ( .D(timestamp_us[40]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[40]) );
  ffr_x1 \event_timestamp_reg[39]  ( .D(timestamp_us[39]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[39]) );
  ffr_x1 \event_timestamp_reg[38]  ( .D(timestamp_us[38]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[38]) );
  ffr_x1 \event_timestamp_reg[37]  ( .D(timestamp_us[37]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[37]) );
  ffr_x1 \event_timestamp_reg[36]  ( .D(timestamp_us[36]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[36]) );
  ffr_x1 \event_timestamp_reg[35]  ( .D(timestamp_us[35]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[35]) );
  ffr_x1 \event_timestamp_reg[34]  ( .D(timestamp_us[34]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[34]) );
  ffr_x1 \event_timestamp_reg[33]  ( .D(timestamp_us[33]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[33]) );
  ffr_x1 \event_timestamp_reg[32]  ( .D(timestamp_us[32]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[32]) );
  ffr_x1 \event_timestamp_reg[31]  ( .D(timestamp_us[31]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[31]) );
  ffr_x1 \event_timestamp_reg[30]  ( .D(timestamp_us[30]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[30]) );
  ffr_x1 \event_timestamp_reg[29]  ( .D(timestamp_us[29]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[29]) );
  ffr_x1 \event_timestamp_reg[27]  ( .D(timestamp_us[27]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[27]) );
  ffr_x1 \event_timestamp_reg[26]  ( .D(timestamp_us[26]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[26]) );
  ffr_x1 \event_timestamp_reg[25]  ( .D(timestamp_us[25]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[25]) );
  ffr_x1 \event_timestamp_reg[24]  ( .D(timestamp_us[24]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[24]) );
  ffr_x1 \event_timestamp_reg[23]  ( .D(timestamp_us[23]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[23]) );
  ffr_x1 \event_timestamp_reg[22]  ( .D(timestamp_us[22]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[22]) );
  ffr_x1 \event_timestamp_reg[21]  ( .D(timestamp_us[21]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[21]) );
  ffr_x1 \event_timestamp_reg[20]  ( .D(timestamp_us[20]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[20]) );
  ffr_x1 \event_timestamp_reg[19]  ( .D(timestamp_us[19]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[19]) );
  ffr_x1 \event_timestamp_reg[18]  ( .D(timestamp_us[18]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[18]) );
  ffr_x1 \event_timestamp_reg[17]  ( .D(timestamp_us[17]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[17]) );
  ffr_x1 \event_timestamp_reg[16]  ( .D(timestamp_us[16]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[16]) );
  ffr_x1 \event_timestamp_reg[15]  ( .D(timestamp_us[15]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[15]) );
  ffr_x1 \event_timestamp_reg[14]  ( .D(timestamp_us[14]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[14]) );
  ffr_x1 \event_timestamp_reg[12]  ( .D(timestamp_us[12]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[12]) );
  ffr_x1 \event_timestamp_reg[11]  ( .D(timestamp_us[11]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[11]) );
  ffr_x1 \event_timestamp_reg[10]  ( .D(timestamp_us[10]), .CLK(net291), 
        .RSTN(rst_n), .Q(event_timestamp[10]) );
  ffr_x1 \event_timestamp_reg[9]  ( .D(timestamp_us[9]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[9]) );
  ffr_x1 \event_timestamp_reg[8]  ( .D(timestamp_us[8]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[8]) );
  ffr_x1 \event_timestamp_reg[7]  ( .D(timestamp_us[7]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[7]) );
  ffr_x1 \event_timestamp_reg[6]  ( .D(timestamp_us[6]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[6]) );
  ffr_x1 \event_timestamp_reg[5]  ( .D(timestamp_us[5]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[5]) );
  ffr_x1 \event_timestamp_reg[4]  ( .D(timestamp_us[4]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[4]) );
  ffr_x1 \event_timestamp_reg[3]  ( .D(timestamp_us[3]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[3]) );
  ffr_x1 \event_timestamp_reg[2]  ( .D(timestamp_us[2]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[2]) );
  ffr_x1 \event_timestamp_reg[1]  ( .D(timestamp_us[1]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[1]) );
  ffr_x1 \event_timestamp_reg[0]  ( .D(timestamp_us[0]), .CLK(net291), .RSTN(
        rst_n), .Q(event_timestamp[0]) );
  ffr_x1 xsel_synced_reg ( .D(xsel_mid_sync), .CLK(clk), .RSTN(rst_n), .Q(
        xsel_synced) );
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
  ffr_x1 \aer_mid_sync_reg[1]  ( .D(aer[1]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[1]) );
  ffr_x1 \aer_mid_sync_reg[0]  ( .D(aer[0]), .CLK(clk), .RSTN(rst_n), .Q(
        aer_mid_sync[0]) );
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
  or2_x1 U3 ( .A(n1), .B(cur_fsm_state[1]), .Y(n2) );
  nand2_x1 U4 ( .A(req_synced), .B(n4), .Y(n6) );
  aoi21_x1 U5 ( .A0(req_synced), .A1(xsel_synced), .B0(cur_fsm_state[0]), .Y(
        n1) );
  inv_x1 U6 ( .A(cur_fsm_state[0]), .Y(n4) );
  oai21_x1 U7 ( .A0(req_synced), .A1(n4), .B0(cur_fsm_state[1]), .Y(n5) );
  nand2_x1 U8 ( .A(n2), .B(n5), .Y(n7) );
  oai21_x1 U9 ( .A0(cur_fsm_state[0]), .A1(req_synced), .B0(xsel_synced), .Y(
        n3) );
  nor2_x1 U10 ( .A(cur_fsm_state[1]), .B(n3), .Y(N9) );
  nor3_x1 U11 ( .A(xsel_synced), .B(cur_fsm_state[1]), .C(n4), .Y(N10) );
  oai21_x1 U12 ( .A0(xsel_synced), .A1(n6), .B0(n5), .Y(n8) );
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
  and2_x1 U6 ( .A(event_x[6]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[61]) );
  and2_x1 U7 ( .A(event_y[7]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[53]) );
  and2_x1 U8 ( .A(event_x[4]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[59]) );
  and2_x1 U9 ( .A(event_x[0]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[55]) );
  and2_x1 U10 ( .A(event_x[3]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[58]) );
  and2_x1 U11 ( .A(event_x[2]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[57]) );
  and2_x1 U12 ( .A(event_x[1]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[56]) );
  and2_x1 U13 ( .A(event_timestamp[0]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[0]) );
  and2_x1 U14 ( .A(event_timestamp[1]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[1]) );
  and2_x1 U15 ( .A(event_timestamp[2]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[2]) );
  and2_x1 U16 ( .A(event_timestamp[3]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[3]) );
  and2_x1 U17 ( .A(event_timestamp[4]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[4]) );
  and2_x1 U18 ( .A(event_timestamp[5]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[5]) );
  and2_x1 U19 ( .A(event_timestamp[6]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[6]) );
  and2_x1 U20 ( .A(event_timestamp[7]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[7]) );
  and2_x1 U21 ( .A(event_timestamp[8]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[8]) );
  and2_x1 U22 ( .A(event_timestamp[18]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[18]) );
  and2_x1 U23 ( .A(event_timestamp[28]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[28]) );
  and2_x1 U24 ( .A(event_timestamp[29]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[29]) );
  and2_x1 U25 ( .A(event_timestamp[30]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[30]) );
  and2_x1 U26 ( .A(event_timestamp[9]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[9]) );
  and2_x1 U27 ( .A(event_timestamp[10]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[10]) );
  and2_x1 U28 ( .A(event_timestamp[11]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[11]) );
  and2_x1 U29 ( .A(event_timestamp[12]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[12]) );
  and2_x1 U30 ( .A(event_timestamp[13]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[13]) );
  and2_x1 U31 ( .A(event_timestamp[14]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[14]) );
  and2_x1 U32 ( .A(event_timestamp[15]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[15]) );
  and2_x1 U33 ( .A(event_timestamp[38]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[38]) );
  and2_x1 U34 ( .A(event_timestamp[16]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[16]) );
  and2_x1 U35 ( .A(event_timestamp[17]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[17]) );
  and2_x1 U36 ( .A(event_timestamp[19]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[19]) );
  and2_x1 U37 ( .A(event_timestamp[20]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[20]) );
  and2_x1 U38 ( .A(event_timestamp[21]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[21]) );
  and2_x1 U39 ( .A(event_timestamp[22]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[22]) );
  and2_x1 U40 ( .A(event_timestamp[23]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[23]) );
  and2_x1 U41 ( .A(event_timestamp[24]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[24]) );
  and2_x1 U42 ( .A(event_timestamp[25]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[25]) );
  and2_x1 U43 ( .A(event_timestamp[26]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[26]) );
  and2_x1 U44 ( .A(event_timestamp[27]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[27]) );
  and2_x1 U45 ( .A(event_timestamp[34]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[34]) );
  and2_x1 U46 ( .A(event_timestamp[44]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[44]) );
  and2_x1 U47 ( .A(event_timestamp[41]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[41]) );
  and2_x1 U48 ( .A(event_timestamp[42]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[42]) );
  and2_x1 U49 ( .A(event_timestamp[43]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[43]) );
  and2_x1 U50 ( .A(event_timestamp[36]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[36]) );
  and2_x1 U51 ( .A(event_timestamp[31]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[31]) );
  and2_x1 U52 ( .A(event_timestamp[32]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[32]) );
  and2_x1 U53 ( .A(event_timestamp[33]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[33]) );
  and2_x1 U54 ( .A(event_timestamp[40]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[40]) );
  and2_x1 U55 ( .A(event_timestamp[35]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[35]) );
  and2_x1 U56 ( .A(event_y[1]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[47]) );
  and2_x1 U57 ( .A(event_timestamp[37]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[37]) );
  and2_x1 U58 ( .A(event_timestamp[39]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[39]) );
  and2_x1 U59 ( .A(event_y[0]), .B(preprocessed_event[45]), .Y(
        preprocessed_event[46]) );
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
  wire   net259, net261, net262, net265, n1;
  assign net259 = CLK;
  assign ENCLK = net261;
  assign net262 = EN;

  latchgd_x1 latch ( .G(n1), .D(net262), .Q(net265) );
  and2_x2 main_gate ( .A(net265), .B(net259), .Y(net261) );
  inv_x1 U2 ( .A(net259), .Y(n1) );
endmodule


module dvs_aer_to_event_interface ( clk, rst_n, aer, xsel, req, fifo_grant, 
        time_us, ack, fifo_req, fifo_wr_en, fifo_event );
  input [9:0] aer;
  input [44:0] time_us;
  output [63:0] fifo_event;
  input clk, rst_n, xsel, req, fifo_grant;
  output ack, fifo_req, fifo_wr_en;
  wire   event_polarity, new_event, event_filtered, n2, net271, n5, n6, n3, n4
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
        .CLK(clk), .EN(fifo_grant), .ENCLK(net271) );
  ffr_x1 \fifo_event_reg[51]  ( .D(dvs_event[51]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[51]) );
  ffr_x1 \fifo_event_reg[36]  ( .D(dvs_event[36]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[36]) );
  ffr_x1 \fifo_event_reg[21]  ( .D(dvs_event[21]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[21]) );
  ffr_x1 \fifo_event_reg[6]  ( .D(dvs_event[6]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[6]) );
  ffr_x1 event_written_reg ( .D(n6), .CLK(clk), .RSTN(rst_n), .Q(n5) );
  ffr_x1 fifo_wr_en_reg ( .D(fifo_grant), .CLK(clk), .RSTN(rst_n), .Q(
        fifo_wr_en) );
  ffr_x1 \fifo_event_reg[63]  ( .D(dvs_event[63]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[63]) );
  ffr_x1 \fifo_event_reg[62]  ( .D(dvs_event[62]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[62]) );
  ffr_x1 \fifo_event_reg[61]  ( .D(dvs_event[61]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[61]) );
  ffr_x1 \fifo_event_reg[60]  ( .D(dvs_event[60]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[60]) );
  ffr_x1 \fifo_event_reg[59]  ( .D(dvs_event[59]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[59]) );
  ffr_x1 \fifo_event_reg[58]  ( .D(dvs_event[58]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[58]) );
  ffr_x1 \fifo_event_reg[57]  ( .D(dvs_event[57]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[57]) );
  ffr_x1 \fifo_event_reg[56]  ( .D(dvs_event[56]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[56]) );
  ffr_x1 \fifo_event_reg[55]  ( .D(dvs_event[55]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[55]) );
  ffr_x1 \fifo_event_reg[54]  ( .D(dvs_event[54]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[54]) );
  ffr_x1 \fifo_event_reg[53]  ( .D(dvs_event[53]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[53]) );
  ffr_x1 \fifo_event_reg[52]  ( .D(dvs_event[52]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[52]) );
  ffr_x1 \fifo_event_reg[50]  ( .D(dvs_event[50]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[50]) );
  ffr_x1 \fifo_event_reg[49]  ( .D(dvs_event[49]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[49]) );
  ffr_x1 \fifo_event_reg[48]  ( .D(dvs_event[48]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[48]) );
  ffr_x1 \fifo_event_reg[47]  ( .D(dvs_event[47]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[47]) );
  ffr_x1 \fifo_event_reg[46]  ( .D(dvs_event[46]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[46]) );
  ffr_x1 \fifo_event_reg[45]  ( .D(dvs_event[45]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[45]) );
  ffr_x1 \fifo_event_reg[44]  ( .D(dvs_event[44]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[44]) );
  ffr_x1 \fifo_event_reg[43]  ( .D(dvs_event[43]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[43]) );
  ffr_x1 \fifo_event_reg[42]  ( .D(dvs_event[42]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[42]) );
  ffr_x1 \fifo_event_reg[41]  ( .D(dvs_event[41]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[41]) );
  ffr_x1 \fifo_event_reg[40]  ( .D(dvs_event[40]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[40]) );
  ffr_x1 \fifo_event_reg[39]  ( .D(dvs_event[39]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[39]) );
  ffr_x1 \fifo_event_reg[38]  ( .D(dvs_event[38]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[38]) );
  ffr_x1 \fifo_event_reg[37]  ( .D(dvs_event[37]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[37]) );
  ffr_x1 \fifo_event_reg[35]  ( .D(dvs_event[35]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[35]) );
  ffr_x1 \fifo_event_reg[34]  ( .D(dvs_event[34]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[34]) );
  ffr_x1 \fifo_event_reg[33]  ( .D(dvs_event[33]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[33]) );
  ffr_x1 \fifo_event_reg[32]  ( .D(dvs_event[32]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[32]) );
  ffr_x1 \fifo_event_reg[31]  ( .D(dvs_event[31]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[31]) );
  ffr_x1 \fifo_event_reg[30]  ( .D(dvs_event[30]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[30]) );
  ffr_x1 \fifo_event_reg[29]  ( .D(dvs_event[29]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[29]) );
  ffr_x1 \fifo_event_reg[28]  ( .D(dvs_event[28]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[28]) );
  ffr_x1 \fifo_event_reg[27]  ( .D(dvs_event[27]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[27]) );
  ffr_x1 \fifo_event_reg[26]  ( .D(dvs_event[26]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[26]) );
  ffr_x1 \fifo_event_reg[25]  ( .D(dvs_event[25]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[25]) );
  ffr_x1 \fifo_event_reg[24]  ( .D(dvs_event[24]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[24]) );
  ffr_x1 \fifo_event_reg[23]  ( .D(dvs_event[23]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[23]) );
  ffr_x1 \fifo_event_reg[22]  ( .D(dvs_event[22]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[22]) );
  ffr_x1 \fifo_event_reg[20]  ( .D(dvs_event[20]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[20]) );
  ffr_x1 \fifo_event_reg[19]  ( .D(dvs_event[19]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[19]) );
  ffr_x1 \fifo_event_reg[18]  ( .D(dvs_event[18]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[18]) );
  ffr_x1 \fifo_event_reg[17]  ( .D(dvs_event[17]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[17]) );
  ffr_x1 \fifo_event_reg[16]  ( .D(dvs_event[16]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[16]) );
  ffr_x1 \fifo_event_reg[15]  ( .D(dvs_event[15]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[15]) );
  ffr_x1 \fifo_event_reg[14]  ( .D(dvs_event[14]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[14]) );
  ffr_x1 \fifo_event_reg[13]  ( .D(dvs_event[13]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[13]) );
  ffr_x1 \fifo_event_reg[12]  ( .D(dvs_event[12]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[12]) );
  ffr_x1 \fifo_event_reg[11]  ( .D(dvs_event[11]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[11]) );
  ffr_x1 \fifo_event_reg[10]  ( .D(dvs_event[10]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[10]) );
  ffr_x1 \fifo_event_reg[9]  ( .D(dvs_event[9]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[9]) );
  ffr_x1 \fifo_event_reg[8]  ( .D(dvs_event[8]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[8]) );
  ffr_x1 \fifo_event_reg[7]  ( .D(dvs_event[7]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[7]) );
  ffr_x1 \fifo_event_reg[5]  ( .D(dvs_event[5]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[5]) );
  ffr_x1 \fifo_event_reg[4]  ( .D(dvs_event[4]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[4]) );
  ffr_x1 \fifo_event_reg[3]  ( .D(dvs_event[3]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[3]) );
  ffr_x1 \fifo_event_reg[2]  ( .D(dvs_event[2]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[2]) );
  ffr_x1 \fifo_event_reg[1]  ( .D(dvs_event[1]), .CLK(net271), .RSTN(rst_n), 
        .Q(fifo_event[1]) );
  ffr_x1 \fifo_event_reg[0]  ( .D(dvs_event[0]), .CLK(net271), .RSTN(rst_n), 
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
  wire   N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30,
         N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44,
         N45, N46, N47, N48, N49, N50, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367;
  wire   [49:0] timestamp_clk_cycles;

  ffr_x1 \timestamp_clk_cycles_reg[41]  ( .D(N42), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[41]) );
  ffr_x1 \timestamp_clk_cycles_reg[11]  ( .D(N12), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[11]) );
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
  ffr_x1 \timestamp_clk_cycles_reg[43]  ( .D(N44), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[43]) );
  ffr_x1 \timestamp_clk_cycles_reg[42]  ( .D(N43), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[42]) );
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
  ffr_x1 \timestamp_clk_cycles_reg[28]  ( .D(N29), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[28]) );
  ffr_x1 \timestamp_clk_cycles_reg[27]  ( .D(N28), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[27]) );
  ffr_x1 \timestamp_clk_cycles_reg[25]  ( .D(N26), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[25]) );
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
  ffr_x1 \timestamp_clk_cycles_reg[16]  ( .D(N17), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[16]) );
  ffr_x1 \timestamp_clk_cycles_reg[15]  ( .D(N16), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[15]) );
  ffr_x1 \timestamp_clk_cycles_reg[14]  ( .D(N15), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[14]) );
  ffr_x1 \timestamp_clk_cycles_reg[13]  ( .D(N14), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[13]) );
  ffr_x1 \timestamp_clk_cycles_reg[12]  ( .D(N13), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[12]) );
  ffr_x1 \timestamp_clk_cycles_reg[10]  ( .D(N11), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[10]) );
  ffr_x1 \timestamp_clk_cycles_reg[9]  ( .D(N10), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[9]) );
  ffr_x1 \timestamp_clk_cycles_reg[8]  ( .D(N9), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[8]) );
  ffr_x1 \timestamp_clk_cycles_reg[7]  ( .D(N8), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[7]) );
  ffr_x1 \timestamp_clk_cycles_reg[6]  ( .D(N7), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[6]) );
  ffr_x1 \timestamp_clk_cycles_reg[5]  ( .D(N6), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[5]) );
  ffr_x1 \timestamp_clk_cycles_reg[4]  ( .D(N5), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[4]) );
  ffr_x1 \timestamp_clk_cycles_reg[3]  ( .D(N4), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[3]) );
  ffr_x1 \timestamp_clk_cycles_reg[2]  ( .D(N3), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[2]) );
  ffr_x1 \timestamp_clk_cycles_reg[1]  ( .D(N2), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[1]) );
  ffr_x1 \timestamp_clk_cycles_reg[0]  ( .D(N1), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[0]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[26]  ( .D(N27), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[26]) );
  ffrhq_x1 \timestamp_clk_cycles_reg[24]  ( .D(N25), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[24]) );
  nand2_x1 U3 ( .A(n68), .B(time_us[43]), .Y(n64) );
  nand2_x1 U4 ( .A(n348), .B(n345), .Y(n346) );
  nand2_x1 U5 ( .A(n313), .B(n310), .Y(n311) );
  nand2_x1 U6 ( .A(n278), .B(n275), .Y(n276) );
  nand2_x1 U7 ( .A(n243), .B(n240), .Y(n241) );
  nand2_x1 U8 ( .A(n208), .B(n205), .Y(n206) );
  nand2_x1 U9 ( .A(n173), .B(n170), .Y(n171) );
  nand2_x1 U10 ( .A(n138), .B(n135), .Y(n136) );
  nand2_x1 U11 ( .A(n103), .B(n100), .Y(n101) );
  nor2_x1 U12 ( .A(n331), .B(n54), .Y(n53) );
  nor2_x1 U13 ( .A(n275), .B(n46), .Y(n45) );
  nor2_x1 U14 ( .A(n219), .B(n38), .Y(n37) );
  nor2_x1 U15 ( .A(n177), .B(n32), .Y(n31) );
  nor2_x1 U16 ( .A(n121), .B(n24), .Y(n23) );
  nor2_x1 U17 ( .A(n68), .B(n16), .Y(n15) );
  inv_x1 U18 ( .A(timestamp_clk_cycles[49]), .Y(n63) );
  oai21_x1 U19 ( .A0(timestamp_clk_cycles[47]), .A1(n63), .B0(
        timestamp_clk_cycles[48]), .Y(n8) );
  inv_x1 U20 ( .A(timestamp_clk_cycles[47]), .Y(n13) );
  nand3_x1 U21 ( .A(timestamp_clk_cycles[48]), .B(timestamp_clk_cycles[49]), 
        .C(n13), .Y(n1) );
  oai21_x1 U22 ( .A0(timestamp_clk_cycles[49]), .A1(n13), .B0(n1), .Y(n5) );
  nor2_x1 U23 ( .A(timestamp_clk_cycles[46]), .B(n5), .Y(n3) );
  nor2_x1 U24 ( .A(timestamp_clk_cycles[48]), .B(timestamp_clk_cycles[47]), 
        .Y(n2) );
  nand2_x1 U25 ( .A(timestamp_clk_cycles[49]), .B(n2), .Y(n9) );
  oai21_x1 U26 ( .A0(n8), .A1(n3), .B0(n9), .Y(time_us[44]) );
  inv_x1 U27 ( .A(timestamp_clk_cycles[46]), .Y(n14) );
  nand2_x1 U28 ( .A(n14), .B(time_us[44]), .Y(n7) );
  nor2_x1 U29 ( .A(timestamp_clk_cycles[46]), .B(n9), .Y(n4) );
  aoi21_x1 U30 ( .A0(n5), .A1(n7), .B0(n4), .Y(n71) );
  nand3_x1 U31 ( .A(n9), .B(timestamp_clk_cycles[46]), .C(n8), .Y(n6) );
  nand2_x1 U32 ( .A(n7), .B(n6), .Y(n65) );
  nor2_x1 U33 ( .A(timestamp_clk_cycles[45]), .B(n65), .Y(n66) );
  mxi2_x1 U34 ( .A0(time_us[44]), .A1(n9), .S(n8), .YN(n69) );
  inv_x1 U35 ( .A(n69), .Y(n10) );
  oai21_x1 U36 ( .A0(n71), .A1(n66), .B0(n10), .Y(time_us[43]) );
  inv_x1 U37 ( .A(timestamp_clk_cycles[48]), .Y(n11) );
  inv_x1 U38 ( .A(timestamp_clk_cycles[45]), .Y(n68) );
  inv_x1 U39 ( .A(timestamp_clk_cycles[43]), .Y(n79) );
  inv_x1 U40 ( .A(timestamp_clk_cycles[41]), .Y(n93) );
  inv_x1 U41 ( .A(timestamp_clk_cycles[39]), .Y(n107) );
  inv_x1 U42 ( .A(timestamp_clk_cycles[37]), .Y(n121) );
  inv_x1 U43 ( .A(timestamp_clk_cycles[35]), .Y(n135) );
  inv_x1 U44 ( .A(timestamp_clk_cycles[33]), .Y(n149) );
  inv_x1 U45 ( .A(timestamp_clk_cycles[31]), .Y(n163) );
  inv_x1 U46 ( .A(timestamp_clk_cycles[29]), .Y(n177) );
  inv_x1 U47 ( .A(timestamp_clk_cycles[27]), .Y(n191) );
  inv_x1 U48 ( .A(timestamp_clk_cycles[25]), .Y(n205) );
  inv_x1 U49 ( .A(timestamp_clk_cycles[23]), .Y(n219) );
  inv_x1 U50 ( .A(timestamp_clk_cycles[21]), .Y(n233) );
  inv_x1 U51 ( .A(timestamp_clk_cycles[19]), .Y(n247) );
  inv_x1 U52 ( .A(timestamp_clk_cycles[17]), .Y(n261) );
  inv_x1 U53 ( .A(timestamp_clk_cycles[15]), .Y(n275) );
  inv_x1 U54 ( .A(timestamp_clk_cycles[13]), .Y(n289) );
  inv_x1 U55 ( .A(timestamp_clk_cycles[11]), .Y(n303) );
  inv_x1 U56 ( .A(timestamp_clk_cycles[9]), .Y(n317) );
  inv_x1 U57 ( .A(timestamp_clk_cycles[7]), .Y(n331) );
  inv_x1 U58 ( .A(timestamp_clk_cycles[5]), .Y(n345) );
  inv_x1 U59 ( .A(timestamp_clk_cycles[3]), .Y(n353) );
  nand3_x1 U60 ( .A(timestamp_clk_cycles[2]), .B(timestamp_clk_cycles[0]), .C(
        timestamp_clk_cycles[1]), .Y(n58) );
  nor2_x1 U61 ( .A(n353), .B(n58), .Y(n57) );
  nand2_x1 U62 ( .A(timestamp_clk_cycles[4]), .B(n57), .Y(n56) );
  nor2_x1 U63 ( .A(n345), .B(n56), .Y(n55) );
  nand2_x1 U64 ( .A(timestamp_clk_cycles[6]), .B(n55), .Y(n54) );
  nand2_x1 U65 ( .A(timestamp_clk_cycles[8]), .B(n53), .Y(n52) );
  nor2_x1 U66 ( .A(n317), .B(n52), .Y(n51) );
  nand2_x1 U67 ( .A(timestamp_clk_cycles[10]), .B(n51), .Y(n50) );
  nor2_x1 U68 ( .A(n303), .B(n50), .Y(n49) );
  nand2_x1 U69 ( .A(timestamp_clk_cycles[12]), .B(n49), .Y(n48) );
  nor2_x1 U70 ( .A(n289), .B(n48), .Y(n47) );
  nand2_x1 U71 ( .A(timestamp_clk_cycles[14]), .B(n47), .Y(n46) );
  nand2_x1 U72 ( .A(timestamp_clk_cycles[16]), .B(n45), .Y(n44) );
  nor2_x1 U73 ( .A(n261), .B(n44), .Y(n43) );
  nand2_x1 U74 ( .A(timestamp_clk_cycles[18]), .B(n43), .Y(n42) );
  nor2_x1 U75 ( .A(n247), .B(n42), .Y(n41) );
  nand2_x1 U76 ( .A(timestamp_clk_cycles[20]), .B(n41), .Y(n40) );
  nor2_x1 U77 ( .A(n233), .B(n40), .Y(n39) );
  nand2_x1 U78 ( .A(timestamp_clk_cycles[22]), .B(n39), .Y(n38) );
  nand2_x1 U79 ( .A(timestamp_clk_cycles[24]), .B(n37), .Y(n36) );
  nor2_x1 U80 ( .A(n205), .B(n36), .Y(n35) );
  nand2_x1 U81 ( .A(timestamp_clk_cycles[26]), .B(n35), .Y(n34) );
  nor2_x1 U82 ( .A(n191), .B(n34), .Y(n33) );
  nand2_x1 U83 ( .A(timestamp_clk_cycles[28]), .B(n33), .Y(n32) );
  nand2_x1 U84 ( .A(timestamp_clk_cycles[30]), .B(n31), .Y(n30) );
  nor2_x1 U85 ( .A(n163), .B(n30), .Y(n29) );
  nand2_x1 U86 ( .A(timestamp_clk_cycles[32]), .B(n29), .Y(n28) );
  nor2_x1 U87 ( .A(n149), .B(n28), .Y(n27) );
  nand2_x1 U88 ( .A(timestamp_clk_cycles[34]), .B(n27), .Y(n26) );
  nor2_x1 U89 ( .A(n135), .B(n26), .Y(n25) );
  nand2_x1 U90 ( .A(timestamp_clk_cycles[36]), .B(n25), .Y(n24) );
  nand2_x1 U91 ( .A(timestamp_clk_cycles[38]), .B(n23), .Y(n22) );
  nor2_x1 U92 ( .A(n107), .B(n22), .Y(n21) );
  nand2_x1 U93 ( .A(timestamp_clk_cycles[40]), .B(n21), .Y(n20) );
  nor2_x1 U94 ( .A(n93), .B(n20), .Y(n19) );
  nand2_x1 U95 ( .A(timestamp_clk_cycles[42]), .B(n19), .Y(n18) );
  nor2_x1 U96 ( .A(n79), .B(n18), .Y(n17) );
  nand2_x1 U97 ( .A(timestamp_clk_cycles[44]), .B(n17), .Y(n16) );
  nand2_x1 U98 ( .A(timestamp_clk_cycles[46]), .B(n15), .Y(n12) );
  nor2_x1 U99 ( .A(n13), .B(n12), .Y(n61) );
  mxi2_x1 U100 ( .A0(n11), .A1(timestamp_clk_cycles[48]), .S(n61), .YN(N49) );
  aoi21_x1 U101 ( .A0(n13), .A1(n12), .B0(n61), .Y(N48) );
  mxi2_x1 U102 ( .A0(n14), .A1(timestamp_clk_cycles[46]), .S(n15), .YN(N47) );
  aoi21_x1 U103 ( .A0(n68), .A1(n16), .B0(n15), .Y(N46) );
  inv_x1 U104 ( .A(timestamp_clk_cycles[44]), .Y(n72) );
  mxi2_x1 U105 ( .A0(n72), .A1(timestamp_clk_cycles[44]), .S(n17), .YN(N45) );
  aoi21_x1 U106 ( .A0(n79), .A1(n18), .B0(n17), .Y(N44) );
  inv_x1 U107 ( .A(timestamp_clk_cycles[42]), .Y(n86) );
  mxi2_x1 U108 ( .A0(n86), .A1(timestamp_clk_cycles[42]), .S(n19), .YN(N43) );
  aoi21_x1 U109 ( .A0(n93), .A1(n20), .B0(n19), .Y(N42) );
  inv_x1 U110 ( .A(timestamp_clk_cycles[40]), .Y(n100) );
  mxi2_x1 U111 ( .A0(n100), .A1(timestamp_clk_cycles[40]), .S(n21), .YN(N41)
         );
  aoi21_x1 U112 ( .A0(n107), .A1(n22), .B0(n21), .Y(N40) );
  inv_x1 U113 ( .A(timestamp_clk_cycles[38]), .Y(n114) );
  mxi2_x1 U114 ( .A0(n114), .A1(timestamp_clk_cycles[38]), .S(n23), .YN(N39)
         );
  aoi21_x1 U115 ( .A0(n121), .A1(n24), .B0(n23), .Y(N38) );
  inv_x1 U116 ( .A(timestamp_clk_cycles[36]), .Y(n128) );
  mxi2_x1 U117 ( .A0(n128), .A1(timestamp_clk_cycles[36]), .S(n25), .YN(N37)
         );
  aoi21_x1 U118 ( .A0(n135), .A1(n26), .B0(n25), .Y(N36) );
  inv_x1 U119 ( .A(timestamp_clk_cycles[34]), .Y(n142) );
  mxi2_x1 U120 ( .A0(n142), .A1(timestamp_clk_cycles[34]), .S(n27), .YN(N35)
         );
  aoi21_x1 U121 ( .A0(n149), .A1(n28), .B0(n27), .Y(N34) );
  inv_x1 U122 ( .A(timestamp_clk_cycles[32]), .Y(n156) );
  mxi2_x1 U123 ( .A0(n156), .A1(timestamp_clk_cycles[32]), .S(n29), .YN(N33)
         );
  aoi21_x1 U124 ( .A0(n163), .A1(n30), .B0(n29), .Y(N32) );
  inv_x1 U125 ( .A(timestamp_clk_cycles[30]), .Y(n170) );
  mxi2_x1 U126 ( .A0(n170), .A1(timestamp_clk_cycles[30]), .S(n31), .YN(N31)
         );
  aoi21_x1 U127 ( .A0(n177), .A1(n32), .B0(n31), .Y(N30) );
  inv_x1 U128 ( .A(timestamp_clk_cycles[28]), .Y(n184) );
  mxi2_x1 U129 ( .A0(n184), .A1(timestamp_clk_cycles[28]), .S(n33), .YN(N29)
         );
  aoi21_x1 U130 ( .A0(n191), .A1(n34), .B0(n33), .Y(N28) );
  inv_x1 U131 ( .A(timestamp_clk_cycles[26]), .Y(n198) );
  mxi2_x1 U132 ( .A0(n198), .A1(timestamp_clk_cycles[26]), .S(n35), .YN(N27)
         );
  aoi21_x1 U133 ( .A0(n205), .A1(n36), .B0(n35), .Y(N26) );
  inv_x1 U134 ( .A(timestamp_clk_cycles[24]), .Y(n212) );
  mxi2_x1 U135 ( .A0(n212), .A1(timestamp_clk_cycles[24]), .S(n37), .YN(N25)
         );
  aoi21_x1 U136 ( .A0(n219), .A1(n38), .B0(n37), .Y(N24) );
  inv_x1 U137 ( .A(timestamp_clk_cycles[22]), .Y(n226) );
  mxi2_x1 U138 ( .A0(n226), .A1(timestamp_clk_cycles[22]), .S(n39), .YN(N23)
         );
  aoi21_x1 U139 ( .A0(n233), .A1(n40), .B0(n39), .Y(N22) );
  inv_x1 U140 ( .A(timestamp_clk_cycles[20]), .Y(n240) );
  mxi2_x1 U141 ( .A0(n240), .A1(timestamp_clk_cycles[20]), .S(n41), .YN(N21)
         );
  aoi21_x1 U142 ( .A0(n247), .A1(n42), .B0(n41), .Y(N20) );
  inv_x1 U143 ( .A(timestamp_clk_cycles[18]), .Y(n254) );
  mxi2_x1 U144 ( .A0(n254), .A1(timestamp_clk_cycles[18]), .S(n43), .YN(N19)
         );
  aoi21_x1 U145 ( .A0(n261), .A1(n44), .B0(n43), .Y(N18) );
  inv_x1 U146 ( .A(timestamp_clk_cycles[16]), .Y(n268) );
  mxi2_x1 U147 ( .A0(n268), .A1(timestamp_clk_cycles[16]), .S(n45), .YN(N17)
         );
  aoi21_x1 U148 ( .A0(n275), .A1(n46), .B0(n45), .Y(N16) );
  inv_x1 U149 ( .A(timestamp_clk_cycles[14]), .Y(n282) );
  mxi2_x1 U150 ( .A0(n282), .A1(timestamp_clk_cycles[14]), .S(n47), .YN(N15)
         );
  aoi21_x1 U151 ( .A0(n289), .A1(n48), .B0(n47), .Y(N14) );
  inv_x1 U152 ( .A(timestamp_clk_cycles[12]), .Y(n296) );
  mxi2_x1 U153 ( .A0(n296), .A1(timestamp_clk_cycles[12]), .S(n49), .YN(N13)
         );
  aoi21_x1 U154 ( .A0(n303), .A1(n50), .B0(n49), .Y(N12) );
  inv_x1 U155 ( .A(timestamp_clk_cycles[10]), .Y(n310) );
  mxi2_x1 U156 ( .A0(n310), .A1(timestamp_clk_cycles[10]), .S(n51), .YN(N11)
         );
  aoi21_x1 U157 ( .A0(n317), .A1(n52), .B0(n51), .Y(N10) );
  inv_x1 U158 ( .A(timestamp_clk_cycles[8]), .Y(n324) );
  mxi2_x1 U159 ( .A0(n324), .A1(timestamp_clk_cycles[8]), .S(n53), .YN(N9) );
  aoi21_x1 U160 ( .A0(n331), .A1(n54), .B0(n53), .Y(N8) );
  inv_x1 U161 ( .A(timestamp_clk_cycles[6]), .Y(n338) );
  mxi2_x1 U162 ( .A0(n338), .A1(timestamp_clk_cycles[6]), .S(n55), .YN(N7) );
  aoi21_x1 U163 ( .A0(n345), .A1(n56), .B0(n55), .Y(N6) );
  inv_x1 U164 ( .A(timestamp_clk_cycles[4]), .Y(n352) );
  mxi2_x1 U165 ( .A0(n352), .A1(timestamp_clk_cycles[4]), .S(n57), .YN(N5) );
  aoi21_x1 U166 ( .A0(n353), .A1(n58), .B0(n57), .Y(N4) );
  and2_x1 U167 ( .A(timestamp_clk_cycles[1]), .B(timestamp_clk_cycles[0]), .Y(
        n59) );
  oai21_x1 U168 ( .A0(timestamp_clk_cycles[2]), .A1(n59), .B0(n58), .Y(n60) );
  inv_x1 U169 ( .A(n60), .Y(N3) );
  inv_x1 U170 ( .A(timestamp_clk_cycles[0]), .Y(N1) );
  mxi2_x1 U171 ( .A0(N1), .A1(timestamp_clk_cycles[0]), .S(
        timestamp_clk_cycles[1]), .YN(N2) );
  nand2_x1 U172 ( .A(timestamp_clk_cycles[48]), .B(n61), .Y(n62) );
  mxi2_x1 U173 ( .A0(timestamp_clk_cycles[49]), .A1(n63), .S(n62), .YN(N50) );
  aoi22_x1 U174 ( .A0(n66), .A1(n69), .B0(n65), .B1(n64), .Y(n67) );
  inv_x1 U175 ( .A(n67), .Y(n77) );
  mxi2_x1 U176 ( .A0(timestamp_clk_cycles[45]), .A1(n68), .S(time_us[43]), 
        .YN(n75) );
  nand2_x1 U177 ( .A(n75), .B(n72), .Y(n73) );
  aoi22_x1 U178 ( .A0(n69), .A1(n71), .B0(n77), .B1(n73), .Y(n70) );
  oai21_x1 U179 ( .A0(n71), .A1(time_us[43]), .B0(n70), .Y(time_us[42]) );
  inv_x1 U180 ( .A(time_us[42]), .Y(n78) );
  aoi22_x1 U181 ( .A0(timestamp_clk_cycles[44]), .A1(n78), .B0(time_us[42]), 
        .B1(n72), .Y(n82) );
  nand2_x1 U182 ( .A(n82), .B(n79), .Y(n80) );
  nor2_x1 U183 ( .A(timestamp_clk_cycles[44]), .B(n78), .Y(n74) );
  oai22_x1 U184 ( .A0(n75), .A1(n74), .B0(n78), .B1(n73), .Y(n84) );
  aoi22_x1 U185 ( .A0(n80), .A1(n84), .B0(n78), .B1(n77), .Y(n76) );
  oai21_x1 U186 ( .A0(n78), .A1(n77), .B0(n76), .Y(time_us[41]) );
  inv_x1 U187 ( .A(time_us[41]), .Y(n85) );
  aoi22_x1 U188 ( .A0(timestamp_clk_cycles[43]), .A1(n85), .B0(time_us[41]), 
        .B1(n79), .Y(n89) );
  nand2_x1 U189 ( .A(n89), .B(n86), .Y(n87) );
  nor2_x1 U190 ( .A(timestamp_clk_cycles[43]), .B(n85), .Y(n81) );
  oai22_x1 U191 ( .A0(n82), .A1(n81), .B0(n85), .B1(n80), .Y(n91) );
  aoi22_x1 U192 ( .A0(n87), .A1(n91), .B0(n85), .B1(n84), .Y(n83) );
  oai21_x1 U193 ( .A0(n85), .A1(n84), .B0(n83), .Y(time_us[40]) );
  inv_x1 U194 ( .A(time_us[40]), .Y(n92) );
  aoi22_x1 U195 ( .A0(timestamp_clk_cycles[42]), .A1(n92), .B0(time_us[40]), 
        .B1(n86), .Y(n96) );
  nand2_x1 U196 ( .A(n96), .B(n93), .Y(n94) );
  nor2_x1 U197 ( .A(timestamp_clk_cycles[42]), .B(n92), .Y(n88) );
  oai22_x1 U198 ( .A0(n89), .A1(n88), .B0(n92), .B1(n87), .Y(n98) );
  aoi22_x1 U199 ( .A0(n94), .A1(n98), .B0(n92), .B1(n91), .Y(n90) );
  oai21_x1 U200 ( .A0(n92), .A1(n91), .B0(n90), .Y(time_us[39]) );
  inv_x1 U201 ( .A(time_us[39]), .Y(n99) );
  aoi22_x1 U202 ( .A0(timestamp_clk_cycles[41]), .A1(n99), .B0(time_us[39]), 
        .B1(n93), .Y(n103) );
  nor2_x1 U203 ( .A(timestamp_clk_cycles[41]), .B(n99), .Y(n95) );
  oai22_x1 U204 ( .A0(n96), .A1(n95), .B0(n99), .B1(n94), .Y(n105) );
  aoi22_x1 U205 ( .A0(n101), .A1(n105), .B0(n99), .B1(n98), .Y(n97) );
  oai21_x1 U206 ( .A0(n99), .A1(n98), .B0(n97), .Y(time_us[38]) );
  inv_x1 U207 ( .A(time_us[38]), .Y(n106) );
  aoi22_x1 U208 ( .A0(timestamp_clk_cycles[40]), .A1(n106), .B0(time_us[38]), 
        .B1(n100), .Y(n110) );
  nand2_x1 U209 ( .A(n110), .B(n107), .Y(n108) );
  nor2_x1 U210 ( .A(timestamp_clk_cycles[40]), .B(n106), .Y(n102) );
  oai22_x1 U211 ( .A0(n103), .A1(n102), .B0(n106), .B1(n101), .Y(n112) );
  aoi22_x1 U212 ( .A0(n108), .A1(n112), .B0(n106), .B1(n105), .Y(n104) );
  oai21_x1 U213 ( .A0(n106), .A1(n105), .B0(n104), .Y(time_us[37]) );
  inv_x1 U214 ( .A(time_us[37]), .Y(n113) );
  aoi22_x1 U215 ( .A0(timestamp_clk_cycles[39]), .A1(n113), .B0(time_us[37]), 
        .B1(n107), .Y(n117) );
  nand2_x1 U216 ( .A(n117), .B(n114), .Y(n115) );
  nor2_x1 U217 ( .A(timestamp_clk_cycles[39]), .B(n113), .Y(n109) );
  oai22_x1 U218 ( .A0(n110), .A1(n109), .B0(n113), .B1(n108), .Y(n119) );
  aoi22_x1 U219 ( .A0(n115), .A1(n119), .B0(n113), .B1(n112), .Y(n111) );
  oai21_x1 U220 ( .A0(n113), .A1(n112), .B0(n111), .Y(time_us[36]) );
  inv_x1 U221 ( .A(time_us[36]), .Y(n120) );
  aoi22_x1 U222 ( .A0(timestamp_clk_cycles[38]), .A1(n120), .B0(time_us[36]), 
        .B1(n114), .Y(n124) );
  nand2_x1 U223 ( .A(n124), .B(n121), .Y(n122) );
  nor2_x1 U224 ( .A(timestamp_clk_cycles[38]), .B(n120), .Y(n116) );
  oai22_x1 U225 ( .A0(n117), .A1(n116), .B0(n120), .B1(n115), .Y(n126) );
  aoi22_x1 U226 ( .A0(n122), .A1(n126), .B0(n120), .B1(n119), .Y(n118) );
  oai21_x1 U227 ( .A0(n120), .A1(n119), .B0(n118), .Y(time_us[35]) );
  inv_x1 U228 ( .A(time_us[35]), .Y(n127) );
  aoi22_x1 U229 ( .A0(timestamp_clk_cycles[37]), .A1(n127), .B0(time_us[35]), 
        .B1(n121), .Y(n131) );
  nand2_x1 U230 ( .A(n131), .B(n128), .Y(n129) );
  nor2_x1 U231 ( .A(timestamp_clk_cycles[37]), .B(n127), .Y(n123) );
  oai22_x1 U232 ( .A0(n124), .A1(n123), .B0(n127), .B1(n122), .Y(n133) );
  aoi22_x1 U233 ( .A0(n129), .A1(n133), .B0(n127), .B1(n126), .Y(n125) );
  oai21_x1 U234 ( .A0(n127), .A1(n126), .B0(n125), .Y(time_us[34]) );
  inv_x1 U235 ( .A(time_us[34]), .Y(n134) );
  aoi22_x1 U236 ( .A0(timestamp_clk_cycles[36]), .A1(n134), .B0(time_us[34]), 
        .B1(n128), .Y(n138) );
  nor2_x1 U237 ( .A(timestamp_clk_cycles[36]), .B(n134), .Y(n130) );
  oai22_x1 U238 ( .A0(n131), .A1(n130), .B0(n134), .B1(n129), .Y(n140) );
  aoi22_x1 U239 ( .A0(n136), .A1(n140), .B0(n134), .B1(n133), .Y(n132) );
  oai21_x1 U240 ( .A0(n134), .A1(n133), .B0(n132), .Y(time_us[33]) );
  inv_x1 U241 ( .A(time_us[33]), .Y(n141) );
  aoi22_x1 U242 ( .A0(timestamp_clk_cycles[35]), .A1(n141), .B0(time_us[33]), 
        .B1(n135), .Y(n145) );
  nand2_x1 U243 ( .A(n145), .B(n142), .Y(n143) );
  nor2_x1 U244 ( .A(timestamp_clk_cycles[35]), .B(n141), .Y(n137) );
  oai22_x1 U245 ( .A0(n138), .A1(n137), .B0(n141), .B1(n136), .Y(n147) );
  aoi22_x1 U246 ( .A0(n143), .A1(n147), .B0(n141), .B1(n140), .Y(n139) );
  oai21_x1 U247 ( .A0(n141), .A1(n140), .B0(n139), .Y(time_us[32]) );
  inv_x1 U248 ( .A(time_us[32]), .Y(n148) );
  aoi22_x1 U249 ( .A0(timestamp_clk_cycles[34]), .A1(n148), .B0(time_us[32]), 
        .B1(n142), .Y(n152) );
  nand2_x1 U250 ( .A(n152), .B(n149), .Y(n150) );
  nor2_x1 U251 ( .A(timestamp_clk_cycles[34]), .B(n148), .Y(n144) );
  oai22_x1 U252 ( .A0(n145), .A1(n144), .B0(n148), .B1(n143), .Y(n154) );
  aoi22_x1 U253 ( .A0(n150), .A1(n154), .B0(n148), .B1(n147), .Y(n146) );
  oai21_x1 U254 ( .A0(n148), .A1(n147), .B0(n146), .Y(time_us[31]) );
  inv_x1 U255 ( .A(time_us[31]), .Y(n155) );
  aoi22_x1 U256 ( .A0(timestamp_clk_cycles[33]), .A1(n155), .B0(time_us[31]), 
        .B1(n149), .Y(n159) );
  nand2_x1 U257 ( .A(n159), .B(n156), .Y(n157) );
  nor2_x1 U258 ( .A(timestamp_clk_cycles[33]), .B(n155), .Y(n151) );
  oai22_x1 U259 ( .A0(n152), .A1(n151), .B0(n155), .B1(n150), .Y(n161) );
  aoi22_x1 U260 ( .A0(n157), .A1(n161), .B0(n155), .B1(n154), .Y(n153) );
  oai21_x1 U261 ( .A0(n155), .A1(n154), .B0(n153), .Y(time_us[30]) );
  inv_x1 U262 ( .A(time_us[30]), .Y(n162) );
  aoi22_x1 U263 ( .A0(timestamp_clk_cycles[32]), .A1(n162), .B0(time_us[30]), 
        .B1(n156), .Y(n166) );
  nand2_x1 U264 ( .A(n166), .B(n163), .Y(n164) );
  nor2_x1 U265 ( .A(timestamp_clk_cycles[32]), .B(n162), .Y(n158) );
  oai22_x1 U266 ( .A0(n159), .A1(n158), .B0(n162), .B1(n157), .Y(n168) );
  aoi22_x1 U267 ( .A0(n164), .A1(n168), .B0(n162), .B1(n161), .Y(n160) );
  oai21_x1 U268 ( .A0(n162), .A1(n161), .B0(n160), .Y(time_us[29]) );
  inv_x1 U269 ( .A(time_us[29]), .Y(n169) );
  aoi22_x1 U270 ( .A0(timestamp_clk_cycles[31]), .A1(n169), .B0(time_us[29]), 
        .B1(n163), .Y(n173) );
  nor2_x1 U271 ( .A(timestamp_clk_cycles[31]), .B(n169), .Y(n165) );
  oai22_x1 U272 ( .A0(n166), .A1(n165), .B0(n169), .B1(n164), .Y(n175) );
  aoi22_x1 U273 ( .A0(n171), .A1(n175), .B0(n169), .B1(n168), .Y(n167) );
  oai21_x1 U274 ( .A0(n169), .A1(n168), .B0(n167), .Y(time_us[28]) );
  inv_x1 U275 ( .A(time_us[28]), .Y(n176) );
  aoi22_x1 U276 ( .A0(timestamp_clk_cycles[30]), .A1(n176), .B0(time_us[28]), 
        .B1(n170), .Y(n180) );
  nand2_x1 U277 ( .A(n180), .B(n177), .Y(n178) );
  nor2_x1 U278 ( .A(timestamp_clk_cycles[30]), .B(n176), .Y(n172) );
  oai22_x1 U279 ( .A0(n173), .A1(n172), .B0(n176), .B1(n171), .Y(n182) );
  aoi22_x1 U280 ( .A0(n178), .A1(n182), .B0(n176), .B1(n175), .Y(n174) );
  oai21_x1 U281 ( .A0(n176), .A1(n175), .B0(n174), .Y(time_us[27]) );
  inv_x1 U282 ( .A(time_us[27]), .Y(n183) );
  aoi22_x1 U283 ( .A0(timestamp_clk_cycles[29]), .A1(n183), .B0(time_us[27]), 
        .B1(n177), .Y(n187) );
  nand2_x1 U284 ( .A(n187), .B(n184), .Y(n185) );
  nor2_x1 U285 ( .A(timestamp_clk_cycles[29]), .B(n183), .Y(n179) );
  oai22_x1 U286 ( .A0(n180), .A1(n179), .B0(n183), .B1(n178), .Y(n189) );
  aoi22_x1 U287 ( .A0(n185), .A1(n189), .B0(n183), .B1(n182), .Y(n181) );
  oai21_x1 U288 ( .A0(n183), .A1(n182), .B0(n181), .Y(time_us[26]) );
  inv_x1 U289 ( .A(time_us[26]), .Y(n190) );
  aoi22_x1 U290 ( .A0(timestamp_clk_cycles[28]), .A1(n190), .B0(time_us[26]), 
        .B1(n184), .Y(n194) );
  nand2_x1 U291 ( .A(n194), .B(n191), .Y(n192) );
  nor2_x1 U292 ( .A(timestamp_clk_cycles[28]), .B(n190), .Y(n186) );
  oai22_x1 U293 ( .A0(n187), .A1(n186), .B0(n190), .B1(n185), .Y(n196) );
  aoi22_x1 U294 ( .A0(n192), .A1(n196), .B0(n190), .B1(n189), .Y(n188) );
  oai21_x1 U295 ( .A0(n190), .A1(n189), .B0(n188), .Y(time_us[25]) );
  inv_x1 U296 ( .A(time_us[25]), .Y(n197) );
  aoi22_x1 U297 ( .A0(timestamp_clk_cycles[27]), .A1(n197), .B0(time_us[25]), 
        .B1(n191), .Y(n201) );
  nand2_x1 U298 ( .A(n201), .B(n198), .Y(n199) );
  nor2_x1 U299 ( .A(timestamp_clk_cycles[27]), .B(n197), .Y(n193) );
  oai22_x1 U300 ( .A0(n194), .A1(n193), .B0(n197), .B1(n192), .Y(n203) );
  aoi22_x1 U301 ( .A0(n199), .A1(n203), .B0(n197), .B1(n196), .Y(n195) );
  oai21_x1 U302 ( .A0(n197), .A1(n196), .B0(n195), .Y(time_us[24]) );
  inv_x1 U303 ( .A(time_us[24]), .Y(n204) );
  aoi22_x1 U304 ( .A0(timestamp_clk_cycles[26]), .A1(n204), .B0(time_us[24]), 
        .B1(n198), .Y(n208) );
  nor2_x1 U305 ( .A(timestamp_clk_cycles[26]), .B(n204), .Y(n200) );
  oai22_x1 U306 ( .A0(n201), .A1(n200), .B0(n204), .B1(n199), .Y(n210) );
  aoi22_x1 U307 ( .A0(n206), .A1(n210), .B0(n204), .B1(n203), .Y(n202) );
  oai21_x1 U308 ( .A0(n204), .A1(n203), .B0(n202), .Y(time_us[23]) );
  inv_x1 U309 ( .A(time_us[23]), .Y(n211) );
  aoi22_x1 U310 ( .A0(timestamp_clk_cycles[25]), .A1(n211), .B0(time_us[23]), 
        .B1(n205), .Y(n215) );
  nand2_x1 U311 ( .A(n215), .B(n212), .Y(n213) );
  nor2_x1 U312 ( .A(timestamp_clk_cycles[25]), .B(n211), .Y(n207) );
  oai22_x1 U313 ( .A0(n208), .A1(n207), .B0(n211), .B1(n206), .Y(n217) );
  aoi22_x1 U314 ( .A0(n213), .A1(n217), .B0(n211), .B1(n210), .Y(n209) );
  oai21_x1 U315 ( .A0(n211), .A1(n210), .B0(n209), .Y(time_us[22]) );
  inv_x1 U316 ( .A(time_us[22]), .Y(n218) );
  aoi22_x1 U317 ( .A0(timestamp_clk_cycles[24]), .A1(n218), .B0(time_us[22]), 
        .B1(n212), .Y(n222) );
  nand2_x1 U318 ( .A(n222), .B(n219), .Y(n220) );
  nor2_x1 U319 ( .A(timestamp_clk_cycles[24]), .B(n218), .Y(n214) );
  oai22_x1 U320 ( .A0(n215), .A1(n214), .B0(n218), .B1(n213), .Y(n224) );
  aoi22_x1 U321 ( .A0(n220), .A1(n224), .B0(n218), .B1(n217), .Y(n216) );
  oai21_x1 U322 ( .A0(n218), .A1(n217), .B0(n216), .Y(time_us[21]) );
  inv_x1 U323 ( .A(time_us[21]), .Y(n225) );
  aoi22_x1 U324 ( .A0(timestamp_clk_cycles[23]), .A1(n225), .B0(time_us[21]), 
        .B1(n219), .Y(n229) );
  nand2_x1 U325 ( .A(n229), .B(n226), .Y(n227) );
  nor2_x1 U326 ( .A(timestamp_clk_cycles[23]), .B(n225), .Y(n221) );
  oai22_x1 U327 ( .A0(n222), .A1(n221), .B0(n225), .B1(n220), .Y(n231) );
  aoi22_x1 U328 ( .A0(n227), .A1(n231), .B0(n225), .B1(n224), .Y(n223) );
  oai21_x1 U329 ( .A0(n225), .A1(n224), .B0(n223), .Y(time_us[20]) );
  inv_x1 U330 ( .A(time_us[20]), .Y(n232) );
  aoi22_x1 U331 ( .A0(timestamp_clk_cycles[22]), .A1(n232), .B0(time_us[20]), 
        .B1(n226), .Y(n236) );
  nand2_x1 U332 ( .A(n236), .B(n233), .Y(n234) );
  nor2_x1 U333 ( .A(timestamp_clk_cycles[22]), .B(n232), .Y(n228) );
  oai22_x1 U334 ( .A0(n229), .A1(n228), .B0(n232), .B1(n227), .Y(n238) );
  aoi22_x1 U335 ( .A0(n234), .A1(n238), .B0(n232), .B1(n231), .Y(n230) );
  oai21_x1 U336 ( .A0(n232), .A1(n231), .B0(n230), .Y(time_us[19]) );
  inv_x1 U337 ( .A(time_us[19]), .Y(n239) );
  aoi22_x1 U338 ( .A0(timestamp_clk_cycles[21]), .A1(n239), .B0(time_us[19]), 
        .B1(n233), .Y(n243) );
  nor2_x1 U339 ( .A(timestamp_clk_cycles[21]), .B(n239), .Y(n235) );
  oai22_x1 U340 ( .A0(n236), .A1(n235), .B0(n239), .B1(n234), .Y(n245) );
  aoi22_x1 U341 ( .A0(n241), .A1(n245), .B0(n239), .B1(n238), .Y(n237) );
  oai21_x1 U342 ( .A0(n239), .A1(n238), .B0(n237), .Y(time_us[18]) );
  inv_x1 U343 ( .A(time_us[18]), .Y(n246) );
  aoi22_x1 U344 ( .A0(timestamp_clk_cycles[20]), .A1(n246), .B0(time_us[18]), 
        .B1(n240), .Y(n250) );
  nand2_x1 U345 ( .A(n250), .B(n247), .Y(n248) );
  nor2_x1 U346 ( .A(timestamp_clk_cycles[20]), .B(n246), .Y(n242) );
  oai22_x1 U347 ( .A0(n243), .A1(n242), .B0(n246), .B1(n241), .Y(n252) );
  aoi22_x1 U348 ( .A0(n248), .A1(n252), .B0(n246), .B1(n245), .Y(n244) );
  oai21_x1 U349 ( .A0(n246), .A1(n245), .B0(n244), .Y(time_us[17]) );
  inv_x1 U350 ( .A(time_us[17]), .Y(n253) );
  aoi22_x1 U351 ( .A0(timestamp_clk_cycles[19]), .A1(n253), .B0(time_us[17]), 
        .B1(n247), .Y(n257) );
  nand2_x1 U352 ( .A(n257), .B(n254), .Y(n255) );
  nor2_x1 U353 ( .A(timestamp_clk_cycles[19]), .B(n253), .Y(n249) );
  oai22_x1 U354 ( .A0(n250), .A1(n249), .B0(n253), .B1(n248), .Y(n259) );
  aoi22_x1 U355 ( .A0(n255), .A1(n259), .B0(n253), .B1(n252), .Y(n251) );
  oai21_x1 U356 ( .A0(n253), .A1(n252), .B0(n251), .Y(time_us[16]) );
  inv_x1 U357 ( .A(time_us[16]), .Y(n260) );
  aoi22_x1 U358 ( .A0(timestamp_clk_cycles[18]), .A1(n260), .B0(time_us[16]), 
        .B1(n254), .Y(n264) );
  nand2_x1 U359 ( .A(n264), .B(n261), .Y(n262) );
  nor2_x1 U360 ( .A(timestamp_clk_cycles[18]), .B(n260), .Y(n256) );
  oai22_x1 U361 ( .A0(n257), .A1(n256), .B0(n260), .B1(n255), .Y(n266) );
  aoi22_x1 U362 ( .A0(n262), .A1(n266), .B0(n260), .B1(n259), .Y(n258) );
  oai21_x1 U363 ( .A0(n260), .A1(n259), .B0(n258), .Y(time_us[15]) );
  inv_x1 U364 ( .A(time_us[15]), .Y(n267) );
  aoi22_x1 U365 ( .A0(timestamp_clk_cycles[17]), .A1(n267), .B0(time_us[15]), 
        .B1(n261), .Y(n271) );
  nand2_x1 U366 ( .A(n271), .B(n268), .Y(n269) );
  nor2_x1 U367 ( .A(timestamp_clk_cycles[17]), .B(n267), .Y(n263) );
  oai22_x1 U368 ( .A0(n264), .A1(n263), .B0(n267), .B1(n262), .Y(n273) );
  aoi22_x1 U369 ( .A0(n269), .A1(n273), .B0(n267), .B1(n266), .Y(n265) );
  oai21_x1 U370 ( .A0(n267), .A1(n266), .B0(n265), .Y(time_us[14]) );
  inv_x1 U371 ( .A(time_us[14]), .Y(n274) );
  aoi22_x1 U372 ( .A0(timestamp_clk_cycles[16]), .A1(n274), .B0(time_us[14]), 
        .B1(n268), .Y(n278) );
  nor2_x1 U373 ( .A(timestamp_clk_cycles[16]), .B(n274), .Y(n270) );
  oai22_x1 U374 ( .A0(n271), .A1(n270), .B0(n274), .B1(n269), .Y(n280) );
  aoi22_x1 U375 ( .A0(n276), .A1(n280), .B0(n274), .B1(n273), .Y(n272) );
  oai21_x1 U376 ( .A0(n274), .A1(n273), .B0(n272), .Y(time_us[13]) );
  inv_x1 U377 ( .A(time_us[13]), .Y(n281) );
  aoi22_x1 U378 ( .A0(timestamp_clk_cycles[15]), .A1(n281), .B0(time_us[13]), 
        .B1(n275), .Y(n285) );
  nand2_x1 U379 ( .A(n285), .B(n282), .Y(n283) );
  nor2_x1 U380 ( .A(timestamp_clk_cycles[15]), .B(n281), .Y(n277) );
  oai22_x1 U381 ( .A0(n278), .A1(n277), .B0(n281), .B1(n276), .Y(n287) );
  aoi22_x1 U382 ( .A0(n283), .A1(n287), .B0(n281), .B1(n280), .Y(n279) );
  oai21_x1 U383 ( .A0(n281), .A1(n280), .B0(n279), .Y(time_us[12]) );
  inv_x1 U384 ( .A(time_us[12]), .Y(n288) );
  aoi22_x1 U385 ( .A0(timestamp_clk_cycles[14]), .A1(n288), .B0(time_us[12]), 
        .B1(n282), .Y(n292) );
  nand2_x1 U386 ( .A(n292), .B(n289), .Y(n290) );
  nor2_x1 U387 ( .A(timestamp_clk_cycles[14]), .B(n288), .Y(n284) );
  oai22_x1 U388 ( .A0(n285), .A1(n284), .B0(n288), .B1(n283), .Y(n294) );
  aoi22_x1 U389 ( .A0(n290), .A1(n294), .B0(n288), .B1(n287), .Y(n286) );
  oai21_x1 U390 ( .A0(n288), .A1(n287), .B0(n286), .Y(time_us[11]) );
  inv_x1 U391 ( .A(time_us[11]), .Y(n295) );
  aoi22_x1 U392 ( .A0(timestamp_clk_cycles[13]), .A1(n295), .B0(time_us[11]), 
        .B1(n289), .Y(n299) );
  nand2_x1 U393 ( .A(n299), .B(n296), .Y(n297) );
  nor2_x1 U394 ( .A(timestamp_clk_cycles[13]), .B(n295), .Y(n291) );
  oai22_x1 U395 ( .A0(n292), .A1(n291), .B0(n295), .B1(n290), .Y(n301) );
  aoi22_x1 U396 ( .A0(n297), .A1(n301), .B0(n295), .B1(n294), .Y(n293) );
  oai21_x1 U397 ( .A0(n295), .A1(n294), .B0(n293), .Y(time_us[10]) );
  inv_x1 U398 ( .A(time_us[10]), .Y(n302) );
  aoi22_x1 U399 ( .A0(timestamp_clk_cycles[12]), .A1(n302), .B0(time_us[10]), 
        .B1(n296), .Y(n306) );
  nand2_x1 U400 ( .A(n306), .B(n303), .Y(n304) );
  nor2_x1 U401 ( .A(timestamp_clk_cycles[12]), .B(n302), .Y(n298) );
  oai22_x1 U402 ( .A0(n299), .A1(n298), .B0(n302), .B1(n297), .Y(n308) );
  aoi22_x1 U403 ( .A0(n304), .A1(n308), .B0(n302), .B1(n301), .Y(n300) );
  oai21_x1 U404 ( .A0(n302), .A1(n301), .B0(n300), .Y(time_us[9]) );
  inv_x1 U405 ( .A(time_us[9]), .Y(n309) );
  aoi22_x1 U406 ( .A0(timestamp_clk_cycles[11]), .A1(n309), .B0(time_us[9]), 
        .B1(n303), .Y(n313) );
  nor2_x1 U407 ( .A(timestamp_clk_cycles[11]), .B(n309), .Y(n305) );
  oai22_x1 U408 ( .A0(n306), .A1(n305), .B0(n309), .B1(n304), .Y(n315) );
  aoi22_x1 U409 ( .A0(n311), .A1(n315), .B0(n309), .B1(n308), .Y(n307) );
  oai21_x1 U410 ( .A0(n309), .A1(n308), .B0(n307), .Y(time_us[8]) );
  inv_x1 U411 ( .A(time_us[8]), .Y(n316) );
  aoi22_x1 U412 ( .A0(timestamp_clk_cycles[10]), .A1(n316), .B0(time_us[8]), 
        .B1(n310), .Y(n320) );
  nand2_x1 U413 ( .A(n320), .B(n317), .Y(n318) );
  nor2_x1 U414 ( .A(timestamp_clk_cycles[10]), .B(n316), .Y(n312) );
  oai22_x1 U415 ( .A0(n313), .A1(n312), .B0(n316), .B1(n311), .Y(n322) );
  aoi22_x1 U416 ( .A0(n318), .A1(n322), .B0(n316), .B1(n315), .Y(n314) );
  oai21_x1 U417 ( .A0(n316), .A1(n315), .B0(n314), .Y(time_us[7]) );
  inv_x1 U418 ( .A(time_us[7]), .Y(n323) );
  aoi22_x1 U419 ( .A0(timestamp_clk_cycles[9]), .A1(n323), .B0(time_us[7]), 
        .B1(n317), .Y(n327) );
  nand2_x1 U420 ( .A(n327), .B(n324), .Y(n325) );
  nor2_x1 U421 ( .A(timestamp_clk_cycles[9]), .B(n323), .Y(n319) );
  oai22_x1 U422 ( .A0(n320), .A1(n319), .B0(n323), .B1(n318), .Y(n329) );
  aoi22_x1 U423 ( .A0(n325), .A1(n329), .B0(n323), .B1(n322), .Y(n321) );
  oai21_x1 U424 ( .A0(n323), .A1(n322), .B0(n321), .Y(time_us[6]) );
  inv_x1 U425 ( .A(time_us[6]), .Y(n330) );
  aoi22_x1 U426 ( .A0(timestamp_clk_cycles[8]), .A1(n330), .B0(time_us[6]), 
        .B1(n324), .Y(n334) );
  nand2_x1 U427 ( .A(n334), .B(n331), .Y(n332) );
  nor2_x1 U428 ( .A(timestamp_clk_cycles[8]), .B(n330), .Y(n326) );
  oai22_x1 U429 ( .A0(n327), .A1(n326), .B0(n330), .B1(n325), .Y(n336) );
  aoi22_x1 U430 ( .A0(n332), .A1(n336), .B0(n330), .B1(n329), .Y(n328) );
  oai21_x1 U431 ( .A0(n330), .A1(n329), .B0(n328), .Y(time_us[5]) );
  inv_x1 U432 ( .A(time_us[5]), .Y(n337) );
  aoi22_x1 U433 ( .A0(timestamp_clk_cycles[7]), .A1(n337), .B0(time_us[5]), 
        .B1(n331), .Y(n341) );
  nand2_x1 U434 ( .A(n341), .B(n338), .Y(n339) );
  nor2_x1 U435 ( .A(timestamp_clk_cycles[7]), .B(n337), .Y(n333) );
  oai22_x1 U436 ( .A0(n334), .A1(n333), .B0(n337), .B1(n332), .Y(n343) );
  aoi22_x1 U437 ( .A0(n339), .A1(n343), .B0(n337), .B1(n336), .Y(n335) );
  oai21_x1 U438 ( .A0(n337), .A1(n336), .B0(n335), .Y(time_us[4]) );
  inv_x1 U439 ( .A(time_us[4]), .Y(n344) );
  aoi22_x1 U440 ( .A0(timestamp_clk_cycles[6]), .A1(n344), .B0(time_us[4]), 
        .B1(n338), .Y(n348) );
  nor2_x1 U441 ( .A(timestamp_clk_cycles[6]), .B(n344), .Y(n340) );
  oai22_x1 U442 ( .A0(n341), .A1(n340), .B0(n344), .B1(n339), .Y(n350) );
  aoi22_x1 U443 ( .A0(n346), .A1(n350), .B0(n344), .B1(n343), .Y(n342) );
  oai21_x1 U444 ( .A0(n344), .A1(n343), .B0(n342), .Y(time_us[3]) );
  inv_x1 U445 ( .A(time_us[3]), .Y(n351) );
  aoi22_x1 U446 ( .A0(timestamp_clk_cycles[5]), .A1(n351), .B0(time_us[3]), 
        .B1(n345), .Y(n356) );
  nand2_x1 U447 ( .A(n356), .B(n352), .Y(n354) );
  nor2_x1 U448 ( .A(timestamp_clk_cycles[5]), .B(n351), .Y(n347) );
  oai22_x1 U449 ( .A0(n348), .A1(n347), .B0(n351), .B1(n346), .Y(n359) );
  aoi22_x1 U450 ( .A0(n354), .A1(n359), .B0(n351), .B1(n350), .Y(n349) );
  oai21_x1 U451 ( .A0(n351), .A1(n350), .B0(n349), .Y(time_us[2]) );
  inv_x1 U452 ( .A(time_us[2]), .Y(n360) );
  aoi22_x1 U453 ( .A0(timestamp_clk_cycles[4]), .A1(n360), .B0(time_us[2]), 
        .B1(n352), .Y(n367) );
  nand2_x1 U454 ( .A(n367), .B(n353), .Y(n357) );
  nor2_x1 U455 ( .A(timestamp_clk_cycles[4]), .B(n360), .Y(n355) );
  oai22_x1 U456 ( .A0(n356), .A1(n355), .B0(n360), .B1(n354), .Y(n364) );
  aoi22_x1 U457 ( .A0(n357), .A1(n364), .B0(n360), .B1(n359), .Y(n358) );
  oai21_x1 U458 ( .A0(n360), .A1(n359), .B0(n358), .Y(time_us[1]) );
  nand2_x1 U459 ( .A(timestamp_clk_cycles[3]), .B(timestamp_clk_cycles[2]), 
        .Y(n361) );
  nand2_x1 U460 ( .A(n364), .B(n361), .Y(n362) );
  oai21_x1 U461 ( .A0(timestamp_clk_cycles[3]), .A1(timestamp_clk_cycles[2]), 
        .B0(n362), .Y(n366) );
  inv_x1 U462 ( .A(n364), .Y(n363) );
  mxi2_x1 U463 ( .A0(n364), .A1(n363), .S(time_us[1]), .YN(n365) );
  oai21_x1 U464 ( .A0(n367), .A1(n366), .B0(n365), .Y(time_us[0]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net239, net241, net242, net245, n1;
  assign net239 = CLK;
  assign ENCLK = net241;
  assign net242 = EN;

  latchgd_x1 latch ( .G(n1), .D(net242), .Q(net245) );
  and2_x2 main_gate ( .A(net245), .B(net239), .Y(net241) );
  inv_x1 U2 ( .A(net239), .Y(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net239, net241, net242, net245, n2;
  assign net239 = CLK;
  assign ENCLK = net241;
  assign net242 = EN;

  latchgd_x1 latch ( .G(n2), .D(net242), .Q(net245) );
  and2_x2 main_gate ( .A(net245), .B(net239), .Y(net241) );
  inv_x1 U2 ( .A(net239), .Y(n2) );
endmodule


module dvs_fifo_event_queue ( clk, rst_n, event_in, wr_en, rd_en, event_out, 
        empty, full );
  input [63:0] event_in;
  output [63:0] event_out;
  input clk, rst_n, wr_en, rd_en;
  output empty, full;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, net251, net256, n1, n2, n3, n4, n5,
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
        clk), .EN(N3), .ENCLK(net251) );
  SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_1 clk_gate_read_ptr_reg ( .CLK(clk), .EN(N14), .ENCLK(net256) );
  ffr_x1 \write_ptr_reg[6]  ( .D(N10), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[6]) );
  ffr_x1 \read_ptr_reg[2]  ( .D(N17), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[2]) );
  ffr_x1 \write_ptr_reg[9]  ( .D(N13), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[9]) );
  ffr_x1 \write_ptr_reg[8]  ( .D(N12), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[8]) );
  ffr_x1 \write_ptr_reg[7]  ( .D(N11), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[7]) );
  ffr_x1 \write_ptr_reg[5]  ( .D(N9), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[5]) );
  ffr_x1 \write_ptr_reg[4]  ( .D(N8), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[4]) );
  ffr_x1 \write_ptr_reg[3]  ( .D(N7), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[3]) );
  ffr_x1 \write_ptr_reg[2]  ( .D(N6), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[2]) );
  ffr_x1 \write_ptr_reg[1]  ( .D(N5), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[1]) );
  ffr_x1 \write_ptr_reg[0]  ( .D(N4), .CLK(net251), .RSTN(rst_n), .Q(
        write_ptr[0]) );
  ffr_x1 \read_ptr_reg[0]  ( .D(N15), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[0]) );
  ffr_x1 \read_ptr_reg[9]  ( .D(N24), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[9]) );
  ffr_x1 \read_ptr_reg[8]  ( .D(N23), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[8]) );
  ffr_x1 \read_ptr_reg[7]  ( .D(N22), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[7]) );
  ffr_x1 \read_ptr_reg[6]  ( .D(N21), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[6]) );
  ffr_x1 \read_ptr_reg[5]  ( .D(N20), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[5]) );
  ffr_x1 \read_ptr_reg[4]  ( .D(N19), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[4]) );
  ffr_x1 \read_ptr_reg[3]  ( .D(N18), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[3]) );
  ffr_x1 \read_ptr_reg[1]  ( .D(N16), .CLK(net256), .RSTN(rst_n), .Q(
        read_ptr[1]) );
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
  nand2_x1 U4 ( .A(N1), .B(n9), .Y(n1) );
  and2_x1 U5 ( .A(N1), .B(dvs_event[56]), .Y(\intadd_0/CI ) );
  aoi2bb1_x1 U6 ( .A0N(N1), .A1N(dvs_event[56]), .B0(\intadd_0/CI ), .Y(
        ravens_spike[6]) );
  inv_x1 U7 ( .A(n9), .Y(n8) );
  aoi2bb1_x1 U8 ( .A0N(dvs_event[48]), .A1N(N1), .B0(n8), .Y(N3) );
  nand2_x1 U9 ( .A(dvs_event[49]), .B(N2), .Y(n4) );
  oai21_x1 U10 ( .A0(dvs_event[49]), .A1(N2), .B0(n4), .Y(n10) );
  inv_x1 U11 ( .A(n10), .Y(n2) );
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
  wire   net206, net208, net209, net212, n1;
  assign net206 = CLK;
  assign ENCLK = net208;
  assign net209 = EN;

  latchgd_x1 latch ( .G(n1), .D(net209), .Q(net212) );
  and2_x2 main_gate ( .A(net212), .B(net206), .Y(net208) );
  inv_x1 U2 ( .A(net206), .Y(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_2 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net206, net208, net209, net212, n2;
  assign net206 = CLK;
  assign ENCLK = net208;
  assign net209 = EN;

  latchgd_x1 latch ( .G(n2), .D(net209), .Q(net212) );
  and2_x2 main_gate ( .A(net212), .B(net206), .Y(net208) );
  inv_x1 U2 ( .A(net206), .Y(n2) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net206, net208, net209, net212, n2;
  assign net206 = CLK;
  assign ENCLK = net208;
  assign net209 = EN;

  latchgd_x1 latch ( .G(n2), .D(net209), .Q(net212) );
  and2_x2 main_gate ( .A(net212), .B(net206), .Y(net208) );
  inv_x1 U2 ( .A(net206), .Y(n2) );
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
         N127, N128, N361, N140, net218, net221, net222, net223, net224,
         net225, net226, net227, net228, net231, net236, n108, n109, n111,
         n112, n113, \intadd_1/A[41] , \intadd_1/A[40] , \intadd_1/A[39] ,
         \intadd_1/A[38] , \intadd_1/A[37] , \intadd_1/A[36] ,
         \intadd_1/A[35] , \intadd_1/A[34] , \intadd_1/A[33] ,
         \intadd_1/A[32] , \intadd_1/A[31] , \intadd_1/A[30] ,
         \intadd_1/A[29] , \intadd_1/A[28] , \intadd_1/A[27] ,
         \intadd_1/A[26] , \intadd_1/A[25] , \intadd_1/A[24] ,
         \intadd_1/A[23] , \intadd_1/A[22] , \intadd_1/A[21] ,
         \intadd_1/A[20] , \intadd_1/A[19] , \intadd_1/A[18] ,
         \intadd_1/A[17] , \intadd_1/A[16] , \intadd_1/A[15] ,
         \intadd_1/A[14] , \intadd_1/A[13] , \intadd_1/A[12] ,
         \intadd_1/A[11] , \intadd_1/A[10] , \intadd_1/A[9] , \intadd_1/A[8] ,
         \intadd_1/A[7] , \intadd_1/A[6] , \intadd_1/A[5] , \intadd_1/A[4] ,
         \intadd_1/A[3] , \intadd_1/A[2] , \intadd_1/A[1] , \intadd_1/A[0] ,
         \intadd_1/CI , \intadd_1/SUM[41] , \intadd_1/SUM[40] ,
         \intadd_1/SUM[39] , \intadd_1/SUM[38] , \intadd_1/SUM[37] ,
         \intadd_1/SUM[36] , \intadd_1/SUM[35] , \intadd_1/SUM[34] ,
         \intadd_1/SUM[33] , \intadd_1/SUM[32] , \intadd_1/SUM[31] ,
         \intadd_1/SUM[30] , \intadd_1/SUM[29] , \intadd_1/SUM[28] ,
         \intadd_1/SUM[27] , \intadd_1/SUM[26] , \intadd_1/SUM[25] ,
         \intadd_1/SUM[24] , \intadd_1/SUM[23] , \intadd_1/SUM[22] ,
         \intadd_1/SUM[21] , \intadd_1/SUM[20] , \intadd_1/SUM[19] ,
         \intadd_1/SUM[18] , \intadd_1/SUM[17] , \intadd_1/SUM[16] ,
         \intadd_1/SUM[15] , \intadd_1/SUM[14] , \intadd_1/SUM[13] ,
         \intadd_1/SUM[12] , \intadd_1/SUM[11] , \intadd_1/SUM[10] ,
         \intadd_1/SUM[9] , \intadd_1/SUM[8] , \intadd_1/SUM[7] ,
         \intadd_1/SUM[6] , \intadd_1/SUM[5] , \intadd_1/SUM[4] ,
         \intadd_1/SUM[3] , \intadd_1/SUM[2] , \intadd_1/SUM[1] ,
         \intadd_1/SUM[0] , \intadd_1/n42 , \intadd_1/n41 , \intadd_1/n40 ,
         \intadd_1/n39 , \intadd_1/n38 , \intadd_1/n37 , \intadd_1/n36 ,
         \intadd_1/n35 , \intadd_1/n34 , \intadd_1/n33 , \intadd_1/n32 ,
         \intadd_1/n31 , \intadd_1/n30 , \intadd_1/n29 , \intadd_1/n28 ,
         \intadd_1/n27 , \intadd_1/n26 , \intadd_1/n25 , \intadd_1/n24 ,
         \intadd_1/n23 , \intadd_1/n22 , \intadd_1/n21 , \intadd_1/n20 ,
         \intadd_1/n19 , \intadd_1/n18 , \intadd_1/n17 , \intadd_1/n16 ,
         \intadd_1/n15 , \intadd_1/n14 , \intadd_1/n13 , \intadd_1/n12 ,
         \intadd_1/n11 , \intadd_1/n10 , \intadd_1/n9 , \intadd_1/n8 ,
         \intadd_1/n7 , \intadd_1/n6 , \intadd_1/n5 , \intadd_1/n4 ,
         \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 , n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n110, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874,
         n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885,
         n886, n887, n888, n889, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906, n907,
         n908, n909, n910, n911, n912, n913, n914, n915, n916, n917, n918,
         n919, n920, n921, n922, n923, n924, n925, n926, n927, n928, n929,
         n930, n931, n932, n933, n934, n935, n936, n937, n938, n939, n940,
         n941, n942, n943, n944, n945, n946, n947, n948, n949, n950, n951,
         n952, n953, n954, n955, n956, n957, n958, n959, n960, n961, n962,
         n963, n964, n965, n966, n967, n968, n969, n970, n971, n972, n973,
         n974, n975, n976, n977, n978, n979, n980, n981, n982, n983, n984,
         n985, n986, n987, n988, n989, n990, n991, n992, n993, n994, n995,
         n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005,
         n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015,
         n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025,
         n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035,
         n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045,
         n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055,
         n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065,
         n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075,
         n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085,
         n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095,
         n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105,
         n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115,
         n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125,
         n1126, n1127, n1128, n1129, n1130, n1131, n1132;
  wire   [2:0] cur_fsm_state;
  wire   [44:0] segment_last_timestamp_us;
  wire   [3:0] cur_sim_time_timestep;
  wire   [44:0] time_us_start_looking_for_new_sim_time;
  assign rdy_for_next_spike = N361;

  SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_0 clk_gate_segment_last_timestamp_us_reg ( 
        .CLK(clk), .EN(N73), .ENCLK(net218) );
  SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_2 clk_gate_ravens_pkt_reg ( 
        .CLK(clk), .EN(N140), .ENCLK(net231) );
  SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_1 clk_gate_time_us_start_looking_for_new_sim_time_reg ( 
        .CLK(clk), .EN(n108), .ENCLK(net236) );
  ffrhq_x1 \segment_last_timestamp_us_reg[1]  ( .D(N75), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[1]) );
  addf_x1 \intadd_1/U43  ( .A(segment_last_timestamp_us[2]), .B(
        \intadd_1/A[0] ), .CI(\intadd_1/CI ), .CO(\intadd_1/n42 ), .S(
        \intadd_1/SUM[0] ) );
  addf_x1 \intadd_1/U42  ( .A(segment_last_timestamp_us[3]), .B(
        \intadd_1/A[1] ), .CI(\intadd_1/n42 ), .CO(\intadd_1/n41 ), .S(
        \intadd_1/SUM[1] ) );
  addf_x1 \intadd_1/U41  ( .A(segment_last_timestamp_us[4]), .B(
        \intadd_1/A[2] ), .CI(\intadd_1/n41 ), .CO(\intadd_1/n40 ), .S(
        \intadd_1/SUM[2] ) );
  addf_x1 \intadd_1/U40  ( .A(segment_last_timestamp_us[5]), .B(
        \intadd_1/A[3] ), .CI(\intadd_1/n40 ), .CO(\intadd_1/n39 ), .S(
        \intadd_1/SUM[3] ) );
  addf_x1 \intadd_1/U39  ( .A(segment_last_timestamp_us[6]), .B(
        \intadd_1/A[4] ), .CI(\intadd_1/n39 ), .CO(\intadd_1/n38 ), .S(
        \intadd_1/SUM[4] ) );
  addf_x1 \intadd_1/U38  ( .A(segment_last_timestamp_us[7]), .B(
        \intadd_1/A[5] ), .CI(\intadd_1/n38 ), .CO(\intadd_1/n37 ), .S(
        \intadd_1/SUM[5] ) );
  addf_x1 \intadd_1/U37  ( .A(segment_last_timestamp_us[8]), .B(
        \intadd_1/A[6] ), .CI(\intadd_1/n37 ), .CO(\intadd_1/n36 ), .S(
        \intadd_1/SUM[6] ) );
  addf_x1 \intadd_1/U36  ( .A(segment_last_timestamp_us[9]), .B(
        \intadd_1/A[7] ), .CI(\intadd_1/n36 ), .CO(\intadd_1/n35 ), .S(
        \intadd_1/SUM[7] ) );
  addf_x1 \intadd_1/U35  ( .A(segment_last_timestamp_us[10]), .B(
        \intadd_1/A[8] ), .CI(\intadd_1/n35 ), .CO(\intadd_1/n34 ), .S(
        \intadd_1/SUM[8] ) );
  addf_x1 \intadd_1/U34  ( .A(segment_last_timestamp_us[11]), .B(
        \intadd_1/A[9] ), .CI(\intadd_1/n34 ), .CO(\intadd_1/n33 ), .S(
        \intadd_1/SUM[9] ) );
  addf_x1 \intadd_1/U33  ( .A(segment_last_timestamp_us[12]), .B(
        \intadd_1/A[10] ), .CI(\intadd_1/n33 ), .CO(\intadd_1/n32 ), .S(
        \intadd_1/SUM[10] ) );
  addf_x1 \intadd_1/U32  ( .A(segment_last_timestamp_us[13]), .B(
        \intadd_1/A[11] ), .CI(\intadd_1/n32 ), .CO(\intadd_1/n31 ), .S(
        \intadd_1/SUM[11] ) );
  addf_x1 \intadd_1/U31  ( .A(segment_last_timestamp_us[14]), .B(
        \intadd_1/A[12] ), .CI(\intadd_1/n31 ), .CO(\intadd_1/n30 ), .S(
        \intadd_1/SUM[12] ) );
  addf_x1 \intadd_1/U30  ( .A(segment_last_timestamp_us[15]), .B(
        \intadd_1/A[13] ), .CI(\intadd_1/n30 ), .CO(\intadd_1/n29 ), .S(
        \intadd_1/SUM[13] ) );
  addf_x1 \intadd_1/U29  ( .A(segment_last_timestamp_us[16]), .B(
        \intadd_1/A[14] ), .CI(\intadd_1/n29 ), .CO(\intadd_1/n28 ), .S(
        \intadd_1/SUM[14] ) );
  addf_x1 \intadd_1/U28  ( .A(segment_last_timestamp_us[17]), .B(
        \intadd_1/A[15] ), .CI(\intadd_1/n28 ), .CO(\intadd_1/n27 ), .S(
        \intadd_1/SUM[15] ) );
  addf_x1 \intadd_1/U27  ( .A(segment_last_timestamp_us[18]), .B(
        \intadd_1/A[16] ), .CI(\intadd_1/n27 ), .CO(\intadd_1/n26 ), .S(
        \intadd_1/SUM[16] ) );
  addf_x1 \intadd_1/U26  ( .A(segment_last_timestamp_us[19]), .B(
        \intadd_1/A[17] ), .CI(\intadd_1/n26 ), .CO(\intadd_1/n25 ), .S(
        \intadd_1/SUM[17] ) );
  addf_x1 \intadd_1/U25  ( .A(segment_last_timestamp_us[20]), .B(
        \intadd_1/A[18] ), .CI(\intadd_1/n25 ), .CO(\intadd_1/n24 ), .S(
        \intadd_1/SUM[18] ) );
  addf_x1 \intadd_1/U24  ( .A(segment_last_timestamp_us[21]), .B(
        \intadd_1/A[19] ), .CI(\intadd_1/n24 ), .CO(\intadd_1/n23 ), .S(
        \intadd_1/SUM[19] ) );
  addf_x1 \intadd_1/U23  ( .A(segment_last_timestamp_us[22]), .B(
        \intadd_1/A[20] ), .CI(\intadd_1/n23 ), .CO(\intadd_1/n22 ), .S(
        \intadd_1/SUM[20] ) );
  addf_x1 \intadd_1/U22  ( .A(segment_last_timestamp_us[23]), .B(
        \intadd_1/A[21] ), .CI(\intadd_1/n22 ), .CO(\intadd_1/n21 ), .S(
        \intadd_1/SUM[21] ) );
  addf_x1 \intadd_1/U21  ( .A(segment_last_timestamp_us[24]), .B(
        \intadd_1/A[22] ), .CI(\intadd_1/n21 ), .CO(\intadd_1/n20 ), .S(
        \intadd_1/SUM[22] ) );
  addf_x1 \intadd_1/U20  ( .A(segment_last_timestamp_us[25]), .B(
        \intadd_1/A[23] ), .CI(\intadd_1/n20 ), .CO(\intadd_1/n19 ), .S(
        \intadd_1/SUM[23] ) );
  addf_x1 \intadd_1/U19  ( .A(segment_last_timestamp_us[26]), .B(
        \intadd_1/A[24] ), .CI(\intadd_1/n19 ), .CO(\intadd_1/n18 ), .S(
        \intadd_1/SUM[24] ) );
  addf_x1 \intadd_1/U18  ( .A(segment_last_timestamp_us[27]), .B(
        \intadd_1/A[25] ), .CI(\intadd_1/n18 ), .CO(\intadd_1/n17 ), .S(
        \intadd_1/SUM[25] ) );
  addf_x1 \intadd_1/U17  ( .A(segment_last_timestamp_us[28]), .B(
        \intadd_1/A[26] ), .CI(\intadd_1/n17 ), .CO(\intadd_1/n16 ), .S(
        \intadd_1/SUM[26] ) );
  addf_x1 \intadd_1/U16  ( .A(segment_last_timestamp_us[29]), .B(
        \intadd_1/A[27] ), .CI(\intadd_1/n16 ), .CO(\intadd_1/n15 ), .S(
        \intadd_1/SUM[27] ) );
  addf_x1 \intadd_1/U15  ( .A(segment_last_timestamp_us[30]), .B(
        \intadd_1/A[28] ), .CI(\intadd_1/n15 ), .CO(\intadd_1/n14 ), .S(
        \intadd_1/SUM[28] ) );
  addf_x1 \intadd_1/U14  ( .A(segment_last_timestamp_us[31]), .B(
        \intadd_1/A[29] ), .CI(\intadd_1/n14 ), .CO(\intadd_1/n13 ), .S(
        \intadd_1/SUM[29] ) );
  addf_x1 \intadd_1/U13  ( .A(segment_last_timestamp_us[32]), .B(
        \intadd_1/A[30] ), .CI(\intadd_1/n13 ), .CO(\intadd_1/n12 ), .S(
        \intadd_1/SUM[30] ) );
  addf_x1 \intadd_1/U12  ( .A(segment_last_timestamp_us[33]), .B(
        \intadd_1/A[31] ), .CI(\intadd_1/n12 ), .CO(\intadd_1/n11 ), .S(
        \intadd_1/SUM[31] ) );
  addf_x1 \intadd_1/U11  ( .A(segment_last_timestamp_us[34]), .B(
        \intadd_1/A[32] ), .CI(\intadd_1/n11 ), .CO(\intadd_1/n10 ), .S(
        \intadd_1/SUM[32] ) );
  addf_x1 \intadd_1/U10  ( .A(segment_last_timestamp_us[35]), .B(
        \intadd_1/A[33] ), .CI(\intadd_1/n10 ), .CO(\intadd_1/n9 ), .S(
        \intadd_1/SUM[33] ) );
  addf_x1 \intadd_1/U9  ( .A(segment_last_timestamp_us[36]), .B(
        \intadd_1/A[34] ), .CI(\intadd_1/n9 ), .CO(\intadd_1/n8 ), .S(
        \intadd_1/SUM[34] ) );
  addf_x1 \intadd_1/U8  ( .A(segment_last_timestamp_us[37]), .B(
        \intadd_1/A[35] ), .CI(\intadd_1/n8 ), .CO(\intadd_1/n7 ), .S(
        \intadd_1/SUM[35] ) );
  addf_x1 \intadd_1/U7  ( .A(segment_last_timestamp_us[38]), .B(
        \intadd_1/A[36] ), .CI(\intadd_1/n7 ), .CO(\intadd_1/n6 ), .S(
        \intadd_1/SUM[36] ) );
  addf_x1 \intadd_1/U6  ( .A(segment_last_timestamp_us[39]), .B(
        \intadd_1/A[37] ), .CI(\intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(
        \intadd_1/SUM[37] ) );
  addf_x1 \intadd_1/U5  ( .A(segment_last_timestamp_us[40]), .B(
        \intadd_1/A[38] ), .CI(\intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(
        \intadd_1/SUM[38] ) );
  addf_x1 \intadd_1/U4  ( .A(segment_last_timestamp_us[41]), .B(
        \intadd_1/A[39] ), .CI(\intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(
        \intadd_1/SUM[39] ) );
  addf_x1 \intadd_1/U3  ( .A(segment_last_timestamp_us[42]), .B(
        \intadd_1/A[40] ), .CI(\intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(
        \intadd_1/SUM[40] ) );
  addf_x1 \intadd_1/U2  ( .A(segment_last_timestamp_us[43]), .B(
        \intadd_1/A[41] ), .CI(\intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(
        \intadd_1/SUM[41] ) );
  ffr_x1 \segment_last_timestamp_us_reg[5]  ( .D(N79), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[5]) );
  ffr_x1 \segment_last_timestamp_us_reg[20]  ( .D(N94), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[20]) );
  ffr_x1 \segment_last_timestamp_us_reg[35]  ( .D(N109), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[35]) );
  ffr_x1 \ravens_pkt_reg[9]  ( .D(net224), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[9]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[34]  ( .D(time_us[34]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[34]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[19]  ( .D(time_us[19]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[19]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[4]  ( .D(time_us[4]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[4]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[0]  ( .D(time_us[0]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[0]) );
  ffr_x1 \cur_sim_time_timestep_reg[0]  ( .D(N126), .CLK(net218), .RSTN(rst_n), 
        .Q(cur_sim_time_timestep[0]) );
  ffr_x1 \cur_fsm_state_reg[1]  ( .D(\next_fsm_state[1] ), .CLK(clk), .RSTN(
        rst_n), .Q(cur_fsm_state[1]) );
  ffr_x1 \cur_fsm_state_reg[2]  ( .D(n111), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[2]) );
  ffr_x1 \cur_fsm_state_reg[0]  ( .D(n109), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[0]) );
  ffr_x1 \cur_sim_time_timestep_reg[1]  ( .D(N127), .CLK(net218), .RSTN(rst_n), 
        .Q(cur_sim_time_timestep[1]) );
  ffr_x1 \cur_sim_time_timestep_reg[2]  ( .D(N128), .CLK(net218), .RSTN(rst_n), 
        .Q(cur_sim_time_timestep[2]) );
  ffr_x1 \cur_sim_time_timestep_reg[3]  ( .D(n1132), .CLK(net218), .RSTN(rst_n), .Q(cur_sim_time_timestep[3]) );
  ffr_x1 \segment_last_timestamp_us_reg[0]  ( .D(N74), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[0]) );
  ffr_x1 \segment_last_timestamp_us_reg[2]  ( .D(N76), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[2]) );
  ffr_x1 \segment_last_timestamp_us_reg[3]  ( .D(N77), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[3]) );
  ffr_x1 \segment_last_timestamp_us_reg[4]  ( .D(N78), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[4]) );
  ffr_x1 \segment_last_timestamp_us_reg[6]  ( .D(N80), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[6]) );
  ffr_x1 \segment_last_timestamp_us_reg[7]  ( .D(N81), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[7]) );
  ffr_x1 \segment_last_timestamp_us_reg[8]  ( .D(N82), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[8]) );
  ffr_x1 \segment_last_timestamp_us_reg[9]  ( .D(N83), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[9]) );
  ffr_x1 \segment_last_timestamp_us_reg[10]  ( .D(N84), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[10]) );
  ffr_x1 \segment_last_timestamp_us_reg[11]  ( .D(N85), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[11]) );
  ffr_x1 \segment_last_timestamp_us_reg[12]  ( .D(N86), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[12]) );
  ffr_x1 \segment_last_timestamp_us_reg[13]  ( .D(N87), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[13]) );
  ffr_x1 \segment_last_timestamp_us_reg[14]  ( .D(N88), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[14]) );
  ffr_x1 \segment_last_timestamp_us_reg[15]  ( .D(N89), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[15]) );
  ffr_x1 \segment_last_timestamp_us_reg[16]  ( .D(N90), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[16]) );
  ffr_x1 \segment_last_timestamp_us_reg[17]  ( .D(N91), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[17]) );
  ffr_x1 \segment_last_timestamp_us_reg[18]  ( .D(N92), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[18]) );
  ffr_x1 \segment_last_timestamp_us_reg[19]  ( .D(N93), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[19]) );
  ffr_x1 \segment_last_timestamp_us_reg[21]  ( .D(N95), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[21]) );
  ffr_x1 \segment_last_timestamp_us_reg[22]  ( .D(N96), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[22]) );
  ffr_x1 \segment_last_timestamp_us_reg[23]  ( .D(N97), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[23]) );
  ffr_x1 \segment_last_timestamp_us_reg[24]  ( .D(N98), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[24]) );
  ffr_x1 \segment_last_timestamp_us_reg[25]  ( .D(N99), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[25]) );
  ffr_x1 \segment_last_timestamp_us_reg[26]  ( .D(N100), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[26]) );
  ffr_x1 \segment_last_timestamp_us_reg[27]  ( .D(N101), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[27]) );
  ffr_x1 \segment_last_timestamp_us_reg[28]  ( .D(N102), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[28]) );
  ffr_x1 \segment_last_timestamp_us_reg[29]  ( .D(N103), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[29]) );
  ffr_x1 \segment_last_timestamp_us_reg[30]  ( .D(N104), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[30]) );
  ffr_x1 \segment_last_timestamp_us_reg[31]  ( .D(N105), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[31]) );
  ffr_x1 \segment_last_timestamp_us_reg[32]  ( .D(N106), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[32]) );
  ffr_x1 \segment_last_timestamp_us_reg[33]  ( .D(N107), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[33]) );
  ffr_x1 \segment_last_timestamp_us_reg[34]  ( .D(N108), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[34]) );
  ffr_x1 \segment_last_timestamp_us_reg[36]  ( .D(N110), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[36]) );
  ffr_x1 \segment_last_timestamp_us_reg[37]  ( .D(N111), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[37]) );
  ffr_x1 \segment_last_timestamp_us_reg[38]  ( .D(N112), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[38]) );
  ffr_x1 \segment_last_timestamp_us_reg[39]  ( .D(N113), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[39]) );
  ffr_x1 \segment_last_timestamp_us_reg[40]  ( .D(N114), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[40]) );
  ffr_x1 \segment_last_timestamp_us_reg[41]  ( .D(N115), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[41]) );
  ffr_x1 \segment_last_timestamp_us_reg[42]  ( .D(N116), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[42]) );
  ffr_x1 \segment_last_timestamp_us_reg[43]  ( .D(N117), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[43]) );
  ffr_x1 \segment_last_timestamp_us_reg[44]  ( .D(N118), .CLK(net218), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[44]) );
  ffr_x1 \ravens_pkt_reg[30]  ( .D(n112), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[30]) );
  ffr_x1 \ravens_pkt_reg[29]  ( .D(n113), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[29]) );
  ffr_x1 \ravens_pkt_reg[12]  ( .D(net221), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[12]) );
  ffr_x1 \ravens_pkt_reg[11]  ( .D(net222), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[11]) );
  ffr_x1 \ravens_pkt_reg[10]  ( .D(net223), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[10]) );
  ffr_x1 \ravens_pkt_reg[8]  ( .D(net225), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[8]) );
  ffr_x1 \ravens_pkt_reg[7]  ( .D(net226), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[7]) );
  ffr_x1 \ravens_pkt_reg[6]  ( .D(net227), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[6]) );
  ffr_x1 \ravens_pkt_reg[5]  ( .D(net228), .CLK(net231), .RSTN(rst_n), .Q(
        ravens_pkt[5]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[44]  ( .D(time_us[44]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[44]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[43]  ( .D(time_us[43]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[43]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[42]  ( .D(time_us[42]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[42]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[41]  ( .D(time_us[41]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[41]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[40]  ( .D(time_us[40]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[40]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[39]  ( .D(time_us[39]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[39]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[38]  ( .D(time_us[38]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[38]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[37]  ( .D(time_us[37]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[37]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[36]  ( .D(time_us[36]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[36]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[35]  ( .D(time_us[35]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[35]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[33]  ( .D(time_us[33]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[33]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[32]  ( .D(time_us[32]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[32]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[31]  ( .D(time_us[31]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[31]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[30]  ( .D(time_us[30]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[30]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[29]  ( .D(time_us[29]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[29]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[28]  ( .D(time_us[28]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[28]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[27]  ( .D(time_us[27]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[27]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[26]  ( .D(time_us[26]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[26]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[25]  ( .D(time_us[25]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[25]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[24]  ( .D(time_us[24]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[24]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[23]  ( .D(time_us[23]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[23]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[22]  ( .D(time_us[22]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[22]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[21]  ( .D(time_us[21]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[21]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[20]  ( .D(time_us[20]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[20]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[18]  ( .D(time_us[18]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[18]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[17]  ( .D(time_us[17]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[17]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[16]  ( .D(time_us[16]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[16]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[15]  ( .D(time_us[15]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[15]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[14]  ( .D(time_us[14]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[14]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[13]  ( .D(time_us[13]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[13]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[12]  ( .D(time_us[12]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[12]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[11]  ( .D(time_us[11]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[11]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[10]  ( .D(time_us[10]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[10]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[9]  ( .D(time_us[9]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[9]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[8]  ( .D(time_us[8]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[8]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[7]  ( .D(time_us[7]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[7]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[6]  ( .D(time_us[6]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[6]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[5]  ( .D(time_us[5]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[5]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[3]  ( .D(time_us[3]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[3]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[2]  ( .D(time_us[2]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[2]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[1]  ( .D(time_us[1]), 
        .CLK(net236), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[1]) );
  inv_x1 U3 ( .A(n512), .Y(n532) );
  inv_x1 U4 ( .A(n476), .Y(n501) );
  inv_x1 U5 ( .A(n384), .Y(n411) );
  nand3_x1 U6 ( .A(n87), .B(\intadd_1/SUM[34] ), .C(n91), .Y(n81) );
  nand2_x1 U7 ( .A(n81), .B(n88), .Y(n82) );
  nor2_x1 U8 ( .A(n83), .B(n82), .Y(n94) );
  nand2_x1 U9 ( .A(n145), .B(n151), .Y(n153) );
  nand2_x1 U10 ( .A(n234), .B(n241), .Y(n235) );
  nand2_x1 U11 ( .A(n265), .B(n272), .Y(n270) );
  nand2_x1 U12 ( .A(n286), .B(n285), .Y(n287) );
  nand2_x1 U13 ( .A(n293), .B(n300), .Y(n297) );
  nand2_x1 U14 ( .A(n339), .B(n346), .Y(n344) );
  nand2_x1 U15 ( .A(n359), .B(n358), .Y(n360) );
  nand2_x1 U16 ( .A(n533), .B(n541), .Y(n537) );
  nand2_x1 U17 ( .A(n564), .B(n570), .Y(n565) );
  and4_x1 U18 ( .A(cur_sim_time_timestep[2]), .B(cur_fsm_state[0]), .C(
        cur_sim_time_timestep[3]), .D(n1119), .Y(n1121) );
  or2_x1 U19 ( .A(n587), .B(n588), .Y(n591) );
  nand3_x2 U20 ( .A(n569), .B(\intadd_1/SUM[2] ), .C(n573), .Y(n564) );
  nand2_x1 U21 ( .A(n553), .B(n552), .Y(n551) );
  nand2_x1 U22 ( .A(n554), .B(n555), .Y(n561) );
  or2_x1 U23 ( .A(n537), .B(n538), .Y(n545) );
  nand3_x2 U24 ( .A(n540), .B(\intadd_1/SUM[4] ), .C(n536), .Y(n533) );
  nand2_x2 U25 ( .A(n518), .B(n524), .Y(n522) );
  nand2_x2 U26 ( .A(n509), .B(n508), .Y(n510) );
  nor2_x1 U27 ( .A(n511), .B(n515), .Y(n498) );
  nand3_x2 U28 ( .A(n506), .B(\intadd_1/SUM[6] ), .C(n504), .Y(n509) );
  or2_x1 U29 ( .A(n494), .B(n495), .Y(n500) );
  nand2_x2 U30 ( .A(n473), .B(n479), .Y(n474) );
  nand3_x2 U31 ( .A(n478), .B(\intadd_1/SUM[8] ), .C(n482), .Y(n473) );
  or2_x1 U32 ( .A(n462), .B(n463), .Y(n470) );
  nand2_x2 U33 ( .A(n442), .B(n449), .Y(n447) );
  nand2_x2 U34 ( .A(n435), .B(n434), .Y(n436) );
  nand2_x1 U35 ( .A(n441), .B(n435), .Y(n423) );
  nand3_x2 U36 ( .A(\intadd_1/SUM[11] ), .B(n430), .C(n433), .Y(n435) );
  nand2_x2 U37 ( .A(n413), .B(n419), .Y(n414) );
  nand3_x2 U38 ( .A(n418), .B(\intadd_1/SUM[12] ), .C(n422), .Y(n413) );
  nand2_x2 U39 ( .A(n381), .B(n388), .Y(n382) );
  nand3_x2 U40 ( .A(n387), .B(\intadd_1/SUM[14] ), .C(n391), .Y(n381) );
  or2_x1 U41 ( .A(n376), .B(n375), .Y(n379) );
  or2_x1 U42 ( .A(n360), .B(n361), .Y(n364) );
  nand3_x2 U43 ( .A(\intadd_1/SUM[17] ), .B(n343), .C(n340), .Y(n339) );
  nand3_x2 U44 ( .A(n328), .B(\intadd_1/SUM[18] ), .C(n332), .Y(n324) );
  or2_x1 U45 ( .A(n312), .B(n313), .Y(n321) );
  nand2_x2 U46 ( .A(n308), .B(n316), .Y(n312) );
  nand3_x2 U47 ( .A(n299), .B(\intadd_1/SUM[20] ), .C(n303), .Y(n293) );
  or2_x1 U48 ( .A(n287), .B(n288), .Y(n291) );
  nand3_x2 U49 ( .A(\intadd_1/SUM[21] ), .B(n280), .C(n283), .Y(n286) );
  nor2b_x1 U50 ( .AN(n277), .B(n271), .Y(n260) );
  nand3_x2 U51 ( .A(n266), .B(\intadd_1/SUM[22] ), .C(n269), .Y(n265) );
  nor2b_x1 U52 ( .AN(n251), .B(n250), .Y(n252) );
  inv_x1 U53 ( .A(n250), .Y(n257) );
  nand3_x2 U54 ( .A(n240), .B(\intadd_1/SUM[24] ), .C(n244), .Y(n234) );
  or2_x1 U55 ( .A(n229), .B(n228), .Y(n232) );
  nand2_x2 U56 ( .A(n219), .B(n225), .Y(n229) );
  nand2_x2 U57 ( .A(n211), .B(n210), .Y(n212) );
  nand3_x2 U58 ( .A(n208), .B(\intadd_1/SUM[26] ), .C(n206), .Y(n211) );
  nand2_x2 U59 ( .A(n191), .B(n198), .Y(n196) );
  nor2b_x1 U60 ( .AN(n203), .B(n197), .Y(n186) );
  nand3_x2 U61 ( .A(\intadd_1/SUM[27] ), .B(n195), .C(n192), .Y(n191) );
  inv_x1 U62 ( .A(n176), .Y(n183) );
  nor2b_x1 U63 ( .AN(n177), .B(n176), .Y(n178) );
  nand3_x2 U64 ( .A(n185), .B(\intadd_1/SUM[28] ), .C(n182), .Y(n177) );
  nand2_x2 U65 ( .A(n159), .B(n167), .Y(n160) );
  nand3_x2 U66 ( .A(n150), .B(\intadd_1/SUM[30] ), .C(n148), .Y(n145) );
  or2_x1 U67 ( .A(n139), .B(n140), .Y(n143) );
  nand2_x2 U68 ( .A(n138), .B(n137), .Y(n139) );
  nand3_x2 U69 ( .A(\intadd_1/SUM[31] ), .B(n132), .C(n135), .Y(n138) );
  nand2_x2 U70 ( .A(n117), .B(n124), .Y(n122) );
  nor2b_x1 U71 ( .AN(n129), .B(n123), .Y(n107) );
  nand3_x2 U72 ( .A(n118), .B(\intadd_1/SUM[32] ), .C(n121), .Y(n117) );
  nor2b_x1 U73 ( .AN(n98), .B(n97), .Y(n99) );
  inv_x1 U74 ( .A(n97), .Y(n104) );
  nor2_x2 U75 ( .A(n72), .B(n71), .Y(n73) );
  nor2_x2 U76 ( .A(n69), .B(n71), .Y(n75) );
  aoi2bb1_x2 U77 ( .A0N(n65), .A1N(n64), .B0(n70), .Y(n71) );
  nand2_x2 U78 ( .A(n58), .B(n57), .Y(n61) );
  nand2_x2 U79 ( .A(n36), .B(n35), .Y(n48) );
  nor2b_x2 U80 ( .AN(n30), .B(\intadd_1/SUM[40] ), .Y(n36) );
  nand2_x2 U81 ( .A(\intadd_1/SUM[39] ), .B(n31), .Y(n30) );
  nand2_x2 U82 ( .A(\intadd_1/SUM[38] ), .B(n32), .Y(n29) );
  and2_x2 U83 ( .A(n28), .B(n27), .Y(n32) );
  nor2_x2 U84 ( .A(\intadd_1/SUM[41] ), .B(n33), .Y(n28) );
  nor2_x1 U85 ( .A(n161), .B(n160), .Y(n173) );
  or2_x1 U86 ( .A(n196), .B(n197), .Y(n202) );
  nor2_x1 U87 ( .A(n326), .B(n325), .Y(n335) );
  nor2_x1 U88 ( .A(n511), .B(n510), .Y(n516) );
  nand2_x1 U89 ( .A(\intadd_1/SUM[1] ), .B(n585), .Y(n582) );
  nand2b_x1 U90 ( .AN(n61), .B(n60), .Y(n62) );
  nand3_x1 U91 ( .A(n183), .B(n185), .C(\intadd_1/SUM[28] ), .Y(n181) );
  nand2_x1 U92 ( .A(n195), .B(n194), .Y(n193) );
  nand2_x1 U93 ( .A(n222), .B(n221), .Y(n220) );
  nand2_x1 U94 ( .A(n280), .B(n279), .Y(n278) );
  nand2_x1 U95 ( .A(n324), .B(n329), .Y(n325) );
  nand2_x1 U96 ( .A(n332), .B(n331), .Y(n330) );
  nand2_x1 U97 ( .A(\intadd_1/SUM[17] ), .B(n346), .Y(n338) );
  nand2_x1 U98 ( .A(n391), .B(n390), .Y(n389) );
  nand3_x1 U99 ( .A(n388), .B(n387), .C(\intadd_1/SUM[14] ), .Y(n390) );
  nor2b_x1 U100 ( .AN(n397), .B(n399), .Y(n403) );
  nand2_x1 U101 ( .A(n422), .B(n421), .Y(n420) );
  nand3_x1 U102 ( .A(n419), .B(n418), .C(\intadd_1/SUM[12] ), .Y(n421) );
  nand2_x1 U103 ( .A(\intadd_1/SUM[11] ), .B(n434), .Y(n432) );
  or2_x1 U104 ( .A(n522), .B(n521), .Y(n531) );
  nor2_x1 U105 ( .A(n550), .B(n548), .Y(n543) );
  nand2_x1 U106 ( .A(n593), .B(n597), .Y(n601) );
  nand2_x1 U107 ( .A(n608), .B(n624), .Y(n615) );
  nand2_x1 U108 ( .A(n600), .B(n599), .Y(n598) );
  nand3_x1 U109 ( .A(n597), .B(n596), .C(\intadd_1/SUM[0] ), .Y(n599) );
  nand2_x1 U110 ( .A(cur_sim_time_timestep[0]), .B(n730), .Y(n625) );
  nor2_x1 U111 ( .A(\intadd_1/SUM[41] ), .B(n32), .Y(n49) );
  nor2_x1 U112 ( .A(n41), .B(n40), .Y(n44) );
  or2_x1 U113 ( .A(n122), .B(n123), .Y(n128) );
  nand3_x1 U114 ( .A(n167), .B(\intadd_1/SUM[29] ), .C(n166), .Y(n169) );
  nor2_x1 U115 ( .A(n213), .B(n212), .Y(n218) );
  nor2_x1 U116 ( .A(n236), .B(n235), .Y(n247) );
  or2_x1 U117 ( .A(n270), .B(n271), .Y(n276) );
  nor2_x1 U118 ( .A(n298), .B(n297), .Y(n306) );
  nor2_x1 U119 ( .A(n375), .B(n374), .Y(n362) );
  or2_x1 U120 ( .A(n344), .B(n345), .Y(n350) );
  nor2_x1 U121 ( .A(n361), .B(n357), .Y(n348) );
  nand2_x1 U122 ( .A(n403), .B(n404), .Y(n410) );
  nor2_x1 U123 ( .A(n415), .B(n426), .Y(n408) );
  nor2_x1 U124 ( .A(n463), .B(n453), .Y(n454) );
  or2_x1 U125 ( .A(n436), .B(n437), .Y(n440) );
  nor2_x1 U126 ( .A(n446), .B(n445), .Y(n438) );
  nor2_x1 U127 ( .A(n475), .B(n486), .Y(n468) );
  nand2_x1 U128 ( .A(n482), .B(n481), .Y(n480) );
  nand3_x1 U129 ( .A(n479), .B(n478), .C(\intadd_1/SUM[8] ), .Y(n481) );
  nand2_x1 U130 ( .A(n504), .B(n503), .Y(n502) );
  nand3_x1 U131 ( .A(n508), .B(n506), .C(\intadd_1/SUM[6] ), .Y(n503) );
  nand2_x1 U132 ( .A(n536), .B(n535), .Y(n534) );
  nand3_x1 U133 ( .A(n541), .B(n540), .C(\intadd_1/SUM[4] ), .Y(n535) );
  and2_x1 U134 ( .A(n549), .B(n556), .Y(n554) );
  nor2_x1 U135 ( .A(n566), .B(n577), .Y(n559) );
  nand2_x1 U136 ( .A(ravens_spike_timestamp_us[0]), .B(n988), .Y(n663) );
  nand2_x1 U137 ( .A(n573), .B(n572), .Y(n571) );
  nand3_x1 U138 ( .A(n570), .B(n569), .C(\intadd_1/SUM[2] ), .Y(n572) );
  or2_x1 U139 ( .A(n619), .B(n618), .Y(n622) );
  nand2_x1 U140 ( .A(n607), .B(n624), .Y(n619) );
  nand2_x1 U141 ( .A(time_us_start_looking_for_new_sim_time[44]), .B(n1114), 
        .Y(n981) );
  nand2_x1 U142 ( .A(n986), .B(n985), .Y(n1119) );
  xor2_x1 U143 ( .A(n41), .B(n40), .Y(n25) );
  xor2_x1 U144 ( .A(n326), .B(n325), .Y(n26) );
  nand3_x1 U145 ( .A(\intadd_1/SUM[39] ), .B(\intadd_1/SUM[40] ), .C(
        \intadd_1/SUM[38] ), .Y(n27) );
  nor2_x1 U146 ( .A(n33), .B(n32), .Y(n43) );
  nor2_x1 U147 ( .A(n154), .B(n153), .Y(n157) );
  nor2_x1 U148 ( .A(segment_last_timestamp_us[5]), .B(\intadd_1/A[3] ), .Y(
        n669) );
  nor2_x1 U149 ( .A(ravens_spike_timestamp_us[8]), .B(n677), .Y(n654) );
  nand2_x1 U150 ( .A(segment_last_timestamp_us[6]), .B(\intadd_1/A[4] ), .Y(
        n671) );
  nor2_x1 U151 ( .A(segment_last_timestamp_us[10]), .B(\intadd_1/A[8] ), .Y(
        n656) );
  nand2_x1 U152 ( .A(ravens_spike_timestamp_us[11]), .B(n1029), .Y(n658) );
  nand2_x1 U153 ( .A(n311), .B(n310), .Y(n309) );
  nor2_x1 U154 ( .A(segment_last_timestamp_us[9]), .B(\intadd_1/A[7] ), .Y(
        n677) );
  nor2_x1 U155 ( .A(segment_last_timestamp_us[12]), .B(\intadd_1/A[10] ), .Y(
        n660) );
  nand2_x1 U156 ( .A(ravens_spike_timestamp_us[13]), .B(n1034), .Y(n662) );
  nor2_x1 U157 ( .A(n383), .B(n395), .Y(n377) );
  nor2_x1 U158 ( .A(segment_last_timestamp_us[19]), .B(\intadd_1/A[17] ), .Y(
        n692) );
  nand2_x1 U159 ( .A(segment_last_timestamp_us[20]), .B(\intadd_1/A[18] ), .Y(
        n653) );
  nand2_x1 U160 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(
        \intadd_1/A[6] ), .Y(n752) );
  nor2_x1 U161 ( .A(segment_last_timestamp_us[23]), .B(\intadd_1/A[21] ), .Y(
        n697) );
  nor2_x1 U162 ( .A(n698), .B(ravens_spike_timestamp_us[22]), .Y(n700) );
  nor2_x1 U163 ( .A(segment_last_timestamp_us[27]), .B(\intadd_1/A[25] ), .Y(
        n703) );
  nor2_x1 U164 ( .A(n538), .B(n528), .Y(n529) );
  or2_x1 U165 ( .A(time_us_start_looking_for_new_sim_time[12]), .B(
        \intadd_1/A[10] ), .Y(n849) );
  nor2_x1 U166 ( .A(time_us_start_looking_for_new_sim_time[14]), .B(
        \intadd_1/A[12] ), .Y(n944) );
  nor2_x1 U167 ( .A(time_us_start_looking_for_new_sim_time[20]), .B(
        \intadd_1/A[18] ), .Y(n919) );
  nor2_x1 U168 ( .A(time_us_start_looking_for_new_sim_time[30]), .B(
        \intadd_1/A[28] ), .Y(n871) );
  nor2_x1 U169 ( .A(time_us_start_looking_for_new_sim_time[34]), .B(
        \intadd_1/A[32] ), .Y(n909) );
  nand2_x1 U170 ( .A(n894), .B(n898), .Y(n851) );
  or2_x1 U171 ( .A(time_us_start_looking_for_new_sim_time[24]), .B(
        \intadd_1/A[22] ), .Y(n781) );
  nor2_x1 U172 ( .A(segment_last_timestamp_us[36]), .B(\intadd_1/A[34] ), .Y(
        n642) );
  nor2_x1 U173 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(n952), .Y(
        n964) );
  nor2_x1 U174 ( .A(time_us_start_looking_for_new_sim_time[17]), .B(
        \intadd_1/A[15] ), .Y(n935) );
  nor2_x1 U175 ( .A(n602), .B(n605), .Y(n589) );
  nor2_x1 U176 ( .A(time_us_start_looking_for_new_sim_time[10]), .B(
        \intadd_1/A[8] ), .Y(n889) );
  nor2_x1 U177 ( .A(segment_last_timestamp_us[44]), .B(n1114), .Y(n719) );
  nor2_x1 U178 ( .A(n602), .B(n601), .Y(n606) );
  nor2_x1 U179 ( .A(n648), .B(n632), .Y(n722) );
  nand3_x1 U180 ( .A(n725), .B(ravens_spike_timestamp_us[44]), .C(n724), .Y(
        n726) );
  nand3_x1 U181 ( .A(segment_last_timestamp_us[5]), .B(n1009), .C(n1002), .Y(
        n1008) );
  nand2_x1 U182 ( .A(segment_last_timestamp_us[42]), .B(n1106), .Y(n1108) );
  nand2_x1 U183 ( .A(segment_last_timestamp_us[26]), .B(n1066), .Y(n1068) );
  nand2_x1 U184 ( .A(segment_last_timestamp_us[12]), .B(n1031), .Y(n1033) );
  oai2bb1_x1 U185 ( .A0N(n1104), .A1N(n1103), .B0(n113), .Y(n1105) );
  and2_x1 U186 ( .A(segment_last_timestamp_us[35]), .B(n1089), .Y(n1091) );
  and2_x1 U187 ( .A(segment_last_timestamp_us[29]), .B(n1074), .Y(n1076) );
  oai2bb1_x1 U188 ( .A0N(n1059), .A1N(n1058), .B0(n113), .Y(n1060) );
  and2_x1 U189 ( .A(segment_last_timestamp_us[17]), .B(n1044), .Y(n1046) );
  oai2bb1_x1 U190 ( .A0N(n1029), .A1N(n1028), .B0(n113), .Y(n1030) );
  and2_x1 U191 ( .A(segment_last_timestamp_us[2]), .B(n994), .Y(n997) );
  and2_x1 U192 ( .A(cur_sim_time_timestep[2]), .B(n734), .Y(n736) );
  nand2_x1 U193 ( .A(n1120), .B(n737), .Y(N140) );
  nor2_x1 U194 ( .A(n736), .B(n735), .Y(N128) );
  inv_x1 U195 ( .A(cur_sim_time_timestep[1]), .Y(n1118) );
  inv_x1 U196 ( .A(\intadd_1/SUM[3] ), .Y(n547) );
  inv_x1 U197 ( .A(\intadd_1/SUM[8] ), .Y(n472) );
  inv_x1 U198 ( .A(\intadd_1/SUM[13] ), .Y(n396) );
  inv_x1 U199 ( .A(\intadd_1/SUM[18] ), .Y(n323) );
  inv_x1 U200 ( .A(\intadd_1/SUM[23] ), .Y(n249) );
  inv_x1 U201 ( .A(\intadd_1/SUM[28] ), .Y(n175) );
  inv_x1 U202 ( .A(\intadd_1/SUM[33] ), .Y(n96) );
  inv_x1 U203 ( .A(segment_last_timestamp_us[44]), .Y(n1112) );
  inv_x1 U204 ( .A(ravens_spike_timestamp_us[44]), .Y(n1114) );
  xnor3_alt_x1 U205 ( .A(n1112), .B(n1114), .C(\intadd_1/n1 ), .Y(n33) );
  oai21_x1 U206 ( .A0(\intadd_1/SUM[38] ), .A1(n28), .B0(n29), .Y(n41) );
  inv_x1 U207 ( .A(n29), .Y(n31) );
  inv_x1 U208 ( .A(\intadd_1/SUM[37] ), .Y(n38) );
  oai21_x1 U209 ( .A0(\intadd_1/SUM[39] ), .A1(n31), .B0(n30), .Y(n39) );
  nor3_x1 U210 ( .A(n38), .B(n39), .C(n41), .Y(n42) );
  nor2b_x1 U211 ( .AN(n49), .B(n42), .Y(n34) );
  aoi21_x1 U212 ( .A0(n36), .A1(n34), .B0(n43), .Y(n37) );
  nand2b_x2 U213 ( .AN(n37), .B(\intadd_1/SUM[37] ), .Y(n40) );
  nor2_x1 U214 ( .A(n42), .B(n37), .Y(n35) );
  oai21_x1 U215 ( .A0(n36), .A1(n35), .B0(n48), .Y(n59) );
  mxi2_x1 U216 ( .A0(n38), .A1(\intadd_1/SUM[37] ), .S(n37), .YN(n56) );
  inv_x1 U217 ( .A(n56), .Y(n51) );
  nand3_x1 U218 ( .A(n51), .B(\intadd_1/SUM[36] ), .C(n25), .Y(n58) );
  inv_x1 U219 ( .A(n39), .Y(n45) );
  oai2bb2_x1 U220 ( .B0(n45), .B1(n44), .A0N(n43), .A1N(n42), .Y(n60) );
  nand2_x1 U221 ( .A(n58), .B(n60), .Y(n46) );
  oai22_x1 U222 ( .A0(n49), .A1(n48), .B0(n59), .B1(n46), .Y(n47) );
  aoi21_x1 U223 ( .A0(n49), .A1(n48), .B0(n47), .Y(n50) );
  inv_x2 U224 ( .A(n50), .Y(n57) );
  nand3_x1 U225 ( .A(n57), .B(n51), .C(\intadd_1/SUM[36] ), .Y(n53) );
  nand2_x1 U226 ( .A(n25), .B(n53), .Y(n52) );
  oai21_x1 U227 ( .A0(n25), .A1(n53), .B0(n52), .Y(n65) );
  inv_x1 U228 ( .A(n65), .Y(n76) );
  inv_x1 U229 ( .A(\intadd_1/SUM[36] ), .Y(n54) );
  mxi2_x1 U230 ( .A0(n54), .A1(\intadd_1/SUM[36] ), .S(n57), .YN(n66) );
  inv_x1 U231 ( .A(n66), .Y(n74) );
  inv_x1 U232 ( .A(\intadd_1/SUM[35] ), .Y(n72) );
  nand2_x1 U233 ( .A(\intadd_1/SUM[36] ), .B(n57), .Y(n55) );
  xnor2_x1 U234 ( .A(n56), .B(n55), .Y(n68) );
  nor3_x1 U235 ( .A(n74), .B(n72), .C(n68), .Y(n69) );
  xnor2_x1 U236 ( .A(n60), .B(n61), .Y(n80) );
  nand2b_x1 U237 ( .AN(n69), .B(n80), .Y(n64) );
  inv_x1 U238 ( .A(n59), .Y(n63) );
  xnor2_x1 U239 ( .A(n63), .B(n62), .Y(n70) );
  xnor2_x1 U240 ( .A(n76), .B(n75), .Y(n95) );
  nand2_x1 U241 ( .A(n66), .B(n73), .Y(n67) );
  aoi22_x1 U242 ( .A0(n70), .A1(n69), .B0(n68), .B1(n67), .Y(n83) );
  mxi2_x1 U243 ( .A0(\intadd_1/SUM[35] ), .A1(n72), .S(n71), .YN(n87) );
  xnor2_x1 U244 ( .A(n74), .B(n73), .Y(n91) );
  nand2_x2 U245 ( .A(n76), .B(n75), .Y(n79) );
  nor2_x1 U246 ( .A(n83), .B(n95), .Y(n77) );
  aoi22_x1 U247 ( .A0(n77), .A1(n81), .B0(n80), .B1(n79), .Y(n78) );
  oai21_x1 U248 ( .A0(n80), .A1(n79), .B0(n78), .Y(n88) );
  xnor2_x1 U249 ( .A(n83), .B(n82), .Y(n84) );
  inv_x1 U250 ( .A(n84), .Y(n115) );
  nand2_x1 U251 ( .A(\intadd_1/SUM[34] ), .B(n88), .Y(n85) );
  xnor2_x1 U252 ( .A(n87), .B(n85), .Y(n103) );
  inv_x1 U253 ( .A(\intadd_1/SUM[34] ), .Y(n86) );
  mxi2_x1 U254 ( .A0(n86), .A1(\intadd_1/SUM[34] ), .S(n88), .YN(n106) );
  nand3_x1 U255 ( .A(\intadd_1/SUM[33] ), .B(n103), .C(n106), .Y(n98) );
  nand2_x1 U256 ( .A(n115), .B(n98), .Y(n92) );
  nand3_x1 U257 ( .A(n88), .B(n87), .C(\intadd_1/SUM[34] ), .Y(n90) );
  nand2_x1 U258 ( .A(n91), .B(n90), .Y(n89) );
  oai21_x1 U259 ( .A0(n91), .A1(n90), .B0(n89), .Y(n100) );
  oai22_x1 U260 ( .A0(n92), .A1(n100), .B0(n95), .B1(n94), .Y(n93) );
  aoi21_x1 U261 ( .A0(n95), .A1(n94), .B0(n93), .Y(n97) );
  mxi2_x1 U262 ( .A0(n96), .A1(\intadd_1/SUM[33] ), .S(n104), .YN(n118) );
  nand2b_x2 U263 ( .AN(n100), .B(n99), .Y(n114) );
  xnor2_x1 U264 ( .A(n100), .B(n99), .Y(n129) );
  nand3_x1 U265 ( .A(n104), .B(\intadd_1/SUM[33] ), .C(n106), .Y(n102) );
  nand2_x1 U266 ( .A(n103), .B(n102), .Y(n101) );
  oai21_x1 U267 ( .A0(n103), .A1(n102), .B0(n101), .Y(n123) );
  nand2_x1 U268 ( .A(\intadd_1/SUM[33] ), .B(n104), .Y(n105) );
  xnor2_x1 U269 ( .A(n106), .B(n105), .Y(n121) );
  aoi22_x1 U270 ( .A0(n107), .A1(n117), .B0(n115), .B1(n114), .Y(n110) );
  oai21_x1 U271 ( .A0(n115), .A1(n114), .B0(n110), .Y(n124) );
  nand2_x1 U272 ( .A(\intadd_1/SUM[32] ), .B(n124), .Y(n116) );
  xnor2_x1 U273 ( .A(n118), .B(n116), .Y(n132) );
  nand3_x1 U274 ( .A(n124), .B(n118), .C(\intadd_1/SUM[32] ), .Y(n120) );
  nand2_x1 U275 ( .A(n121), .B(n120), .Y(n119) );
  oai21_x1 U276 ( .A0(n121), .A1(n120), .B0(n119), .Y(n140) );
  xnor2_x1 U277 ( .A(n123), .B(n122), .Y(n136) );
  nor2_x1 U278 ( .A(n140), .B(n136), .Y(n126) );
  inv_x1 U279 ( .A(\intadd_1/SUM[32] ), .Y(n125) );
  mxi2_x1 U280 ( .A0(n125), .A1(\intadd_1/SUM[32] ), .S(n124), .YN(n135) );
  aoi22_x1 U281 ( .A0(n126), .A1(n138), .B0(n129), .B1(n128), .Y(n127) );
  oai21_x1 U282 ( .A0(n129), .A1(n128), .B0(n127), .Y(n137) );
  nand3_x1 U283 ( .A(n137), .B(\intadd_1/SUM[31] ), .C(n135), .Y(n131) );
  nand2_x1 U284 ( .A(n132), .B(n131), .Y(n130) );
  oai21_x1 U285 ( .A0(n132), .A1(n131), .B0(n130), .Y(n154) );
  inv_x1 U286 ( .A(\intadd_1/SUM[31] ), .Y(n133) );
  mxi2_x1 U287 ( .A0(n133), .A1(\intadd_1/SUM[31] ), .S(n137), .YN(n150) );
  nand2_x1 U288 ( .A(\intadd_1/SUM[31] ), .B(n137), .Y(n134) );
  xnor2_x1 U289 ( .A(n135), .B(n134), .Y(n148) );
  inv_x1 U290 ( .A(n136), .Y(n144) );
  xnor2_x1 U291 ( .A(n140), .B(n139), .Y(n158) );
  nor2_x1 U292 ( .A(n154), .B(n158), .Y(n141) );
  aoi22_x1 U293 ( .A0(n141), .A1(n145), .B0(n144), .B1(n143), .Y(n142) );
  oai21_x1 U294 ( .A0(n144), .A1(n143), .B0(n142), .Y(n151) );
  xnor2_x1 U295 ( .A(n154), .B(n153), .Y(n174) );
  nand3_x1 U296 ( .A(n151), .B(n150), .C(\intadd_1/SUM[30] ), .Y(n147) );
  nand2_x1 U297 ( .A(n148), .B(n147), .Y(n146) );
  oai21_x1 U298 ( .A0(n148), .A1(n147), .B0(n146), .Y(n161) );
  nand2_x1 U299 ( .A(\intadd_1/SUM[30] ), .B(n151), .Y(n149) );
  xnor2_x1 U300 ( .A(n150), .B(n149), .Y(n170) );
  inv_x1 U301 ( .A(\intadd_1/SUM[30] ), .Y(n152) );
  mxi2_x1 U302 ( .A0(n152), .A1(\intadd_1/SUM[30] ), .S(n151), .YN(n166) );
  nand3_x1 U303 ( .A(\intadd_1/SUM[29] ), .B(n170), .C(n166), .Y(n159) );
  nand2b_x1 U304 ( .AN(n174), .B(n159), .Y(n155) );
  oai22_x1 U305 ( .A0(n155), .A1(n161), .B0(n158), .B1(n157), .Y(n156) );
  aoi21_x1 U306 ( .A0(n158), .A1(n157), .B0(n156), .Y(n163) );
  inv_x1 U307 ( .A(n163), .Y(n167) );
  xnor2_x1 U308 ( .A(n161), .B(n160), .Y(n162) );
  inv_x1 U309 ( .A(n162), .Y(n189) );
  inv_x1 U310 ( .A(\intadd_1/SUM[29] ), .Y(n164) );
  mxi2_x1 U311 ( .A0(\intadd_1/SUM[29] ), .A1(n164), .S(n163), .YN(n185) );
  nand2_x1 U312 ( .A(\intadd_1/SUM[29] ), .B(n167), .Y(n165) );
  xnor2_x1 U313 ( .A(n166), .B(n165), .Y(n182) );
  nand2_x1 U314 ( .A(n189), .B(n177), .Y(n171) );
  nand2_x1 U315 ( .A(n170), .B(n169), .Y(n168) );
  oai21_x1 U316 ( .A0(n170), .A1(n169), .B0(n168), .Y(n179) );
  oai22_x1 U317 ( .A0(n171), .A1(n179), .B0(n174), .B1(n173), .Y(n172) );
  aoi21_x1 U318 ( .A0(n174), .A1(n173), .B0(n172), .Y(n176) );
  mxi2_x1 U319 ( .A0(n175), .A1(\intadd_1/SUM[28] ), .S(n183), .YN(n192) );
  nand2b_x2 U320 ( .AN(n179), .B(n178), .Y(n188) );
  xnor2_x1 U321 ( .A(n179), .B(n178), .Y(n203) );
  nand2_x1 U322 ( .A(n182), .B(n181), .Y(n180) );
  oai21_x1 U323 ( .A0(n182), .A1(n181), .B0(n180), .Y(n197) );
  nand2_x1 U324 ( .A(\intadd_1/SUM[28] ), .B(n183), .Y(n184) );
  xnor2_x1 U325 ( .A(n185), .B(n184), .Y(n195) );
  aoi22_x1 U326 ( .A0(n186), .A1(n191), .B0(n189), .B1(n188), .Y(n187) );
  oai21_x1 U327 ( .A0(n189), .A1(n188), .B0(n187), .Y(n198) );
  nand2_x1 U328 ( .A(\intadd_1/SUM[27] ), .B(n198), .Y(n190) );
  xnor2_x1 U329 ( .A(n192), .B(n190), .Y(n206) );
  nand3_x1 U330 ( .A(n198), .B(\intadd_1/SUM[27] ), .C(n192), .Y(n194) );
  oai21_x1 U331 ( .A0(n195), .A1(n194), .B0(n193), .Y(n213) );
  xnor2_x1 U332 ( .A(n197), .B(n196), .Y(n217) );
  nor2_x1 U333 ( .A(n213), .B(n217), .Y(n200) );
  inv_x1 U334 ( .A(\intadd_1/SUM[27] ), .Y(n199) );
  mxi2_x1 U335 ( .A0(n199), .A1(\intadd_1/SUM[27] ), .S(n198), .YN(n208) );
  aoi22_x1 U336 ( .A0(n200), .A1(n211), .B0(n203), .B1(n202), .Y(n201) );
  oai21_x1 U337 ( .A0(n203), .A1(n202), .B0(n201), .Y(n210) );
  nand3_x1 U338 ( .A(n210), .B(n208), .C(\intadd_1/SUM[26] ), .Y(n205) );
  nand2_x1 U339 ( .A(n206), .B(n205), .Y(n204) );
  oai21_x1 U340 ( .A0(n206), .A1(n205), .B0(n204), .Y(n228) );
  nand2_x1 U341 ( .A(\intadd_1/SUM[26] ), .B(n210), .Y(n207) );
  xnor2_x1 U342 ( .A(n208), .B(n207), .Y(n222) );
  inv_x1 U343 ( .A(\intadd_1/SUM[26] ), .Y(n209) );
  mxi2_x1 U344 ( .A0(n209), .A1(\intadd_1/SUM[26] ), .S(n210), .YN(n227) );
  nand3_x1 U345 ( .A(\intadd_1/SUM[25] ), .B(n222), .C(n227), .Y(n219) );
  xnor2_x1 U346 ( .A(n213), .B(n212), .Y(n214) );
  inv_x1 U347 ( .A(n214), .Y(n233) );
  nand2_x1 U348 ( .A(n233), .B(n219), .Y(n215) );
  oai22_x1 U349 ( .A0(n218), .A1(n217), .B0(n215), .B1(n228), .Y(n216) );
  aoi21_x1 U350 ( .A0(n218), .A1(n217), .B0(n216), .Y(n223) );
  inv_x1 U351 ( .A(n223), .Y(n225) );
  xnor2_x1 U352 ( .A(n228), .B(n229), .Y(n248) );
  nand3_x1 U353 ( .A(n225), .B(\intadd_1/SUM[25] ), .C(n227), .Y(n221) );
  oai21_x1 U354 ( .A0(n222), .A1(n221), .B0(n220), .Y(n236) );
  inv_x1 U355 ( .A(\intadd_1/SUM[25] ), .Y(n224) );
  mxi2_x1 U356 ( .A0(\intadd_1/SUM[25] ), .A1(n224), .S(n223), .YN(n240) );
  nand2_x1 U357 ( .A(\intadd_1/SUM[25] ), .B(n225), .Y(n226) );
  xnor2_x1 U358 ( .A(n227), .B(n226), .Y(n244) );
  nor2_x1 U359 ( .A(n236), .B(n248), .Y(n230) );
  aoi22_x1 U360 ( .A0(n230), .A1(n234), .B0(n233), .B1(n232), .Y(n231) );
  oai21_x1 U361 ( .A0(n233), .A1(n232), .B0(n231), .Y(n241) );
  xnor2_x1 U362 ( .A(n236), .B(n235), .Y(n237) );
  inv_x1 U363 ( .A(n237), .Y(n263) );
  nand2_x1 U364 ( .A(\intadd_1/SUM[24] ), .B(n241), .Y(n238) );
  xnor2_x1 U365 ( .A(n240), .B(n238), .Y(n256) );
  inv_x1 U366 ( .A(\intadd_1/SUM[24] ), .Y(n239) );
  mxi2_x1 U367 ( .A0(n239), .A1(\intadd_1/SUM[24] ), .S(n241), .YN(n259) );
  nand3_x1 U368 ( .A(\intadd_1/SUM[23] ), .B(n256), .C(n259), .Y(n251) );
  nand2_x1 U369 ( .A(n263), .B(n251), .Y(n245) );
  nand3_x1 U370 ( .A(n241), .B(n240), .C(\intadd_1/SUM[24] ), .Y(n243) );
  nand2_x1 U371 ( .A(n244), .B(n243), .Y(n242) );
  oai21_x1 U372 ( .A0(n244), .A1(n243), .B0(n242), .Y(n253) );
  oai22_x1 U373 ( .A0(n245), .A1(n253), .B0(n248), .B1(n247), .Y(n246) );
  aoi21_x1 U374 ( .A0(n248), .A1(n247), .B0(n246), .Y(n250) );
  mxi2_x1 U375 ( .A0(n249), .A1(\intadd_1/SUM[23] ), .S(n257), .YN(n266) );
  nand2b_x2 U376 ( .AN(n253), .B(n252), .Y(n262) );
  xnor2_x1 U377 ( .A(n253), .B(n252), .Y(n277) );
  nand3_x1 U378 ( .A(n257), .B(\intadd_1/SUM[23] ), .C(n259), .Y(n255) );
  nand2_x1 U379 ( .A(n256), .B(n255), .Y(n254) );
  oai21_x1 U380 ( .A0(n256), .A1(n255), .B0(n254), .Y(n271) );
  nand2_x1 U381 ( .A(\intadd_1/SUM[23] ), .B(n257), .Y(n258) );
  xnor2_x1 U382 ( .A(n259), .B(n258), .Y(n269) );
  aoi22_x1 U383 ( .A0(n260), .A1(n265), .B0(n263), .B1(n262), .Y(n261) );
  oai21_x1 U384 ( .A0(n263), .A1(n262), .B0(n261), .Y(n272) );
  nand2_x1 U385 ( .A(\intadd_1/SUM[22] ), .B(n272), .Y(n264) );
  xnor2_x1 U386 ( .A(n266), .B(n264), .Y(n280) );
  nand3_x1 U387 ( .A(n272), .B(n266), .C(\intadd_1/SUM[22] ), .Y(n268) );
  nand2_x1 U388 ( .A(n269), .B(n268), .Y(n267) );
  oai21_x1 U389 ( .A0(n269), .A1(n268), .B0(n267), .Y(n288) );
  xnor2_x1 U390 ( .A(n271), .B(n270), .Y(n284) );
  nor2_x1 U391 ( .A(n288), .B(n284), .Y(n274) );
  inv_x1 U392 ( .A(\intadd_1/SUM[22] ), .Y(n273) );
  mxi2_x1 U393 ( .A0(n273), .A1(\intadd_1/SUM[22] ), .S(n272), .YN(n283) );
  aoi22_x1 U394 ( .A0(n274), .A1(n286), .B0(n277), .B1(n276), .Y(n275) );
  oai21_x1 U395 ( .A0(n277), .A1(n276), .B0(n275), .Y(n285) );
  nand3_x1 U396 ( .A(n285), .B(\intadd_1/SUM[21] ), .C(n283), .Y(n279) );
  oai21_x1 U397 ( .A0(n280), .A1(n279), .B0(n278), .Y(n298) );
  inv_x1 U398 ( .A(\intadd_1/SUM[21] ), .Y(n281) );
  mxi2_x1 U399 ( .A0(n281), .A1(\intadd_1/SUM[21] ), .S(n285), .YN(n299) );
  nand2_x1 U400 ( .A(\intadd_1/SUM[21] ), .B(n285), .Y(n282) );
  xnor2_x1 U401 ( .A(n283), .B(n282), .Y(n303) );
  inv_x1 U402 ( .A(n284), .Y(n292) );
  xnor2_x1 U403 ( .A(n288), .B(n287), .Y(n307) );
  nor2_x1 U404 ( .A(n298), .B(n307), .Y(n289) );
  aoi22_x1 U405 ( .A0(n289), .A1(n293), .B0(n292), .B1(n291), .Y(n290) );
  oai21_x1 U406 ( .A0(n292), .A1(n291), .B0(n290), .Y(n300) );
  xnor2_x1 U407 ( .A(n298), .B(n297), .Y(n294) );
  inv_x1 U408 ( .A(n294), .Y(n322) );
  nand2_x1 U409 ( .A(\intadd_1/SUM[20] ), .B(n300), .Y(n295) );
  xnor2_x1 U410 ( .A(n299), .B(n295), .Y(n311) );
  inv_x1 U411 ( .A(\intadd_1/SUM[20] ), .Y(n296) );
  mxi2_x1 U412 ( .A0(n296), .A1(\intadd_1/SUM[20] ), .S(n300), .YN(n318) );
  nand3_x1 U413 ( .A(\intadd_1/SUM[19] ), .B(n311), .C(n318), .Y(n308) );
  nand2_x1 U414 ( .A(n322), .B(n308), .Y(n304) );
  nand3_x1 U415 ( .A(n300), .B(n299), .C(\intadd_1/SUM[20] ), .Y(n302) );
  nand2_x1 U416 ( .A(n303), .B(n302), .Y(n301) );
  oai21_x1 U417 ( .A0(n303), .A1(n302), .B0(n301), .Y(n313) );
  oai22_x1 U418 ( .A0(n304), .A1(n313), .B0(n307), .B1(n306), .Y(n305) );
  aoi21_x1 U419 ( .A0(n307), .A1(n306), .B0(n305), .Y(n314) );
  inv_x1 U420 ( .A(n314), .Y(n316) );
  nand3_x1 U421 ( .A(n316), .B(\intadd_1/SUM[19] ), .C(n318), .Y(n310) );
  oai21_x1 U422 ( .A0(n311), .A1(n310), .B0(n309), .Y(n326) );
  xnor2_x1 U423 ( .A(n313), .B(n312), .Y(n336) );
  nor2_x1 U424 ( .A(n326), .B(n336), .Y(n319) );
  inv_x1 U425 ( .A(\intadd_1/SUM[19] ), .Y(n315) );
  mxi2_x1 U426 ( .A0(\intadd_1/SUM[19] ), .A1(n315), .S(n314), .YN(n328) );
  nand2_x1 U427 ( .A(\intadd_1/SUM[19] ), .B(n316), .Y(n317) );
  xnor2_x1 U428 ( .A(n318), .B(n317), .Y(n332) );
  aoi22_x1 U429 ( .A0(n319), .A1(n324), .B0(n322), .B1(n321), .Y(n320) );
  oai21_x1 U430 ( .A0(n322), .A1(n321), .B0(n320), .Y(n329) );
  mxi2_x1 U431 ( .A0(n323), .A1(\intadd_1/SUM[18] ), .S(n329), .YN(n340) );
  nand2_x1 U432 ( .A(\intadd_1/SUM[18] ), .B(n329), .Y(n327) );
  xnor2_x1 U433 ( .A(n328), .B(n327), .Y(n343) );
  nand2_x1 U434 ( .A(n26), .B(n339), .Y(n333) );
  nand3_x1 U435 ( .A(n329), .B(n328), .C(\intadd_1/SUM[18] ), .Y(n331) );
  oai21_x1 U436 ( .A0(n332), .A1(n331), .B0(n330), .Y(n345) );
  oai22_x1 U437 ( .A0(n333), .A1(n345), .B0(n336), .B1(n335), .Y(n334) );
  aoi21_x1 U438 ( .A0(n336), .A1(n335), .B0(n334), .Y(n337) );
  inv_x2 U439 ( .A(n337), .Y(n346) );
  xnor2_x1 U440 ( .A(n340), .B(n338), .Y(n353) );
  nand3_x2 U441 ( .A(n346), .B(\intadd_1/SUM[17] ), .C(n340), .Y(n342) );
  nand2_x2 U442 ( .A(n343), .B(n342), .Y(n341) );
  oai21_x1 U443 ( .A0(n343), .A1(n342), .B0(n341), .Y(n361) );
  xnor2_x1 U444 ( .A(n345), .B(n344), .Y(n357) );
  inv_x1 U445 ( .A(\intadd_1/SUM[17] ), .Y(n347) );
  mxi2_x1 U446 ( .A0(n347), .A1(\intadd_1/SUM[17] ), .S(n346), .YN(n355) );
  nand3_x2 U447 ( .A(n355), .B(\intadd_1/SUM[16] ), .C(n353), .Y(n359) );
  aoi22_x1 U448 ( .A0(n348), .A1(n359), .B0(n26), .B1(n350), .Y(n349) );
  oai21_x1 U449 ( .A0(n26), .A1(n350), .B0(n349), .Y(n358) );
  nand3_x2 U450 ( .A(n358), .B(n355), .C(\intadd_1/SUM[16] ), .Y(n352) );
  nand2_x2 U451 ( .A(n353), .B(n352), .Y(n351) );
  oai21_x1 U452 ( .A0(n353), .A1(n352), .B0(n351), .Y(n375) );
  nand2_x2 U453 ( .A(\intadd_1/SUM[16] ), .B(n358), .Y(n354) );
  xnor2_x1 U454 ( .A(n355), .B(n354), .Y(n369) );
  inv_x1 U455 ( .A(\intadd_1/SUM[16] ), .Y(n356) );
  mxi2_x1 U456 ( .A0(n356), .A1(\intadd_1/SUM[16] ), .S(n358), .YN(n373) );
  nand3_x2 U457 ( .A(\intadd_1/SUM[15] ), .B(n369), .C(n373), .Y(n366) );
  inv_x1 U458 ( .A(n357), .Y(n365) );
  xnor2_x1 U459 ( .A(n361), .B(n360), .Y(n374) );
  aoi22_x1 U460 ( .A0(n362), .A1(n366), .B0(n365), .B1(n364), .Y(n363) );
  oai21_x1 U461 ( .A0(n365), .A1(n364), .B0(n363), .Y(n371) );
  nand2_x2 U462 ( .A(n366), .B(n371), .Y(n376) );
  xnor2_x1 U463 ( .A(n375), .B(n376), .Y(n395) );
  nand3_x2 U464 ( .A(n371), .B(\intadd_1/SUM[15] ), .C(n373), .Y(n368) );
  nand2_x2 U465 ( .A(n369), .B(n368), .Y(n367) );
  oai21_x1 U466 ( .A0(n369), .A1(n368), .B0(n367), .Y(n383) );
  inv_x1 U467 ( .A(\intadd_1/SUM[15] ), .Y(n370) );
  mxi2_x1 U468 ( .A0(n370), .A1(\intadd_1/SUM[15] ), .S(n371), .YN(n387) );
  nand2_x2 U469 ( .A(\intadd_1/SUM[15] ), .B(n371), .Y(n372) );
  xnor2_x1 U470 ( .A(n373), .B(n372), .Y(n391) );
  inv_x1 U471 ( .A(n374), .Y(n380) );
  aoi22_x1 U472 ( .A0(n377), .A1(n381), .B0(n380), .B1(n379), .Y(n378) );
  oai21_x1 U473 ( .A0(n380), .A1(n379), .B0(n378), .Y(n388) );
  nor2_x2 U474 ( .A(n383), .B(n382), .Y(n394) );
  xnor2_x1 U475 ( .A(n383), .B(n382), .Y(n384) );
  nand2_x2 U476 ( .A(\intadd_1/SUM[14] ), .B(n388), .Y(n385) );
  xnor2_x1 U477 ( .A(n387), .B(n385), .Y(n402) );
  inv_x1 U478 ( .A(\intadd_1/SUM[14] ), .Y(n386) );
  mxi2_x1 U479 ( .A0(n386), .A1(\intadd_1/SUM[14] ), .S(n388), .YN(n407) );
  nand3_x2 U480 ( .A(\intadd_1/SUM[13] ), .B(n402), .C(n407), .Y(n397) );
  nand2_x2 U481 ( .A(n411), .B(n397), .Y(n392) );
  oai21_x1 U482 ( .A0(n391), .A1(n390), .B0(n389), .Y(n398) );
  oai22_x1 U483 ( .A0(n392), .A1(n398), .B0(n395), .B1(n394), .Y(n393) );
  aoi21_x1 U484 ( .A0(n395), .A1(n394), .B0(n393), .Y(n399) );
  mxi2_x1 U485 ( .A0(\intadd_1/SUM[13] ), .A1(n396), .S(n399), .YN(n418) );
  inv_x1 U486 ( .A(n398), .Y(n404) );
  inv_x1 U487 ( .A(n399), .Y(n405) );
  nand3_x2 U488 ( .A(n405), .B(\intadd_1/SUM[13] ), .C(n407), .Y(n401) );
  nand2_x2 U489 ( .A(n402), .B(n401), .Y(n400) );
  oai21_x1 U490 ( .A0(n402), .A1(n401), .B0(n400), .Y(n415) );
  xnor2_x1 U491 ( .A(n404), .B(n403), .Y(n426) );
  nand2_x2 U492 ( .A(\intadd_1/SUM[13] ), .B(n405), .Y(n406) );
  xnor2_x1 U493 ( .A(n407), .B(n406), .Y(n422) );
  aoi22_x1 U494 ( .A0(n408), .A1(n413), .B0(n411), .B1(n410), .Y(n409) );
  oai21_x1 U495 ( .A0(n411), .A1(n410), .B0(n409), .Y(n419) );
  nand2_x2 U496 ( .A(\intadd_1/SUM[12] ), .B(n419), .Y(n412) );
  xnor2_x1 U497 ( .A(n418), .B(n412), .Y(n430) );
  nor2_x2 U498 ( .A(n415), .B(n414), .Y(n425) );
  xnor2_x1 U499 ( .A(n415), .B(n414), .Y(n416) );
  inv_x1 U500 ( .A(n416), .Y(n441) );
  inv_x1 U501 ( .A(\intadd_1/SUM[12] ), .Y(n417) );
  mxi2_x1 U502 ( .A0(n417), .A1(\intadd_1/SUM[12] ), .S(n419), .YN(n433) );
  oai21_x1 U503 ( .A0(n422), .A1(n421), .B0(n420), .Y(n437) );
  oai22_x1 U504 ( .A0(n423), .A1(n437), .B0(n426), .B1(n425), .Y(n424) );
  aoi21_x1 U505 ( .A0(n426), .A1(n425), .B0(n424), .Y(n427) );
  inv_x2 U506 ( .A(n427), .Y(n434) );
  nand3_x2 U507 ( .A(n434), .B(\intadd_1/SUM[11] ), .C(n433), .Y(n429) );
  nand2_x2 U508 ( .A(n430), .B(n429), .Y(n428) );
  oai21_x1 U509 ( .A0(n430), .A1(n429), .B0(n428), .Y(n446) );
  inv_x1 U510 ( .A(\intadd_1/SUM[11] ), .Y(n431) );
  mxi2_x1 U511 ( .A0(n431), .A1(\intadd_1/SUM[11] ), .S(n434), .YN(n448) );
  xnor2_x1 U512 ( .A(n433), .B(n432), .Y(n452) );
  nand3_x2 U513 ( .A(n448), .B(\intadd_1/SUM[10] ), .C(n452), .Y(n442) );
  xnor2_x1 U514 ( .A(n437), .B(n436), .Y(n445) );
  aoi22_x1 U515 ( .A0(n438), .A1(n442), .B0(n441), .B1(n440), .Y(n439) );
  oai21_x1 U516 ( .A0(n441), .A1(n440), .B0(n439), .Y(n449) );
  xnor2_x1 U517 ( .A(n446), .B(n447), .Y(n453) );
  inv_x1 U518 ( .A(n453), .Y(n471) );
  nand2_x2 U519 ( .A(\intadd_1/SUM[10] ), .B(n449), .Y(n443) );
  xnor2_x1 U520 ( .A(n448), .B(n443), .Y(n461) );
  inv_x1 U521 ( .A(\intadd_1/SUM[10] ), .Y(n444) );
  mxi2_x1 U522 ( .A0(n444), .A1(\intadd_1/SUM[10] ), .S(n449), .YN(n467) );
  nand3_x2 U523 ( .A(\intadd_1/SUM[9] ), .B(n461), .C(n467), .Y(n458) );
  inv_x1 U524 ( .A(n445), .Y(n457) );
  or2_x2 U525 ( .A(n447), .B(n446), .Y(n456) );
  nand3_x2 U526 ( .A(n449), .B(n448), .C(\intadd_1/SUM[10] ), .Y(n451) );
  nand2_x2 U527 ( .A(n452), .B(n451), .Y(n450) );
  oai21_x1 U528 ( .A0(n452), .A1(n451), .B0(n450), .Y(n463) );
  aoi22_x1 U529 ( .A0(n454), .A1(n458), .B0(n457), .B1(n456), .Y(n455) );
  oai21_x2 U530 ( .A0(n457), .A1(n456), .B0(n455), .Y(n465) );
  nand2_x2 U531 ( .A(n458), .B(n465), .Y(n462) );
  nand3_x2 U532 ( .A(n465), .B(\intadd_1/SUM[9] ), .C(n467), .Y(n460) );
  nand2_x2 U533 ( .A(n461), .B(n460), .Y(n459) );
  oai21_x1 U534 ( .A0(n461), .A1(n460), .B0(n459), .Y(n475) );
  xnor2_x1 U535 ( .A(n463), .B(n462), .Y(n486) );
  inv_x1 U536 ( .A(\intadd_1/SUM[9] ), .Y(n464) );
  mxi2_x1 U537 ( .A0(n464), .A1(\intadd_1/SUM[9] ), .S(n465), .YN(n478) );
  nand2_x2 U538 ( .A(\intadd_1/SUM[9] ), .B(n465), .Y(n466) );
  xnor2_x1 U539 ( .A(n467), .B(n466), .Y(n482) );
  aoi22_x1 U540 ( .A0(n468), .A1(n473), .B0(n471), .B1(n470), .Y(n469) );
  oai21_x1 U541 ( .A0(n471), .A1(n470), .B0(n469), .Y(n479) );
  mxi2_x1 U542 ( .A0(n472), .A1(\intadd_1/SUM[8] ), .S(n479), .YN(n489) );
  nor2_x2 U543 ( .A(n475), .B(n474), .Y(n485) );
  xnor2_x1 U544 ( .A(n475), .B(n474), .Y(n476) );
  nand2_x2 U545 ( .A(\intadd_1/SUM[8] ), .B(n479), .Y(n477) );
  xnor2_x1 U546 ( .A(n478), .B(n477), .Y(n493) );
  nand3_x2 U547 ( .A(\intadd_1/SUM[7] ), .B(n493), .C(n489), .Y(n488) );
  nand2_x2 U548 ( .A(n501), .B(n488), .Y(n483) );
  oai21_x1 U549 ( .A0(n482), .A1(n481), .B0(n480), .Y(n495) );
  oai22_x1 U550 ( .A0(n483), .A1(n495), .B0(n486), .B1(n485), .Y(n484) );
  aoi21_x1 U551 ( .A0(n486), .A1(n485), .B0(n484), .Y(n496) );
  inv_x2 U552 ( .A(n496), .Y(n490) );
  nand2_x2 U553 ( .A(\intadd_1/SUM[7] ), .B(n490), .Y(n487) );
  xnor2_x1 U554 ( .A(n489), .B(n487), .Y(n504) );
  nand2_x2 U555 ( .A(n488), .B(n490), .Y(n494) );
  nand3_x2 U556 ( .A(n490), .B(\intadd_1/SUM[7] ), .C(n489), .Y(n492) );
  nand2_x2 U557 ( .A(n493), .B(n492), .Y(n491) );
  oai21_x1 U558 ( .A0(n493), .A1(n492), .B0(n491), .Y(n511) );
  xnor2_x1 U559 ( .A(n495), .B(n494), .Y(n515) );
  inv_x1 U560 ( .A(\intadd_1/SUM[7] ), .Y(n497) );
  mxi2_x1 U561 ( .A0(\intadd_1/SUM[7] ), .A1(n497), .S(n496), .YN(n506) );
  aoi22_x1 U562 ( .A0(n498), .A1(n509), .B0(n501), .B1(n500), .Y(n499) );
  oai21_x1 U563 ( .A0(n501), .A1(n500), .B0(n499), .Y(n508) );
  oai21_x1 U564 ( .A0(n504), .A1(n503), .B0(n502), .Y(n521) );
  nand2_x2 U565 ( .A(\intadd_1/SUM[6] ), .B(n508), .Y(n505) );
  xnor2_x1 U566 ( .A(n506), .B(n505), .Y(n527) );
  inv_x1 U567 ( .A(\intadd_1/SUM[6] ), .Y(n507) );
  mxi2_x1 U568 ( .A0(n507), .A1(\intadd_1/SUM[6] ), .S(n508), .YN(n523) );
  nand3_x2 U569 ( .A(\intadd_1/SUM[5] ), .B(n527), .C(n523), .Y(n518) );
  xnor2_x1 U570 ( .A(n511), .B(n510), .Y(n512) );
  nand2_x2 U571 ( .A(n532), .B(n518), .Y(n513) );
  oai22_x1 U572 ( .A0(n516), .A1(n515), .B0(n513), .B1(n521), .Y(n514) );
  aoi21_x1 U573 ( .A0(n516), .A1(n515), .B0(n514), .Y(n517) );
  inv_x2 U574 ( .A(n517), .Y(n524) );
  xnor2_x1 U575 ( .A(n521), .B(n522), .Y(n528) );
  inv_x1 U576 ( .A(n528), .Y(n546) );
  inv_x1 U577 ( .A(\intadd_1/SUM[5] ), .Y(n519) );
  mxi2_x1 U578 ( .A0(n519), .A1(\intadd_1/SUM[5] ), .S(n524), .YN(n540) );
  nand2_x2 U579 ( .A(\intadd_1/SUM[5] ), .B(n524), .Y(n520) );
  xnor2_x1 U580 ( .A(n523), .B(n520), .Y(n536) );
  nand3_x2 U581 ( .A(n524), .B(\intadd_1/SUM[5] ), .C(n523), .Y(n526) );
  nand2_x2 U582 ( .A(n527), .B(n526), .Y(n525) );
  oai21_x1 U583 ( .A0(n527), .A1(n526), .B0(n525), .Y(n538) );
  aoi22_x1 U584 ( .A0(n529), .A1(n533), .B0(n532), .B1(n531), .Y(n530) );
  oai21_x1 U585 ( .A0(n532), .A1(n531), .B0(n530), .Y(n541) );
  oai21_x1 U586 ( .A0(n536), .A1(n535), .B0(n534), .Y(n550) );
  xnor2_x1 U587 ( .A(n538), .B(n537), .Y(n548) );
  nand2_x2 U588 ( .A(\intadd_1/SUM[4] ), .B(n541), .Y(n539) );
  xnor2_x1 U589 ( .A(n540), .B(n539), .Y(n553) );
  inv_x1 U590 ( .A(\intadd_1/SUM[4] ), .Y(n542) );
  mxi2_x1 U591 ( .A0(n542), .A1(\intadd_1/SUM[4] ), .S(n541), .YN(n558) );
  nand3_x2 U592 ( .A(\intadd_1/SUM[3] ), .B(n553), .C(n558), .Y(n549) );
  aoi22_x1 U593 ( .A0(n543), .A1(n549), .B0(n546), .B1(n545), .Y(n544) );
  oai21_x1 U594 ( .A0(n546), .A1(n545), .B0(n544), .Y(n556) );
  mxi2_x1 U595 ( .A0(n547), .A1(\intadd_1/SUM[3] ), .S(n556), .YN(n569) );
  inv_x1 U596 ( .A(n548), .Y(n562) );
  inv_x1 U597 ( .A(n550), .Y(n555) );
  nand3_x2 U598 ( .A(n556), .B(\intadd_1/SUM[3] ), .C(n558), .Y(n552) );
  oai21_x1 U599 ( .A0(n553), .A1(n552), .B0(n551), .Y(n566) );
  xnor2_x1 U600 ( .A(n555), .B(n554), .Y(n577) );
  nand2_x2 U601 ( .A(\intadd_1/SUM[3] ), .B(n556), .Y(n557) );
  xnor2_x1 U602 ( .A(n558), .B(n557), .Y(n573) );
  aoi22_x1 U603 ( .A0(n559), .A1(n564), .B0(n562), .B1(n561), .Y(n560) );
  oai21_x1 U604 ( .A0(n562), .A1(n561), .B0(n560), .Y(n570) );
  nand2_x2 U605 ( .A(\intadd_1/SUM[2] ), .B(n570), .Y(n563) );
  xnor2_x1 U606 ( .A(n569), .B(n563), .Y(n581) );
  nor2_x2 U607 ( .A(n566), .B(n565), .Y(n576) );
  xnor2_x1 U608 ( .A(n566), .B(n565), .Y(n567) );
  inv_x2 U609 ( .A(n567), .Y(n592) );
  inv_x1 U610 ( .A(\intadd_1/SUM[2] ), .Y(n568) );
  mxi2_x1 U611 ( .A0(n568), .A1(\intadd_1/SUM[2] ), .S(n570), .YN(n583) );
  nand3_x2 U612 ( .A(n581), .B(n583), .C(\intadd_1/SUM[1] ), .Y(n586) );
  nand2_x2 U613 ( .A(n592), .B(n586), .Y(n574) );
  oai21_x1 U614 ( .A0(n573), .A1(n572), .B0(n571), .Y(n588) );
  oai22_x1 U615 ( .A0(n574), .A1(n588), .B0(n577), .B1(n576), .Y(n575) );
  aoi21_x1 U616 ( .A0(n577), .A1(n576), .B0(n575), .Y(n578) );
  inv_x2 U617 ( .A(n578), .Y(n585) );
  nand3_x2 U618 ( .A(n585), .B(\intadd_1/SUM[1] ), .C(n583), .Y(n580) );
  nand2_x1 U619 ( .A(n581), .B(n580), .Y(n579) );
  oai21_x1 U620 ( .A0(n581), .A1(n580), .B0(n579), .Y(n602) );
  xnor2_x1 U621 ( .A(n583), .B(n582), .Y(n600) );
  inv_x1 U622 ( .A(\intadd_1/SUM[1] ), .Y(n584) );
  mxi2_x1 U623 ( .A0(n584), .A1(\intadd_1/SUM[1] ), .S(n585), .YN(n596) );
  nand3_x2 U624 ( .A(n600), .B(\intadd_1/SUM[0] ), .C(n596), .Y(n593) );
  nand2_x2 U625 ( .A(n586), .B(n585), .Y(n587) );
  xnor2_x1 U626 ( .A(n588), .B(n587), .Y(n605) );
  aoi22_x1 U627 ( .A0(n589), .A1(n593), .B0(n592), .B1(n591), .Y(n590) );
  oai21_x1 U628 ( .A0(n592), .A1(n591), .B0(n590), .Y(n597) );
  nand2_x2 U629 ( .A(\intadd_1/SUM[0] ), .B(n597), .Y(n594) );
  xnor2_x1 U630 ( .A(n596), .B(n594), .Y(n616) );
  inv_x1 U631 ( .A(ravens_spike_timestamp_us[1]), .Y(n992) );
  inv_x1 U632 ( .A(segment_last_timestamp_us[0]), .Y(n988) );
  inv_x1 U633 ( .A(\intadd_1/SUM[0] ), .Y(n595) );
  mxi2_x1 U634 ( .A0(n595), .A1(\intadd_1/SUM[0] ), .S(n597), .YN(n613) );
  and2_x2 U635 ( .A(n611), .B(n613), .Y(n608) );
  nand2_x2 U636 ( .A(n616), .B(n608), .Y(n607) );
  oai21_x1 U637 ( .A0(n600), .A1(n599), .B0(n598), .Y(n618) );
  xnor2_x1 U638 ( .A(n602), .B(n601), .Y(n620) );
  nor3b_x1 U639 ( .AN(n607), .B(n618), .C(n620), .Y(n603) );
  aoi21_x1 U640 ( .A0(n606), .A1(n605), .B0(n603), .Y(n604) );
  oai21_x1 U641 ( .A0(n606), .A1(n605), .B0(n604), .Y(n624) );
  inv_x1 U642 ( .A(n624), .Y(n623) );
  oai21_x1 U643 ( .A0(ravens_spike_timestamp_us[0]), .A1(n988), .B0(n663), .Y(
        n609) );
  oai21_x1 U644 ( .A0(n611), .A1(n624), .B0(n609), .Y(n610) );
  aoi21_x1 U645 ( .A0(n611), .A1(n624), .B0(n610), .Y(n612) );
  aoi22_x1 U646 ( .A0(n613), .A1(n612), .B0(n616), .B1(n615), .Y(n614) );
  oai21_x1 U647 ( .A0(n616), .A1(n615), .B0(n614), .Y(n617) );
  aoi22_x1 U648 ( .A0(n619), .A1(n618), .B0(n617), .B1(n622), .Y(n621) );
  mxi2_x1 U649 ( .A0(n622), .A1(n621), .S(n620), .YN(n730) );
  mxi2_x1 U650 ( .A0(n624), .A1(n623), .S(n730), .YN(n728) );
  inv_x2 U651 ( .A(n728), .Y(n626) );
  addf_x1 U652 ( .A(n1118), .B(n626), .CI(n625), .CO(n631), .S(n627) );
  inv_x1 U653 ( .A(n627), .Y(n628) );
  aoi21_x1 U654 ( .A0(cur_sim_time_timestep[2]), .A1(n628), .B0(
        cur_sim_time_timestep[3]), .Y(n630) );
  oai21_x1 U655 ( .A0(cur_sim_time_timestep[2]), .A1(n628), .B0(
        cur_sim_time_timestep[3]), .Y(n629) );
  oai21_x1 U656 ( .A0(n631), .A1(n630), .B0(n629), .Y(n731) );
  inv_x1 U657 ( .A(ravens_spike_timestamp_us[42]), .Y(\intadd_1/A[40] ) );
  inv_x1 U658 ( .A(ravens_spike_timestamp_us[43]), .Y(\intadd_1/A[41] ) );
  oai22_x1 U659 ( .A0(segment_last_timestamp_us[42]), .A1(\intadd_1/A[40] ), 
        .B0(segment_last_timestamp_us[43]), .B1(\intadd_1/A[41] ), .Y(n648) );
  inv_x1 U660 ( .A(ravens_spike_timestamp_us[40]), .Y(\intadd_1/A[38] ) );
  inv_x1 U661 ( .A(ravens_spike_timestamp_us[41]), .Y(\intadd_1/A[39] ) );
  oai22_x1 U662 ( .A0(segment_last_timestamp_us[40]), .A1(\intadd_1/A[38] ), 
        .B0(segment_last_timestamp_us[41]), .B1(\intadd_1/A[39] ), .Y(n632) );
  inv_x1 U663 ( .A(ravens_spike_timestamp_us[39]), .Y(\intadd_1/A[37] ) );
  oai21_x1 U664 ( .A0(segment_last_timestamp_us[39]), .A1(\intadd_1/A[37] ), 
        .B0(segment_last_timestamp_us[38]), .Y(n645) );
  nor2_x1 U665 ( .A(segment_last_timestamp_us[39]), .B(\intadd_1/A[37] ), .Y(
        n634) );
  inv_x1 U666 ( .A(ravens_spike_timestamp_us[37]), .Y(\intadd_1/A[35] ) );
  inv_x1 U667 ( .A(ravens_spike_timestamp_us[38]), .Y(\intadd_1/A[36] ) );
  oai22_x1 U668 ( .A0(segment_last_timestamp_us[37]), .A1(\intadd_1/A[35] ), 
        .B0(segment_last_timestamp_us[38]), .B1(\intadd_1/A[36] ), .Y(n633) );
  nor2_x1 U669 ( .A(n634), .B(n633), .Y(n721) );
  inv_x1 U670 ( .A(ravens_spike_timestamp_us[36]), .Y(\intadd_1/A[34] ) );
  inv_x1 U671 ( .A(ravens_spike_timestamp_us[35]), .Y(\intadd_1/A[33] ) );
  oai21_x1 U672 ( .A0(segment_last_timestamp_us[35]), .A1(\intadd_1/A[33] ), 
        .B0(segment_last_timestamp_us[34]), .Y(n638) );
  inv_x1 U673 ( .A(ravens_spike_timestamp_us[33]), .Y(\intadd_1/A[31] ) );
  inv_x1 U674 ( .A(ravens_spike_timestamp_us[32]), .Y(\intadd_1/A[30] ) );
  aoi22_x1 U675 ( .A0(segment_last_timestamp_us[33]), .A1(\intadd_1/A[31] ), 
        .B0(segment_last_timestamp_us[32]), .B1(\intadd_1/A[30] ), .Y(n637) );
  inv_x1 U676 ( .A(ravens_spike_timestamp_us[34]), .Y(\intadd_1/A[32] ) );
  nor2_x1 U677 ( .A(segment_last_timestamp_us[35]), .B(\intadd_1/A[33] ), .Y(
        n635) );
  aoi2bb1_x1 U678 ( .A0N(\intadd_1/A[32] ), .A1N(segment_last_timestamp_us[34]), .B0(n635), .Y(n636) );
  oai21_x1 U679 ( .A0(segment_last_timestamp_us[33]), .A1(\intadd_1/A[31] ), 
        .B0(n636), .Y(n723) );
  oai22_x1 U680 ( .A0(ravens_spike_timestamp_us[34]), .A1(n638), .B0(n637), 
        .B1(n723), .Y(n639) );
  aoi21_x1 U681 ( .A0(segment_last_timestamp_us[35]), .A1(\intadd_1/A[33] ), 
        .B0(n639), .Y(n641) );
  aoi22_x1 U682 ( .A0(segment_last_timestamp_us[37]), .A1(\intadd_1/A[35] ), 
        .B0(segment_last_timestamp_us[36]), .B1(\intadd_1/A[34] ), .Y(n640) );
  oai21_x1 U683 ( .A0(n642), .A1(n641), .B0(n640), .Y(n643) );
  aoi22_x1 U684 ( .A0(segment_last_timestamp_us[39]), .A1(\intadd_1/A[37] ), 
        .B0(n721), .B1(n643), .Y(n644) );
  oai21_x1 U685 ( .A0(ravens_spike_timestamp_us[38]), .A1(n645), .B0(n644), 
        .Y(n651) );
  inv_x1 U686 ( .A(segment_last_timestamp_us[43]), .Y(n1109) );
  inv_x1 U687 ( .A(segment_last_timestamp_us[41]), .Y(n1104) );
  oai21_x1 U688 ( .A0(segment_last_timestamp_us[41]), .A1(\intadd_1/A[39] ), 
        .B0(segment_last_timestamp_us[40]), .Y(n646) );
  oai22_x1 U689 ( .A0(ravens_spike_timestamp_us[41]), .A1(n1104), .B0(n646), 
        .B1(ravens_spike_timestamp_us[40]), .Y(n647) );
  aoi21_x1 U690 ( .A0(segment_last_timestamp_us[42]), .A1(\intadd_1/A[40] ), 
        .B0(n647), .Y(n649) );
  oai22_x1 U691 ( .A0(ravens_spike_timestamp_us[43]), .A1(n1109), .B0(n649), 
        .B1(n648), .Y(n650) );
  aoi21_x1 U692 ( .A0(n722), .A1(n651), .B0(n650), .Y(n724) );
  inv_x1 U693 ( .A(ravens_spike_timestamp_us[31]), .Y(\intadd_1/A[29] ) );
  nor2_x1 U694 ( .A(segment_last_timestamp_us[31]), .B(\intadd_1/A[29] ), .Y(
        n715) );
  inv_x1 U695 ( .A(ravens_spike_timestamp_us[30]), .Y(\intadd_1/A[28] ) );
  inv_x1 U696 ( .A(ravens_spike_timestamp_us[29]), .Y(\intadd_1/A[27] ) );
  inv_x1 U697 ( .A(ravens_spike_timestamp_us[28]), .Y(\intadd_1/A[26] ) );
  aoi22_x1 U698 ( .A0(segment_last_timestamp_us[29]), .A1(\intadd_1/A[27] ), 
        .B0(segment_last_timestamp_us[28]), .B1(\intadd_1/A[26] ), .Y(n712) );
  inv_x1 U699 ( .A(segment_last_timestamp_us[27]), .Y(n1069) );
  inv_x1 U700 ( .A(ravens_spike_timestamp_us[27]), .Y(\intadd_1/A[25] ) );
  oai21_x1 U701 ( .A0(segment_last_timestamp_us[27]), .A1(\intadd_1/A[25] ), 
        .B0(segment_last_timestamp_us[26]), .Y(n652) );
  oai22_x1 U702 ( .A0(ravens_spike_timestamp_us[27]), .A1(n1069), .B0(n652), 
        .B1(ravens_spike_timestamp_us[26]), .Y(n709) );
  inv_x1 U703 ( .A(ravens_spike_timestamp_us[25]), .Y(\intadd_1/A[23] ) );
  inv_x1 U704 ( .A(ravens_spike_timestamp_us[24]), .Y(\intadd_1/A[22] ) );
  aoi22_x1 U705 ( .A0(segment_last_timestamp_us[25]), .A1(\intadd_1/A[23] ), 
        .B0(segment_last_timestamp_us[24]), .B1(\intadd_1/A[22] ), .Y(n707) );
  inv_x1 U706 ( .A(segment_last_timestamp_us[23]), .Y(n1059) );
  inv_x1 U707 ( .A(ravens_spike_timestamp_us[21]), .Y(\intadd_1/A[19] ) );
  inv_x1 U708 ( .A(segment_last_timestamp_us[21]), .Y(n1054) );
  inv_x1 U709 ( .A(ravens_spike_timestamp_us[20]), .Y(\intadd_1/A[18] ) );
  oai21_x1 U710 ( .A0(ravens_spike_timestamp_us[21]), .A1(n1054), .B0(n653), 
        .Y(n696) );
  inv_x1 U711 ( .A(ravens_spike_timestamp_us[19]), .Y(\intadd_1/A[17] ) );
  inv_x1 U712 ( .A(ravens_spike_timestamp_us[18]), .Y(\intadd_1/A[16] ) );
  inv_x1 U713 ( .A(ravens_spike_timestamp_us[17]), .Y(\intadd_1/A[15] ) );
  inv_x1 U714 ( .A(ravens_spike_timestamp_us[16]), .Y(\intadd_1/A[14] ) );
  aoi22_x1 U715 ( .A0(segment_last_timestamp_us[17]), .A1(\intadd_1/A[15] ), 
        .B0(segment_last_timestamp_us[16]), .B1(\intadd_1/A[14] ), .Y(n689) );
  inv_x1 U716 ( .A(ravens_spike_timestamp_us[13]), .Y(\intadd_1/A[11] ) );
  inv_x1 U717 ( .A(segment_last_timestamp_us[13]), .Y(n1034) );
  inv_x1 U718 ( .A(ravens_spike_timestamp_us[12]), .Y(\intadd_1/A[10] ) );
  inv_x1 U719 ( .A(ravens_spike_timestamp_us[11]), .Y(\intadd_1/A[9] ) );
  inv_x1 U720 ( .A(segment_last_timestamp_us[11]), .Y(n1029) );
  inv_x1 U721 ( .A(ravens_spike_timestamp_us[10]), .Y(\intadd_1/A[8] ) );
  inv_x1 U722 ( .A(ravens_spike_timestamp_us[9]), .Y(\intadd_1/A[7] ) );
  aoi22_x1 U723 ( .A0(segment_last_timestamp_us[9]), .A1(\intadd_1/A[7] ), 
        .B0(segment_last_timestamp_us[8]), .B1(n654), .Y(n655) );
  oai2bb2_x1 U724 ( .B0(n656), .B1(n655), .A0N(\intadd_1/A[8] ), .A1N(
        segment_last_timestamp_us[10]), .Y(n657) );
  aoi22_x1 U725 ( .A0(segment_last_timestamp_us[11]), .A1(\intadd_1/A[9] ), 
        .B0(n658), .B1(n657), .Y(n659) );
  oai2bb2_x1 U726 ( .B0(n660), .B1(n659), .A0N(\intadd_1/A[10] ), .A1N(
        segment_last_timestamp_us[12]), .Y(n661) );
  aoi22_x1 U727 ( .A0(segment_last_timestamp_us[13]), .A1(\intadd_1/A[11] ), 
        .B0(n662), .B1(n661), .Y(n683) );
  inv_x1 U728 ( .A(ravens_spike_timestamp_us[7]), .Y(\intadd_1/A[5] ) );
  inv_x1 U729 ( .A(segment_last_timestamp_us[7]), .Y(n1018) );
  inv_x1 U730 ( .A(ravens_spike_timestamp_us[6]), .Y(\intadd_1/A[4] ) );
  inv_x1 U731 ( .A(ravens_spike_timestamp_us[5]), .Y(\intadd_1/A[3] ) );
  inv_x1 U732 ( .A(ravens_spike_timestamp_us[4]), .Y(\intadd_1/A[2] ) );
  inv_x1 U733 ( .A(ravens_spike_timestamp_us[2]), .Y(\intadd_1/A[0] ) );
  inv_x1 U734 ( .A(ravens_spike_timestamp_us[3]), .Y(\intadd_1/A[1] ) );
  aoi22_x1 U735 ( .A0(segment_last_timestamp_us[2]), .A1(\intadd_1/A[0] ), 
        .B0(segment_last_timestamp_us[3]), .B1(\intadd_1/A[1] ), .Y(n666) );
  addf_x1 U736 ( .A(n992), .B(segment_last_timestamp_us[1]), .CI(n663), .CO(
        \intadd_1/CI ), .S(n611) );
  oai21_x1 U737 ( .A0(segment_last_timestamp_us[2]), .A1(\intadd_1/A[0] ), 
        .B0(\intadd_1/CI ), .Y(n665) );
  oai22_x1 U738 ( .A0(segment_last_timestamp_us[4]), .A1(\intadd_1/A[2] ), 
        .B0(segment_last_timestamp_us[3]), .B1(\intadd_1/A[1] ), .Y(n664) );
  aoi21_x1 U739 ( .A0(n666), .A1(n665), .B0(n664), .Y(n667) );
  aoi21_x1 U740 ( .A0(segment_last_timestamp_us[4]), .A1(\intadd_1/A[2] ), 
        .B0(n667), .Y(n668) );
  oai2bb2_x1 U741 ( .B0(n669), .B1(n668), .A0N(\intadd_1/A[3] ), .A1N(
        segment_last_timestamp_us[5]), .Y(n670) );
  oai21_x1 U742 ( .A0(segment_last_timestamp_us[6]), .A1(\intadd_1/A[4] ), 
        .B0(n670), .Y(n672) );
  aoi22_x1 U743 ( .A0(ravens_spike_timestamp_us[7]), .A1(n1018), .B0(n672), 
        .B1(n671), .Y(n673) );
  aoi21_x1 U744 ( .A0(segment_last_timestamp_us[7]), .A1(\intadd_1/A[5] ), 
        .B0(n673), .Y(n676) );
  oai22_x1 U745 ( .A0(segment_last_timestamp_us[10]), .A1(\intadd_1/A[8] ), 
        .B0(segment_last_timestamp_us[11]), .B1(\intadd_1/A[9] ), .Y(n675) );
  inv_x1 U746 ( .A(ravens_spike_timestamp_us[8]), .Y(\intadd_1/A[6] ) );
  oai22_x1 U747 ( .A0(segment_last_timestamp_us[8]), .A1(\intadd_1/A[6] ), 
        .B0(segment_last_timestamp_us[12]), .B1(\intadd_1/A[10] ), .Y(n674) );
  nor3_x1 U748 ( .A(n676), .B(n675), .C(n674), .Y(n680) );
  nor2_x1 U749 ( .A(segment_last_timestamp_us[13]), .B(\intadd_1/A[11] ), .Y(
        n678) );
  nor2_x1 U750 ( .A(n678), .B(n677), .Y(n679) );
  nand2_x1 U751 ( .A(n680), .B(n679), .Y(n682) );
  inv_x1 U752 ( .A(ravens_spike_timestamp_us[14]), .Y(\intadd_1/A[12] ) );
  inv_x1 U753 ( .A(ravens_spike_timestamp_us[15]), .Y(\intadd_1/A[13] ) );
  oai22_x1 U754 ( .A0(segment_last_timestamp_us[14]), .A1(\intadd_1/A[12] ), 
        .B0(segment_last_timestamp_us[15]), .B1(\intadd_1/A[13] ), .Y(n681) );
  aoi21_x1 U755 ( .A0(n683), .A1(n682), .B0(n681), .Y(n686) );
  inv_x1 U756 ( .A(segment_last_timestamp_us[15]), .Y(n1039) );
  oai21_x1 U757 ( .A0(segment_last_timestamp_us[15]), .A1(\intadd_1/A[13] ), 
        .B0(segment_last_timestamp_us[14]), .Y(n684) );
  oai22_x1 U758 ( .A0(ravens_spike_timestamp_us[15]), .A1(n1039), .B0(n684), 
        .B1(ravens_spike_timestamp_us[14]), .Y(n685) );
  oai22_x1 U759 ( .A0(segment_last_timestamp_us[16]), .A1(\intadd_1/A[14] ), 
        .B0(n686), .B1(n685), .Y(n688) );
  oai22_x1 U760 ( .A0(segment_last_timestamp_us[17]), .A1(\intadd_1/A[15] ), 
        .B0(segment_last_timestamp_us[18]), .B1(\intadd_1/A[16] ), .Y(n687) );
  aoi21_x1 U761 ( .A0(n689), .A1(n688), .B0(n687), .Y(n690) );
  aoi21_x1 U762 ( .A0(segment_last_timestamp_us[18]), .A1(\intadd_1/A[16] ), 
        .B0(n690), .Y(n691) );
  nor2_x1 U763 ( .A(n692), .B(n691), .Y(n693) );
  aoi21_x1 U764 ( .A0(segment_last_timestamp_us[19]), .A1(\intadd_1/A[17] ), 
        .B0(n693), .Y(n694) );
  aoi2bb1_x1 U765 ( .A0N(\intadd_1/A[18] ), .A1N(segment_last_timestamp_us[20]), .B0(n694), .Y(n695) );
  oai22_x1 U766 ( .A0(segment_last_timestamp_us[21]), .A1(\intadd_1/A[19] ), 
        .B0(n696), .B1(n695), .Y(n698) );
  inv_x1 U767 ( .A(ravens_spike_timestamp_us[23]), .Y(\intadd_1/A[21] ) );
  aoi21_x1 U768 ( .A0(ravens_spike_timestamp_us[22]), .A1(n698), .B0(n697), 
        .Y(n699) );
  oai21_x1 U769 ( .A0(segment_last_timestamp_us[22]), .A1(n700), .B0(n699), 
        .Y(n701) );
  oai21_x1 U770 ( .A0(ravens_spike_timestamp_us[23]), .A1(n1059), .B0(n701), 
        .Y(n702) );
  oai21_x1 U771 ( .A0(segment_last_timestamp_us[24]), .A1(\intadd_1/A[22] ), 
        .B0(n702), .Y(n706) );
  inv_x1 U772 ( .A(ravens_spike_timestamp_us[26]), .Y(\intadd_1/A[24] ) );
  inv_x1 U773 ( .A(segment_last_timestamp_us[25]), .Y(n1064) );
  aoi21_x1 U774 ( .A0(ravens_spike_timestamp_us[25]), .A1(n1064), .B0(n703), 
        .Y(n704) );
  oai21_x1 U775 ( .A0(segment_last_timestamp_us[26]), .A1(\intadd_1/A[24] ), 
        .B0(n704), .Y(n705) );
  aoi21_x1 U776 ( .A0(n707), .A1(n706), .B0(n705), .Y(n708) );
  oai22_x1 U777 ( .A0(segment_last_timestamp_us[28]), .A1(\intadd_1/A[26] ), 
        .B0(n709), .B1(n708), .Y(n711) );
  oai22_x1 U778 ( .A0(segment_last_timestamp_us[29]), .A1(\intadd_1/A[27] ), 
        .B0(segment_last_timestamp_us[30]), .B1(\intadd_1/A[28] ), .Y(n710) );
  aoi21_x1 U779 ( .A0(n712), .A1(n711), .B0(n710), .Y(n713) );
  aoi21_x1 U780 ( .A0(segment_last_timestamp_us[30]), .A1(\intadd_1/A[28] ), 
        .B0(n713), .Y(n714) );
  nor2_x1 U781 ( .A(n715), .B(n714), .Y(n716) );
  aoi21_x1 U782 ( .A0(segment_last_timestamp_us[31]), .A1(\intadd_1/A[29] ), 
        .B0(n716), .Y(n718) );
  oai22_x1 U783 ( .A0(segment_last_timestamp_us[32]), .A1(\intadd_1/A[30] ), 
        .B0(segment_last_timestamp_us[36]), .B1(\intadd_1/A[34] ), .Y(n717) );
  nor3_x1 U784 ( .A(n719), .B(n718), .C(n717), .Y(n720) );
  nand4b_x2 U785 ( .AN(n723), .B(n722), .C(n721), .D(n720), .Y(n725) );
  oai21_x1 U786 ( .A0(ravens_spike_timestamp_us[44]), .A1(n724), .B0(n725), 
        .Y(n727) );
  oai21_x1 U787 ( .A0(segment_last_timestamp_us[44]), .A1(n727), .B0(n726), 
        .Y(n729) );
  oai21_x1 U788 ( .A0(n728), .A1(n731), .B0(n729), .Y(n1117) );
  aoi21_x1 U789 ( .A0(cur_sim_time_timestep[1]), .A1(n731), .B0(n1117), .Y(
        n1009) );
  inv_x1 U790 ( .A(cur_sim_time_timestep[0]), .Y(n986) );
  oai21_x1 U791 ( .A0(n730), .A1(n731), .B0(n729), .Y(n985) );
  aoi21_x1 U792 ( .A0(cur_sim_time_timestep[0]), .A1(n731), .B0(n985), .Y(
        n1010) );
  inv_x1 U793 ( .A(n1010), .Y(n1002) );
  nor2_x1 U794 ( .A(n986), .B(n1002), .Y(n987) );
  inv_x1 U795 ( .A(cur_fsm_state[0]), .Y(n982) );
  inv_x1 U796 ( .A(cur_fsm_state[2]), .Y(n1128) );
  nand2_x1 U797 ( .A(n1128), .B(cur_fsm_state[1]), .Y(n1120) );
  nor2_x1 U798 ( .A(n982), .B(n1120), .Y(n113) );
  oai21_x1 U799 ( .A0(cur_sim_time_timestep[3]), .A1(n736), .B0(n113), .Y(n732) );
  inv_x1 U800 ( .A(n732), .Y(n1132) );
  or2_x1 U801 ( .A(cur_fsm_state[1]), .B(cur_fsm_state[0]), .Y(n1126) );
  nor2_x1 U802 ( .A(n1128), .B(n1126), .Y(sent_spike) );
  inv_x1 U803 ( .A(sent_spike), .Y(n737) );
  nor2_x1 U804 ( .A(cur_fsm_state[0]), .B(n1120), .Y(n112) );
  nor3_x1 U805 ( .A(cur_fsm_state[2]), .B(cur_fsm_state[1]), .C(n982), .Y(
        n1130) );
  nor2_x2 U806 ( .A(n1010), .B(n1009), .Y(n998) );
  nand2_x1 U807 ( .A(n998), .B(new_spike), .Y(n1124) );
  oai2bb1_x1 U808 ( .A0N(n1130), .A1N(n1124), .B0(n737), .Y(n109) );
  addf_x1 U809 ( .A(cur_sim_time_timestep[1]), .B(n1009), .CI(n987), .CO(n734), 
        .S(n733) );
  and2_x1 U810 ( .A(n113), .B(n733), .Y(N127) );
  oai21_x1 U811 ( .A0(cur_sim_time_timestep[2]), .A1(n734), .B0(n113), .Y(n735) );
  inv_x1 U812 ( .A(ravens_spike_timestamp_us[22]), .Y(\intadd_1/A[20] ) );
  nor2b_x1 U813 ( .AN(ravens_spike[5]), .B(n737), .Y(net228) );
  nor2b_x1 U814 ( .AN(ravens_spike[6]), .B(n737), .Y(net227) );
  nor2b_x1 U815 ( .AN(ravens_spike[7]), .B(n737), .Y(net226) );
  nor2b_x1 U816 ( .AN(ravens_spike[8]), .B(n737), .Y(net225) );
  nor2b_x1 U817 ( .AN(ravens_spike[9]), .B(n737), .Y(net224) );
  nor2b_x1 U818 ( .AN(ravens_spike[10]), .B(n737), .Y(net223) );
  nor2b_x1 U819 ( .AN(ravens_spike[11]), .B(n737), .Y(net222) );
  nor2b_x1 U820 ( .AN(ravens_spike[12]), .B(n737), .Y(net221) );
  nor2_x1 U821 ( .A(cur_fsm_state[2]), .B(cur_fsm_state[1]), .Y(N361) );
  nor2_x1 U822 ( .A(time_us_start_looking_for_new_sim_time[39]), .B(
        \intadd_1/A[37] ), .Y(n955) );
  nand2_x1 U823 ( .A(time_us_start_looking_for_new_sim_time[38]), .B(
        \intadd_1/A[36] ), .Y(n840) );
  nor2_x1 U824 ( .A(time_us_start_looking_for_new_sim_time[37]), .B(
        \intadd_1/A[35] ), .Y(n738) );
  nor2_x1 U825 ( .A(time_us_start_looking_for_new_sim_time[38]), .B(
        \intadd_1/A[36] ), .Y(n876) );
  nor3_x1 U826 ( .A(n955), .B(n738), .C(n876), .Y(n796) );
  nor2_x1 U827 ( .A(time_us_start_looking_for_new_sim_time[36]), .B(
        \intadd_1/A[34] ), .Y(n836) );
  aoi22_x1 U828 ( .A0(time_us_start_looking_for_new_sim_time[32]), .A1(
        \intadd_1/A[30] ), .B0(time_us_start_looking_for_new_sim_time[33]), 
        .B1(\intadd_1/A[31] ), .Y(n740) );
  nor2_x1 U829 ( .A(time_us_start_looking_for_new_sim_time[35]), .B(
        \intadd_1/A[33] ), .Y(n939) );
  nor2_x1 U830 ( .A(n939), .B(n909), .Y(n739) );
  or2_x1 U831 ( .A(time_us_start_looking_for_new_sim_time[33]), .B(
        \intadd_1/A[31] ), .Y(n908) );
  nand2_x1 U832 ( .A(n739), .B(n908), .Y(n798) );
  nand2_x1 U833 ( .A(time_us_start_looking_for_new_sim_time[34]), .B(
        \intadd_1/A[32] ), .Y(n901) );
  oai22_x1 U834 ( .A0(n740), .A1(n798), .B0(n939), .B1(n901), .Y(n741) );
  aoi21_x1 U835 ( .A0(time_us_start_looking_for_new_sim_time[35]), .A1(
        \intadd_1/A[33] ), .B0(n741), .Y(n743) );
  aoi22_x1 U836 ( .A0(time_us_start_looking_for_new_sim_time[36]), .A1(
        \intadd_1/A[34] ), .B0(time_us_start_looking_for_new_sim_time[37]), 
        .B1(\intadd_1/A[35] ), .Y(n742) );
  oai21_x1 U837 ( .A0(n836), .A1(n743), .B0(n742), .Y(n744) );
  nand2_x1 U838 ( .A(n796), .B(n744), .Y(n745) );
  oai21_x1 U839 ( .A0(n955), .A1(n840), .B0(n745), .Y(n746) );
  aoi21_x1 U840 ( .A0(time_us_start_looking_for_new_sim_time[39]), .A1(
        \intadd_1/A[37] ), .B0(n746), .Y(n805) );
  nor2_x1 U841 ( .A(time_us_start_looking_for_new_sim_time[22]), .B(
        \intadd_1/A[20] ), .Y(n932) );
  nor2_x1 U842 ( .A(time_us_start_looking_for_new_sim_time[23]), .B(
        \intadd_1/A[21] ), .Y(n923) );
  nor2_x1 U843 ( .A(n932), .B(n923), .Y(n764) );
  nor2_x1 U844 ( .A(time_us_start_looking_for_new_sim_time[21]), .B(
        \intadd_1/A[19] ), .Y(n857) );
  nand2_x1 U845 ( .A(time_us_start_looking_for_new_sim_time[20]), .B(
        \intadd_1/A[18] ), .Y(n747) );
  nand2_x1 U846 ( .A(time_us_start_looking_for_new_sim_time[21]), .B(
        \intadd_1/A[19] ), .Y(n918) );
  oai21_x1 U847 ( .A0(n857), .A1(n747), .B0(n918), .Y(n748) );
  aoi22_x1 U848 ( .A0(n764), .A1(n748), .B0(
        time_us_start_looking_for_new_sim_time[23]), .B1(\intadd_1/A[21] ), 
        .Y(n784) );
  nor2_x1 U849 ( .A(time_us_start_looking_for_new_sim_time[15]), .B(
        \intadd_1/A[13] ), .Y(n954) );
  nand2_x1 U850 ( .A(time_us_start_looking_for_new_sim_time[14]), .B(
        \intadd_1/A[12] ), .Y(n853) );
  nor2_x1 U851 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(
        \intadd_1/A[6] ), .Y(n751) );
  nor2_x1 U852 ( .A(time_us_start_looking_for_new_sim_time[13]), .B(
        \intadd_1/A[11] ), .Y(n850) );
  nor2b_x1 U853 ( .AN(time_us_start_looking_for_new_sim_time[7]), .B(
        ravens_spike_timestamp_us[7]), .Y(n826) );
  nor2_x1 U854 ( .A(time_us_start_looking_for_new_sim_time[11]), .B(
        \intadd_1/A[9] ), .Y(n877) );
  nor2_x1 U855 ( .A(n889), .B(n877), .Y(n755) );
  inv_x1 U856 ( .A(time_us_start_looking_for_new_sim_time[9]), .Y(n848) );
  nand2_x1 U857 ( .A(ravens_spike_timestamp_us[9]), .B(n848), .Y(n749) );
  nand4_x1 U858 ( .A(n826), .B(n755), .C(n749), .D(n849), .Y(n750) );
  nor3_x1 U859 ( .A(n751), .B(n850), .C(n750), .Y(n761) );
  nand2_x1 U860 ( .A(time_us_start_looking_for_new_sim_time[10]), .B(
        \intadd_1/A[8] ), .Y(n968) );
  nor2_x1 U861 ( .A(time_us_start_looking_for_new_sim_time[9]), .B(
        \intadd_1/A[7] ), .Y(n753) );
  oai22_x1 U862 ( .A0(ravens_spike_timestamp_us[9]), .A1(n848), .B0(n753), 
        .B1(n752), .Y(n754) );
  aoi22_x1 U863 ( .A0(n755), .A1(n754), .B0(
        time_us_start_looking_for_new_sim_time[11]), .B1(\intadd_1/A[9] ), .Y(
        n756) );
  oai21_x1 U864 ( .A0(n877), .A1(n968), .B0(n756), .Y(n757) );
  aoi22_x1 U865 ( .A0(time_us_start_looking_for_new_sim_time[12]), .A1(
        \intadd_1/A[10] ), .B0(n849), .B1(n757), .Y(n758) );
  nand2_x1 U866 ( .A(time_us_start_looking_for_new_sim_time[13]), .B(
        \intadd_1/A[11] ), .Y(n915) );
  oai21_x1 U867 ( .A0(n850), .A1(n758), .B0(n915), .Y(n760) );
  nor2_x1 U868 ( .A(n944), .B(n954), .Y(n759) );
  oai21_x1 U869 ( .A0(n761), .A1(n760), .B0(n759), .Y(n762) );
  oai21_x1 U870 ( .A0(n954), .A1(n853), .B0(n762), .Y(n763) );
  aoi21_x1 U871 ( .A0(time_us_start_looking_for_new_sim_time[15]), .A1(
        \intadd_1/A[13] ), .B0(n763), .Y(n769) );
  or2_x1 U872 ( .A(time_us_start_looking_for_new_sim_time[20]), .B(
        \intadd_1/A[18] ), .Y(n837) );
  oai21_x1 U873 ( .A0(time_us_start_looking_for_new_sim_time[21]), .A1(
        \intadd_1/A[19] ), .B0(n837), .Y(n765) );
  nand2b_x1 U874 ( .AN(n765), .B(n764), .Y(n774) );
  nor2_x1 U875 ( .A(time_us_start_looking_for_new_sim_time[18]), .B(
        \intadd_1/A[16] ), .Y(n926) );
  nor2_x1 U876 ( .A(time_us_start_looking_for_new_sim_time[19]), .B(
        \intadd_1/A[17] ), .Y(n924) );
  nor2_x1 U877 ( .A(n926), .B(n924), .Y(n773) );
  or2_x1 U878 ( .A(time_us_start_looking_for_new_sim_time[16]), .B(
        \intadd_1/A[14] ), .Y(n767) );
  or2_x1 U879 ( .A(time_us_start_looking_for_new_sim_time[17]), .B(
        \intadd_1/A[15] ), .Y(n766) );
  nand4b_x1 U880 ( .AN(n774), .B(n773), .C(n767), .D(n766), .Y(n768) );
  nand2_x1 U881 ( .A(time_us_start_looking_for_new_sim_time[22]), .B(
        \intadd_1/A[20] ), .Y(n839) );
  oai22_x1 U882 ( .A0(n769), .A1(n768), .B0(n923), .B1(n839), .Y(n778) );
  nand2_x1 U883 ( .A(time_us_start_looking_for_new_sim_time[16]), .B(
        \intadd_1/A[14] ), .Y(n936) );
  nand2_x1 U884 ( .A(time_us_start_looking_for_new_sim_time[17]), .B(
        \intadd_1/A[15] ), .Y(n770) );
  oai21_x1 U885 ( .A0(n935), .A1(n936), .B0(n770), .Y(n772) );
  nor2b_x1 U886 ( .AN(time_us_start_looking_for_new_sim_time[18]), .B(
        ravens_spike_timestamp_us[18]), .Y(n933) );
  inv_x1 U887 ( .A(n924), .Y(n771) );
  aoi22_x1 U888 ( .A0(n773), .A1(n772), .B0(n933), .B1(n771), .Y(n776) );
  nand2_x1 U889 ( .A(time_us_start_looking_for_new_sim_time[19]), .B(
        \intadd_1/A[17] ), .Y(n775) );
  aoi21_x1 U890 ( .A0(n776), .A1(n775), .B0(n774), .Y(n777) );
  nor2_x1 U891 ( .A(n778), .B(n777), .Y(n783) );
  nor2_x1 U892 ( .A(time_us_start_looking_for_new_sim_time[27]), .B(
        \intadd_1/A[25] ), .Y(n914) );
  nor2_x1 U893 ( .A(time_us_start_looking_for_new_sim_time[25]), .B(
        \intadd_1/A[23] ), .Y(n779) );
  nor2_x1 U894 ( .A(time_us_start_looking_for_new_sim_time[26]), .B(
        \intadd_1/A[24] ), .Y(n879) );
  nor3_x1 U895 ( .A(n914), .B(n779), .C(n879), .Y(n785) );
  nor2_x1 U896 ( .A(time_us_start_looking_for_new_sim_time[28]), .B(
        \intadd_1/A[26] ), .Y(n913) );
  nor2_x1 U897 ( .A(time_us_start_looking_for_new_sim_time[31]), .B(
        \intadd_1/A[29] ), .Y(n912) );
  nor2_x1 U898 ( .A(n912), .B(n871), .Y(n780) );
  oai21_x1 U899 ( .A0(time_us_start_looking_for_new_sim_time[29]), .A1(
        \intadd_1/A[27] ), .B0(n780), .Y(n790) );
  nor2_x1 U900 ( .A(n913), .B(n790), .Y(n789) );
  nand3_x1 U901 ( .A(n785), .B(n789), .C(n781), .Y(n782) );
  aoi21_x1 U902 ( .A0(n784), .A1(n783), .B0(n782), .Y(n801) );
  aoi22_x1 U903 ( .A0(time_us_start_looking_for_new_sim_time[25]), .A1(
        \intadd_1/A[23] ), .B0(time_us_start_looking_for_new_sim_time[24]), 
        .B1(\intadd_1/A[22] ), .Y(n787) );
  inv_x1 U904 ( .A(n785), .Y(n786) );
  nand2_x1 U905 ( .A(time_us_start_looking_for_new_sim_time[26]), .B(
        \intadd_1/A[24] ), .Y(n855) );
  oai22_x1 U906 ( .A0(n787), .A1(n786), .B0(n914), .B1(n855), .Y(n788) );
  aoi21_x1 U907 ( .A0(time_us_start_looking_for_new_sim_time[27]), .A1(
        \intadd_1/A[25] ), .B0(n788), .Y(n795) );
  inv_x1 U908 ( .A(n789), .Y(n794) );
  nand2_x1 U909 ( .A(time_us_start_looking_for_new_sim_time[30]), .B(
        \intadd_1/A[28] ), .Y(n841) );
  aoi22_x1 U910 ( .A0(time_us_start_looking_for_new_sim_time[29]), .A1(
        \intadd_1/A[27] ), .B0(time_us_start_looking_for_new_sim_time[28]), 
        .B1(\intadd_1/A[26] ), .Y(n791) );
  oai22_x1 U911 ( .A0(n912), .A1(n841), .B0(n791), .B1(n790), .Y(n792) );
  aoi21_x1 U912 ( .A0(time_us_start_looking_for_new_sim_time[31]), .A1(
        \intadd_1/A[29] ), .B0(n792), .Y(n793) );
  oai21_x1 U913 ( .A0(n795), .A1(n794), .B0(n793), .Y(n800) );
  nor2_x1 U914 ( .A(time_us_start_looking_for_new_sim_time[32]), .B(
        \intadd_1/A[30] ), .Y(n895) );
  oai21_x1 U915 ( .A0(time_us_start_looking_for_new_sim_time[36]), .A1(
        \intadd_1/A[34] ), .B0(n796), .Y(n797) );
  nor3_x1 U916 ( .A(n895), .B(n798), .C(n797), .Y(n799) );
  oai21_x1 U917 ( .A0(n801), .A1(n800), .B0(n799), .Y(n804) );
  nor2_x1 U918 ( .A(time_us_start_looking_for_new_sim_time[42]), .B(
        \intadd_1/A[40] ), .Y(n894) );
  nor2_x1 U919 ( .A(time_us_start_looking_for_new_sim_time[43]), .B(
        \intadd_1/A[41] ), .Y(n917) );
  nor2_x1 U920 ( .A(n894), .B(n917), .Y(n807) );
  or2_x1 U921 ( .A(time_us_start_looking_for_new_sim_time[41]), .B(
        \intadd_1/A[39] ), .Y(n867) );
  or2_x1 U922 ( .A(time_us_start_looking_for_new_sim_time[40]), .B(
        \intadd_1/A[38] ), .Y(n802) );
  nand3_x1 U923 ( .A(n807), .B(n867), .C(n802), .Y(n803) );
  aoi21_x1 U924 ( .A0(n805), .A1(n804), .B0(n803), .Y(n810) );
  nor2_x1 U925 ( .A(time_us_start_looking_for_new_sim_time[41]), .B(
        \intadd_1/A[39] ), .Y(n898) );
  nand2_x1 U926 ( .A(time_us_start_looking_for_new_sim_time[40]), .B(
        \intadd_1/A[38] ), .Y(n937) );
  nand2_x1 U927 ( .A(time_us_start_looking_for_new_sim_time[41]), .B(
        \intadd_1/A[39] ), .Y(n866) );
  oai21_x1 U928 ( .A0(n898), .A1(n937), .B0(n866), .Y(n806) );
  aoi21_x1 U929 ( .A0(time_us_start_looking_for_new_sim_time[42]), .A1(
        \intadd_1/A[40] ), .B0(n806), .Y(n808) );
  inv_x1 U930 ( .A(n807), .Y(n852) );
  nand2_x1 U931 ( .A(time_us_start_looking_for_new_sim_time[43]), .B(
        \intadd_1/A[41] ), .Y(n893) );
  oai21_x1 U932 ( .A0(n808), .A1(n852), .B0(n893), .Y(n809) );
  oai22_x1 U933 ( .A0(time_us_start_looking_for_new_sim_time[44]), .A1(n1114), 
        .B0(n810), .B1(n809), .Y(n980) );
  inv_x1 U934 ( .A(time_us_start_looking_for_new_sim_time[6]), .Y(n825) );
  inv_x1 U935 ( .A(time_us_start_looking_for_new_sim_time[5]), .Y(n817) );
  inv_x1 U936 ( .A(time_us_start_looking_for_new_sim_time[2]), .Y(n821) );
  inv_x1 U937 ( .A(time_us_start_looking_for_new_sim_time[1]), .Y(n823) );
  inv_x1 U938 ( .A(ravens_spike_timestamp_us[0]), .Y(n989) );
  nor2_x1 U939 ( .A(time_us_start_looking_for_new_sim_time[0]), .B(n989), .Y(
        n822) );
  nor2b_x1 U940 ( .AN(time_us_start_looking_for_new_sim_time[3]), .B(n832), 
        .Y(n811) );
  nor2_x1 U941 ( .A(n811), .B(\intadd_1/A[1] ), .Y(n813) );
  nor2b_x1 U942 ( .AN(n832), .B(time_us_start_looking_for_new_sim_time[3]), 
        .Y(n812) );
  nor2_x1 U943 ( .A(n813), .B(n812), .Y(n835) );
  aoi21_x1 U944 ( .A0(\intadd_1/A[2] ), .A1(n835), .B0(
        time_us_start_looking_for_new_sim_time[4]), .Y(n814) );
  inv_x1 U945 ( .A(n814), .Y(n815) );
  oai21_x1 U946 ( .A0(n835), .A1(\intadd_1/A[2] ), .B0(n815), .Y(n816) );
  addf_x1 U947 ( .A(n817), .B(ravens_spike_timestamp_us[5]), .CI(n816), .CO(
        n824), .S(n818) );
  nor2_x1 U948 ( .A(n819), .B(n818), .Y(n831) );
  addf_x1 U949 ( .A(n821), .B(ravens_spike_timestamp_us[2]), .CI(n820), .CO(
        n832), .S(n829) );
  addf_x1 U950 ( .A(n823), .B(ravens_spike_timestamp_us[1]), .CI(n822), .CO(
        n820), .S(n828) );
  addf_x1 U951 ( .A(n825), .B(ravens_spike_timestamp_us[6]), .CI(n824), .CO(
        n847), .S(n819) );
  inv_x1 U952 ( .A(n826), .Y(n845) );
  oai21_x1 U953 ( .A0(time_us_start_looking_for_new_sim_time[7]), .A1(
        \intadd_1/A[5] ), .B0(n845), .Y(n827) );
  aoi22_x1 U954 ( .A0(n829), .A1(n828), .B0(n847), .B1(n827), .Y(n830) );
  nand2_x1 U955 ( .A(n831), .B(n830), .Y(n834) );
  xnor3_alt_x1 U956 ( .A(time_us_start_looking_for_new_sim_time[3]), .B(n832), 
        .C(ravens_spike_timestamp_us[3]), .Y(n833) );
  nor2_x1 U957 ( .A(n834), .B(n833), .Y(n978) );
  xnor3_alt_x1 U958 ( .A(ravens_spike_timestamp_us[4]), .B(n835), .C(
        time_us_start_looking_for_new_sim_time[4]), .Y(n977) );
  nor2_x1 U959 ( .A(time_us_start_looking_for_new_sim_time[24]), .B(
        \intadd_1/A[22] ), .Y(n907) );
  xnor3_alt_x1 U960 ( .A(ravens_spike_timestamp_us[25]), .B(n907), .C(
        time_us_start_looking_for_new_sim_time[25]), .Y(n975) );
  inv_x1 U961 ( .A(n836), .Y(n896) );
  xnor3_alt_x1 U962 ( .A(n896), .B(time_us_start_looking_for_new_sim_time[37]), 
        .C(ravens_spike_timestamp_us[37]), .Y(n844) );
  nor2_x1 U963 ( .A(\intadd_1/A[19] ), .B(n837), .Y(n856) );
  inv_x1 U964 ( .A(n926), .Y(n838) );
  oai22_x1 U965 ( .A0(n856), .A1(n839), .B0(n935), .B1(n838), .Y(n843) );
  nor3_x1 U966 ( .A(time_us_start_looking_for_new_sim_time[28]), .B(
        time_us_start_looking_for_new_sim_time[29]), .C(\intadd_1/A[26] ), .Y(
        n861) );
  nor3_x1 U967 ( .A(time_us_start_looking_for_new_sim_time[36]), .B(
        time_us_start_looking_for_new_sim_time[37]), .C(\intadd_1/A[34] ), .Y(
        n865) );
  oai22_x1 U968 ( .A0(n861), .A1(n841), .B0(n865), .B1(n840), .Y(n842) );
  nor3_x1 U969 ( .A(n844), .B(n843), .C(n842), .Y(n974) );
  nor2_x1 U970 ( .A(time_us_start_looking_for_new_sim_time[7]), .B(
        \intadd_1/A[5] ), .Y(n846) );
  oai21_x1 U971 ( .A0(n847), .A1(n846), .B0(n845), .Y(n952) );
  nand2_x1 U972 ( .A(n964), .B(n848), .Y(n963) );
  nor2_x1 U973 ( .A(\intadd_1/A[11] ), .B(n849), .Y(n854) );
  inv_x1 U974 ( .A(n854), .Y(n941) );
  aoi2bb2_x1 U975 ( .B0(n852), .B1(n851), .A0N(n941), .A1N(n850), .Y(n887) );
  nor3_x1 U976 ( .A(time_us_start_looking_for_new_sim_time[24]), .B(
        time_us_start_looking_for_new_sim_time[25]), .C(\intadd_1/A[22] ), .Y(
        n874) );
  oai22_x1 U977 ( .A0(n874), .A1(n855), .B0(n854), .B1(n853), .Y(n864) );
  nor2_x1 U978 ( .A(time_us_start_looking_for_new_sim_time[12]), .B(
        \intadd_1/A[10] ), .Y(n916) );
  aoi21_x1 U979 ( .A0(time_us_start_looking_for_new_sim_time[12]), .A1(
        \intadd_1/A[10] ), .B0(n916), .Y(n858) );
  inv_x1 U980 ( .A(n856), .Y(n929) );
  oai22_x1 U981 ( .A0(n877), .A1(n858), .B0(n857), .B1(n929), .Y(n863) );
  inv_x1 U982 ( .A(n871), .Y(n860) );
  aoi21_x1 U983 ( .A0(time_us_start_looking_for_new_sim_time[20]), .A1(
        \intadd_1/A[18] ), .B0(n919), .Y(n859) );
  oai22_x1 U984 ( .A0(n861), .A1(n860), .B0(n924), .B1(n859), .Y(n862) );
  nor3_x1 U985 ( .A(n864), .B(n863), .C(n862), .Y(n886) );
  inv_x1 U986 ( .A(n865), .Y(n869) );
  nor2_x1 U987 ( .A(time_us_start_looking_for_new_sim_time[40]), .B(
        \intadd_1/A[38] ), .Y(n957) );
  aoi21_x1 U988 ( .A0(n867), .A1(n866), .B0(n957), .Y(n868) );
  aoi21_x1 U989 ( .A0(n876), .A1(n869), .B0(n868), .Y(n885) );
  aoi21_x1 U990 ( .A0(time_us_start_looking_for_new_sim_time[35]), .A1(
        \intadd_1/A[33] ), .B0(n939), .Y(n872) );
  aoi21_x1 U991 ( .A0(time_us_start_looking_for_new_sim_time[31]), .A1(
        \intadd_1/A[29] ), .B0(n912), .Y(n870) );
  oai22_x1 U992 ( .A0(n909), .A1(n872), .B0(n871), .B1(n870), .Y(n883) );
  aoi21_x1 U993 ( .A0(time_us_start_looking_for_new_sim_time[39]), .A1(
        \intadd_1/A[37] ), .B0(n955), .Y(n875) );
  inv_x1 U994 ( .A(n879), .Y(n873) );
  oai22_x1 U995 ( .A0(n876), .A1(n875), .B0(n874), .B1(n873), .Y(n882) );
  aoi21_x1 U996 ( .A0(time_us_start_looking_for_new_sim_time[11]), .A1(
        \intadd_1/A[9] ), .B0(n877), .Y(n880) );
  aoi21_x1 U997 ( .A0(time_us_start_looking_for_new_sim_time[27]), .A1(
        \intadd_1/A[25] ), .B0(n914), .Y(n878) );
  oai22_x1 U998 ( .A0(n889), .A1(n880), .B0(n879), .B1(n878), .Y(n881) );
  nor3_x1 U999 ( .A(n883), .B(n882), .C(n881), .Y(n884) );
  nand4_x1 U1000 ( .A(n887), .B(n886), .C(n885), .D(n884), .Y(n888) );
  aoi21_x1 U1001 ( .A0(n889), .A1(n963), .B0(n888), .Y(n973) );
  nand2_x1 U1002 ( .A(time_us_start_looking_for_new_sim_time[32]), .B(
        \intadd_1/A[30] ), .Y(n891) );
  nand2_x1 U1003 ( .A(time_us_start_looking_for_new_sim_time[24]), .B(
        \intadd_1/A[22] ), .Y(n890) );
  oai22_x1 U1004 ( .A0(n912), .A1(n891), .B0(n923), .B1(n890), .Y(n905) );
  nand2_x1 U1005 ( .A(time_us_start_looking_for_new_sim_time[28]), .B(
        \intadd_1/A[26] ), .Y(n892) );
  oai22_x1 U1006 ( .A0(n894), .A1(n893), .B0(n914), .B1(n892), .Y(n904) );
  nor2_x1 U1007 ( .A(time_us_start_looking_for_new_sim_time[33]), .B(
        \intadd_1/A[31] ), .Y(n902) );
  inv_x1 U1008 ( .A(n895), .Y(n910) );
  nand2_x1 U1009 ( .A(time_us_start_looking_for_new_sim_time[42]), .B(
        \intadd_1/A[40] ), .Y(n897) );
  oai22_x1 U1010 ( .A0(n898), .A1(n897), .B0(n939), .B1(n896), .Y(n899) );
  aoi21_x1 U1011 ( .A0(n910), .A1(n902), .B0(n899), .Y(n900) );
  oai21_x1 U1012 ( .A0(n902), .A1(n901), .B0(n900), .Y(n903) );
  nor3_x1 U1013 ( .A(n905), .B(n904), .C(n903), .Y(n951) );
  inv_x1 U1014 ( .A(n923), .Y(n906) );
  aoi22_x1 U1015 ( .A0(n909), .A1(n908), .B0(n907), .B1(n906), .Y(n950) );
  nand2_x1 U1016 ( .A(time_us_start_looking_for_new_sim_time[33]), .B(
        \intadd_1/A[31] ), .Y(n911) );
  mxi2_x1 U1017 ( .A0(n912), .A1(n911), .S(n910), .YN(n922) );
  inv_x1 U1018 ( .A(n913), .Y(n953) );
  oai22_x1 U1019 ( .A0(n916), .A1(n915), .B0(n914), .B1(n953), .Y(n921) );
  oai22_x1 U1020 ( .A0(n919), .A1(n918), .B0(n917), .B1(n981), .Y(n920) );
  nor3_x1 U1021 ( .A(n922), .B(n921), .C(n920), .Y(n949) );
  aoi21_x1 U1022 ( .A0(time_us_start_looking_for_new_sim_time[23]), .A1(
        \intadd_1/A[21] ), .B0(n923), .Y(n931) );
  nor2_x1 U1023 ( .A(time_us_start_looking_for_new_sim_time[16]), .B(
        \intadd_1/A[14] ), .Y(n959) );
  aoi21_x1 U1024 ( .A0(time_us_start_looking_for_new_sim_time[17]), .A1(
        \intadd_1/A[15] ), .B0(n935), .Y(n927) );
  aoi21_x1 U1025 ( .A0(time_us_start_looking_for_new_sim_time[19]), .A1(
        \intadd_1/A[17] ), .B0(n924), .Y(n925) );
  oai22_x1 U1026 ( .A0(n959), .A1(n927), .B0(n926), .B1(n925), .Y(n928) );
  aoi21_x1 U1027 ( .A0(n929), .A1(n932), .B0(n928), .Y(n930) );
  oai21_x1 U1028 ( .A0(n932), .A1(n931), .B0(n930), .Y(n947) );
  inv_x1 U1029 ( .A(n933), .Y(n934) );
  oai22_x1 U1030 ( .A0(n954), .A1(n936), .B0(n935), .B1(n934), .Y(n946) );
  aoi21_x1 U1031 ( .A0(time_us_start_looking_for_new_sim_time[15]), .A1(
        \intadd_1/A[13] ), .B0(n954), .Y(n943) );
  nand2_x1 U1032 ( .A(time_us_start_looking_for_new_sim_time[36]), .B(
        \intadd_1/A[34] ), .Y(n938) );
  oai22_x1 U1033 ( .A0(n939), .A1(n938), .B0(n955), .B1(n937), .Y(n940) );
  aoi21_x1 U1034 ( .A0(n941), .A1(n944), .B0(n940), .Y(n942) );
  oai21_x1 U1035 ( .A0(n944), .A1(n943), .B0(n942), .Y(n945) );
  nor3_x1 U1036 ( .A(n947), .B(n946), .C(n945), .Y(n948) );
  nand4_x1 U1037 ( .A(n951), .B(n950), .C(n949), .D(n948), .Y(n971) );
  xnor3_alt_x1 U1038 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(
        \intadd_1/A[6] ), .C(n952), .Y(n962) );
  xnor3_alt_x1 U1039 ( .A(\intadd_1/A[27] ), .B(n953), .C(
        time_us_start_looking_for_new_sim_time[29]), .Y(n961) );
  inv_x1 U1040 ( .A(n954), .Y(n958) );
  inv_x1 U1041 ( .A(n955), .Y(n956) );
  aoi22_x1 U1042 ( .A0(n959), .A1(n958), .B0(n957), .B1(n956), .Y(n960) );
  nand3_x1 U1043 ( .A(n962), .B(n961), .C(n960), .Y(n970) );
  inv_x1 U1044 ( .A(n963), .Y(n967) );
  inv_x1 U1045 ( .A(n964), .Y(n965) );
  aoi21_x1 U1046 ( .A0(time_us_start_looking_for_new_sim_time[9]), .A1(n965), 
        .B0(n967), .Y(n966) );
  oai22_x1 U1047 ( .A0(n968), .A1(n967), .B0(ravens_spike_timestamp_us[9]), 
        .B1(n966), .Y(n969) );
  nor3_x1 U1048 ( .A(n971), .B(n970), .C(n969), .Y(n972) );
  nand4_x2 U1049 ( .A(n975), .B(n974), .C(n973), .D(n972), .Y(n976) );
  aoi21_x1 U1050 ( .A0(n978), .A1(n977), .B0(n976), .Y(n979) );
  aoi21_x1 U1051 ( .A0(n981), .A1(n980), .B0(n979), .Y(n983) );
  aoi22_x1 U1052 ( .A0(cur_fsm_state[0]), .A1(n998), .B0(n983), .B1(n982), .Y(
        n984) );
  nand2_x2 U1053 ( .A(new_spike), .B(n984), .Y(n1127) );
  nor3_x1 U1054 ( .A(cur_fsm_state[2]), .B(cur_fsm_state[1]), .C(n1127), .Y(
        \next_fsm_state[1] ) );
  inv_x1 U1055 ( .A(n1120), .Y(N73) );
  inv_x1 U1056 ( .A(n113), .Y(n1116) );
  nor3b_x1 U1057 ( .AN(n1119), .B(n987), .C(n1116), .Y(N126) );
  nor2_x1 U1058 ( .A(n988), .B(n1002), .Y(n993) );
  oai21_x1 U1059 ( .A0(segment_last_timestamp_us[0]), .A1(n1010), .B0(n113), 
        .Y(n990) );
  inv_x1 U1060 ( .A(n112), .Y(n1113) );
  oai22_x1 U1061 ( .A0(n993), .A1(n990), .B0(n989), .B1(n1113), .Y(N74) );
  oai2bb2_x1 U1062 ( .B0(n1113), .B1(n992), .A0N(n113), .A1N(n991), .Y(N75) );
  addf_x1 U1063 ( .A(segment_last_timestamp_us[1]), .B(n1009), .CI(n993), .CO(
        n994), .S(n991) );
  oai21_x1 U1064 ( .A0(segment_last_timestamp_us[2]), .A1(n994), .B0(n113), 
        .Y(n995) );
  oai22_x1 U1065 ( .A0(n997), .A1(n995), .B0(\intadd_1/A[0] ), .B1(n1113), .Y(
        N76) );
  oai2bb2_x1 U1066 ( .B0(\intadd_1/A[1] ), .B1(n1113), .A0N(n113), .A1N(n996), 
        .Y(N77) );
  addf_x1 U1067 ( .A(segment_last_timestamp_us[3]), .B(n1010), .CI(n997), .CO(
        n1001), .S(n996) );
  aoi21_x1 U1068 ( .A0(n1009), .A1(n1010), .B0(n998), .Y(n1000) );
  oai2bb2_x1 U1069 ( .B0(\intadd_1/A[2] ), .B1(n1113), .A0N(n113), .A1N(n999), 
        .Y(N78) );
  addf_x1 U1070 ( .A(segment_last_timestamp_us[4]), .B(n1001), .CI(n1000), 
        .CO(n1004), .S(n999) );
  inv_x1 U1071 ( .A(n1004), .Y(n1007) );
  aoi21_x1 U1072 ( .A0(n1009), .A1(n1002), .B0(segment_last_timestamp_us[5]), 
        .Y(n1006) );
  nor2b_x1 U1073 ( .AN(n1008), .B(n1006), .Y(n1003) );
  mxi2_x1 U1074 ( .A0(n1004), .A1(n1007), .S(n1003), .YN(n1005) );
  oai22_x1 U1075 ( .A0(n1116), .A1(n1005), .B0(\intadd_1/A[3] ), .B1(n1113), 
        .Y(N79) );
  aoi21_x1 U1076 ( .A0(n1008), .A1(n1007), .B0(n1006), .Y(n1015) );
  inv_x1 U1077 ( .A(segment_last_timestamp_us[6]), .Y(n1013) );
  nand2_x1 U1078 ( .A(n1010), .B(n1009), .Y(n1012) );
  xnor3_alt_x1 U1079 ( .A(n1015), .B(n1013), .C(n1012), .Y(n1011) );
  oai22_x1 U1080 ( .A0(n1116), .A1(n1011), .B0(\intadd_1/A[4] ), .B1(n1113), 
        .Y(N80) );
  nor2_x1 U1081 ( .A(n1013), .B(n1012), .Y(n1016) );
  nand2_x1 U1082 ( .A(n1013), .B(n1012), .Y(n1014) );
  oai21_x1 U1083 ( .A0(n1016), .A1(n1015), .B0(n1014), .Y(n1017) );
  nor2_x1 U1084 ( .A(n1018), .B(n1017), .Y(n1021) );
  aoi21_x1 U1085 ( .A0(n1018), .A1(n1017), .B0(n1021), .Y(n1019) );
  nand2_x1 U1086 ( .A(n113), .B(n1019), .Y(n1020) );
  oai21_x1 U1087 ( .A0(n1113), .A1(\intadd_1/A[5] ), .B0(n1020), .Y(N81) );
  nand2_x1 U1088 ( .A(segment_last_timestamp_us[8]), .B(n1021), .Y(n1023) );
  oai21_x1 U1089 ( .A0(segment_last_timestamp_us[8]), .A1(n1021), .B0(n1023), 
        .Y(n1022) );
  oai22_x1 U1090 ( .A0(n1116), .A1(n1022), .B0(\intadd_1/A[6] ), .B1(n1113), 
        .Y(N82) );
  inv_x1 U1091 ( .A(n1023), .Y(n1024) );
  and2_x1 U1092 ( .A(segment_last_timestamp_us[9]), .B(n1024), .Y(n1026) );
  oai21_x1 U1093 ( .A0(segment_last_timestamp_us[9]), .A1(n1024), .B0(n113), 
        .Y(n1025) );
  oai22_x1 U1094 ( .A0(n1026), .A1(n1025), .B0(\intadd_1/A[7] ), .B1(n1113), 
        .Y(N83) );
  nand2_x1 U1095 ( .A(segment_last_timestamp_us[10]), .B(n1026), .Y(n1028) );
  oai21_x1 U1096 ( .A0(segment_last_timestamp_us[10]), .A1(n1026), .B0(n1028), 
        .Y(n1027) );
  oai22_x1 U1097 ( .A0(n1116), .A1(n1027), .B0(\intadd_1/A[8] ), .B1(n1113), 
        .Y(N84) );
  nor2_x1 U1098 ( .A(n1029), .B(n1028), .Y(n1031) );
  oai22_x1 U1099 ( .A0(n1031), .A1(n1030), .B0(\intadd_1/A[9] ), .B1(n1113), 
        .Y(N85) );
  oai21_x1 U1100 ( .A0(segment_last_timestamp_us[12]), .A1(n1031), .B0(n1033), 
        .Y(n1032) );
  oai22_x1 U1101 ( .A0(n1116), .A1(n1032), .B0(\intadd_1/A[10] ), .B1(n1113), 
        .Y(N86) );
  nor2_x1 U1102 ( .A(n1034), .B(n1033), .Y(n1036) );
  oai2bb1_x1 U1103 ( .A0N(n1034), .A1N(n1033), .B0(n113), .Y(n1035) );
  oai22_x1 U1104 ( .A0(n1036), .A1(n1035), .B0(\intadd_1/A[11] ), .B1(n1113), 
        .Y(N87) );
  nand2_x1 U1105 ( .A(segment_last_timestamp_us[14]), .B(n1036), .Y(n1038) );
  oai21_x1 U1106 ( .A0(segment_last_timestamp_us[14]), .A1(n1036), .B0(n1038), 
        .Y(n1037) );
  oai22_x1 U1107 ( .A0(n1116), .A1(n1037), .B0(\intadd_1/A[12] ), .B1(n1113), 
        .Y(N88) );
  nor2_x1 U1108 ( .A(n1039), .B(n1038), .Y(n1041) );
  oai2bb1_x1 U1109 ( .A0N(n1039), .A1N(n1038), .B0(n113), .Y(n1040) );
  oai22_x1 U1110 ( .A0(n1041), .A1(n1040), .B0(\intadd_1/A[13] ), .B1(n1113), 
        .Y(N89) );
  nand2_x1 U1111 ( .A(segment_last_timestamp_us[16]), .B(n1041), .Y(n1043) );
  oai21_x1 U1112 ( .A0(segment_last_timestamp_us[16]), .A1(n1041), .B0(n1043), 
        .Y(n1042) );
  oai22_x1 U1113 ( .A0(n1116), .A1(n1042), .B0(\intadd_1/A[14] ), .B1(n1113), 
        .Y(N90) );
  inv_x1 U1114 ( .A(n1043), .Y(n1044) );
  oai21_x1 U1115 ( .A0(segment_last_timestamp_us[17]), .A1(n1044), .B0(n113), 
        .Y(n1045) );
  oai22_x1 U1116 ( .A0(n1046), .A1(n1045), .B0(\intadd_1/A[15] ), .B1(n1113), 
        .Y(N91) );
  nand2_x1 U1117 ( .A(segment_last_timestamp_us[18]), .B(n1046), .Y(n1048) );
  oai21_x1 U1118 ( .A0(segment_last_timestamp_us[18]), .A1(n1046), .B0(n1048), 
        .Y(n1047) );
  oai22_x1 U1119 ( .A0(n1116), .A1(n1047), .B0(\intadd_1/A[16] ), .B1(n1113), 
        .Y(N92) );
  inv_x1 U1120 ( .A(n1048), .Y(n1049) );
  and2_x1 U1121 ( .A(segment_last_timestamp_us[19]), .B(n1049), .Y(n1051) );
  oai21_x1 U1122 ( .A0(segment_last_timestamp_us[19]), .A1(n1049), .B0(n113), 
        .Y(n1050) );
  oai22_x1 U1123 ( .A0(n1051), .A1(n1050), .B0(\intadd_1/A[17] ), .B1(n1113), 
        .Y(N93) );
  nand2_x1 U1124 ( .A(segment_last_timestamp_us[20]), .B(n1051), .Y(n1053) );
  oai21_x1 U1125 ( .A0(segment_last_timestamp_us[20]), .A1(n1051), .B0(n1053), 
        .Y(n1052) );
  oai22_x1 U1126 ( .A0(n1116), .A1(n1052), .B0(\intadd_1/A[18] ), .B1(n1113), 
        .Y(N94) );
  nor2_x1 U1127 ( .A(n1054), .B(n1053), .Y(n1056) );
  oai2bb1_x1 U1128 ( .A0N(n1054), .A1N(n1053), .B0(n113), .Y(n1055) );
  oai22_x1 U1129 ( .A0(n1056), .A1(n1055), .B0(\intadd_1/A[19] ), .B1(n1113), 
        .Y(N95) );
  nand2_x1 U1130 ( .A(segment_last_timestamp_us[22]), .B(n1056), .Y(n1058) );
  oai21_x1 U1131 ( .A0(segment_last_timestamp_us[22]), .A1(n1056), .B0(n1058), 
        .Y(n1057) );
  oai22_x1 U1132 ( .A0(n1116), .A1(n1057), .B0(\intadd_1/A[20] ), .B1(n1113), 
        .Y(N96) );
  nor2_x1 U1133 ( .A(n1059), .B(n1058), .Y(n1061) );
  oai22_x1 U1134 ( .A0(n1061), .A1(n1060), .B0(\intadd_1/A[21] ), .B1(n1113), 
        .Y(N97) );
  nand2_x1 U1135 ( .A(segment_last_timestamp_us[24]), .B(n1061), .Y(n1063) );
  oai21_x1 U1136 ( .A0(segment_last_timestamp_us[24]), .A1(n1061), .B0(n1063), 
        .Y(n1062) );
  oai22_x1 U1137 ( .A0(n1116), .A1(n1062), .B0(\intadd_1/A[22] ), .B1(n1113), 
        .Y(N98) );
  nor2_x1 U1138 ( .A(n1064), .B(n1063), .Y(n1066) );
  oai2bb1_x1 U1139 ( .A0N(n1064), .A1N(n1063), .B0(n113), .Y(n1065) );
  oai22_x1 U1140 ( .A0(n1066), .A1(n1065), .B0(\intadd_1/A[23] ), .B1(n1113), 
        .Y(N99) );
  oai21_x1 U1141 ( .A0(segment_last_timestamp_us[26]), .A1(n1066), .B0(n1068), 
        .Y(n1067) );
  oai22_x1 U1142 ( .A0(n1116), .A1(n1067), .B0(\intadd_1/A[24] ), .B1(n1113), 
        .Y(N100) );
  nor2_x1 U1143 ( .A(n1069), .B(n1068), .Y(n1071) );
  oai2bb1_x1 U1144 ( .A0N(n1069), .A1N(n1068), .B0(n113), .Y(n1070) );
  oai22_x1 U1145 ( .A0(n1071), .A1(n1070), .B0(\intadd_1/A[25] ), .B1(n1113), 
        .Y(N101) );
  nand2_x1 U1146 ( .A(segment_last_timestamp_us[28]), .B(n1071), .Y(n1073) );
  oai21_x1 U1147 ( .A0(segment_last_timestamp_us[28]), .A1(n1071), .B0(n1073), 
        .Y(n1072) );
  oai22_x1 U1148 ( .A0(n1116), .A1(n1072), .B0(\intadd_1/A[26] ), .B1(n1113), 
        .Y(N102) );
  inv_x1 U1149 ( .A(n1073), .Y(n1074) );
  oai21_x1 U1150 ( .A0(segment_last_timestamp_us[29]), .A1(n1074), .B0(n113), 
        .Y(n1075) );
  oai22_x1 U1151 ( .A0(n1076), .A1(n1075), .B0(\intadd_1/A[27] ), .B1(n1113), 
        .Y(N103) );
  nand2_x1 U1152 ( .A(segment_last_timestamp_us[30]), .B(n1076), .Y(n1078) );
  oai21_x1 U1153 ( .A0(segment_last_timestamp_us[30]), .A1(n1076), .B0(n1078), 
        .Y(n1077) );
  oai22_x1 U1154 ( .A0(n1116), .A1(n1077), .B0(\intadd_1/A[28] ), .B1(n1113), 
        .Y(N104) );
  inv_x1 U1155 ( .A(n1078), .Y(n1079) );
  and2_x1 U1156 ( .A(segment_last_timestamp_us[31]), .B(n1079), .Y(n1081) );
  oai21_x1 U1157 ( .A0(segment_last_timestamp_us[31]), .A1(n1079), .B0(n113), 
        .Y(n1080) );
  oai22_x1 U1158 ( .A0(n1081), .A1(n1080), .B0(\intadd_1/A[29] ), .B1(n1113), 
        .Y(N105) );
  nand2_x1 U1159 ( .A(segment_last_timestamp_us[32]), .B(n1081), .Y(n1083) );
  oai21_x1 U1160 ( .A0(segment_last_timestamp_us[32]), .A1(n1081), .B0(n1083), 
        .Y(n1082) );
  oai22_x1 U1161 ( .A0(n1116), .A1(n1082), .B0(\intadd_1/A[30] ), .B1(n1113), 
        .Y(N106) );
  inv_x1 U1162 ( .A(n1083), .Y(n1084) );
  and2_x1 U1163 ( .A(segment_last_timestamp_us[33]), .B(n1084), .Y(n1086) );
  oai21_x1 U1164 ( .A0(segment_last_timestamp_us[33]), .A1(n1084), .B0(n113), 
        .Y(n1085) );
  oai22_x1 U1165 ( .A0(n1086), .A1(n1085), .B0(\intadd_1/A[31] ), .B1(n1113), 
        .Y(N107) );
  nand2_x1 U1166 ( .A(segment_last_timestamp_us[34]), .B(n1086), .Y(n1088) );
  oai21_x1 U1167 ( .A0(segment_last_timestamp_us[34]), .A1(n1086), .B0(n1088), 
        .Y(n1087) );
  oai22_x1 U1168 ( .A0(n1116), .A1(n1087), .B0(\intadd_1/A[32] ), .B1(n1113), 
        .Y(N108) );
  inv_x1 U1169 ( .A(n1088), .Y(n1089) );
  oai21_x1 U1170 ( .A0(segment_last_timestamp_us[35]), .A1(n1089), .B0(n113), 
        .Y(n1090) );
  oai22_x1 U1171 ( .A0(n1091), .A1(n1090), .B0(\intadd_1/A[33] ), .B1(n1113), 
        .Y(N109) );
  nand2_x1 U1172 ( .A(segment_last_timestamp_us[36]), .B(n1091), .Y(n1093) );
  oai21_x1 U1173 ( .A0(segment_last_timestamp_us[36]), .A1(n1091), .B0(n1093), 
        .Y(n1092) );
  oai22_x1 U1174 ( .A0(n1116), .A1(n1092), .B0(\intadd_1/A[34] ), .B1(n1113), 
        .Y(N110) );
  inv_x1 U1175 ( .A(n1093), .Y(n1094) );
  and2_x1 U1176 ( .A(segment_last_timestamp_us[37]), .B(n1094), .Y(n1096) );
  oai21_x1 U1177 ( .A0(segment_last_timestamp_us[37]), .A1(n1094), .B0(n113), 
        .Y(n1095) );
  oai22_x1 U1178 ( .A0(n1096), .A1(n1095), .B0(\intadd_1/A[35] ), .B1(n1113), 
        .Y(N111) );
  nand2_x1 U1179 ( .A(segment_last_timestamp_us[38]), .B(n1096), .Y(n1098) );
  oai21_x1 U1180 ( .A0(segment_last_timestamp_us[38]), .A1(n1096), .B0(n1098), 
        .Y(n1097) );
  oai22_x1 U1181 ( .A0(n1116), .A1(n1097), .B0(\intadd_1/A[36] ), .B1(n1113), 
        .Y(N112) );
  inv_x1 U1182 ( .A(n1098), .Y(n1099) );
  and2_x1 U1183 ( .A(segment_last_timestamp_us[39]), .B(n1099), .Y(n1101) );
  oai21_x1 U1184 ( .A0(segment_last_timestamp_us[39]), .A1(n1099), .B0(n113), 
        .Y(n1100) );
  oai22_x1 U1185 ( .A0(n1101), .A1(n1100), .B0(\intadd_1/A[37] ), .B1(n1113), 
        .Y(N113) );
  nand2_x1 U1186 ( .A(segment_last_timestamp_us[40]), .B(n1101), .Y(n1103) );
  oai21_x1 U1187 ( .A0(segment_last_timestamp_us[40]), .A1(n1101), .B0(n1103), 
        .Y(n1102) );
  oai22_x1 U1188 ( .A0(n1116), .A1(n1102), .B0(\intadd_1/A[38] ), .B1(n1113), 
        .Y(N114) );
  nor2_x1 U1189 ( .A(n1104), .B(n1103), .Y(n1106) );
  oai22_x1 U1190 ( .A0(n1106), .A1(n1105), .B0(\intadd_1/A[39] ), .B1(n1113), 
        .Y(N115) );
  oai21_x1 U1191 ( .A0(segment_last_timestamp_us[42]), .A1(n1106), .B0(n1108), 
        .Y(n1107) );
  oai22_x1 U1192 ( .A0(n1116), .A1(n1107), .B0(\intadd_1/A[40] ), .B1(n1113), 
        .Y(N116) );
  nor2_x1 U1193 ( .A(n1109), .B(n1108), .Y(n1111) );
  oai2bb1_x1 U1194 ( .A0N(n1109), .A1N(n1108), .B0(n113), .Y(n1110) );
  oai22_x1 U1195 ( .A0(n1111), .A1(n1110), .B0(\intadd_1/A[41] ), .B1(n1113), 
        .Y(N117) );
  mxi2_x1 U1196 ( .A0(segment_last_timestamp_us[44]), .A1(n1112), .S(n1111), 
        .YN(n1115) );
  oai22_x1 U1197 ( .A0(n1116), .A1(n1115), .B0(n1114), .B1(n1113), .Y(N118) );
  nand2_x1 U1198 ( .A(cur_fsm_state[0]), .B(N361), .Y(n1125) );
  nand2_x1 U1199 ( .A(n1118), .B(n1117), .Y(n1122) );
  aoi21_x1 U1200 ( .A0(n1122), .A1(n1121), .B0(n1120), .Y(n1129) );
  inv_x1 U1201 ( .A(n1129), .Y(n1123) );
  oai21_x1 U1202 ( .A0(n1125), .A1(n1124), .B0(n1123), .Y(n111) );
  aoi21_x1 U1203 ( .A0(n1128), .A1(n1127), .B0(n1126), .Y(n1131) );
  nor3_x1 U1204 ( .A(n1131), .B(n1130), .C(n1129), .Y(n108) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_event_to_ravens ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net191, net193, net194, net197, n1;
  assign net191 = CLK;
  assign ENCLK = net193;
  assign net194 = EN;

  latchgd_x1 latch ( .G(n1), .D(net194), .Q(net197) );
  and2_x2 main_gate ( .A(net197), .B(net191), .Y(net193) );
  inv_x1 U2 ( .A(net191), .Y(n1) );
endmodule


module dvs_event_to_ravens ( clk, rst_n, fifo_grant, fifo_event, time_us, 
        fifo_req, fifo_rd_en, ravens_pkt );
  input [63:0] fifo_event;
  input [44:0] time_us;
  output [31:0] ravens_pkt;
  input clk, rst_n, fifo_grant;
  output fifo_req, fifo_rd_en;
  wire   new_spike, sent_spike, \next_fsm_state[0] , net203, n4, n5, n49, n50,
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
        .EN(n5), .ENCLK(net203) );
  ffrhq_x1 \dvs_event_reg[1]  ( .D(fifo_event[1]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[1]) );
  ffr_x1 \dvs_event_reg[49]  ( .D(fifo_event[49]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[49]) );
  ffr_x1 \dvs_event_reg[33]  ( .D(fifo_event[33]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[33]) );
  ffr_x1 \dvs_event_reg[18]  ( .D(fifo_event[18]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[18]) );
  ffr_x1 \dvs_event_reg[3]  ( .D(fifo_event[3]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[3]) );
  ffr_x1 \cur_fsm_state_reg[0]  ( .D(\next_fsm_state[0] ), .CLK(clk), .RSTN(
        rst_n), .Q(cur_fsm_state[0]) );
  ffr_x1 \cur_fsm_state_reg[1]  ( .D(fifo_rd_en), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[1]) );
  ffr_x1 \dvs_event_reg[62]  ( .D(fifo_event[62]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[62]) );
  ffr_x1 \dvs_event_reg[61]  ( .D(fifo_event[61]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[61]) );
  ffr_x1 \dvs_event_reg[60]  ( .D(fifo_event[60]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[60]) );
  ffr_x1 \dvs_event_reg[59]  ( .D(fifo_event[59]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[59]) );
  ffr_x1 \dvs_event_reg[58]  ( .D(fifo_event[58]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[58]) );
  ffr_x1 \dvs_event_reg[57]  ( .D(fifo_event[57]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[57]) );
  ffr_x1 \dvs_event_reg[56]  ( .D(fifo_event[56]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[56]) );
  ffr_x1 \dvs_event_reg[55]  ( .D(fifo_event[55]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[55]) );
  ffr_x1 \dvs_event_reg[52]  ( .D(fifo_event[52]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[52]) );
  ffr_x1 \dvs_event_reg[51]  ( .D(fifo_event[51]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[51]) );
  ffr_x1 \dvs_event_reg[50]  ( .D(fifo_event[50]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[50]) );
  ffr_x1 \dvs_event_reg[48]  ( .D(fifo_event[48]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[48]) );
  ffr_x1 \dvs_event_reg[47]  ( .D(fifo_event[47]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[47]) );
  ffr_x1 \dvs_event_reg[46]  ( .D(fifo_event[46]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[46]) );
  ffr_x1 \dvs_event_reg[44]  ( .D(fifo_event[44]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[44]) );
  ffr_x1 \dvs_event_reg[43]  ( .D(fifo_event[43]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[43]) );
  ffr_x1 \dvs_event_reg[42]  ( .D(fifo_event[42]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[42]) );
  ffr_x1 \dvs_event_reg[41]  ( .D(fifo_event[41]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[41]) );
  ffr_x1 \dvs_event_reg[40]  ( .D(fifo_event[40]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[40]) );
  ffr_x1 \dvs_event_reg[39]  ( .D(fifo_event[39]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[39]) );
  ffr_x1 \dvs_event_reg[38]  ( .D(fifo_event[38]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[38]) );
  ffr_x1 \dvs_event_reg[37]  ( .D(fifo_event[37]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[37]) );
  ffr_x1 \dvs_event_reg[36]  ( .D(fifo_event[36]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[36]) );
  ffr_x1 \dvs_event_reg[35]  ( .D(fifo_event[35]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[35]) );
  ffr_x1 \dvs_event_reg[34]  ( .D(fifo_event[34]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[34]) );
  ffr_x1 \dvs_event_reg[32]  ( .D(fifo_event[32]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[32]) );
  ffr_x1 \dvs_event_reg[31]  ( .D(fifo_event[31]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[31]) );
  ffr_x1 \dvs_event_reg[30]  ( .D(fifo_event[30]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[30]) );
  ffr_x1 \dvs_event_reg[29]  ( .D(fifo_event[29]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[29]) );
  ffr_x1 \dvs_event_reg[28]  ( .D(fifo_event[28]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[28]) );
  ffr_x1 \dvs_event_reg[27]  ( .D(fifo_event[27]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[27]) );
  ffr_x1 \dvs_event_reg[26]  ( .D(fifo_event[26]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[26]) );
  ffr_x1 \dvs_event_reg[25]  ( .D(fifo_event[25]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[25]) );
  ffr_x1 \dvs_event_reg[24]  ( .D(fifo_event[24]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[24]) );
  ffr_x1 \dvs_event_reg[23]  ( .D(fifo_event[23]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[23]) );
  ffr_x1 \dvs_event_reg[22]  ( .D(fifo_event[22]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[22]) );
  ffr_x1 \dvs_event_reg[21]  ( .D(fifo_event[21]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[21]) );
  ffr_x1 \dvs_event_reg[20]  ( .D(fifo_event[20]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[20]) );
  ffr_x1 \dvs_event_reg[19]  ( .D(fifo_event[19]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[19]) );
  ffr_x1 \dvs_event_reg[17]  ( .D(fifo_event[17]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[17]) );
  ffr_x1 \dvs_event_reg[16]  ( .D(fifo_event[16]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[16]) );
  ffr_x1 \dvs_event_reg[15]  ( .D(fifo_event[15]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[15]) );
  ffr_x1 \dvs_event_reg[14]  ( .D(fifo_event[14]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[14]) );
  ffr_x1 \dvs_event_reg[13]  ( .D(fifo_event[13]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[13]) );
  ffr_x1 \dvs_event_reg[12]  ( .D(fifo_event[12]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[12]) );
  ffr_x1 \dvs_event_reg[11]  ( .D(fifo_event[11]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[11]) );
  ffr_x1 \dvs_event_reg[10]  ( .D(fifo_event[10]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[10]) );
  ffr_x1 \dvs_event_reg[9]  ( .D(fifo_event[9]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[9]) );
  ffr_x1 \dvs_event_reg[8]  ( .D(fifo_event[8]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[8]) );
  ffr_x1 \dvs_event_reg[7]  ( .D(fifo_event[7]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[7]) );
  ffr_x1 \dvs_event_reg[6]  ( .D(fifo_event[6]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[6]) );
  ffr_x1 \dvs_event_reg[5]  ( .D(fifo_event[5]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[5]) );
  ffr_x1 \dvs_event_reg[4]  ( .D(fifo_event[4]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[4]) );
  ffr_x1 \dvs_event_reg[2]  ( .D(fifo_event[2]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[2]) );
  ffr_x1 \dvs_event_reg[0]  ( .D(fifo_event[0]), .CLK(net203), .RSTN(rst_n), 
        .Q(dvs_event[0]) );
  ffr_x1 new_spike_reg ( .D(n4), .CLK(clk), .RSTN(rst_n), .Q(new_spike) );
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
         fifo_empty, fifo_full, fifo_grant_read, fifo_rd_en, net300, net5497;
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
  assign ravens_pkt[31] = net300;
  assign ravens_pkt[28] = net300;
  assign ravens_pkt[27] = net300;
  assign ravens_pkt[26] = net300;
  assign ravens_pkt[25] = net300;
  assign ravens_pkt[24] = net300;
  assign ravens_pkt[23] = net300;
  assign ravens_pkt[22] = net300;
  assign ravens_pkt[21] = net300;
  assign ravens_pkt[20] = net300;
  assign ravens_pkt[19] = net300;
  assign ravens_pkt[18] = net300;
  assign ravens_pkt[17] = net300;
  assign ravens_pkt[16] = net300;
  assign ravens_pkt[15] = net300;
  assign ravens_pkt[14] = net300;
  assign ravens_pkt[13] = net300;
  assign ravens_pkt[4] = net300;
  assign ravens_pkt[3] = net300;
  assign ravens_pkt[2] = net300;
  assign ravens_pkt[1] = net300;
  assign ravens_pkt[0] = net300;

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
        .fifo_grant(fifo_grant_read), .fifo_event({net300, 
        fifo_read_event[62:55], net300, net5497, fifo_read_event[52:46], 
        net300, fifo_read_event[44:0]}), .time_us(time_us), .fifo_req(
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
  tielo U2 ( .L(net300) );
endmodule


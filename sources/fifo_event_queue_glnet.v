/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Mon May  6 01:40:04 2024
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


module SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net21, net23, net24, net27, n1;
  assign net21 = CLK;
  assign ENCLK = net23;
  assign net24 = EN;

  latchgd_x1 latch ( .G(n1), .D(net24), .Q(net27) );
  and2_x1 main_gate ( .A(net27), .B(net21), .Y(net23) );
  inv_x1 U2 ( .A(net21), .Y(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net21, net23, net24, net27, n2;
  assign net21 = CLK;
  assign ENCLK = net23;
  assign net24 = EN;

  latchgd_x1 latch ( .G(n2), .D(net24), .Q(net27) );
  and2_x1 main_gate ( .A(net27), .B(net21), .Y(net23) );
  inv_x1 U2 ( .A(net21), .Y(n2) );
endmodule


module dvs_fifo_event_queue ( clk, rst_n, event_in, wr_en, rd_en, event_out, 
        empty, full );
  input [63:0] event_in;
  output [63:0] event_out;
  input clk, rst_n, wr_en, rd_en;
  output empty, full;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, net33, net38, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86;
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
        .dout44(event_out[44]), .dout45(event_out[45]), .dout46(event_out[46]), 
        .dout47(event_out[47]), .dout48(event_out[48]), .dout49(event_out[49]), 
        .dout50(event_out[50]), .dout51(event_out[51]), .dout52(event_out[52]), 
        .dout53(event_out[53]), .dout54(event_out[54]), .dout55(event_out[55]), 
        .dout56(event_out[56]), .dout57(event_out[57]), .dout58(event_out[58]), 
        .dout59(event_out[59]), .dout60(event_out[60]), .dout61(event_out[61]), 
        .dout62(event_out[62]), .dout63(event_out[63]), .clk(clk), .write_en(
        wr_en), .sense_en(rd_en) );
  SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_0 clk_gate_write_ptr_reg ( .CLK(
        clk), .EN(N3), .ENCLK(net33) );
  SNPS_CLOCK_GATE_HIGH_dvs_fifo_event_queue_1 clk_gate_read_ptr_reg ( .CLK(clk), .EN(N14), .ENCLK(net38) );
  ffr_x1 \read_ptr_reg[6]  ( .D(N21), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[6]) );
  ffr_x1 \write_ptr_reg[9]  ( .D(N13), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[9]) );
  ffr_x1 \write_ptr_reg[8]  ( .D(N12), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[8]) );
  ffr_x1 \write_ptr_reg[7]  ( .D(N11), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[7]) );
  ffr_x1 \write_ptr_reg[6]  ( .D(N10), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[6]) );
  ffr_x1 \write_ptr_reg[5]  ( .D(N9), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[5]) );
  ffr_x1 \write_ptr_reg[4]  ( .D(N8), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[4]) );
  ffr_x1 \write_ptr_reg[3]  ( .D(N7), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[3]) );
  ffr_x1 \write_ptr_reg[2]  ( .D(N6), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[2]) );
  ffr_x1 \write_ptr_reg[1]  ( .D(N5), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[1]) );
  ffr_x1 \write_ptr_reg[0]  ( .D(N4), .CLK(net33), .RSTN(rst_n), .Q(
        write_ptr[0]) );
  ffr_x1 \read_ptr_reg[0]  ( .D(N15), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[0]) );
  ffr_x1 \read_ptr_reg[9]  ( .D(N24), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[9]) );
  ffr_x1 \read_ptr_reg[8]  ( .D(N23), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[8]) );
  ffr_x1 \read_ptr_reg[7]  ( .D(N22), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[7]) );
  ffr_x1 \read_ptr_reg[5]  ( .D(N20), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[5]) );
  ffr_x1 \read_ptr_reg[4]  ( .D(N19), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[4]) );
  ffr_x1 \read_ptr_reg[3]  ( .D(N18), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[3]) );
  ffr_x1 \read_ptr_reg[2]  ( .D(N17), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[2]) );
  ffr_x1 \read_ptr_reg[1]  ( .D(N16), .CLK(net38), .RSTN(rst_n), .Q(
        read_ptr[1]) );
  nand2_x1 U40 ( .A(write_ptr[4]), .B(n44), .Y(n41) );
  nor2_x1 U41 ( .A(n77), .B(n41), .Y(n40) );
  nand2_x1 U42 ( .A(write_ptr[6]), .B(n40), .Y(n38) );
  nor2_x1 U43 ( .A(n81), .B(n38), .Y(n39) );
  nand2_x1 U44 ( .A(write_ptr[8]), .B(n39), .Y(n37) );
  nor2_x1 U45 ( .A(n70), .B(n67), .Y(n66) );
  nor2_x1 U46 ( .A(n73), .B(n45), .Y(n44) );
  inv_x1 U47 ( .A(read_ptr[0]), .Y(N15) );
  inv_x1 U48 ( .A(write_ptr[0]), .Y(N4) );
  aoi22_x1 U49 ( .A0(write_ptr[0]), .A1(read_ptr[0]), .B0(N15), .B1(N4), .Y(
        n49) );
  inv_x1 U50 ( .A(read_ptr[6]), .Y(n78) );
  inv_x1 U51 ( .A(write_ptr[6]), .Y(n79) );
  aoi22_x1 U52 ( .A0(write_ptr[6]), .A1(read_ptr[6]), .B0(n78), .B1(n79), .Y(
        n26) );
  inv_x1 U53 ( .A(read_ptr[8]), .Y(n82) );
  inv_x1 U54 ( .A(write_ptr[8]), .Y(n83) );
  aoi22_x1 U55 ( .A0(write_ptr[8]), .A1(read_ptr[8]), .B0(n82), .B1(n83), .Y(
        n25) );
  nor3_x1 U56 ( .A(n49), .B(n26), .C(n25), .Y(n30) );
  inv_x1 U57 ( .A(read_ptr[4]), .Y(n74) );
  inv_x1 U58 ( .A(write_ptr[4]), .Y(n75) );
  aoi22_x1 U59 ( .A0(write_ptr[4]), .A1(n74), .B0(read_ptr[4]), .B1(n75), .Y(
        n29) );
  inv_x1 U60 ( .A(read_ptr[1]), .Y(n69) );
  mxi2_x1 U61 ( .A0(read_ptr[1]), .A1(n69), .S(write_ptr[1]), .YN(n28) );
  inv_x1 U62 ( .A(read_ptr[2]), .Y(n70) );
  inv_x1 U63 ( .A(write_ptr[2]), .Y(n71) );
  aoi22_x1 U64 ( .A0(write_ptr[2]), .A1(n70), .B0(read_ptr[2]), .B1(n71), .Y(
        n27) );
  nand4_x2 U65 ( .A(n30), .B(n29), .C(n28), .D(n27), .Y(n36) );
  inv_x1 U66 ( .A(read_ptr[7]), .Y(n80) );
  inv_x1 U67 ( .A(write_ptr[7]), .Y(n81) );
  aoi22_x1 U68 ( .A0(write_ptr[7]), .A1(n80), .B0(read_ptr[7]), .B1(n81), .Y(
        n34) );
  inv_x1 U69 ( .A(read_ptr[5]), .Y(n76) );
  inv_x1 U70 ( .A(write_ptr[5]), .Y(n77) );
  aoi22_x1 U71 ( .A0(write_ptr[5]), .A1(n76), .B0(read_ptr[5]), .B1(n77), .Y(
        n33) );
  inv_x1 U72 ( .A(read_ptr[3]), .Y(n72) );
  inv_x1 U73 ( .A(write_ptr[3]), .Y(n73) );
  aoi22_x1 U74 ( .A0(write_ptr[3]), .A1(n72), .B0(read_ptr[3]), .B1(n73), .Y(
        n32) );
  inv_x1 U75 ( .A(write_ptr[9]), .Y(n86) );
  inv_x1 U76 ( .A(read_ptr[9]), .Y(n85) );
  aoi22_x1 U77 ( .A0(read_ptr[9]), .A1(n86), .B0(write_ptr[9]), .B1(n85), .Y(
        n31) );
  nand4_x2 U78 ( .A(n34), .B(n33), .C(n32), .D(n31), .Y(n35) );
  nor2_x2 U79 ( .A(n36), .B(n35), .Y(empty) );
  nand3_x1 U80 ( .A(write_ptr[2]), .B(write_ptr[1]), .C(write_ptr[0]), .Y(n45)
         );
  mxi2_x1 U81 ( .A0(write_ptr[9]), .A1(n86), .S(n37), .YN(N13) );
  aoi21_x1 U82 ( .A0(n81), .A1(n38), .B0(n39), .Y(N11) );
  mxi2_x1 U83 ( .A0(n83), .A1(write_ptr[8]), .S(n39), .YN(N12) );
  mxi2_x1 U84 ( .A0(n79), .A1(write_ptr[6]), .S(n40), .YN(N10) );
  mxi2_x1 U85 ( .A0(n75), .A1(write_ptr[4]), .S(n44), .YN(N8) );
  aoi21_x1 U86 ( .A0(n77), .A1(n41), .B0(n40), .Y(N9) );
  nand2_x1 U87 ( .A(write_ptr[1]), .B(write_ptr[0]), .Y(n43) );
  inv_x1 U88 ( .A(n45), .Y(n42) );
  aoi21_x1 U89 ( .A0(n71), .A1(n43), .B0(n42), .Y(N6) );
  aoi21_x1 U90 ( .A0(n73), .A1(n45), .B0(n44), .Y(N7) );
  mxi2_x1 U91 ( .A0(N4), .A1(write_ptr[0]), .S(write_ptr[1]), .YN(N5) );
  mxi2_x1 U92 ( .A0(n74), .A1(read_ptr[4]), .S(N8), .YN(n52) );
  mxi2_x1 U93 ( .A0(n76), .A1(read_ptr[5]), .S(N9), .YN(n51) );
  mxi2_x1 U94 ( .A0(read_ptr[2]), .A1(n70), .S(N6), .YN(n48) );
  mxi2_x1 U95 ( .A0(read_ptr[3]), .A1(n72), .S(N7), .YN(n47) );
  mxi2_x1 U96 ( .A0(read_ptr[1]), .A1(n69), .S(N5), .YN(n46) );
  nand4_x2 U97 ( .A(n49), .B(n48), .C(n47), .D(n46), .Y(n50) );
  nor3_x1 U98 ( .A(n52), .B(n51), .C(n50), .Y(n53) );
  oai21_x1 U99 ( .A0(N10), .A1(n78), .B0(n53), .Y(n54) );
  aoi21_x1 U100 ( .A0(N10), .A1(n78), .B0(n54), .Y(n55) );
  oai21_x1 U101 ( .A0(N12), .A1(n82), .B0(n55), .Y(n56) );
  aoi21_x1 U102 ( .A0(N12), .A1(n82), .B0(n56), .Y(n57) );
  oai21_x1 U103 ( .A0(N11), .A1(n80), .B0(n57), .Y(n58) );
  aoi21_x1 U104 ( .A0(N11), .A1(n80), .B0(n58), .Y(n59) );
  oai21_x1 U105 ( .A0(N13), .A1(n85), .B0(n59), .Y(n60) );
  aoi21_x1 U106 ( .A0(N13), .A1(n85), .B0(n60), .Y(full) );
  inv_x1 U107 ( .A(wr_en), .Y(n84) );
  nor2_x1 U108 ( .A(full), .B(n84), .Y(N3) );
  nor2b_x1 U109 ( .AN(rd_en), .B(empty), .Y(N14) );
  nand2_x1 U110 ( .A(read_ptr[0]), .B(read_ptr[1]), .Y(n67) );
  nand2_x1 U111 ( .A(read_ptr[3]), .B(n66), .Y(n65) );
  nor2_x1 U112 ( .A(n74), .B(n65), .Y(n64) );
  nand2_x1 U113 ( .A(read_ptr[5]), .B(n64), .Y(n63) );
  nor2_x1 U114 ( .A(n78), .B(n63), .Y(n62) );
  nand2_x1 U115 ( .A(read_ptr[7]), .B(n62), .Y(n61) );
  nor2_x1 U116 ( .A(n82), .B(n61), .Y(n68) );
  aoi21_x1 U117 ( .A0(n82), .A1(n61), .B0(n68), .Y(N23) );
  mxi2_x1 U118 ( .A0(n80), .A1(read_ptr[7]), .S(n62), .YN(N22) );
  aoi21_x1 U119 ( .A0(n78), .A1(n63), .B0(n62), .Y(N21) );
  mxi2_x1 U120 ( .A0(n76), .A1(read_ptr[5]), .S(n64), .YN(N20) );
  aoi21_x1 U121 ( .A0(n74), .A1(n65), .B0(n64), .Y(N19) );
  mxi2_x1 U122 ( .A0(n72), .A1(read_ptr[3]), .S(n66), .YN(N18) );
  aoi21_x1 U123 ( .A0(n70), .A1(n67), .B0(n66), .Y(N17) );
  aoi22_x1 U124 ( .A0(read_ptr[0]), .A1(read_ptr[1]), .B0(n69), .B1(N15), .Y(
        N16) );
  mxi2_x1 U125 ( .A0(n85), .A1(read_ptr[9]), .S(n68), .YN(N24) );
  aoi22_x1 U126 ( .A0(wr_en), .A1(N4), .B0(N15), .B1(n84), .Y(addr[0]) );
  aoi2bb2_x1 U127 ( .B0(n69), .B1(n84), .A0N(n84), .A1N(write_ptr[1]), .Y(
        addr[1]) );
  aoi22_x1 U128 ( .A0(wr_en), .A1(n71), .B0(n70), .B1(n84), .Y(addr[2]) );
  aoi22_x1 U129 ( .A0(wr_en), .A1(n73), .B0(n72), .B1(n84), .Y(addr[3]) );
  aoi22_x1 U130 ( .A0(wr_en), .A1(n75), .B0(n74), .B1(n84), .Y(addr[4]) );
  aoi22_x1 U131 ( .A0(wr_en), .A1(n77), .B0(n76), .B1(n84), .Y(addr[5]) );
  aoi22_x1 U132 ( .A0(wr_en), .A1(n79), .B0(n78), .B1(n84), .Y(addr[6]) );
  aoi22_x1 U133 ( .A0(wr_en), .A1(n81), .B0(n80), .B1(n84), .Y(addr[7]) );
  aoi22_x1 U134 ( .A0(wr_en), .A1(n83), .B0(n82), .B1(n84), .Y(addr[8]) );
  aoi22_x1 U135 ( .A0(wr_en), .A1(n86), .B0(n85), .B1(n84), .Y(addr[9]) );
endmodule


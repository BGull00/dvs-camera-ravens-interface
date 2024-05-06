/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Mon May  6 01:37:30 2024
/////////////////////////////////////////////////////////////


module timer_us ( clk, rst_n, time_us );
  output [44:0] time_us;
  input clk, rst_n;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30,
         N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44,
         N45, N46, N47, N48, N49, N50, N51, N52, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
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
         n743, n744;
  wire   [51:0] timestamp_clk_cycles;

  ffr_x1 \timestamp_clk_cycles_reg[37]  ( .D(N38), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[37]) );
  ffr_x1 \timestamp_clk_cycles_reg[22]  ( .D(N23), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[22]) );
  ffr_x1 \timestamp_clk_cycles_reg[7]  ( .D(N8), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[7]) );
  ffr_x1 \timestamp_clk_cycles_reg[0]  ( .D(N1), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[0]) );
  ffr_x1 \timestamp_clk_cycles_reg[51]  ( .D(N52), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[51]) );
  ffr_x1 \timestamp_clk_cycles_reg[50]  ( .D(N51), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[50]) );
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
  ffr_x1 \timestamp_clk_cycles_reg[41]  ( .D(N42), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[41]) );
  ffr_x1 \timestamp_clk_cycles_reg[40]  ( .D(N41), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[40]) );
  ffr_x1 \timestamp_clk_cycles_reg[39]  ( .D(N40), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[39]) );
  ffr_x1 \timestamp_clk_cycles_reg[38]  ( .D(N39), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[38]) );
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
  ffr_x1 \timestamp_clk_cycles_reg[26]  ( .D(N27), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[26]) );
  ffr_x1 \timestamp_clk_cycles_reg[25]  ( .D(N26), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[25]) );
  ffr_x1 \timestamp_clk_cycles_reg[24]  ( .D(N25), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[24]) );
  ffr_x1 \timestamp_clk_cycles_reg[23]  ( .D(N24), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[23]) );
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
  ffr_x1 \timestamp_clk_cycles_reg[11]  ( .D(N12), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[11]) );
  ffr_x1 \timestamp_clk_cycles_reg[10]  ( .D(N11), .CLK(clk), .RSTN(rst_n), 
        .Q(timestamp_clk_cycles[10]) );
  ffr_x1 \timestamp_clk_cycles_reg[9]  ( .D(N10), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[9]) );
  ffr_x1 \timestamp_clk_cycles_reg[8]  ( .D(N9), .CLK(clk), .RSTN(rst_n), .Q(
        timestamp_clk_cycles[8]) );
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
  nand2_x1 U5 ( .A(n706), .B(time_us[3]), .Y(n608) );
  nand2_x1 U6 ( .A(n702), .B(time_us[5]), .Y(n574) );
  nand2_x1 U7 ( .A(n698), .B(time_us[7]), .Y(n545) );
  nand2_x1 U8 ( .A(n694), .B(time_us[9]), .Y(n521) );
  nand2_x1 U9 ( .A(n690), .B(time_us[11]), .Y(n487) );
  nand2_x1 U10 ( .A(n686), .B(time_us[13]), .Y(n458) );
  nand2_x1 U11 ( .A(n682), .B(time_us[15]), .Y(n434) );
  nand2_x1 U12 ( .A(n678), .B(time_us[17]), .Y(n400) );
  nand2_x1 U13 ( .A(n674), .B(time_us[19]), .Y(n371) );
  nand2_x1 U14 ( .A(n670), .B(time_us[21]), .Y(n347) );
  nand2_x1 U15 ( .A(n666), .B(time_us[23]), .Y(n313) );
  nand2_x1 U16 ( .A(n662), .B(time_us[25]), .Y(n284) );
  nand2_x1 U17 ( .A(n658), .B(time_us[27]), .Y(n260) );
  nand2_x1 U18 ( .A(n654), .B(time_us[29]), .Y(n226) );
  nand2_x1 U19 ( .A(n650), .B(time_us[31]), .Y(n197) );
  nand2_x1 U20 ( .A(n646), .B(time_us[33]), .Y(n173) );
  nand2_x1 U21 ( .A(n642), .B(time_us[35]), .Y(n139) );
  nand2_x1 U22 ( .A(n638), .B(time_us[37]), .Y(n110) );
  nand2_x1 U23 ( .A(n634), .B(time_us[39]), .Y(n86) );
  nand2_x1 U24 ( .A(n630), .B(time_us[41]), .Y(n51) );
  nor2_x1 U25 ( .A(timestamp_clk_cycles[47]), .B(n4), .Y(n3) );
  nor2b_x1 U26 ( .AN(n607), .B(n606), .Y(n720) );
  nor2_x1 U27 ( .A(n607), .B(n608), .Y(n721) );
  nor2b_x1 U28 ( .AN(n589), .B(n587), .Y(n603) );
  nor2_x1 U29 ( .A(n589), .B(n588), .Y(n602) );
  nor2b_x1 U30 ( .AN(n575), .B(n573), .Y(n591) );
  nor2_x1 U31 ( .A(n575), .B(n574), .Y(n590) );
  nor2b_x1 U32 ( .AN(n562), .B(n561), .Y(n576) );
  nor2_x1 U33 ( .A(n562), .B(n563), .Y(n577) );
  nor2b_x1 U34 ( .AN(n546), .B(n544), .Y(n559) );
  nor2_x1 U35 ( .A(n546), .B(n545), .Y(n558) );
  nor2b_x1 U36 ( .AN(n531), .B(n529), .Y(n548) );
  nor2_x1 U37 ( .A(n531), .B(n530), .Y(n547) );
  nor2b_x1 U38 ( .AN(n520), .B(n519), .Y(n532) );
  nor2b_x1 U39 ( .AN(n502), .B(n500), .Y(n516) );
  nor2_x1 U40 ( .A(n502), .B(n501), .Y(n515) );
  nor2b_x1 U41 ( .AN(n488), .B(n486), .Y(n504) );
  nor2_x1 U42 ( .A(n488), .B(n487), .Y(n503) );
  nor2b_x1 U43 ( .AN(n475), .B(n474), .Y(n489) );
  nor2_x1 U44 ( .A(n475), .B(n476), .Y(n490) );
  nor2b_x1 U45 ( .AN(n459), .B(n457), .Y(n472) );
  nor2_x1 U46 ( .A(n459), .B(n458), .Y(n471) );
  nor2b_x1 U47 ( .AN(n444), .B(n442), .Y(n461) );
  nor2_x1 U48 ( .A(n444), .B(n443), .Y(n460) );
  nor2b_x1 U49 ( .AN(n433), .B(n432), .Y(n445) );
  nor2_x1 U50 ( .A(n433), .B(n434), .Y(n446) );
  nor2b_x1 U51 ( .AN(n415), .B(n413), .Y(n429) );
  nor2_x1 U52 ( .A(n415), .B(n414), .Y(n428) );
  nor2b_x1 U53 ( .AN(n401), .B(n399), .Y(n417) );
  nor2_x1 U54 ( .A(n401), .B(n400), .Y(n416) );
  nor2b_x1 U55 ( .AN(n388), .B(n387), .Y(n402) );
  nor2_x1 U56 ( .A(n388), .B(n389), .Y(n403) );
  nor2b_x1 U57 ( .AN(n372), .B(n370), .Y(n385) );
  nor2_x1 U58 ( .A(n372), .B(n371), .Y(n384) );
  nor2b_x1 U59 ( .AN(n357), .B(n355), .Y(n374) );
  nor2b_x1 U60 ( .AN(n346), .B(n345), .Y(n358) );
  nor2_x1 U61 ( .A(n346), .B(n347), .Y(n359) );
  nor2b_x1 U62 ( .AN(n328), .B(n326), .Y(n342) );
  nor2_x1 U63 ( .A(n328), .B(n327), .Y(n341) );
  nor2b_x1 U64 ( .AN(n314), .B(n312), .Y(n330) );
  nor2_x1 U65 ( .A(n314), .B(n313), .Y(n329) );
  nor2b_x1 U66 ( .AN(n301), .B(n300), .Y(n315) );
  nor2_x1 U67 ( .A(n301), .B(n302), .Y(n316) );
  nor2b_x1 U68 ( .AN(n285), .B(n283), .Y(n298) );
  nor2_x1 U69 ( .A(n285), .B(n284), .Y(n297) );
  nor2b_x1 U70 ( .AN(n270), .B(n268), .Y(n287) );
  nor2_x1 U71 ( .A(n270), .B(n269), .Y(n286) );
  nor2b_x1 U72 ( .AN(n259), .B(n258), .Y(n271) );
  nor2_x1 U73 ( .A(n259), .B(n260), .Y(n272) );
  nor2b_x1 U74 ( .AN(n241), .B(n239), .Y(n255) );
  nor2_x1 U75 ( .A(n241), .B(n240), .Y(n254) );
  nor2b_x1 U76 ( .AN(n227), .B(n225), .Y(n243) );
  nor2_x1 U77 ( .A(n227), .B(n226), .Y(n242) );
  nor2b_x1 U78 ( .AN(n214), .B(n213), .Y(n228) );
  nor2b_x1 U79 ( .AN(n198), .B(n196), .Y(n211) );
  nor2_x1 U80 ( .A(n198), .B(n197), .Y(n210) );
  nor2b_x1 U81 ( .AN(n183), .B(n181), .Y(n200) );
  nor2_x1 U82 ( .A(n183), .B(n182), .Y(n199) );
  nor2b_x1 U83 ( .AN(n172), .B(n171), .Y(n184) );
  nor2_x1 U84 ( .A(n172), .B(n173), .Y(n185) );
  nor2b_x1 U85 ( .AN(n154), .B(n152), .Y(n168) );
  nor2_x1 U86 ( .A(n154), .B(n153), .Y(n167) );
  nor2b_x1 U87 ( .AN(n140), .B(n138), .Y(n156) );
  nor2_x1 U88 ( .A(n140), .B(n139), .Y(n155) );
  nor2b_x1 U89 ( .AN(n127), .B(n126), .Y(n141) );
  nor2_x1 U90 ( .A(n127), .B(n128), .Y(n142) );
  nor2b_x1 U91 ( .AN(n111), .B(n109), .Y(n124) );
  nor2_x1 U92 ( .A(n111), .B(n110), .Y(n123) );
  nor2b_x1 U93 ( .AN(n96), .B(n94), .Y(n113) );
  nor2_x1 U94 ( .A(n96), .B(n95), .Y(n112) );
  nor2b_x1 U95 ( .AN(n85), .B(n84), .Y(n97) );
  nor2b_x1 U96 ( .AN(n67), .B(n65), .Y(n81) );
  nor2_x1 U97 ( .A(n67), .B(n66), .Y(n80) );
  nor2b_x1 U98 ( .AN(n52), .B(n50), .Y(n69) );
  nor2_x1 U99 ( .A(n52), .B(n51), .Y(n68) );
  nand2_x1 U100 ( .A(n626), .B(time_us[43]), .Y(n41) );
  nor2b_x1 U101 ( .AN(n39), .B(n38), .Y(n54) );
  nor2_x1 U102 ( .A(n42), .B(n41), .Y(n40) );
  nand2b_x1 U103 ( .AN(n3), .B(timestamp_clk_cycles[48]), .Y(n9) );
  nand2_x1 U104 ( .A(n3), .B(n621), .Y(n8) );
  nand3_x1 U105 ( .A(n618), .B(n621), .C(n622), .Y(n1) );
  nor2_x1 U106 ( .A(n605), .B(n601), .Y(n609) );
  aoi2bb1_x1 U107 ( .A0N(n603), .A1N(n602), .B0(n721), .Y(n604) );
  aoi2bb1_x1 U108 ( .A0N(n591), .A1N(n590), .B0(n602), .Y(n592) );
  or2_x1 U109 ( .A(n594), .B(n593), .Y(n595) );
  aoi2bb1_x1 U110 ( .A0N(n577), .A1N(n576), .B0(n590), .Y(n578) );
  nor2_x1 U111 ( .A(n579), .B(n572), .Y(n580) );
  aoi2bb1_x1 U112 ( .A0N(n559), .A1N(n558), .B0(n577), .Y(n560) );
  or2_x1 U113 ( .A(n565), .B(n564), .Y(n566) );
  aoi2bb1_x1 U114 ( .A0N(n548), .A1N(n547), .B0(n558), .Y(n549) );
  aoi2bb1_x1 U115 ( .A0N(n533), .A1N(n532), .B0(n547), .Y(n534) );
  aoi2bb1_x1 U116 ( .A0N(n516), .A1N(n515), .B0(n533), .Y(n517) );
  nor2_x1 U117 ( .A(n518), .B(n514), .Y(n522) );
  aoi2bb1_x1 U118 ( .A0N(n490), .A1N(n489), .B0(n503), .Y(n491) );
  aoi2bb1_x1 U119 ( .A0N(n472), .A1N(n471), .B0(n490), .Y(n473) );
  nor2_x1 U120 ( .A(n463), .B(n456), .Y(n464) );
  aoi2bb1_x1 U121 ( .A0N(n461), .A1N(n460), .B0(n471), .Y(n462) );
  aoi2bb1_x1 U122 ( .A0N(n446), .A1N(n445), .B0(n460), .Y(n447) );
  aoi2bb1_x1 U123 ( .A0N(n429), .A1N(n428), .B0(n446), .Y(n430) );
  aoi2bb1_x1 U124 ( .A0N(n417), .A1N(n416), .B0(n428), .Y(n418) );
  aoi2bb1_x1 U125 ( .A0N(n403), .A1N(n402), .B0(n416), .Y(n404) );
  aoi2bb1_x1 U126 ( .A0N(n385), .A1N(n384), .B0(n403), .Y(n386) );
  aoi2bb1_x1 U127 ( .A0N(n374), .A1N(n373), .B0(n384), .Y(n375) );
  nor2_x1 U128 ( .A(n376), .B(n369), .Y(n377) );
  aoi2bb1_x1 U129 ( .A0N(n342), .A1N(n341), .B0(n359), .Y(n343) );
  aoi2bb1_x1 U130 ( .A0N(n330), .A1N(n329), .B0(n341), .Y(n331) );
  nor2_x1 U131 ( .A(n318), .B(n311), .Y(n319) );
  aoi2bb1_x1 U132 ( .A0N(n316), .A1N(n315), .B0(n329), .Y(n317) );
  aoi2bb1_x1 U133 ( .A0N(n298), .A1N(n297), .B0(n316), .Y(n299) );
  aoi2bb1_x1 U134 ( .A0N(n287), .A1N(n286), .B0(n297), .Y(n288) );
  aoi2bb1_x1 U135 ( .A0N(n272), .A1N(n271), .B0(n286), .Y(n273) );
  aoi2bb1_x1 U136 ( .A0N(n255), .A1N(n254), .B0(n272), .Y(n256) );
  aoi2bb1_x1 U137 ( .A0N(n243), .A1N(n242), .B0(n254), .Y(n244) );
  aoi2bb1_x1 U138 ( .A0N(n229), .A1N(n228), .B0(n242), .Y(n230) );
  nor2_x1 U139 ( .A(n231), .B(n224), .Y(n232) );
  aoi2bb1_x1 U140 ( .A0N(n200), .A1N(n199), .B0(n210), .Y(n201) );
  aoi2bb1_x1 U141 ( .A0N(n185), .A1N(n184), .B0(n199), .Y(n186) );
  nor2_x1 U142 ( .A(n170), .B(n166), .Y(n174) );
  aoi2bb1_x1 U143 ( .A0N(n168), .A1N(n167), .B0(n185), .Y(n169) );
  aoi2bb1_x1 U144 ( .A0N(n156), .A1N(n155), .B0(n167), .Y(n157) );
  aoi2bb1_x1 U145 ( .A0N(n142), .A1N(n141), .B0(n155), .Y(n143) );
  aoi2bb1_x1 U146 ( .A0N(n124), .A1N(n123), .B0(n142), .Y(n125) );
  aoi2bb1_x1 U147 ( .A0N(n113), .A1N(n112), .B0(n123), .Y(n114) );
  aoi2bb1_x1 U148 ( .A0N(n98), .A1N(n97), .B0(n112), .Y(n99) );
  aoi2bb1_x1 U149 ( .A0N(n81), .A1N(n80), .B0(n98), .Y(n82) );
  nor2_x1 U150 ( .A(n83), .B(n79), .Y(n87) );
  aoi2bb1_x1 U151 ( .A0N(n54), .A1N(n53), .B0(n68), .Y(n55) );
  nor2_x1 U152 ( .A(n57), .B(n56), .Y(n60) );
  nand3b_x1 U153 ( .AN(n57), .B(n59), .C(time_us[41]), .Y(n58) );
  nor2_x1 U154 ( .A(n13), .B(n10), .Y(n11) );
  nand3_x1 U155 ( .A(n7), .B(n625), .C(n9), .Y(n13) );
  nand2_x1 U156 ( .A(timestamp_clk_cycles[51]), .B(n4), .Y(n10) );
  nand2_x1 U157 ( .A(timestamp_clk_cycles[49]), .B(n8), .Y(n16) );
  nor2_x1 U158 ( .A(n741), .B(n740), .Y(n727) );
  nand2_x1 U159 ( .A(n609), .B(n611), .Y(n614) );
  nand2_x1 U160 ( .A(n551), .B(n553), .Y(n556) );
  nand2_x1 U161 ( .A(n493), .B(n495), .Y(n498) );
  nand2_x1 U162 ( .A(n464), .B(n466), .Y(n469) );
  nand2_x1 U163 ( .A(n406), .B(n408), .Y(n411) );
  nand2_x1 U164 ( .A(n348), .B(n350), .Y(n353) );
  nand2_x1 U165 ( .A(n319), .B(n321), .Y(n324) );
  nand2_x1 U166 ( .A(n261), .B(n263), .Y(n266) );
  nand2_x1 U167 ( .A(n203), .B(n205), .Y(n208) );
  nand2_x1 U168 ( .A(n174), .B(n176), .Y(n179) );
  nand2_x1 U169 ( .A(n116), .B(n118), .Y(n121) );
  nand2_x1 U170 ( .A(n49), .B(n44), .Y(n34) );
  nand2_x1 U171 ( .A(n20), .B(n13), .Y(n5) );
  nor2_x1 U172 ( .A(n718), .B(n717), .Y(n719) );
  nor2_x1 U173 ( .A(n520), .B(n521), .Y(n533) );
  nor2_x1 U174 ( .A(n357), .B(n356), .Y(n373) );
  nor2_x1 U175 ( .A(n214), .B(n215), .Y(n229) );
  nor2_x1 U176 ( .A(n85), .B(n86), .Y(n98) );
  aoi2bb1_x1 U177 ( .A0N(n721), .A1N(n720), .B0(n719), .Y(n722) );
  aoi2bb1_x1 U178 ( .A0N(n504), .A1N(n503), .B0(n515), .Y(n505) );
  aoi2bb1_x1 U179 ( .A0N(n359), .A1N(n358), .B0(n373), .Y(n360) );
  aoi2bb1_x1 U180 ( .A0N(n211), .A1N(n210), .B0(n229), .Y(n212) );
  aoi2bb1_x1 U181 ( .A0N(n69), .A1N(n68), .B0(n80), .Y(n70) );
  nand2_x1 U182 ( .A(n9), .B(n8), .Y(n12) );
  or2_x1 U183 ( .A(n724), .B(n723), .Y(n725) );
  nor2_x1 U184 ( .A(n605), .B(n610), .Y(n597) );
  nor2_x1 U185 ( .A(n550), .B(n543), .Y(n551) );
  nor2_x1 U186 ( .A(n492), .B(n485), .Y(n493) );
  nor2_x1 U187 ( .A(n431), .B(n427), .Y(n435) );
  nor2_x1 U188 ( .A(n405), .B(n398), .Y(n406) );
  nor2_x1 U189 ( .A(n344), .B(n340), .Y(n348) );
  nor2_x1 U190 ( .A(n289), .B(n282), .Y(n290) );
  nor2_x1 U191 ( .A(n257), .B(n253), .Y(n261) );
  nor2_x1 U192 ( .A(n202), .B(n195), .Y(n203) );
  nor2_x1 U193 ( .A(n144), .B(n137), .Y(n145) );
  nor2_x1 U194 ( .A(n115), .B(n108), .Y(n116) );
  nor2_x1 U195 ( .A(n705), .B(n704), .Y(n703) );
  nor2_x1 U196 ( .A(n689), .B(n688), .Y(n687) );
  nand2_x1 U197 ( .A(timestamp_clk_cycles[21]), .B(n675), .Y(n672) );
  nand2_x1 U198 ( .A(timestamp_clk_cycles[29]), .B(n659), .Y(n656) );
  nor2_x1 U199 ( .A(n645), .B(n644), .Y(n643) );
  nor2_x1 U200 ( .A(n629), .B(n628), .Y(n627) );
  nor2_x1 U201 ( .A(n743), .B(n738), .Y(n744) );
  nand2_x1 U202 ( .A(n580), .B(n582), .Y(n585) );
  nand2_x1 U203 ( .A(n522), .B(n524), .Y(n527) );
  nand2_x1 U204 ( .A(n435), .B(n437), .Y(n440) );
  nand2_x1 U205 ( .A(n377), .B(n379), .Y(n382) );
  nand2_x1 U206 ( .A(n290), .B(n292), .Y(n295) );
  nand2_x1 U207 ( .A(n232), .B(n234), .Y(n237) );
  nand2_x1 U208 ( .A(n145), .B(n147), .Y(n150) );
  nand2_x1 U209 ( .A(n87), .B(n89), .Y(n92) );
  and2_x1 U210 ( .A(n4), .B(timestamp_clk_cycles[50]), .Y(n20) );
  inv_x1 U211 ( .A(timestamp_clk_cycles[49]), .Y(n618) );
  inv_x1 U212 ( .A(timestamp_clk_cycles[48]), .Y(n621) );
  inv_x1 U213 ( .A(timestamp_clk_cycles[47]), .Y(n622) );
  nand3_x2 U214 ( .A(timestamp_clk_cycles[50]), .B(timestamp_clk_cycles[51]), 
        .C(n1), .Y(n4) );
  nand2_x1 U215 ( .A(timestamp_clk_cycles[50]), .B(timestamp_clk_cycles[51]), 
        .Y(n2) );
  aoi21_x1 U216 ( .A0(timestamp_clk_cycles[47]), .A1(n2), .B0(n3), .Y(n7) );
  inv_x1 U217 ( .A(timestamp_clk_cycles[46]), .Y(n625) );
  oai21_x1 U218 ( .A0(n16), .A1(n5), .B0(n10), .Y(time_us[44]) );
  nand2_x1 U219 ( .A(time_us[44]), .B(timestamp_clk_cycles[49]), .Y(n19) );
  aoi21_x1 U220 ( .A0(n625), .A1(time_us[44]), .B0(n7), .Y(n21) );
  nand2_x1 U221 ( .A(n625), .B(time_us[44]), .Y(n6) );
  oai21_x1 U222 ( .A0(time_us[44]), .A1(n625), .B0(n6), .Y(n42) );
  nor3_x1 U223 ( .A(timestamp_clk_cycles[45]), .B(n21), .C(n42), .Y(n25) );
  nand3_x1 U224 ( .A(n7), .B(n625), .C(time_us[44]), .Y(n22) );
  aoi21_x1 U225 ( .A0(n22), .A1(n12), .B0(n11), .Y(n27) );
  inv_x1 U226 ( .A(n16), .Y(n15) );
  nand2_x1 U227 ( .A(n13), .B(time_us[44]), .Y(n14) );
  mxi2_x1 U228 ( .A0(n16), .A1(n15), .S(n14), .YN(n32) );
  nor3_x1 U229 ( .A(n25), .B(n27), .C(n32), .Y(n17) );
  aoi21_x1 U230 ( .A0(n20), .A1(n19), .B0(n17), .Y(n18) );
  oai21_x1 U231 ( .A0(n20), .A1(n19), .B0(n18), .Y(time_us[43]) );
  inv_x1 U232 ( .A(n21), .Y(n23) );
  inv_x1 U233 ( .A(timestamp_clk_cycles[45]), .Y(n626) );
  aoi21_x1 U234 ( .A0(n23), .A1(n22), .B0(n40), .Y(n24) );
  aoi21_x1 U235 ( .A0(n25), .A1(time_us[43]), .B0(n24), .Y(n37) );
  inv_x1 U236 ( .A(time_us[43]), .Y(n29) );
  or2_x1 U237 ( .A(n25), .B(n29), .Y(n26) );
  nor3_x1 U238 ( .A(n25), .B(n27), .C(n29), .Y(n31) );
  aoi21_x1 U239 ( .A0(n27), .A1(n26), .B0(n31), .Y(n49) );
  inv_x1 U240 ( .A(n41), .Y(n28) );
  aoi21_x1 U241 ( .A0(n29), .A1(timestamp_clk_cycles[45]), .B0(n28), .Y(n39)
         );
  inv_x1 U242 ( .A(timestamp_clk_cycles[44]), .Y(n629) );
  inv_x1 U243 ( .A(n42), .Y(n30) );
  nand3_x2 U244 ( .A(n39), .B(n629), .C(n30), .Y(n44) );
  inv_x1 U245 ( .A(n32), .Y(n33) );
  mxi2_x1 U246 ( .A0(n33), .A1(n32), .S(n31), .YN(n43) );
  oai21_x1 U247 ( .A0(n37), .A1(n34), .B0(n43), .Y(time_us[42]) );
  inv_x1 U248 ( .A(n37), .Y(n36) );
  nand2_x1 U249 ( .A(time_us[42]), .B(n36), .Y(n48) );
  aoi21_x1 U250 ( .A0(n629), .A1(time_us[42]), .B0(n39), .Y(n53) );
  nand2_x1 U251 ( .A(n629), .B(time_us[42]), .Y(n38) );
  oai21_x1 U252 ( .A0(time_us[42]), .A1(n629), .B0(n38), .Y(n52) );
  nor3_x1 U253 ( .A(timestamp_clk_cycles[43]), .B(n53), .C(n52), .Y(n57) );
  nand2_x1 U254 ( .A(n44), .B(time_us[42]), .Y(n35) );
  mxi2_x1 U255 ( .A0(n37), .A1(n36), .S(n35), .YN(n63) );
  nor2_x1 U256 ( .A(n57), .B(n63), .Y(n46) );
  aoi21_x1 U257 ( .A0(n42), .A1(n41), .B0(n40), .Y(n45) );
  oai22_x1 U258 ( .A0(n54), .A1(n45), .B0(n44), .B1(n43), .Y(n59) );
  aoi22_x1 U259 ( .A0(n46), .A1(n59), .B0(n49), .B1(n48), .Y(n47) );
  oai21_x1 U260 ( .A0(n49), .A1(n48), .B0(n47), .Y(time_us[41]) );
  inv_x1 U261 ( .A(n58), .Y(n64) );
  inv_x1 U262 ( .A(timestamp_clk_cycles[43]), .Y(n630) );
  inv_x1 U263 ( .A(n51), .Y(n50) );
  oai21_x1 U264 ( .A0(time_us[41]), .A1(n630), .B0(n51), .Y(n67) );
  nor3_x1 U265 ( .A(timestamp_clk_cycles[42]), .B(n69), .C(n67), .Y(n72) );
  aoi21_x1 U266 ( .A0(n57), .A1(time_us[41]), .B0(n55), .Y(n74) );
  inv_x1 U267 ( .A(time_us[41]), .Y(n56) );
  oai21_x1 U268 ( .A0(n60), .A1(n59), .B0(n58), .Y(n77) );
  nor3_x1 U269 ( .A(n72), .B(n74), .C(n77), .Y(n61) );
  aoi21_x1 U270 ( .A0(n64), .A1(n63), .B0(n61), .Y(n62) );
  oai21_x1 U271 ( .A0(n64), .A1(n63), .B0(n62), .Y(time_us[40]) );
  inv_x1 U272 ( .A(time_us[40]), .Y(n71) );
  nor3_x1 U273 ( .A(n72), .B(n74), .C(n71), .Y(n78) );
  inv_x1 U274 ( .A(timestamp_clk_cycles[42]), .Y(n633) );
  nand2_x1 U275 ( .A(n633), .B(time_us[40]), .Y(n66) );
  inv_x1 U276 ( .A(n66), .Y(n65) );
  oai21_x1 U277 ( .A0(time_us[40]), .A1(n633), .B0(n66), .Y(n85) );
  nor3_x1 U278 ( .A(timestamp_clk_cycles[41]), .B(n81), .C(n85), .Y(n83) );
  aoi21_x1 U279 ( .A0(n72), .A1(time_us[40]), .B0(n70), .Y(n88) );
  nor2_x1 U280 ( .A(n83), .B(n88), .Y(n75) );
  or2_x1 U281 ( .A(n72), .B(n71), .Y(n73) );
  aoi21_x1 U282 ( .A0(n74), .A1(n73), .B0(n78), .Y(n93) );
  aoi22_x1 U283 ( .A0(n75), .A1(n93), .B0(n78), .B1(n77), .Y(n76) );
  oai21_x1 U284 ( .A0(n78), .A1(n77), .B0(n76), .Y(time_us[39]) );
  inv_x1 U285 ( .A(time_us[39]), .Y(n79) );
  inv_x1 U286 ( .A(n88), .Y(n89) );
  inv_x1 U287 ( .A(timestamp_clk_cycles[41]), .Y(n634) );
  aoi21_x1 U288 ( .A0(n83), .A1(time_us[39]), .B0(n82), .Y(n103) );
  inv_x1 U289 ( .A(n86), .Y(n84) );
  oai21_x1 U290 ( .A0(time_us[39]), .A1(n634), .B0(n86), .Y(n96) );
  nor3_x1 U291 ( .A(timestamp_clk_cycles[40]), .B(n97), .C(n96), .Y(n101) );
  mxi2_x1 U292 ( .A0(n89), .A1(n88), .S(n87), .YN(n106) );
  nor3_x1 U293 ( .A(n103), .B(n101), .C(n106), .Y(n90) );
  aoi21_x1 U294 ( .A0(n93), .A1(n92), .B0(n90), .Y(n91) );
  oai21_x1 U295 ( .A0(n93), .A1(n92), .B0(n91), .Y(time_us[38]) );
  inv_x1 U296 ( .A(time_us[38]), .Y(n100) );
  nor3_x1 U297 ( .A(n103), .B(n101), .C(n100), .Y(n107) );
  inv_x1 U298 ( .A(timestamp_clk_cycles[40]), .Y(n637) );
  nand2_x1 U299 ( .A(n637), .B(time_us[38]), .Y(n95) );
  inv_x1 U300 ( .A(n95), .Y(n94) );
  oai21_x1 U301 ( .A0(time_us[38]), .A1(n637), .B0(n95), .Y(n111) );
  nor3_x1 U302 ( .A(timestamp_clk_cycles[39]), .B(n113), .C(n111), .Y(n115) );
  aoi21_x1 U303 ( .A0(n101), .A1(time_us[38]), .B0(n99), .Y(n117) );
  nor2_x1 U304 ( .A(n115), .B(n117), .Y(n104) );
  or2_x1 U305 ( .A(n101), .B(n100), .Y(n102) );
  aoi21_x1 U306 ( .A0(n103), .A1(n102), .B0(n107), .Y(n122) );
  aoi22_x1 U307 ( .A0(n104), .A1(n122), .B0(n107), .B1(n106), .Y(n105) );
  oai21_x1 U308 ( .A0(n107), .A1(n106), .B0(n105), .Y(time_us[37]) );
  inv_x1 U309 ( .A(time_us[37]), .Y(n108) );
  inv_x1 U310 ( .A(n117), .Y(n118) );
  inv_x1 U311 ( .A(timestamp_clk_cycles[39]), .Y(n638) );
  inv_x1 U312 ( .A(n110), .Y(n109) );
  oai21_x1 U313 ( .A0(time_us[37]), .A1(n638), .B0(n110), .Y(n127) );
  nor3_x1 U314 ( .A(timestamp_clk_cycles[38]), .B(n124), .C(n127), .Y(n130) );
  aoi21_x1 U315 ( .A0(n115), .A1(time_us[37]), .B0(n114), .Y(n132) );
  mxi2_x1 U316 ( .A0(n118), .A1(n117), .S(n116), .YN(n135) );
  nor3_x1 U317 ( .A(n130), .B(n132), .C(n135), .Y(n119) );
  aoi21_x1 U318 ( .A0(n122), .A1(n121), .B0(n119), .Y(n120) );
  oai21_x1 U319 ( .A0(n122), .A1(n121), .B0(n120), .Y(time_us[36]) );
  inv_x1 U320 ( .A(time_us[36]), .Y(n129) );
  nor3_x1 U321 ( .A(n130), .B(n132), .C(n129), .Y(n136) );
  inv_x1 U322 ( .A(timestamp_clk_cycles[38]), .Y(n641) );
  nand2_x1 U323 ( .A(n641), .B(time_us[36]), .Y(n128) );
  aoi21_x1 U324 ( .A0(n130), .A1(time_us[36]), .B0(n125), .Y(n146) );
  inv_x1 U325 ( .A(n128), .Y(n126) );
  oai21_x1 U326 ( .A0(time_us[36]), .A1(n641), .B0(n128), .Y(n140) );
  nor3_x1 U327 ( .A(timestamp_clk_cycles[37]), .B(n141), .C(n140), .Y(n144) );
  nor2_x1 U328 ( .A(n146), .B(n144), .Y(n133) );
  or2_x1 U329 ( .A(n130), .B(n129), .Y(n131) );
  aoi21_x1 U330 ( .A0(n132), .A1(n131), .B0(n136), .Y(n151) );
  aoi22_x1 U331 ( .A0(n133), .A1(n151), .B0(n136), .B1(n135), .Y(n134) );
  oai21_x1 U332 ( .A0(n136), .A1(n135), .B0(n134), .Y(time_us[35]) );
  inv_x1 U333 ( .A(time_us[35]), .Y(n137) );
  inv_x1 U334 ( .A(n146), .Y(n147) );
  inv_x1 U335 ( .A(timestamp_clk_cycles[37]), .Y(n642) );
  inv_x1 U336 ( .A(n139), .Y(n138) );
  oai21_x1 U337 ( .A0(time_us[35]), .A1(n642), .B0(n139), .Y(n154) );
  nor3_x1 U338 ( .A(timestamp_clk_cycles[36]), .B(n156), .C(n154), .Y(n159) );
  aoi21_x1 U339 ( .A0(n144), .A1(time_us[35]), .B0(n143), .Y(n161) );
  mxi2_x1 U340 ( .A0(n147), .A1(n146), .S(n145), .YN(n164) );
  nor3_x1 U341 ( .A(n159), .B(n161), .C(n164), .Y(n148) );
  aoi21_x1 U342 ( .A0(n151), .A1(n150), .B0(n148), .Y(n149) );
  oai21_x1 U343 ( .A0(n151), .A1(n150), .B0(n149), .Y(time_us[34]) );
  inv_x1 U344 ( .A(time_us[34]), .Y(n158) );
  nor3_x1 U345 ( .A(n159), .B(n161), .C(n158), .Y(n165) );
  inv_x1 U346 ( .A(timestamp_clk_cycles[36]), .Y(n645) );
  nand2_x1 U347 ( .A(n645), .B(time_us[34]), .Y(n153) );
  inv_x1 U348 ( .A(n153), .Y(n152) );
  oai21_x1 U349 ( .A0(time_us[34]), .A1(n645), .B0(n153), .Y(n172) );
  nor3_x1 U350 ( .A(timestamp_clk_cycles[35]), .B(n168), .C(n172), .Y(n170) );
  aoi21_x1 U351 ( .A0(n159), .A1(time_us[34]), .B0(n157), .Y(n175) );
  nor2_x1 U352 ( .A(n170), .B(n175), .Y(n162) );
  or2_x1 U353 ( .A(n159), .B(n158), .Y(n160) );
  aoi21_x1 U354 ( .A0(n161), .A1(n160), .B0(n165), .Y(n180) );
  aoi22_x1 U355 ( .A0(n162), .A1(n180), .B0(n165), .B1(n164), .Y(n163) );
  oai21_x1 U356 ( .A0(n165), .A1(n164), .B0(n163), .Y(time_us[33]) );
  inv_x1 U357 ( .A(time_us[33]), .Y(n166) );
  inv_x1 U358 ( .A(n175), .Y(n176) );
  inv_x1 U359 ( .A(timestamp_clk_cycles[35]), .Y(n646) );
  aoi21_x1 U360 ( .A0(n170), .A1(time_us[33]), .B0(n169), .Y(n190) );
  inv_x1 U361 ( .A(n173), .Y(n171) );
  oai21_x1 U362 ( .A0(time_us[33]), .A1(n646), .B0(n173), .Y(n183) );
  nor3_x1 U363 ( .A(timestamp_clk_cycles[34]), .B(n184), .C(n183), .Y(n188) );
  mxi2_x1 U364 ( .A0(n176), .A1(n175), .S(n174), .YN(n193) );
  nor3_x1 U365 ( .A(n190), .B(n188), .C(n193), .Y(n177) );
  aoi21_x1 U366 ( .A0(n180), .A1(n179), .B0(n177), .Y(n178) );
  oai21_x1 U367 ( .A0(n180), .A1(n179), .B0(n178), .Y(time_us[32]) );
  inv_x1 U368 ( .A(time_us[32]), .Y(n187) );
  nor3_x1 U369 ( .A(n190), .B(n188), .C(n187), .Y(n194) );
  inv_x1 U370 ( .A(timestamp_clk_cycles[34]), .Y(n649) );
  nand2_x1 U371 ( .A(n649), .B(time_us[32]), .Y(n182) );
  inv_x1 U372 ( .A(n182), .Y(n181) );
  oai21_x1 U373 ( .A0(time_us[32]), .A1(n649), .B0(n182), .Y(n198) );
  nor3_x1 U374 ( .A(timestamp_clk_cycles[33]), .B(n200), .C(n198), .Y(n202) );
  aoi21_x1 U375 ( .A0(n188), .A1(time_us[32]), .B0(n186), .Y(n204) );
  nor2_x1 U376 ( .A(n202), .B(n204), .Y(n191) );
  or2_x1 U377 ( .A(n188), .B(n187), .Y(n189) );
  aoi21_x1 U378 ( .A0(n190), .A1(n189), .B0(n194), .Y(n209) );
  aoi22_x1 U379 ( .A0(n191), .A1(n209), .B0(n194), .B1(n193), .Y(n192) );
  oai21_x1 U380 ( .A0(n194), .A1(n193), .B0(n192), .Y(time_us[31]) );
  inv_x1 U381 ( .A(time_us[31]), .Y(n195) );
  inv_x1 U382 ( .A(n204), .Y(n205) );
  inv_x1 U383 ( .A(timestamp_clk_cycles[33]), .Y(n650) );
  inv_x1 U384 ( .A(n197), .Y(n196) );
  oai21_x1 U385 ( .A0(time_us[31]), .A1(n650), .B0(n197), .Y(n214) );
  nor3_x1 U386 ( .A(timestamp_clk_cycles[32]), .B(n211), .C(n214), .Y(n217) );
  aoi21_x1 U387 ( .A0(n202), .A1(time_us[31]), .B0(n201), .Y(n219) );
  mxi2_x1 U388 ( .A0(n205), .A1(n204), .S(n203), .YN(n222) );
  nor3_x1 U389 ( .A(n217), .B(n219), .C(n222), .Y(n206) );
  aoi21_x1 U390 ( .A0(n209), .A1(n208), .B0(n206), .Y(n207) );
  oai21_x1 U391 ( .A0(n209), .A1(n208), .B0(n207), .Y(time_us[30]) );
  inv_x1 U392 ( .A(time_us[30]), .Y(n216) );
  nor3_x1 U393 ( .A(n217), .B(n219), .C(n216), .Y(n223) );
  inv_x1 U394 ( .A(timestamp_clk_cycles[32]), .Y(n653) );
  nand2_x1 U395 ( .A(n653), .B(time_us[30]), .Y(n215) );
  aoi21_x1 U396 ( .A0(n217), .A1(time_us[30]), .B0(n212), .Y(n233) );
  inv_x1 U397 ( .A(n215), .Y(n213) );
  oai21_x1 U398 ( .A0(time_us[30]), .A1(n653), .B0(n215), .Y(n227) );
  nor3_x1 U399 ( .A(timestamp_clk_cycles[31]), .B(n228), .C(n227), .Y(n231) );
  nor2_x1 U400 ( .A(n233), .B(n231), .Y(n220) );
  or2_x1 U401 ( .A(n217), .B(n216), .Y(n218) );
  aoi21_x1 U402 ( .A0(n219), .A1(n218), .B0(n223), .Y(n238) );
  aoi22_x1 U403 ( .A0(n220), .A1(n238), .B0(n223), .B1(n222), .Y(n221) );
  oai21_x1 U404 ( .A0(n223), .A1(n222), .B0(n221), .Y(time_us[29]) );
  inv_x1 U405 ( .A(time_us[29]), .Y(n224) );
  inv_x1 U406 ( .A(n233), .Y(n234) );
  inv_x1 U407 ( .A(timestamp_clk_cycles[31]), .Y(n654) );
  inv_x1 U408 ( .A(n226), .Y(n225) );
  oai21_x1 U409 ( .A0(time_us[29]), .A1(n654), .B0(n226), .Y(n241) );
  nor3_x1 U410 ( .A(timestamp_clk_cycles[30]), .B(n243), .C(n241), .Y(n246) );
  aoi21_x1 U411 ( .A0(n231), .A1(time_us[29]), .B0(n230), .Y(n248) );
  mxi2_x1 U412 ( .A0(n234), .A1(n233), .S(n232), .YN(n251) );
  nor3_x1 U413 ( .A(n246), .B(n248), .C(n251), .Y(n235) );
  aoi21_x1 U414 ( .A0(n238), .A1(n237), .B0(n235), .Y(n236) );
  oai21_x1 U415 ( .A0(n238), .A1(n237), .B0(n236), .Y(time_us[28]) );
  inv_x1 U416 ( .A(time_us[28]), .Y(n245) );
  nor3_x1 U417 ( .A(n246), .B(n248), .C(n245), .Y(n252) );
  inv_x1 U418 ( .A(timestamp_clk_cycles[30]), .Y(n657) );
  nand2_x1 U419 ( .A(n657), .B(time_us[28]), .Y(n240) );
  inv_x1 U420 ( .A(n240), .Y(n239) );
  oai21_x1 U421 ( .A0(time_us[28]), .A1(n657), .B0(n240), .Y(n259) );
  nor3_x1 U422 ( .A(timestamp_clk_cycles[29]), .B(n255), .C(n259), .Y(n257) );
  aoi21_x1 U423 ( .A0(n246), .A1(time_us[28]), .B0(n244), .Y(n262) );
  nor2_x1 U424 ( .A(n257), .B(n262), .Y(n249) );
  or2_x1 U425 ( .A(n246), .B(n245), .Y(n247) );
  aoi21_x1 U426 ( .A0(n248), .A1(n247), .B0(n252), .Y(n267) );
  aoi22_x1 U427 ( .A0(n249), .A1(n267), .B0(n252), .B1(n251), .Y(n250) );
  oai21_x1 U428 ( .A0(n252), .A1(n251), .B0(n250), .Y(time_us[27]) );
  inv_x1 U429 ( .A(time_us[27]), .Y(n253) );
  inv_x1 U430 ( .A(n262), .Y(n263) );
  inv_x1 U431 ( .A(timestamp_clk_cycles[29]), .Y(n658) );
  aoi21_x1 U432 ( .A0(n257), .A1(time_us[27]), .B0(n256), .Y(n277) );
  inv_x1 U433 ( .A(n260), .Y(n258) );
  oai21_x1 U434 ( .A0(time_us[27]), .A1(n658), .B0(n260), .Y(n270) );
  nor3_x1 U435 ( .A(timestamp_clk_cycles[28]), .B(n271), .C(n270), .Y(n275) );
  mxi2_x1 U436 ( .A0(n263), .A1(n262), .S(n261), .YN(n280) );
  nor3_x1 U437 ( .A(n277), .B(n275), .C(n280), .Y(n264) );
  aoi21_x1 U438 ( .A0(n267), .A1(n266), .B0(n264), .Y(n265) );
  oai21_x1 U439 ( .A0(n267), .A1(n266), .B0(n265), .Y(time_us[26]) );
  inv_x1 U440 ( .A(time_us[26]), .Y(n274) );
  nor3_x1 U441 ( .A(n277), .B(n275), .C(n274), .Y(n281) );
  inv_x1 U442 ( .A(timestamp_clk_cycles[28]), .Y(n661) );
  nand2_x1 U443 ( .A(n661), .B(time_us[26]), .Y(n269) );
  inv_x1 U444 ( .A(n269), .Y(n268) );
  oai21_x1 U445 ( .A0(time_us[26]), .A1(n661), .B0(n269), .Y(n285) );
  nor3_x1 U446 ( .A(timestamp_clk_cycles[27]), .B(n287), .C(n285), .Y(n289) );
  aoi21_x1 U447 ( .A0(n275), .A1(time_us[26]), .B0(n273), .Y(n291) );
  nor2_x1 U448 ( .A(n289), .B(n291), .Y(n278) );
  or2_x1 U449 ( .A(n275), .B(n274), .Y(n276) );
  aoi21_x1 U450 ( .A0(n277), .A1(n276), .B0(n281), .Y(n296) );
  aoi22_x1 U451 ( .A0(n278), .A1(n296), .B0(n281), .B1(n280), .Y(n279) );
  oai21_x1 U452 ( .A0(n281), .A1(n280), .B0(n279), .Y(time_us[25]) );
  inv_x1 U453 ( .A(time_us[25]), .Y(n282) );
  inv_x1 U454 ( .A(n291), .Y(n292) );
  inv_x1 U455 ( .A(timestamp_clk_cycles[27]), .Y(n662) );
  inv_x1 U456 ( .A(n284), .Y(n283) );
  oai21_x1 U457 ( .A0(time_us[25]), .A1(n662), .B0(n284), .Y(n301) );
  nor3_x1 U458 ( .A(timestamp_clk_cycles[26]), .B(n298), .C(n301), .Y(n304) );
  aoi21_x1 U459 ( .A0(n289), .A1(time_us[25]), .B0(n288), .Y(n306) );
  mxi2_x1 U460 ( .A0(n292), .A1(n291), .S(n290), .YN(n309) );
  nor3_x1 U461 ( .A(n304), .B(n306), .C(n309), .Y(n293) );
  aoi21_x1 U462 ( .A0(n296), .A1(n295), .B0(n293), .Y(n294) );
  oai21_x1 U463 ( .A0(n296), .A1(n295), .B0(n294), .Y(time_us[24]) );
  inv_x1 U464 ( .A(time_us[24]), .Y(n303) );
  nor3_x1 U465 ( .A(n304), .B(n306), .C(n303), .Y(n310) );
  inv_x1 U466 ( .A(timestamp_clk_cycles[26]), .Y(n665) );
  nand2_x1 U467 ( .A(n665), .B(time_us[24]), .Y(n302) );
  aoi21_x1 U468 ( .A0(n304), .A1(time_us[24]), .B0(n299), .Y(n320) );
  inv_x1 U469 ( .A(n302), .Y(n300) );
  oai21_x1 U470 ( .A0(time_us[24]), .A1(n665), .B0(n302), .Y(n314) );
  nor3_x1 U471 ( .A(timestamp_clk_cycles[25]), .B(n315), .C(n314), .Y(n318) );
  nor2_x1 U472 ( .A(n320), .B(n318), .Y(n307) );
  or2_x1 U473 ( .A(n304), .B(n303), .Y(n305) );
  aoi21_x1 U474 ( .A0(n306), .A1(n305), .B0(n310), .Y(n325) );
  aoi22_x1 U475 ( .A0(n307), .A1(n325), .B0(n310), .B1(n309), .Y(n308) );
  oai21_x1 U476 ( .A0(n310), .A1(n309), .B0(n308), .Y(time_us[23]) );
  inv_x1 U477 ( .A(time_us[23]), .Y(n311) );
  inv_x1 U478 ( .A(n320), .Y(n321) );
  inv_x1 U479 ( .A(timestamp_clk_cycles[25]), .Y(n666) );
  inv_x1 U480 ( .A(n313), .Y(n312) );
  oai21_x1 U481 ( .A0(time_us[23]), .A1(n666), .B0(n313), .Y(n328) );
  nor3_x1 U482 ( .A(timestamp_clk_cycles[24]), .B(n330), .C(n328), .Y(n333) );
  aoi21_x1 U483 ( .A0(n318), .A1(time_us[23]), .B0(n317), .Y(n335) );
  mxi2_x1 U484 ( .A0(n321), .A1(n320), .S(n319), .YN(n338) );
  nor3_x1 U485 ( .A(n333), .B(n335), .C(n338), .Y(n322) );
  aoi21_x1 U486 ( .A0(n325), .A1(n324), .B0(n322), .Y(n323) );
  oai21_x1 U487 ( .A0(n325), .A1(n324), .B0(n323), .Y(time_us[22]) );
  inv_x1 U488 ( .A(time_us[22]), .Y(n332) );
  nor3_x1 U489 ( .A(n333), .B(n335), .C(n332), .Y(n339) );
  inv_x1 U490 ( .A(timestamp_clk_cycles[24]), .Y(n669) );
  nand2_x1 U491 ( .A(n669), .B(time_us[22]), .Y(n327) );
  inv_x1 U492 ( .A(n327), .Y(n326) );
  oai21_x1 U493 ( .A0(time_us[22]), .A1(n669), .B0(n327), .Y(n346) );
  nor3_x1 U494 ( .A(timestamp_clk_cycles[23]), .B(n342), .C(n346), .Y(n344) );
  aoi21_x1 U495 ( .A0(n333), .A1(time_us[22]), .B0(n331), .Y(n349) );
  nor2_x1 U496 ( .A(n344), .B(n349), .Y(n336) );
  or2_x1 U497 ( .A(n333), .B(n332), .Y(n334) );
  aoi21_x1 U498 ( .A0(n335), .A1(n334), .B0(n339), .Y(n354) );
  aoi22_x1 U499 ( .A0(n336), .A1(n354), .B0(n339), .B1(n338), .Y(n337) );
  oai21_x1 U500 ( .A0(n339), .A1(n338), .B0(n337), .Y(time_us[21]) );
  inv_x1 U501 ( .A(time_us[21]), .Y(n340) );
  inv_x1 U502 ( .A(n349), .Y(n350) );
  inv_x1 U503 ( .A(timestamp_clk_cycles[23]), .Y(n670) );
  aoi21_x1 U504 ( .A0(n344), .A1(time_us[21]), .B0(n343), .Y(n364) );
  inv_x1 U505 ( .A(n347), .Y(n345) );
  oai21_x1 U506 ( .A0(time_us[21]), .A1(n670), .B0(n347), .Y(n357) );
  nor3_x1 U507 ( .A(timestamp_clk_cycles[22]), .B(n358), .C(n357), .Y(n362) );
  mxi2_x1 U508 ( .A0(n350), .A1(n349), .S(n348), .YN(n367) );
  nor3_x1 U509 ( .A(n364), .B(n362), .C(n367), .Y(n351) );
  aoi21_x1 U510 ( .A0(n354), .A1(n353), .B0(n351), .Y(n352) );
  oai21_x1 U511 ( .A0(n354), .A1(n353), .B0(n352), .Y(time_us[20]) );
  inv_x1 U512 ( .A(time_us[20]), .Y(n361) );
  nor3_x1 U513 ( .A(n364), .B(n362), .C(n361), .Y(n368) );
  inv_x1 U514 ( .A(timestamp_clk_cycles[22]), .Y(n673) );
  nand2_x1 U515 ( .A(n673), .B(time_us[20]), .Y(n356) );
  inv_x1 U516 ( .A(n356), .Y(n355) );
  oai21_x1 U517 ( .A0(time_us[20]), .A1(n673), .B0(n356), .Y(n372) );
  nor3_x1 U518 ( .A(timestamp_clk_cycles[21]), .B(n374), .C(n372), .Y(n376) );
  aoi21_x1 U519 ( .A0(n362), .A1(time_us[20]), .B0(n360), .Y(n378) );
  nor2_x1 U520 ( .A(n376), .B(n378), .Y(n365) );
  or2_x1 U521 ( .A(n362), .B(n361), .Y(n363) );
  aoi21_x1 U522 ( .A0(n364), .A1(n363), .B0(n368), .Y(n383) );
  aoi22_x1 U523 ( .A0(n365), .A1(n383), .B0(n368), .B1(n367), .Y(n366) );
  oai21_x1 U524 ( .A0(n368), .A1(n367), .B0(n366), .Y(time_us[19]) );
  inv_x1 U525 ( .A(time_us[19]), .Y(n369) );
  inv_x1 U526 ( .A(n378), .Y(n379) );
  inv_x1 U527 ( .A(timestamp_clk_cycles[21]), .Y(n674) );
  inv_x1 U528 ( .A(n371), .Y(n370) );
  oai21_x1 U529 ( .A0(time_us[19]), .A1(n674), .B0(n371), .Y(n388) );
  nor3_x1 U530 ( .A(timestamp_clk_cycles[20]), .B(n385), .C(n388), .Y(n391) );
  aoi21_x1 U531 ( .A0(n376), .A1(time_us[19]), .B0(n375), .Y(n393) );
  mxi2_x1 U532 ( .A0(n379), .A1(n378), .S(n377), .YN(n396) );
  nor3_x1 U533 ( .A(n391), .B(n393), .C(n396), .Y(n380) );
  aoi21_x1 U534 ( .A0(n383), .A1(n382), .B0(n380), .Y(n381) );
  oai21_x1 U535 ( .A0(n383), .A1(n382), .B0(n381), .Y(time_us[18]) );
  inv_x1 U536 ( .A(time_us[18]), .Y(n390) );
  nor3_x1 U537 ( .A(n391), .B(n393), .C(n390), .Y(n397) );
  inv_x1 U538 ( .A(timestamp_clk_cycles[20]), .Y(n677) );
  nand2_x1 U539 ( .A(n677), .B(time_us[18]), .Y(n389) );
  aoi21_x1 U540 ( .A0(n391), .A1(time_us[18]), .B0(n386), .Y(n407) );
  inv_x1 U541 ( .A(n389), .Y(n387) );
  oai21_x1 U542 ( .A0(time_us[18]), .A1(n677), .B0(n389), .Y(n401) );
  nor3_x1 U543 ( .A(timestamp_clk_cycles[19]), .B(n402), .C(n401), .Y(n405) );
  nor2_x1 U544 ( .A(n407), .B(n405), .Y(n394) );
  or2_x1 U545 ( .A(n391), .B(n390), .Y(n392) );
  aoi21_x1 U546 ( .A0(n393), .A1(n392), .B0(n397), .Y(n412) );
  aoi22_x1 U547 ( .A0(n394), .A1(n412), .B0(n397), .B1(n396), .Y(n395) );
  oai21_x1 U548 ( .A0(n397), .A1(n396), .B0(n395), .Y(time_us[17]) );
  inv_x1 U549 ( .A(time_us[17]), .Y(n398) );
  inv_x1 U550 ( .A(n407), .Y(n408) );
  inv_x1 U551 ( .A(timestamp_clk_cycles[19]), .Y(n678) );
  inv_x1 U552 ( .A(n400), .Y(n399) );
  oai21_x1 U553 ( .A0(time_us[17]), .A1(n678), .B0(n400), .Y(n415) );
  nor3_x1 U554 ( .A(timestamp_clk_cycles[18]), .B(n417), .C(n415), .Y(n420) );
  aoi21_x1 U555 ( .A0(n405), .A1(time_us[17]), .B0(n404), .Y(n422) );
  mxi2_x1 U556 ( .A0(n408), .A1(n407), .S(n406), .YN(n425) );
  nor3_x1 U557 ( .A(n420), .B(n422), .C(n425), .Y(n409) );
  aoi21_x1 U558 ( .A0(n412), .A1(n411), .B0(n409), .Y(n410) );
  oai21_x1 U559 ( .A0(n412), .A1(n411), .B0(n410), .Y(time_us[16]) );
  inv_x1 U560 ( .A(time_us[16]), .Y(n419) );
  nor3_x1 U561 ( .A(n420), .B(n422), .C(n419), .Y(n426) );
  inv_x1 U562 ( .A(timestamp_clk_cycles[18]), .Y(n681) );
  nand2_x1 U563 ( .A(n681), .B(time_us[16]), .Y(n414) );
  inv_x1 U564 ( .A(n414), .Y(n413) );
  oai21_x1 U565 ( .A0(time_us[16]), .A1(n681), .B0(n414), .Y(n433) );
  nor3_x1 U566 ( .A(timestamp_clk_cycles[17]), .B(n429), .C(n433), .Y(n431) );
  aoi21_x1 U567 ( .A0(n420), .A1(time_us[16]), .B0(n418), .Y(n436) );
  nor2_x1 U568 ( .A(n431), .B(n436), .Y(n423) );
  or2_x1 U569 ( .A(n420), .B(n419), .Y(n421) );
  aoi21_x1 U570 ( .A0(n422), .A1(n421), .B0(n426), .Y(n441) );
  aoi22_x1 U571 ( .A0(n423), .A1(n441), .B0(n426), .B1(n425), .Y(n424) );
  oai21_x1 U572 ( .A0(n426), .A1(n425), .B0(n424), .Y(time_us[15]) );
  inv_x1 U573 ( .A(time_us[15]), .Y(n427) );
  inv_x1 U574 ( .A(n436), .Y(n437) );
  inv_x1 U575 ( .A(timestamp_clk_cycles[17]), .Y(n682) );
  aoi21_x1 U576 ( .A0(n431), .A1(time_us[15]), .B0(n430), .Y(n451) );
  inv_x1 U577 ( .A(n434), .Y(n432) );
  oai21_x1 U578 ( .A0(time_us[15]), .A1(n682), .B0(n434), .Y(n444) );
  nor3_x1 U579 ( .A(timestamp_clk_cycles[16]), .B(n445), .C(n444), .Y(n449) );
  mxi2_x1 U580 ( .A0(n437), .A1(n436), .S(n435), .YN(n454) );
  nor3_x1 U581 ( .A(n451), .B(n449), .C(n454), .Y(n438) );
  aoi21_x1 U582 ( .A0(n441), .A1(n440), .B0(n438), .Y(n439) );
  oai21_x1 U583 ( .A0(n441), .A1(n440), .B0(n439), .Y(time_us[14]) );
  inv_x1 U584 ( .A(time_us[14]), .Y(n448) );
  nor3_x1 U585 ( .A(n451), .B(n449), .C(n448), .Y(n455) );
  inv_x1 U586 ( .A(timestamp_clk_cycles[16]), .Y(n685) );
  nand2_x1 U587 ( .A(n685), .B(time_us[14]), .Y(n443) );
  inv_x1 U588 ( .A(n443), .Y(n442) );
  oai21_x1 U589 ( .A0(time_us[14]), .A1(n685), .B0(n443), .Y(n459) );
  nor3_x1 U590 ( .A(timestamp_clk_cycles[15]), .B(n461), .C(n459), .Y(n463) );
  aoi21_x1 U591 ( .A0(n449), .A1(time_us[14]), .B0(n447), .Y(n465) );
  nor2_x1 U592 ( .A(n463), .B(n465), .Y(n452) );
  or2_x1 U593 ( .A(n449), .B(n448), .Y(n450) );
  aoi21_x1 U594 ( .A0(n451), .A1(n450), .B0(n455), .Y(n470) );
  aoi22_x1 U595 ( .A0(n452), .A1(n470), .B0(n455), .B1(n454), .Y(n453) );
  oai21_x1 U596 ( .A0(n455), .A1(n454), .B0(n453), .Y(time_us[13]) );
  inv_x1 U597 ( .A(time_us[13]), .Y(n456) );
  inv_x1 U598 ( .A(n465), .Y(n466) );
  inv_x1 U599 ( .A(timestamp_clk_cycles[15]), .Y(n686) );
  inv_x1 U600 ( .A(n458), .Y(n457) );
  oai21_x1 U601 ( .A0(time_us[13]), .A1(n686), .B0(n458), .Y(n475) );
  nor3_x1 U602 ( .A(timestamp_clk_cycles[14]), .B(n472), .C(n475), .Y(n478) );
  aoi21_x1 U603 ( .A0(n463), .A1(time_us[13]), .B0(n462), .Y(n480) );
  mxi2_x1 U604 ( .A0(n466), .A1(n465), .S(n464), .YN(n483) );
  nor3_x1 U605 ( .A(n478), .B(n480), .C(n483), .Y(n467) );
  aoi21_x1 U606 ( .A0(n470), .A1(n469), .B0(n467), .Y(n468) );
  oai21_x1 U607 ( .A0(n470), .A1(n469), .B0(n468), .Y(time_us[12]) );
  inv_x1 U608 ( .A(time_us[12]), .Y(n477) );
  nor3_x1 U609 ( .A(n478), .B(n480), .C(n477), .Y(n484) );
  inv_x1 U610 ( .A(timestamp_clk_cycles[14]), .Y(n689) );
  nand2_x1 U611 ( .A(n689), .B(time_us[12]), .Y(n476) );
  aoi21_x1 U612 ( .A0(n478), .A1(time_us[12]), .B0(n473), .Y(n494) );
  inv_x1 U613 ( .A(n476), .Y(n474) );
  oai21_x1 U614 ( .A0(time_us[12]), .A1(n689), .B0(n476), .Y(n488) );
  nor3_x1 U615 ( .A(timestamp_clk_cycles[13]), .B(n489), .C(n488), .Y(n492) );
  nor2_x1 U616 ( .A(n494), .B(n492), .Y(n481) );
  or2_x1 U617 ( .A(n478), .B(n477), .Y(n479) );
  aoi21_x1 U618 ( .A0(n480), .A1(n479), .B0(n484), .Y(n499) );
  aoi22_x1 U619 ( .A0(n481), .A1(n499), .B0(n484), .B1(n483), .Y(n482) );
  oai21_x1 U620 ( .A0(n484), .A1(n483), .B0(n482), .Y(time_us[11]) );
  inv_x1 U621 ( .A(time_us[11]), .Y(n485) );
  inv_x1 U622 ( .A(n494), .Y(n495) );
  inv_x1 U623 ( .A(timestamp_clk_cycles[13]), .Y(n690) );
  inv_x1 U624 ( .A(n487), .Y(n486) );
  oai21_x1 U625 ( .A0(time_us[11]), .A1(n690), .B0(n487), .Y(n502) );
  nor3_x1 U626 ( .A(timestamp_clk_cycles[12]), .B(n504), .C(n502), .Y(n507) );
  aoi21_x1 U627 ( .A0(n492), .A1(time_us[11]), .B0(n491), .Y(n509) );
  mxi2_x1 U628 ( .A0(n495), .A1(n494), .S(n493), .YN(n512) );
  nor3_x1 U629 ( .A(n507), .B(n509), .C(n512), .Y(n496) );
  aoi21_x1 U630 ( .A0(n499), .A1(n498), .B0(n496), .Y(n497) );
  oai21_x1 U631 ( .A0(n499), .A1(n498), .B0(n497), .Y(time_us[10]) );
  inv_x1 U632 ( .A(time_us[10]), .Y(n506) );
  nor3_x1 U633 ( .A(n507), .B(n509), .C(n506), .Y(n513) );
  inv_x1 U634 ( .A(timestamp_clk_cycles[12]), .Y(n693) );
  nand2_x1 U635 ( .A(n693), .B(time_us[10]), .Y(n501) );
  inv_x1 U636 ( .A(n501), .Y(n500) );
  oai21_x1 U637 ( .A0(time_us[10]), .A1(n693), .B0(n501), .Y(n520) );
  nor3_x1 U638 ( .A(timestamp_clk_cycles[11]), .B(n516), .C(n520), .Y(n518) );
  aoi21_x1 U639 ( .A0(n507), .A1(time_us[10]), .B0(n505), .Y(n523) );
  nor2_x1 U640 ( .A(n518), .B(n523), .Y(n510) );
  or2_x1 U641 ( .A(n507), .B(n506), .Y(n508) );
  aoi21_x1 U642 ( .A0(n509), .A1(n508), .B0(n513), .Y(n528) );
  aoi22_x1 U643 ( .A0(n510), .A1(n528), .B0(n513), .B1(n512), .Y(n511) );
  oai21_x1 U644 ( .A0(n513), .A1(n512), .B0(n511), .Y(time_us[9]) );
  inv_x1 U645 ( .A(time_us[9]), .Y(n514) );
  inv_x1 U646 ( .A(n523), .Y(n524) );
  inv_x1 U647 ( .A(timestamp_clk_cycles[11]), .Y(n694) );
  aoi21_x1 U648 ( .A0(n518), .A1(time_us[9]), .B0(n517), .Y(n538) );
  inv_x1 U649 ( .A(n521), .Y(n519) );
  oai21_x1 U650 ( .A0(time_us[9]), .A1(n694), .B0(n521), .Y(n531) );
  nor3_x1 U651 ( .A(timestamp_clk_cycles[10]), .B(n532), .C(n531), .Y(n536) );
  mxi2_x1 U652 ( .A0(n524), .A1(n523), .S(n522), .YN(n541) );
  nor3_x1 U653 ( .A(n538), .B(n536), .C(n541), .Y(n525) );
  aoi21_x1 U654 ( .A0(n528), .A1(n527), .B0(n525), .Y(n526) );
  oai21_x1 U655 ( .A0(n528), .A1(n527), .B0(n526), .Y(time_us[8]) );
  inv_x1 U656 ( .A(time_us[8]), .Y(n535) );
  nor3_x1 U657 ( .A(n538), .B(n536), .C(n535), .Y(n542) );
  inv_x1 U658 ( .A(timestamp_clk_cycles[10]), .Y(n697) );
  nand2_x1 U659 ( .A(n697), .B(time_us[8]), .Y(n530) );
  inv_x1 U660 ( .A(n530), .Y(n529) );
  oai21_x1 U661 ( .A0(time_us[8]), .A1(n697), .B0(n530), .Y(n546) );
  nor3_x1 U662 ( .A(timestamp_clk_cycles[9]), .B(n548), .C(n546), .Y(n550) );
  aoi21_x1 U663 ( .A0(n536), .A1(time_us[8]), .B0(n534), .Y(n552) );
  nor2_x1 U664 ( .A(n550), .B(n552), .Y(n539) );
  or2_x1 U665 ( .A(n536), .B(n535), .Y(n537) );
  aoi21_x1 U666 ( .A0(n538), .A1(n537), .B0(n542), .Y(n557) );
  aoi22_x1 U667 ( .A0(n539), .A1(n557), .B0(n542), .B1(n541), .Y(n540) );
  oai21_x1 U668 ( .A0(n542), .A1(n541), .B0(n540), .Y(time_us[7]) );
  inv_x1 U669 ( .A(time_us[7]), .Y(n543) );
  inv_x1 U670 ( .A(n552), .Y(n553) );
  inv_x1 U671 ( .A(timestamp_clk_cycles[9]), .Y(n698) );
  inv_x1 U672 ( .A(n545), .Y(n544) );
  oai21_x1 U673 ( .A0(time_us[7]), .A1(n698), .B0(n545), .Y(n562) );
  nor3_x1 U674 ( .A(timestamp_clk_cycles[8]), .B(n559), .C(n562), .Y(n565) );
  aoi21_x1 U675 ( .A0(n550), .A1(time_us[7]), .B0(n549), .Y(n567) );
  mxi2_x1 U676 ( .A0(n553), .A1(n552), .S(n551), .YN(n570) );
  nor3_x1 U677 ( .A(n565), .B(n567), .C(n570), .Y(n554) );
  aoi21_x1 U678 ( .A0(n557), .A1(n556), .B0(n554), .Y(n555) );
  oai21_x1 U679 ( .A0(n557), .A1(n556), .B0(n555), .Y(time_us[6]) );
  inv_x1 U680 ( .A(time_us[6]), .Y(n564) );
  nor3_x1 U681 ( .A(n565), .B(n567), .C(n564), .Y(n571) );
  inv_x1 U682 ( .A(timestamp_clk_cycles[8]), .Y(n701) );
  nand2_x1 U683 ( .A(n701), .B(time_us[6]), .Y(n563) );
  aoi21_x1 U684 ( .A0(n565), .A1(time_us[6]), .B0(n560), .Y(n581) );
  inv_x1 U685 ( .A(n563), .Y(n561) );
  oai21_x1 U686 ( .A0(time_us[6]), .A1(n701), .B0(n563), .Y(n575) );
  nor3_x1 U687 ( .A(timestamp_clk_cycles[7]), .B(n576), .C(n575), .Y(n579) );
  nor2_x1 U688 ( .A(n581), .B(n579), .Y(n568) );
  aoi21_x1 U689 ( .A0(n567), .A1(n566), .B0(n571), .Y(n586) );
  aoi22_x1 U690 ( .A0(n568), .A1(n586), .B0(n571), .B1(n570), .Y(n569) );
  oai21_x1 U691 ( .A0(n571), .A1(n570), .B0(n569), .Y(time_us[5]) );
  inv_x1 U692 ( .A(time_us[5]), .Y(n572) );
  inv_x1 U693 ( .A(n581), .Y(n582) );
  inv_x1 U694 ( .A(timestamp_clk_cycles[7]), .Y(n702) );
  inv_x1 U695 ( .A(n574), .Y(n573) );
  oai21_x1 U696 ( .A0(time_us[5]), .A1(n702), .B0(n574), .Y(n589) );
  nor3_x1 U697 ( .A(timestamp_clk_cycles[6]), .B(n591), .C(n589), .Y(n594) );
  aoi21_x1 U698 ( .A0(n579), .A1(time_us[5]), .B0(n578), .Y(n596) );
  mxi2_x1 U699 ( .A0(n582), .A1(n581), .S(n580), .YN(n599) );
  nor3_x1 U700 ( .A(n594), .B(n596), .C(n599), .Y(n583) );
  aoi21_x1 U701 ( .A0(n586), .A1(n585), .B0(n583), .Y(n584) );
  oai21_x1 U702 ( .A0(n586), .A1(n585), .B0(n584), .Y(time_us[4]) );
  inv_x1 U703 ( .A(time_us[4]), .Y(n593) );
  nor3_x1 U704 ( .A(n594), .B(n596), .C(n593), .Y(n600) );
  inv_x1 U705 ( .A(timestamp_clk_cycles[6]), .Y(n705) );
  nand2_x1 U706 ( .A(n705), .B(time_us[4]), .Y(n588) );
  inv_x1 U707 ( .A(n588), .Y(n587) );
  oai21_x1 U708 ( .A0(time_us[4]), .A1(n705), .B0(n588), .Y(n607) );
  nor3_x1 U709 ( .A(timestamp_clk_cycles[5]), .B(n603), .C(n607), .Y(n605) );
  aoi21_x1 U710 ( .A0(n594), .A1(time_us[4]), .B0(n592), .Y(n610) );
  aoi21_x1 U711 ( .A0(n596), .A1(n595), .B0(n600), .Y(n615) );
  aoi22_x1 U712 ( .A0(n597), .A1(n615), .B0(n600), .B1(n599), .Y(n598) );
  oai21_x1 U713 ( .A0(n600), .A1(n599), .B0(n598), .Y(time_us[3]) );
  inv_x1 U714 ( .A(time_us[3]), .Y(n601) );
  inv_x1 U715 ( .A(n610), .Y(n611) );
  inv_x1 U716 ( .A(timestamp_clk_cycles[5]), .Y(n706) );
  aoi21_x1 U717 ( .A0(n605), .A1(time_us[3]), .B0(n604), .Y(n726) );
  inv_x1 U718 ( .A(n608), .Y(n606) );
  oai21_x1 U719 ( .A0(time_us[3]), .A1(n706), .B0(n608), .Y(n718) );
  nor3_x1 U720 ( .A(timestamp_clk_cycles[4]), .B(n720), .C(n718), .Y(n724) );
  mxi2_x1 U721 ( .A0(n611), .A1(n610), .S(n609), .YN(n729) );
  nor3_x1 U722 ( .A(n726), .B(n724), .C(n729), .Y(n612) );
  aoi21_x1 U723 ( .A0(n615), .A1(n614), .B0(n612), .Y(n613) );
  oai21_x1 U724 ( .A0(n615), .A1(n614), .B0(n613), .Y(time_us[2]) );
  inv_x1 U725 ( .A(timestamp_clk_cycles[50]), .Y(n617) );
  inv_x1 U726 ( .A(timestamp_clk_cycles[4]), .Y(n715) );
  inv_x1 U727 ( .A(timestamp_clk_cycles[2]), .Y(n712) );
  nand2_x1 U728 ( .A(timestamp_clk_cycles[0]), .B(timestamp_clk_cycles[1]), 
        .Y(n711) );
  nor2_x1 U729 ( .A(n712), .B(n711), .Y(n710) );
  nand2_x1 U730 ( .A(timestamp_clk_cycles[3]), .B(n710), .Y(n708) );
  nor2_x1 U731 ( .A(n715), .B(n708), .Y(n707) );
  nand2_x1 U732 ( .A(timestamp_clk_cycles[5]), .B(n707), .Y(n704) );
  nand2_x1 U733 ( .A(timestamp_clk_cycles[7]), .B(n703), .Y(n700) );
  nor2_x1 U734 ( .A(n701), .B(n700), .Y(n699) );
  nand2_x1 U735 ( .A(timestamp_clk_cycles[9]), .B(n699), .Y(n696) );
  nor2_x1 U736 ( .A(n697), .B(n696), .Y(n695) );
  nand2_x1 U737 ( .A(timestamp_clk_cycles[11]), .B(n695), .Y(n692) );
  nor2_x1 U738 ( .A(n693), .B(n692), .Y(n691) );
  nand2_x1 U739 ( .A(timestamp_clk_cycles[13]), .B(n691), .Y(n688) );
  nand2_x1 U740 ( .A(timestamp_clk_cycles[15]), .B(n687), .Y(n684) );
  nor2_x1 U741 ( .A(n685), .B(n684), .Y(n683) );
  nand2_x1 U742 ( .A(timestamp_clk_cycles[17]), .B(n683), .Y(n680) );
  nor2_x1 U743 ( .A(n681), .B(n680), .Y(n679) );
  nand2_x1 U744 ( .A(timestamp_clk_cycles[19]), .B(n679), .Y(n676) );
  nor2_x1 U745 ( .A(n677), .B(n676), .Y(n675) );
  nor2_x1 U746 ( .A(n673), .B(n672), .Y(n671) );
  nand2_x1 U747 ( .A(timestamp_clk_cycles[23]), .B(n671), .Y(n668) );
  nor2_x1 U748 ( .A(n669), .B(n668), .Y(n667) );
  nand2_x1 U749 ( .A(timestamp_clk_cycles[25]), .B(n667), .Y(n664) );
  nor2_x1 U750 ( .A(n665), .B(n664), .Y(n663) );
  nand2_x1 U751 ( .A(timestamp_clk_cycles[27]), .B(n663), .Y(n660) );
  nor2_x1 U752 ( .A(n661), .B(n660), .Y(n659) );
  nor2_x1 U753 ( .A(n657), .B(n656), .Y(n655) );
  nand2_x1 U754 ( .A(timestamp_clk_cycles[31]), .B(n655), .Y(n652) );
  nor2_x1 U755 ( .A(n653), .B(n652), .Y(n651) );
  nand2_x1 U756 ( .A(timestamp_clk_cycles[33]), .B(n651), .Y(n648) );
  nor2_x1 U757 ( .A(n649), .B(n648), .Y(n647) );
  nand2_x1 U758 ( .A(timestamp_clk_cycles[35]), .B(n647), .Y(n644) );
  nand2_x1 U759 ( .A(timestamp_clk_cycles[37]), .B(n643), .Y(n640) );
  nor2_x1 U760 ( .A(n641), .B(n640), .Y(n639) );
  nand2_x1 U761 ( .A(timestamp_clk_cycles[39]), .B(n639), .Y(n636) );
  nor2_x1 U762 ( .A(n637), .B(n636), .Y(n635) );
  nand2_x1 U763 ( .A(timestamp_clk_cycles[41]), .B(n635), .Y(n632) );
  nor2_x1 U764 ( .A(n633), .B(n632), .Y(n631) );
  nand2_x1 U765 ( .A(timestamp_clk_cycles[43]), .B(n631), .Y(n628) );
  nand2_x1 U766 ( .A(timestamp_clk_cycles[45]), .B(n627), .Y(n624) );
  nor2_x1 U767 ( .A(n625), .B(n624), .Y(n623) );
  nand2_x1 U768 ( .A(timestamp_clk_cycles[47]), .B(n623), .Y(n620) );
  nor2_x1 U769 ( .A(n621), .B(n620), .Y(n619) );
  nand2_x1 U770 ( .A(timestamp_clk_cycles[49]), .B(n619), .Y(n616) );
  nor2_x1 U771 ( .A(n617), .B(n616), .Y(n713) );
  aoi21_x1 U772 ( .A0(n617), .A1(n616), .B0(n713), .Y(N51) );
  mxi2_x1 U773 ( .A0(n618), .A1(timestamp_clk_cycles[49]), .S(n619), .YN(N50)
         );
  aoi21_x1 U774 ( .A0(n621), .A1(n620), .B0(n619), .Y(N49) );
  mxi2_x1 U775 ( .A0(n622), .A1(timestamp_clk_cycles[47]), .S(n623), .YN(N48)
         );
  aoi21_x1 U776 ( .A0(n625), .A1(n624), .B0(n623), .Y(N47) );
  mxi2_x1 U777 ( .A0(n626), .A1(timestamp_clk_cycles[45]), .S(n627), .YN(N46)
         );
  aoi21_x1 U778 ( .A0(n629), .A1(n628), .B0(n627), .Y(N45) );
  mxi2_x1 U779 ( .A0(n630), .A1(timestamp_clk_cycles[43]), .S(n631), .YN(N44)
         );
  aoi21_x1 U780 ( .A0(n633), .A1(n632), .B0(n631), .Y(N43) );
  mxi2_x1 U781 ( .A0(n634), .A1(timestamp_clk_cycles[41]), .S(n635), .YN(N42)
         );
  aoi21_x1 U782 ( .A0(n637), .A1(n636), .B0(n635), .Y(N41) );
  mxi2_x1 U783 ( .A0(n638), .A1(timestamp_clk_cycles[39]), .S(n639), .YN(N40)
         );
  aoi21_x1 U784 ( .A0(n641), .A1(n640), .B0(n639), .Y(N39) );
  mxi2_x1 U785 ( .A0(n642), .A1(timestamp_clk_cycles[37]), .S(n643), .YN(N38)
         );
  aoi21_x1 U786 ( .A0(n645), .A1(n644), .B0(n643), .Y(N37) );
  mxi2_x1 U787 ( .A0(n646), .A1(timestamp_clk_cycles[35]), .S(n647), .YN(N36)
         );
  aoi21_x1 U788 ( .A0(n649), .A1(n648), .B0(n647), .Y(N35) );
  mxi2_x1 U789 ( .A0(n650), .A1(timestamp_clk_cycles[33]), .S(n651), .YN(N34)
         );
  aoi21_x1 U790 ( .A0(n653), .A1(n652), .B0(n651), .Y(N33) );
  mxi2_x1 U791 ( .A0(n654), .A1(timestamp_clk_cycles[31]), .S(n655), .YN(N32)
         );
  aoi21_x1 U792 ( .A0(n657), .A1(n656), .B0(n655), .Y(N31) );
  mxi2_x1 U793 ( .A0(n658), .A1(timestamp_clk_cycles[29]), .S(n659), .YN(N30)
         );
  aoi21_x1 U794 ( .A0(n661), .A1(n660), .B0(n659), .Y(N29) );
  mxi2_x1 U795 ( .A0(n662), .A1(timestamp_clk_cycles[27]), .S(n663), .YN(N28)
         );
  aoi21_x1 U796 ( .A0(n665), .A1(n664), .B0(n663), .Y(N27) );
  mxi2_x1 U797 ( .A0(n666), .A1(timestamp_clk_cycles[25]), .S(n667), .YN(N26)
         );
  aoi21_x1 U798 ( .A0(n669), .A1(n668), .B0(n667), .Y(N25) );
  mxi2_x1 U799 ( .A0(n670), .A1(timestamp_clk_cycles[23]), .S(n671), .YN(N24)
         );
  aoi21_x1 U800 ( .A0(n673), .A1(n672), .B0(n671), .Y(N23) );
  mxi2_x1 U801 ( .A0(n674), .A1(timestamp_clk_cycles[21]), .S(n675), .YN(N22)
         );
  aoi21_x1 U802 ( .A0(n677), .A1(n676), .B0(n675), .Y(N21) );
  mxi2_x1 U803 ( .A0(n678), .A1(timestamp_clk_cycles[19]), .S(n679), .YN(N20)
         );
  aoi21_x1 U804 ( .A0(n681), .A1(n680), .B0(n679), .Y(N19) );
  mxi2_x1 U805 ( .A0(n682), .A1(timestamp_clk_cycles[17]), .S(n683), .YN(N18)
         );
  aoi21_x1 U806 ( .A0(n685), .A1(n684), .B0(n683), .Y(N17) );
  mxi2_x1 U807 ( .A0(n686), .A1(timestamp_clk_cycles[15]), .S(n687), .YN(N16)
         );
  aoi21_x1 U808 ( .A0(n689), .A1(n688), .B0(n687), .Y(N15) );
  mxi2_x1 U809 ( .A0(n690), .A1(timestamp_clk_cycles[13]), .S(n691), .YN(N14)
         );
  aoi21_x1 U810 ( .A0(n693), .A1(n692), .B0(n691), .Y(N13) );
  mxi2_x1 U811 ( .A0(n694), .A1(timestamp_clk_cycles[11]), .S(n695), .YN(N12)
         );
  aoi21_x1 U812 ( .A0(n697), .A1(n696), .B0(n695), .Y(N11) );
  mxi2_x1 U813 ( .A0(n698), .A1(timestamp_clk_cycles[9]), .S(n699), .YN(N10)
         );
  aoi21_x1 U814 ( .A0(n701), .A1(n700), .B0(n699), .Y(N9) );
  mxi2_x1 U815 ( .A0(n702), .A1(timestamp_clk_cycles[7]), .S(n703), .YN(N8) );
  aoi21_x1 U816 ( .A0(n705), .A1(n704), .B0(n703), .Y(N7) );
  mxi2_x1 U817 ( .A0(n706), .A1(timestamp_clk_cycles[5]), .S(n707), .YN(N6) );
  aoi21_x1 U818 ( .A0(n715), .A1(n708), .B0(n707), .Y(N5) );
  inv_x1 U819 ( .A(timestamp_clk_cycles[3]), .Y(n709) );
  mxi2_x1 U820 ( .A0(n709), .A1(timestamp_clk_cycles[3]), .S(n710), .YN(N4) );
  aoi21_x1 U821 ( .A0(n712), .A1(n711), .B0(n710), .Y(N3) );
  inv_x1 U822 ( .A(timestamp_clk_cycles[0]), .Y(N1) );
  mxi2_x1 U823 ( .A0(N1), .A1(timestamp_clk_cycles[0]), .S(
        timestamp_clk_cycles[1]), .YN(N2) );
  inv_x1 U824 ( .A(timestamp_clk_cycles[51]), .Y(n714) );
  mxi2_x1 U825 ( .A0(n714), .A1(timestamp_clk_cycles[51]), .S(n713), .YN(N52)
         );
  inv_x1 U826 ( .A(time_us[2]), .Y(n723) );
  nor3_x1 U827 ( .A(n726), .B(n724), .C(n723), .Y(n730) );
  nand2_x1 U828 ( .A(n715), .B(time_us[2]), .Y(n717) );
  oai21_x1 U829 ( .A0(time_us[2]), .A1(n715), .B0(n717), .Y(n731) );
  inv_x1 U830 ( .A(n717), .Y(n716) );
  mxi2_x1 U831 ( .A0(n717), .A1(n716), .S(n718), .YN(n735) );
  nor3_x1 U832 ( .A(timestamp_clk_cycles[3]), .B(n731), .C(n735), .Y(n741) );
  aoi21_x1 U833 ( .A0(n724), .A1(time_us[2]), .B0(n722), .Y(n740) );
  aoi21_x1 U834 ( .A0(n726), .A1(n725), .B0(n730), .Y(n743) );
  aoi22_x1 U835 ( .A0(n727), .A1(n743), .B0(n730), .B1(n729), .Y(n728) );
  oai21_x1 U836 ( .A0(n730), .A1(n729), .B0(n728), .Y(time_us[1]) );
  inv_x1 U837 ( .A(time_us[1]), .Y(n739) );
  or2_x1 U838 ( .A(n741), .B(n739), .Y(n737) );
  aoi21_x1 U839 ( .A0(n739), .A1(timestamp_clk_cycles[2]), .B0(n731), .Y(n733)
         );
  oai21_x1 U840 ( .A0(timestamp_clk_cycles[2]), .A1(n739), .B0(
        timestamp_clk_cycles[3]), .Y(n732) );
  nand2_x1 U841 ( .A(n733), .B(n732), .Y(n734) );
  aoi22_x1 U842 ( .A0(n741), .A1(time_us[1]), .B0(n735), .B1(n734), .Y(n736)
         );
  aoi21_x1 U843 ( .A0(n740), .A1(n737), .B0(n736), .Y(n738) );
  nor3_x1 U844 ( .A(n741), .B(n740), .C(n739), .Y(n742) );
  mxi2_x1 U845 ( .A0(n744), .A1(n743), .S(n742), .YN(time_us[0]) );
endmodule


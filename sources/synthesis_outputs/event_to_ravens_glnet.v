/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Mon May  6 10:17:22 2024
/////////////////////////////////////////////////////////////


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
  and2_x1 U4 ( .A(N1), .B(dvs_event[56]), .Y(\intadd_0/CI ) );
  aoi2bb1_x1 U5 ( .A0N(N1), .A1N(dvs_event[56]), .B0(\intadd_0/CI ), .Y(
        ravens_spike[6]) );
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
  wire   net230, net232, net233, net236, n1;
  assign net230 = CLK;
  assign ENCLK = net232;
  assign net233 = EN;

  latchgd_x1 latch ( .G(n1), .D(net233), .Q(net236) );
  and2_x1 main_gate ( .A(net236), .B(net230), .Y(net232) );
  inv_x1 U2 ( .A(net230), .Y(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_2 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net230, net232, net233, net236, n2;
  assign net230 = CLK;
  assign ENCLK = net232;
  assign net233 = EN;

  latchgd_x1 latch ( .G(n2), .D(net233), .Q(net236) );
  and2_x1 main_gate ( .A(net236), .B(net230), .Y(net232) );
  inv_x1 U2 ( .A(net230), .Y(n2) );
endmodule


module SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net230, net232, net233, net236, n2;
  assign net230 = CLK;
  assign ENCLK = net232;
  assign net233 = EN;

  latchgd_x1 latch ( .G(n2), .D(net233), .Q(net236) );
  and2_x1 main_gate ( .A(net236), .B(net230), .Y(net232) );
  inv_x1 U2 ( .A(net230), .Y(n2) );
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
         N127, N128, N129, N361, N140, net242, net245, net246, net247, net248,
         net249, net250, net251, net252, net255, net260, n108, n109, n111,
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
        .CLK(clk), .EN(N73), .ENCLK(net242) );
  SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_2 clk_gate_ravens_pkt_reg ( 
        .CLK(clk), .EN(N140), .ENCLK(net255) );
  SNPS_CLOCK_GATE_HIGH_dvs_ravens_transmitter_1 clk_gate_time_us_start_looking_for_new_sim_time_reg ( 
        .CLK(clk), .EN(n108), .ENCLK(net260) );
  ffrhq_x1 \segment_last_timestamp_us_reg[0]  ( .D(N74), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[0]) );
  addf_x1 \intadd_1/U4  ( .A(ravens_spike_timestamp_us[1]), .B(\intadd_1/A[0] ), .CI(\intadd_1/CI ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[0] ) );
  addf_x1 \intadd_1/U3  ( .A(ravens_spike_timestamp_us[2]), .B(\intadd_1/A[1] ), .CI(\intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[1] ) );
  addf_x1 \intadd_1/U2  ( .A(\intadd_1/B[2] ), .B(ravens_spike_timestamp_us[3]), .CI(\intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\intadd_1/SUM[2] ) );
  ffrhq_x1 \segment_last_timestamp_us_reg[1]  ( .D(N75), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[1]) );
  ffr_x1 \segment_last_timestamp_us_reg[5]  ( .D(N79), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[5]) );
  ffr_x1 \segment_last_timestamp_us_reg[20]  ( .D(N94), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[20]) );
  ffr_x1 \segment_last_timestamp_us_reg[35]  ( .D(N109), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[35]) );
  ffr_x1 \ravens_pkt_reg[9]  ( .D(net248), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[9]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[34]  ( .D(time_us[34]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[34]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[19]  ( .D(time_us[19]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[19]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[4]  ( .D(time_us[4]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[4]) );
  ffr_x1 \segment_last_timestamp_us_reg[44]  ( .D(N118), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[44]) );
  ffr_x1 \segment_last_timestamp_us_reg[43]  ( .D(N117), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[43]) );
  ffr_x1 \segment_last_timestamp_us_reg[39]  ( .D(N113), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[39]) );
  ffr_x1 \segment_last_timestamp_us_reg[2]  ( .D(N76), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[2]) );
  ffr_x1 \segment_last_timestamp_us_reg[3]  ( .D(N77), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[3]) );
  ffr_x1 \segment_last_timestamp_us_reg[6]  ( .D(N80), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[6]) );
  ffr_x1 \segment_last_timestamp_us_reg[8]  ( .D(N82), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[8]) );
  ffr_x1 \segment_last_timestamp_us_reg[28]  ( .D(N102), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[28]) );
  ffr_x1 \segment_last_timestamp_us_reg[14]  ( .D(N88), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[14]) );
  ffr_x1 \segment_last_timestamp_us_reg[22]  ( .D(N96), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[22]) );
  ffr_x1 \segment_last_timestamp_us_reg[32]  ( .D(N106), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[32]) );
  ffr_x1 \segment_last_timestamp_us_reg[24]  ( .D(N98), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[24]) );
  ffr_x1 \segment_last_timestamp_us_reg[30]  ( .D(N104), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[30]) );
  ffr_x1 \segment_last_timestamp_us_reg[18]  ( .D(N92), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[18]) );
  ffr_x1 \segment_last_timestamp_us_reg[36]  ( .D(N110), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[36]) );
  ffr_x1 \segment_last_timestamp_us_reg[16]  ( .D(N90), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[16]) );
  ffr_x1 \segment_last_timestamp_us_reg[12]  ( .D(N86), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[12]) );
  ffr_x1 \segment_last_timestamp_us_reg[26]  ( .D(N100), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[26]) );
  ffr_x1 \segment_last_timestamp_us_reg[34]  ( .D(N108), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[34]) );
  ffr_x1 \segment_last_timestamp_us_reg[11]  ( .D(N85), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[11]) );
  ffr_x1 \segment_last_timestamp_us_reg[29]  ( .D(N103), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[29]) );
  ffr_x1 \segment_last_timestamp_us_reg[31]  ( .D(N105), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[31]) );
  ffr_x1 \segment_last_timestamp_us_reg[33]  ( .D(N107), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[33]) );
  ffr_x1 \segment_last_timestamp_us_reg[27]  ( .D(N101), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[27]) );
  ffr_x1 \segment_last_timestamp_us_reg[13]  ( .D(N87), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[13]) );
  ffr_x1 \segment_last_timestamp_us_reg[23]  ( .D(N97), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[23]) );
  ffr_x1 \segment_last_timestamp_us_reg[25]  ( .D(N99), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[25]) );
  ffr_x1 \segment_last_timestamp_us_reg[9]  ( .D(N83), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[9]) );
  ffr_x1 \segment_last_timestamp_us_reg[17]  ( .D(N91), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[17]) );
  ffr_x1 \segment_last_timestamp_us_reg[19]  ( .D(N93), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[19]) );
  ffr_x1 \segment_last_timestamp_us_reg[21]  ( .D(N95), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[21]) );
  ffr_x1 \segment_last_timestamp_us_reg[15]  ( .D(N89), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[15]) );
  ffr_x1 \segment_last_timestamp_us_reg[7]  ( .D(N81), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[7]) );
  ffr_x1 \segment_last_timestamp_us_reg[10]  ( .D(N84), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[10]) );
  ffr_x1 \cur_fsm_state_reg[1]  ( .D(\next_fsm_state[1] ), .CLK(clk), .RSTN(
        rst_n), .Q(cur_fsm_state[1]) );
  ffr_x1 \cur_fsm_state_reg[2]  ( .D(n111), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[2]) );
  ffr_x1 \cur_fsm_state_reg[0]  ( .D(n109), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[0]) );
  ffr_x1 \cur_sim_time_timestep_reg[2]  ( .D(N128), .CLK(net242), .RSTN(rst_n), 
        .Q(cur_sim_time_timestep[2]) );
  ffr_x1 \cur_sim_time_timestep_reg[3]  ( .D(N129), .CLK(net242), .RSTN(rst_n), 
        .Q(cur_sim_time_timestep[3]) );
  ffr_x1 \segment_last_timestamp_us_reg[4]  ( .D(N78), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[4]) );
  ffr_x1 \segment_last_timestamp_us_reg[37]  ( .D(N111), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[37]) );
  ffr_x1 \segment_last_timestamp_us_reg[38]  ( .D(N112), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[38]) );
  ffr_x1 \segment_last_timestamp_us_reg[40]  ( .D(N114), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[40]) );
  ffr_x1 \segment_last_timestamp_us_reg[41]  ( .D(N115), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[41]) );
  ffr_x1 \segment_last_timestamp_us_reg[42]  ( .D(N116), .CLK(net242), .RSTN(
        rst_n), .Q(segment_last_timestamp_us[42]) );
  ffr_x1 \ravens_pkt_reg[30]  ( .D(n1453), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[30]) );
  ffr_x1 \ravens_pkt_reg[29]  ( .D(n1454), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[29]) );
  ffr_x1 \ravens_pkt_reg[12]  ( .D(net245), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[12]) );
  ffr_x1 \ravens_pkt_reg[11]  ( .D(net246), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[11]) );
  ffr_x1 \ravens_pkt_reg[10]  ( .D(net247), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[10]) );
  ffr_x1 \ravens_pkt_reg[8]  ( .D(net249), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[8]) );
  ffr_x1 \ravens_pkt_reg[7]  ( .D(net250), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[7]) );
  ffr_x1 \ravens_pkt_reg[6]  ( .D(net251), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[6]) );
  ffr_x1 \ravens_pkt_reg[5]  ( .D(net252), .CLK(net255), .RSTN(rst_n), .Q(
        ravens_pkt[5]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[44]  ( .D(time_us[44]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[44]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[43]  ( .D(time_us[43]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[43]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[42]  ( .D(time_us[42]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[42]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[41]  ( .D(time_us[41]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[41]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[40]  ( .D(time_us[40]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[40]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[38]  ( .D(time_us[38]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[38]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[37]  ( .D(time_us[37]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[37]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[36]  ( .D(time_us[36]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[36]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[35]  ( .D(time_us[35]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[35]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[33]  ( .D(time_us[33]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[33]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[32]  ( .D(time_us[32]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[32]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[31]  ( .D(time_us[31]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[31]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[30]  ( .D(time_us[30]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[30]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[29]  ( .D(time_us[29]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[29]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[28]  ( .D(time_us[28]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[28]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[27]  ( .D(time_us[27]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[27]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[26]  ( .D(time_us[26]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[26]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[25]  ( .D(time_us[25]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[25]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[24]  ( .D(time_us[24]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[24]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[23]  ( .D(time_us[23]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[23]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[22]  ( .D(time_us[22]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[22]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[21]  ( .D(time_us[21]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[21]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[20]  ( .D(time_us[20]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[20]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[18]  ( .D(time_us[18]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[18]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[17]  ( .D(time_us[17]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[17]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[16]  ( .D(time_us[16]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[16]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[15]  ( .D(time_us[15]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[15]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[14]  ( .D(time_us[14]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[14]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[13]  ( .D(time_us[13]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[13]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[12]  ( .D(time_us[12]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[12]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[11]  ( .D(time_us[11]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[11]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[10]  ( .D(time_us[10]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[10]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[9]  ( .D(time_us[9]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[9]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[7]  ( .D(time_us[7]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[7]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[6]  ( .D(time_us[6]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[6]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[5]  ( .D(time_us[5]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[5]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[3]  ( .D(time_us[3]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[3]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[2]  ( .D(time_us[2]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[2]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[1]  ( .D(time_us[1]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[1]) );
  ffr_x1 \time_us_start_looking_for_new_sim_time_reg[0]  ( .D(time_us[0]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[0]) );
  ffrhq_x1 \cur_sim_time_timestep_reg[0]  ( .D(N126), .CLK(net242), .RSTN(
        rst_n), .Q(cur_sim_time_timestep[0]) );
  ffrhq_x1 \cur_sim_time_timestep_reg[1]  ( .D(N127), .CLK(net242), .RSTN(
        rst_n), .Q(cur_sim_time_timestep[1]) );
  ffrhq_x1 \time_us_start_looking_for_new_sim_time_reg[8]  ( .D(time_us[8]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[8]) );
  ffrhq_x1 \time_us_start_looking_for_new_sim_time_reg[39]  ( .D(time_us[39]), 
        .CLK(net260), .RSTN(rst_n), .Q(
        time_us_start_looking_for_new_sim_time[39]) );
  oai21_x1 U3 ( .A0(n1258), .A1(n1271), .B0(n1257), .Y(n1259) );
  oai21_x1 U4 ( .A0(n667), .A1(n666), .B0(n665), .Y(n735) );
  oai21_x1 U5 ( .A0(n599), .A1(n598), .B0(n597), .Y(n630) );
  inv_x1 U6 ( .A(n426), .Y(n703) );
  inv_x1 U7 ( .A(n410), .Y(n684) );
  inv_x1 U8 ( .A(n647), .Y(n811) );
  inv_x1 U9 ( .A(n504), .Y(n802) );
  nand2_x1 U10 ( .A(n729), .B(n728), .Y(n730) );
  nor2_x1 U11 ( .A(cur_sim_time_timestep[2]), .B(n851), .Y(n857) );
  nor2_x1 U12 ( .A(segment_last_timestamp_us[6]), .B(n1273), .Y(n1307) );
  nand2_x1 U13 ( .A(segment_last_timestamp_us[4]), .B(n1259), .Y(n1276) );
  nand2_x1 U14 ( .A(segment_last_timestamp_us[6]), .B(n1273), .Y(n1306) );
  nand2_x1 U15 ( .A(segment_last_timestamp_us[3]), .B(n1256), .Y(n1251) );
  inv_x1 U16 ( .A(n1281), .Y(n1286) );
  inv_x1 U17 ( .A(n1316), .Y(n1443) );
  and2_x1 U18 ( .A(cur_fsm_state[0]), .B(N73), .Y(n1454) );
  nor2b_x2 U19 ( .AN(n1218), .B(cur_sim_time_timestep[0]), .Y(n1228) );
  aoi21_x1 U20 ( .A0(n630), .A1(n50), .B0(n49), .Y(n667) );
  nor2_x2 U21 ( .A(n729), .B(n728), .Y(n731) );
  inv_x1 U22 ( .A(n786), .Y(n642) );
  inv_x1 U23 ( .A(n790), .Y(n610) );
  nor2_x2 U24 ( .A(segment_last_timestamp_us[4]), .B(n1259), .Y(n1275) );
  nor2_x2 U25 ( .A(segment_last_timestamp_us[5]), .B(n1265), .Y(n1278) );
  nand4_x2 U26 ( .A(cur_sim_time_timestep[3]), .B(cur_fsm_state[0]), .C(
        cur_sim_time_timestep[2]), .D(n1217), .Y(n1219) );
  oai21_x1 U27 ( .A0(n976), .A1(n975), .B0(n974), .Y(n1218) );
  nand2_x2 U28 ( .A(n847), .B(n852), .Y(n853) );
  nand2_x1 U29 ( .A(n766), .B(n664), .Y(n665) );
  nor2_x1 U30 ( .A(n766), .B(n664), .Y(n666) );
  addf_x1 U31 ( .A(n670), .B(n669), .CI(n668), .CO(n727), .S(n664) );
  addf_x1 U32 ( .A(n696), .B(n836), .CI(n695), .CO(n698), .S(n669) );
  addf_x1 U33 ( .A(n661), .B(n825), .CI(n660), .CO(n695), .S(n663) );
  addf_x1 U34 ( .A(n626), .B(n828), .CI(n625), .CO(n660), .S(n628) );
  addf_x1 U35 ( .A(n591), .B(n763), .CI(n590), .CO(n625), .S(n593) );
  addf_x1 U36 ( .A(n417), .B(n508), .CI(n416), .CO(n434), .S(n419) );
  addf_x1 U37 ( .A(n398), .B(n489), .CI(n397), .CO(n416), .S(n400) );
  addf_x1 U38 ( .A(n469), .B(n379), .CI(n378), .CO(n397), .S(n381) );
  addf_x1 U39 ( .A(n449), .B(n362), .CI(n361), .CO(n378), .S(n364) );
  addf_x1 U40 ( .A(n345), .B(n344), .CI(n811), .CO(n361), .S(n347) );
  addf_x1 U41 ( .A(n320), .B(n804), .CI(n319), .CO(n345), .S(n330) );
  addf_x1 U42 ( .A(n642), .B(n257), .CI(n256), .CO(n272), .S(n259) );
  addf_x1 U43 ( .A(ravens_spike_timestamp_us[15]), .B(n101), .CI(n100), .CO(
        n133), .S(n463) );
  addf_x1 U44 ( .A(n103), .B(n642), .CI(n102), .CO(n611), .S(n124) );
  addf_x1 U45 ( .A(n141), .B(n90), .CI(n89), .CO(n608), .S(n103) );
  addf_x1 U46 ( .A(ravens_spike_timestamp_us[12]), .B(n88), .CI(n87), .CO(n110), .S(n410) );
  addf_x1 U47 ( .A(n144), .B(n93), .CI(n610), .CO(n89), .S(n107) );
  inv_x1 U48 ( .A(n750), .Y(n141) );
  inv_x1 U49 ( .A(n782), .Y(n144) );
  inv_x1 U50 ( .A(n785), .Y(n147) );
  inv_x1 U51 ( .A(n784), .Y(n152) );
  addf_x1 U52 ( .A(ravens_spike_timestamp_us[5]), .B(n73), .CI(n72), .CO(n96), 
        .S(n784) );
  addf_x1 U53 ( .A(ravens_spike_timestamp_us[4]), .B(n78), .CI(n77), .CO(n72), 
        .S(n752) );
  addf_x1 U54 ( .A(ravens_spike_timestamp_us[3]), .B(n82), .CI(n81), .CO(n77), 
        .S(n700) );
  addf_x1 U55 ( .A(ravens_spike_timestamp_us[2]), .B(n75), .CI(n74), .CO(n81), 
        .S(n679) );
  addf_x1 U56 ( .A(ravens_spike_timestamp_us[1]), .B(n80), .CI(n79), .CO(n74), 
        .S(n636) );
  inv_x1 U57 ( .A(segment_last_timestamp_us[1]), .Y(n80) );
  nand2b_x2 U58 ( .AN(cur_fsm_state[0]), .B(N73), .Y(n66) );
  nor2_x2 U59 ( .A(n1278), .B(n1275), .Y(n1287) );
  nor2_x2 U60 ( .A(n1256), .B(n1272), .Y(n1265) );
  nor2_x2 U61 ( .A(n1272), .B(n1271), .Y(n1273) );
  nand2_x2 U62 ( .A(segment_last_timestamp_us[0]), .B(n1256), .Y(n1240) );
  nand2_x1 U63 ( .A(n980), .B(n978), .Y(n1217) );
  aoi2bb1_x2 U64 ( .A0N(n972), .A1N(n980), .B0(n978), .Y(n1258) );
  oai21_x1 U65 ( .A0(n971), .A1(n975), .B0(n974), .Y(n978) );
  oai22_x2 U66 ( .A0(n858), .A1(n857), .B0(n856), .B1(n855), .Y(n975) );
  aoi21_x1 U67 ( .A0(cur_sim_time_timestep[2]), .A1(n851), .B0(
        cur_sim_time_timestep[3]), .Y(n856) );
  aoi21_x1 U68 ( .A0(n854), .A1(n850), .B0(n849), .Y(n851) );
  inv_x1 U69 ( .A(n852), .Y(n971) );
  nand2b_x2 U70 ( .AN(n973), .B(cur_sim_time_timestep[0]), .Y(n847) );
  aoi21_x1 U71 ( .A0(n65), .A1(n774), .B0(n773), .Y(n845) );
  inv_x2 U72 ( .A(n736), .Y(n774) );
  nand2_x2 U73 ( .A(n772), .B(n65), .Y(n771) );
  or2_x2 U74 ( .A(n770), .B(n769), .Y(n65) );
  nand2_x2 U75 ( .A(n770), .B(n769), .Y(n772) );
  nand2_x2 U76 ( .A(n843), .B(n51), .Y(n844) );
  and2_x1 U77 ( .A(n697), .B(n629), .Y(n49) );
  or2_x1 U78 ( .A(n697), .B(n629), .Y(n50) );
  addf_x1 U79 ( .A(n837), .B(n663), .CI(n662), .CO(n668), .S(n629) );
  addf_x1 U80 ( .A(n724), .B(n593), .CI(n592), .CO(n627), .S(n575) );
  addf_x1 U81 ( .A(n739), .B(n738), .CI(n737), .CO(n777), .S(n768) );
  addf_x1 U82 ( .A(n624), .B(n534), .CI(n533), .CO(n552), .S(n515) );
  addf_x1 U83 ( .A(n589), .B(n514), .CI(n513), .CO(n533), .S(n496) );
  addf_x1 U84 ( .A(n570), .B(n495), .CI(n494), .CO(n513), .S(n476) );
  addf_x1 U85 ( .A(n693), .B(n763), .CI(n692), .CO(n722), .S(n696) );
  addf_x1 U86 ( .A(n549), .B(n475), .CI(n474), .CO(n494), .S(n456) );
  addf_x1 U87 ( .A(n658), .B(n717), .CI(n657), .CO(n692), .S(n661) );
  addf_x1 U88 ( .A(n623), .B(n691), .CI(n622), .CO(n657), .S(n626) );
  addf_x1 U89 ( .A(n530), .B(n455), .CI(n454), .CO(n474), .S(n438) );
  addf_x1 U90 ( .A(n572), .B(n717), .CI(n571), .CO(n590), .S(n574) );
  addf_x1 U91 ( .A(n819), .B(n437), .CI(n436), .CO(n454), .S(n420) );
  addf_x1 U92 ( .A(n551), .B(n691), .CI(n550), .CO(n571), .S(n553) );
  addf_x1 U93 ( .A(n588), .B(n656), .CI(n587), .CO(n622), .S(n591) );
  addf_x1 U94 ( .A(n532), .B(n656), .CI(n531), .CO(n550), .S(n534) );
  addf_x1 U95 ( .A(n824), .B(n419), .CI(n418), .CO(n436), .S(n401) );
  addf_x1 U96 ( .A(n569), .B(n621), .CI(n568), .CO(n587), .S(n572) );
  addf_x1 U97 ( .A(n548), .B(n586), .CI(n547), .CO(n568), .S(n551) );
  addf_x1 U98 ( .A(n760), .B(n400), .CI(n399), .CO(n418), .S(n382) );
  addf_x1 U99 ( .A(n512), .B(n621), .CI(n511), .CO(n531), .S(n514) );
  addf_x1 U100 ( .A(n493), .B(n586), .CI(n492), .CO(n511), .S(n495) );
  addf_x1 U101 ( .A(n529), .B(n567), .CI(n528), .CO(n547), .S(n532) );
  addf_x1 U102 ( .A(n815), .B(n381), .CI(n380), .CO(n399), .S(n365) );
  addf_x1 U103 ( .A(n817), .B(n364), .CI(n363), .CO(n380), .S(n348) );
  addf_x1 U104 ( .A(n510), .B(n546), .CI(n509), .CO(n528), .S(n512) );
  addf_x1 U105 ( .A(n473), .B(n567), .CI(n472), .CO(n492), .S(n475) );
  addf_x1 U106 ( .A(n453), .B(n546), .CI(n452), .CO(n472), .S(n455) );
  addf_x1 U107 ( .A(n491), .B(n527), .CI(n490), .CO(n509), .S(n493) );
  addf_x1 U108 ( .A(n810), .B(n347), .CI(n346), .CO(n363), .S(n331) );
  addf_x1 U109 ( .A(n471), .B(n508), .CI(n470), .CO(n490), .S(n473) );
  addf_x1 U110 ( .A(n435), .B(n527), .CI(n434), .CO(n452), .S(n437) );
  addf_x1 U111 ( .A(n778), .B(n330), .CI(n329), .CO(n346), .S(n313) );
  addf_x1 U112 ( .A(n451), .B(n489), .CI(n450), .CO(n470), .S(n453) );
  addf_x1 U113 ( .A(n433), .B(n469), .CI(n432), .CO(n450), .S(n435) );
  addf_x1 U114 ( .A(n677), .B(n279), .CI(n278), .CO(n293), .S(n264) );
  addf_x1 U115 ( .A(n277), .B(n802), .CI(n276), .CO(n291), .S(n279) );
  addf_x1 U116 ( .A(n684), .B(n273), .CI(n272), .CO(n287), .S(n275) );
  inv_x1 U117 ( .A(n443), .Y(n756) );
  addf_x1 U118 ( .A(n694), .B(n574), .CI(n573), .CO(n592), .S(n554) );
  addf_x1 U119 ( .A(ravens_spike_timestamp_us[36]), .B(n481), .CI(n480), .CO(
        n499), .S(n624) );
  inv_x1 U120 ( .A(n694), .Y(n831) );
  inv_x1 U121 ( .A(n463), .Y(n795) );
  addf_x1 U122 ( .A(n751), .B(n750), .CI(n749), .CO(n797), .S(n757) );
  addf_x1 U123 ( .A(n659), .B(n553), .CI(n552), .CO(n573), .S(n535) );
  inv_x1 U124 ( .A(n483), .Y(n792) );
  inv_x1 U125 ( .A(n521), .Y(n798) );
  addf_x1 U126 ( .A(n785), .B(n784), .CI(n783), .CO(n787), .S(n791) );
  addf_x1 U127 ( .A(n791), .B(n790), .CI(n789), .CO(n793), .S(n796) );
  addf_x1 U128 ( .A(n797), .B(n796), .CI(n795), .CO(n799), .S(n803) );
  addf_x1 U129 ( .A(ravens_spike_timestamp_us[35]), .B(n870), .CI(n461), .CO(
        n480), .S(n589) );
  addf_x1 U130 ( .A(n762), .B(n761), .CI(n760), .CO(n822), .S(n742) );
  addf_x1 U131 ( .A(n818), .B(n817), .CI(n816), .CO(n820), .S(n823) );
  inv_x1 U132 ( .A(n589), .Y(n828) );
  addf_x1 U133 ( .A(n742), .B(n741), .CI(n740), .CO(n830), .S(n764) );
  addf_x1 U134 ( .A(n821), .B(n820), .CI(n819), .S(n827) );
  addf_x1 U135 ( .A(n815), .B(n814), .CI(n813), .S(n821) );
  addf_x1 U136 ( .A(n812), .B(n811), .CI(n810), .S(n813) );
  addf_x1 U137 ( .A(n809), .B(n808), .CI(n807), .S(n812) );
  inv_x1 U138 ( .A(n624), .Y(n825) );
  addf_x1 U139 ( .A(n824), .B(n823), .CI(n822), .CO(n826), .S(n829) );
  addf_x1 U140 ( .A(ravens_spike_timestamp_us[38]), .B(n519), .CI(n518), .CO(
        n537), .S(n694) );
  inv_x1 U141 ( .A(n659), .Y(n836) );
  addf_x1 U142 ( .A(n764), .B(n763), .CI(n825), .CO(n834), .S(n739) );
  addf_x1 U143 ( .A(n830), .B(n829), .CI(n828), .CO(n832), .S(n835) );
  addf_x1 U144 ( .A(n765), .B(n628), .CI(n627), .CO(n662), .S(n596) );
  addf_x1 U145 ( .A(n768), .B(n767), .CI(n766), .CO(n769), .S(n728) );
  inv_x1 U146 ( .A(n724), .Y(n767) );
  aoi21_x1 U147 ( .A0(n735), .A1(n734), .B0(n733), .Y(n736) );
  oai21_x2 U148 ( .A0(n732), .A1(n731), .B0(n730), .Y(n733) );
  nor2_x2 U149 ( .A(n725), .B(n731), .Y(n734) );
  oai22_x1 U150 ( .A0(n848), .A1(n852), .B0(n853), .B1(
        cur_sim_time_timestep[1]), .Y(n849) );
  nand2_x1 U151 ( .A(cur_sim_time_timestep[1]), .B(n847), .Y(n848) );
  inv_x1 U152 ( .A(n1265), .Y(n1257) );
  inv_x1 U153 ( .A(n975), .Y(n972) );
  nand2_x1 U154 ( .A(segment_last_timestamp_us[5]), .B(n1265), .Y(n1277) );
  nor2_x2 U155 ( .A(n977), .B(n1218), .Y(n1256) );
  and2_x2 U156 ( .A(cur_sim_time_timestep[0]), .B(n975), .Y(n977) );
  inv_x1 U157 ( .A(n1258), .Y(n1272) );
  nand2_x1 U158 ( .A(cur_sim_time_timestep[0]), .B(n1256), .Y(n1225) );
  addf_x1 U159 ( .A(n253), .B(n636), .CI(n700), .CO(n269), .S(n255) );
  addf_x1 U160 ( .A(n784), .B(n700), .CI(n284), .CO(n302), .S(n286) );
  addf_x1 U161 ( .A(n781), .B(n255), .CI(n254), .CO(n270), .S(n257) );
  addf_x1 U162 ( .A(n752), .B(n679), .CI(n269), .CO(n284), .S(n271) );
  xnor2_x1 U163 ( .A(n784), .B(n168), .Y(n322) );
  nand2_x1 U164 ( .A(n605), .B(n679), .Y(n156) );
  addf_x1 U165 ( .A(n781), .B(n752), .CI(n302), .CO(n321), .S(n304) );
  addf_x1 U166 ( .A(n782), .B(n286), .CI(n285), .CO(n303), .S(n288) );
  addf_x1 U167 ( .A(n610), .B(n244), .CI(n608), .CO(n256), .S(n245) );
  addf_x1 U168 ( .A(n785), .B(n271), .CI(n270), .CO(n285), .S(n273) );
  addf_x1 U169 ( .A(n785), .B(n322), .CI(n321), .CO(n336), .S(n324) );
  addf_x1 U170 ( .A(n172), .B(n171), .CI(n781), .CO(n174), .S(n337) );
  or2_x1 U171 ( .A(n168), .B(n784), .Y(n172) );
  inv_x1 U172 ( .A(n636), .Y(n171) );
  inv_x1 U173 ( .A(n605), .Y(n168) );
  inv_x1 U174 ( .A(n679), .Y(n175) );
  addf_x1 U175 ( .A(n156), .B(n171), .CI(n155), .CO(n121), .S(n149) );
  addf_x1 U176 ( .A(n152), .B(n607), .CI(n151), .CO(n148), .S(n188) );
  addf_x1 U177 ( .A(n750), .B(n304), .CI(n303), .CO(n323), .S(n306) );
  addf_x1 U178 ( .A(n703), .B(n288), .CI(n287), .CO(n305), .S(n290) );
  addf_x1 U179 ( .A(n245), .B(n684), .CI(n611), .CO(n258), .S(n246) );
  addf_x1 U180 ( .A(n324), .B(n790), .CI(n323), .CO(n338), .S(n326) );
  addf_x1 U181 ( .A(n337), .B(n782), .CI(n336), .CO(n353), .S(n339) );
  addf_x1 U182 ( .A(n785), .B(n175), .CI(n174), .CO(n370), .S(n354) );
  addf_x1 U183 ( .A(n154), .B(n171), .CI(n153), .CO(n151), .S(n182) );
  or2_x1 U184 ( .A(n168), .B(n155), .Y(n154) );
  addf_x1 U185 ( .A(n782), .B(n176), .CI(n790), .CO(n181), .S(n371) );
  xnor2_x1 U186 ( .A(n155), .B(n168), .Y(n176) );
  inv_x1 U187 ( .A(n700), .Y(n155) );
  addf_x1 U188 ( .A(n153), .B(n175), .CI(n121), .CO(n120), .S(n146) );
  inv_x1 U189 ( .A(n752), .Y(n153) );
  addf_x1 U190 ( .A(n150), .B(n149), .CI(n148), .CO(n145), .S(n194) );
  addf_x1 U191 ( .A(n790), .B(n188), .CI(n187), .CO(n193), .S(n411) );
  addf_x1 U192 ( .A(n354), .B(n750), .CI(n353), .CO(n369), .S(n356) );
  addf_x1 U193 ( .A(n756), .B(n306), .CI(n305), .CO(n325), .S(n308) );
  addf_x1 U194 ( .A(n246), .B(n795), .CI(n613), .CO(n260), .S(n242) );
  addf_x1 U195 ( .A(n792), .B(n261), .CI(n260), .CO(n276), .S(n262) );
  addf_x1 U196 ( .A(n795), .B(n326), .CI(n325), .CO(n340), .S(n328) );
  addf_x1 U197 ( .A(n786), .B(n339), .CI(n338), .CO(n355), .S(n341) );
  addf_x1 U198 ( .A(n371), .B(n370), .CI(n369), .CO(n389), .S(n373) );
  addf_x1 U199 ( .A(n750), .B(n182), .CI(n181), .CO(n187), .S(n390) );
  addf_x1 U200 ( .A(n152), .B(n155), .CI(n120), .CO(n119), .S(n143) );
  addf_x1 U201 ( .A(n147), .B(n146), .CI(n145), .CO(n142), .S(n200) );
  addf_x1 U202 ( .A(n150), .B(n153), .CI(n119), .CO(n117), .S(n140) );
  addf_x1 U203 ( .A(n786), .B(n194), .CI(n193), .CO(n199), .S(n427) );
  addf_x1 U204 ( .A(n411), .B(n410), .CI(n409), .CO(n425), .S(n413) );
  addf_x1 U205 ( .A(n356), .B(n410), .CI(n355), .CO(n372), .S(n358) );
  addf_x1 U206 ( .A(n292), .B(n798), .CI(n291), .CO(n309), .S(n294) );
  addf_x1 U207 ( .A(n604), .B(n242), .CI(n602), .CO(n263), .S(n238) );
  addf_x1 U208 ( .A(n263), .B(n262), .CI(n647), .CO(n278), .S(n247) );
  addf_x1 U209 ( .A(n792), .B(n341), .CI(n340), .CO(n357), .S(n343) );
  addf_x1 U210 ( .A(n426), .B(n373), .CI(n372), .CO(n391), .S(n375) );
  addf_x1 U211 ( .A(n390), .B(n786), .CI(n389), .CO(n409), .S(n392) );
  addf_x1 U212 ( .A(n144), .B(n143), .CI(n142), .CO(n139), .S(n205) );
  addf_x1 U213 ( .A(n410), .B(n200), .CI(n199), .CO(n204), .S(n444) );
  addf_x1 U214 ( .A(n141), .B(n140), .CI(n139), .CO(n137), .S(n209) );
  inv_x1 U215 ( .A(n781), .Y(n150) );
  addf_x1 U216 ( .A(n147), .B(n118), .CI(n117), .CO(n115), .S(n138) );
  addf_x1 U217 ( .A(n427), .B(n426), .CI(n425), .CO(n442), .S(n429) );
  addf_x1 U218 ( .A(n413), .B(n463), .CI(n412), .CO(n428), .S(n408) );
  addf_x1 U219 ( .A(n802), .B(n358), .CI(n357), .CO(n374), .S(n360) );
  addf_x1 U220 ( .A(n310), .B(n744), .CI(n309), .CO(n319), .S(n312) );
  addf_x1 U221 ( .A(n710), .B(n294), .CI(n293), .CO(n311), .S(n280) );
  addf_x1 U222 ( .A(n798), .B(n375), .CI(n374), .CO(n393), .S(n377) );
  addf_x1 U223 ( .A(n443), .B(n392), .CI(n391), .CO(n412), .S(n394) );
  addf_x1 U224 ( .A(n444), .B(n443), .CI(n442), .CO(n462), .S(n446) );
  addf_x1 U225 ( .A(n426), .B(n205), .CI(n204), .CO(n208), .S(n464) );
  addf_x1 U226 ( .A(n138), .B(n610), .CI(n137), .CO(n135), .S(n212) );
  addf_x1 U227 ( .A(n443), .B(n209), .CI(n208), .CO(n211), .S(n484) );
  addf_x1 U228 ( .A(n150), .B(n636), .CI(n99), .CO(n98), .S(n116) );
  addf_x1 U229 ( .A(n116), .B(n144), .CI(n115), .CO(n113), .S(n136) );
  addf_x1 U230 ( .A(n642), .B(n136), .CI(n135), .CO(n131), .S(n218) );
  addf_x1 U231 ( .A(n483), .B(n429), .CI(n428), .CO(n445), .S(n430) );
  addf_x1 U232 ( .A(n804), .B(n408), .CI(n407), .CO(n431), .S(n415) );
  addf_x1 U233 ( .A(n758), .B(n312), .CI(n311), .CO(n329), .S(n295) );
  addf_x1 U234 ( .A(n744), .B(n394), .CI(n393), .CO(n407), .S(n396) );
  inv_x1 U235 ( .A(n677), .Y(n449) );
  addf_x1 U236 ( .A(n446), .B(n504), .CI(n445), .CO(n465), .S(n448) );
  addf_x1 U237 ( .A(n464), .B(n463), .CI(n462), .CO(n482), .S(n466) );
  addf_x1 U238 ( .A(n484), .B(n483), .CI(n482), .CO(n503), .S(n486) );
  addf_x1 U239 ( .A(n463), .B(n212), .CI(n211), .CO(n217), .S(n505) );
  addf_x1 U240 ( .A(n147), .B(n679), .CI(n98), .CO(n106), .S(n114) );
  addf_x1 U241 ( .A(n114), .B(n141), .CI(n113), .CO(n105), .S(n132) );
  addf_x1 U242 ( .A(n132), .B(n684), .CI(n131), .CO(n127), .S(n224) );
  addf_x1 U243 ( .A(n483), .B(n218), .CI(n217), .CO(n223), .S(n522) );
  addf_x1 U244 ( .A(n431), .B(n430), .CI(n811), .CO(n447), .S(n433) );
  addf_x1 U245 ( .A(n415), .B(n449), .CI(n414), .CO(n432), .S(n417) );
  addf_x1 U246 ( .A(n811), .B(n396), .CI(n395), .CO(n414), .S(n398) );
  inv_x1 U247 ( .A(n710), .Y(n469) );
  addf_x1 U248 ( .A(n449), .B(n448), .CI(n447), .CO(n467), .S(n451) );
  addf_x1 U249 ( .A(n466), .B(n521), .CI(n465), .CO(n485), .S(n468) );
  inv_x1 U250 ( .A(n758), .Y(n489) );
  addf_x1 U251 ( .A(n486), .B(n540), .CI(n485), .CO(n501), .S(n488) );
  addf_x1 U252 ( .A(n505), .B(n504), .CI(n503), .CO(n520), .S(n502) );
  addf_x1 U253 ( .A(n107), .B(n106), .CI(n105), .CO(n102), .S(n128) );
  xnor2_x1 U254 ( .A(n679), .B(n605), .Y(n607) );
  addf_x1 U255 ( .A(n504), .B(n224), .CI(n223), .CO(n228), .S(n541) );
  addf_x1 U256 ( .A(n128), .B(n703), .CI(n127), .CO(n123), .S(n229) );
  addf_x1 U257 ( .A(n522), .B(n521), .CI(n520), .CO(n539), .S(n523) );
  addf_x1 U258 ( .A(n469), .B(n468), .CI(n467), .CO(n487), .S(n471) );
  inv_x1 U259 ( .A(n778), .Y(n508) );
  addf_x1 U260 ( .A(n489), .B(n488), .CI(n487), .CO(n506), .S(n491) );
  addf_x1 U261 ( .A(n502), .B(n604), .CI(n501), .CO(n524), .S(n507) );
  addf_x1 U262 ( .A(n541), .B(n540), .CI(n539), .CO(n561), .S(n543) );
  addf_x1 U263 ( .A(n521), .B(n229), .CI(n228), .CO(n231), .S(n562) );
  addf_x1 U264 ( .A(n124), .B(n756), .CI(n123), .CO(n613), .S(n232) );
  inv_x1 U265 ( .A(n810), .Y(n527) );
  addf_x1 U266 ( .A(n524), .B(n523), .CI(n647), .CO(n542), .S(n526) );
  addf_x1 U267 ( .A(n508), .B(n507), .CI(n506), .CO(n525), .S(n510) );
  inv_x1 U268 ( .A(n817), .Y(n546) );
  addf_x1 U269 ( .A(n677), .B(n543), .CI(n542), .CO(n563), .S(n545) );
  addf_x1 U270 ( .A(n562), .B(n604), .CI(n561), .CO(n580), .S(n564) );
  addf_x1 U271 ( .A(n610), .B(n609), .CI(n608), .CO(n640), .S(n612) );
  addf_x1 U272 ( .A(n612), .B(n684), .CI(n611), .CO(n643), .S(n614) );
  addf_x1 U273 ( .A(n637), .B(n636), .CI(n700), .CO(n678), .S(n639) );
  or2_x1 U274 ( .A(n605), .B(n679), .Y(n637) );
  addf_x1 U275 ( .A(n540), .B(n232), .CI(n231), .CO(n602), .S(n581) );
  addf_x1 U276 ( .A(n614), .B(n795), .CI(n613), .CO(n645), .S(n603) );
  addf_x1 U277 ( .A(n527), .B(n526), .CI(n525), .CO(n544), .S(n529) );
  inv_x1 U278 ( .A(n815), .Y(n567) );
  addf_x1 U279 ( .A(n546), .B(n545), .CI(n544), .CO(n565), .S(n548) );
  addf_x1 U280 ( .A(n710), .B(n564), .CI(n563), .CO(n582), .S(n566) );
  addf_x1 U281 ( .A(n647), .B(n581), .CI(n580), .CO(n615), .S(n583) );
  addf_x1 U282 ( .A(n642), .B(n641), .CI(n640), .CO(n682), .S(n644) );
  addf_x1 U283 ( .A(n752), .B(n679), .CI(n678), .CO(n701), .S(n681) );
  addf_x1 U284 ( .A(ravens_spike_timestamp_us[13]), .B(n112), .CI(n110), .CO(
        n104), .S(n426) );
  addf_x1 U285 ( .A(n785), .B(n681), .CI(n680), .CO(n704), .S(n683) );
  addf_x1 U286 ( .A(n792), .B(n646), .CI(n645), .CO(n687), .S(n648) );
  inv_x1 U287 ( .A(n760), .Y(n586) );
  addf_x1 U288 ( .A(n567), .B(n566), .CI(n565), .CO(n584), .S(n569) );
  addf_x1 U289 ( .A(n583), .B(n758), .CI(n582), .CO(n617), .S(n585) );
  addf_x1 U290 ( .A(n616), .B(n677), .CI(n615), .CO(n650), .S(n618) );
  addf_x1 U291 ( .A(n684), .B(n683), .CI(n682), .CO(n706), .S(n686) );
  addf_x1 U292 ( .A(n686), .B(n756), .CI(n685), .CO(n708), .S(n688) );
  addf_x1 U293 ( .A(n702), .B(n701), .CI(n782), .CO(n753), .S(n705) );
  addf_x1 U294 ( .A(ravens_spike_timestamp_us[14]), .B(n1323), .CI(n104), .CO(
        n100), .S(n443) );
  addf_x1 U295 ( .A(n705), .B(n704), .CI(n703), .CO(n749), .S(n707) );
  addf_x1 U296 ( .A(ravens_spike_timestamp_us[19]), .B(n929), .CI(n122), .CO(
        n68), .S(n540) );
  addf_x1 U297 ( .A(ravens_spike_timestamp_us[22]), .B(n241), .CI(n240), .CO(
        n251), .S(n677) );
  addf_x1 U298 ( .A(n649), .B(n648), .CI(n647), .CO(n675), .S(n651) );
  addf_x1 U299 ( .A(n688), .B(n802), .CI(n687), .CO(n711), .S(n676) );
  addf_x1 U300 ( .A(ravens_spike_timestamp_us[23]), .B(n252), .CI(n251), .CO(
        n267), .S(n710) );
  addf_x1 U301 ( .A(n651), .B(n710), .CI(n650), .CO(n673), .S(n653) );
  inv_x1 U302 ( .A(n824), .Y(n621) );
  addf_x1 U303 ( .A(n586), .B(n585), .CI(n584), .CO(n619), .S(n588) );
  addf_x1 U304 ( .A(ravens_spike_timestamp_us[20]), .B(n69), .CI(n68), .CO(
        n233), .S(n604) );
  addf_x1 U305 ( .A(n707), .B(n706), .CI(n795), .CO(n747), .S(n709) );
  addf_x1 U306 ( .A(ravens_spike_timestamp_us[16]), .B(n134), .CI(n133), .CO(
        n129), .S(n483) );
  addf_x1 U307 ( .A(ravens_spike_timestamp_us[18]), .B(n126), .CI(n125), .CO(
        n122), .S(n521) );
  addf_x1 U308 ( .A(n755), .B(n754), .CI(n753), .CO(n789), .S(n751) );
  addf_x1 U309 ( .A(ravens_spike_timestamp_us[17]), .B(n130), .CI(n129), .CO(
        n125), .S(n504) );
  inv_x1 U310 ( .A(n540), .Y(n744) );
  addf_x1 U311 ( .A(n677), .B(n676), .CI(n675), .CO(n714), .S(n674) );
  addf_x1 U312 ( .A(n712), .B(n711), .CI(n710), .CO(n743), .S(n713) );
  addf_x1 U313 ( .A(ravens_spike_timestamp_us[24]), .B(n268), .CI(n267), .CO(
        n282), .S(n758) );
  nand2b_x1 U314 ( .AN(segment_last_timestamp_us[13]), .B(
        ravens_spike_timestamp_us[13]), .Y(n915) );
  addf_x1 U315 ( .A(ravens_spike_timestamp_us[32]), .B(n406), .CI(n405), .CO(
        n423), .S(n530) );
  inv_x1 U316 ( .A(n819), .Y(n656) );
  addf_x1 U317 ( .A(n653), .B(n810), .CI(n652), .CO(n671), .S(n655) );
  addf_x1 U318 ( .A(ravens_spike_timestamp_us[33]), .B(n424), .CI(n423), .CO(
        n440), .S(n549) );
  addf_x1 U319 ( .A(n674), .B(n758), .CI(n673), .CO(n716), .S(n672) );
  addf_x1 U320 ( .A(n621), .B(n620), .CI(n619), .CO(n654), .S(n623) );
  inv_x1 U321 ( .A(n604), .Y(n804) );
  addf_x1 U322 ( .A(n748), .B(n747), .CI(n746), .CO(n806), .S(n745) );
  addf_x1 U323 ( .A(n757), .B(n756), .CI(n792), .CO(n801), .S(n748) );
  addf_x1 U324 ( .A(ravens_spike_timestamp_us[25]), .B(n283), .CI(n282), .CO(
        n300), .S(n778) );
  addf_x1 U325 ( .A(n745), .B(n744), .CI(n743), .CO(n780), .S(n759) );
  addf_x1 U326 ( .A(ravens_spike_timestamp_us[29]), .B(n352), .CI(n351), .CO(
        n367), .S(n760) );
  addf_x1 U327 ( .A(n714), .B(n713), .CI(n778), .CO(n761), .S(n715) );
  addf_x1 U328 ( .A(n759), .B(n758), .CI(n810), .CO(n816), .S(n762) );
  inv_x1 U329 ( .A(n530), .Y(n691) );
  addf_x1 U330 ( .A(n656), .B(n655), .CI(n654), .CO(n689), .S(n658) );
  inv_x1 U331 ( .A(n549), .Y(n717) );
  addf_x1 U332 ( .A(n672), .B(n817), .CI(n671), .CO(n719), .S(n690) );
  addf_x1 U333 ( .A(ravens_spike_timestamp_us[34]), .B(n441), .CI(n440), .CO(
        n461), .S(n570) );
  addf_x1 U334 ( .A(n716), .B(n715), .CI(n815), .CO(n741), .S(n718) );
  addf_x1 U335 ( .A(ravens_spike_timestamp_us[26]), .B(n301), .CI(n300), .CO(
        n317), .S(n810) );
  addf_x1 U336 ( .A(ravens_spike_timestamp_us[28]), .B(n335), .CI(n334), .CO(
        n351), .S(n815) );
  addf_x1 U337 ( .A(ravens_spike_timestamp_us[31]), .B(n388), .CI(n387), .CO(
        n405), .S(n819) );
  addf_x1 U338 ( .A(n806), .B(n805), .CI(n804), .CO(n807), .S(n779) );
  addf_x1 U339 ( .A(n800), .B(n799), .CI(n798), .S(n809) );
  addf_x1 U340 ( .A(n803), .B(n802), .CI(n801), .CO(n808), .S(n805) );
  addf_x1 U341 ( .A(n780), .B(n779), .CI(n778), .CO(n814), .S(n818) );
  addf_x1 U342 ( .A(ravens_spike_timestamp_us[30]), .B(n368), .CI(n367), .CO(
        n387), .S(n824) );
  addf_x1 U343 ( .A(n691), .B(n690), .CI(n689), .CO(n720), .S(n693) );
  addf_x1 U344 ( .A(n719), .B(n718), .CI(n717), .CO(n740), .S(n721) );
  addf_x1 U345 ( .A(ravens_spike_timestamp_us[37]), .B(n500), .CI(n499), .CO(
        n518), .S(n659) );
  inv_x1 U346 ( .A(n570), .Y(n763) );
  addf_x1 U347 ( .A(n721), .B(n720), .CI(n828), .CO(n738), .S(n723) );
  addf_x1 U348 ( .A(n723), .B(n722), .CI(n831), .CO(n737), .S(n699) );
  nand2_x1 U349 ( .A(n837), .B(n575), .Y(n576) );
  nor2_x1 U350 ( .A(n837), .B(n575), .Y(n577) );
  addf_x1 U351 ( .A(n840), .B(n839), .CI(n838), .S(n841) );
  inv_x1 U352 ( .A(n837), .Y(n838) );
  addf_x1 U353 ( .A(n833), .B(n832), .CI(n831), .S(n840) );
  addf_x1 U354 ( .A(ravens_spike_timestamp_us[40]), .B(n560), .CI(n559), .CO(
        n594), .S(n765) );
  addf_x1 U355 ( .A(n836), .B(n835), .CI(n834), .CO(n839), .S(n776) );
  addf_x1 U356 ( .A(n699), .B(n698), .CI(n697), .CO(n729), .S(n726) );
  inv_x1 U357 ( .A(n579), .Y(n599) );
  nand2_x1 U358 ( .A(n596), .B(n670), .Y(n597) );
  nor2_x1 U359 ( .A(n596), .B(n670), .Y(n598) );
  inv_x1 U360 ( .A(n772), .Y(n773) );
  nand2_x1 U361 ( .A(n842), .B(n841), .Y(n843) );
  addf_x1 U362 ( .A(n777), .B(n776), .CI(n775), .CO(n842), .S(n770) );
  inv_x1 U363 ( .A(n765), .Y(n775) );
  nor2_x1 U364 ( .A(n727), .B(n726), .Y(n725) );
  nand2_x1 U365 ( .A(n727), .B(n726), .Y(n732) );
  nor2_x1 U366 ( .A(n84), .B(n1423), .Y(n1372) );
  nand2_x1 U367 ( .A(segment_last_timestamp_us[14]), .B(n1321), .Y(n1439) );
  nand2_x1 U368 ( .A(segment_last_timestamp_us[20]), .B(n1367), .Y(n1435) );
  nand2_x1 U369 ( .A(segment_last_timestamp_us[18]), .B(n1347), .Y(n1431) );
  nand2_x1 U370 ( .A(segment_last_timestamp_us[16]), .B(n1357), .Y(n1427) );
  nand2_x1 U371 ( .A(segment_last_timestamp_us[24]), .B(n1337), .Y(n1419) );
  nand2_x1 U372 ( .A(segment_last_timestamp_us[22]), .B(n1327), .Y(n1415) );
  nand2_x1 U373 ( .A(segment_last_timestamp_us[26]), .B(n1377), .Y(n1407) );
  nand2_x1 U374 ( .A(segment_last_timestamp_us[32]), .B(n1332), .Y(n1399) );
  nand2_x1 U375 ( .A(segment_last_timestamp_us[30]), .B(n1342), .Y(n1395) );
  nand2_x1 U376 ( .A(segment_last_timestamp_us[10]), .B(n1372), .Y(n1387) );
  nor2_x1 U377 ( .A(n424), .B(n1399), .Y(n1382) );
  nor2_x1 U378 ( .A(n283), .B(n1419), .Y(n1377) );
  nor2_x1 U379 ( .A(n92), .B(n1387), .Y(n1362) );
  nor2_x1 U380 ( .A(n101), .B(n1439), .Y(n1357) );
  nor2_x1 U381 ( .A(n870), .B(n1403), .Y(n1352) );
  nor2_x1 U382 ( .A(n130), .B(n1427), .Y(n1347) );
  nor2_x1 U383 ( .A(n352), .B(n1391), .Y(n1342) );
  nor2_x1 U384 ( .A(n252), .B(n1415), .Y(n1337) );
  nor2_x1 U385 ( .A(n388), .B(n1395), .Y(n1332) );
  nor2_x1 U386 ( .A(n112), .B(n1411), .Y(n1321) );
  nor2_x1 U387 ( .A(n318), .B(n1407), .Y(n1315) );
  nand2_x1 U388 ( .A(segment_last_timestamp_us[34]), .B(n1382), .Y(n1403) );
  nor2_x1 U389 ( .A(n929), .B(n1431), .Y(n1367) );
  nor2_x1 U390 ( .A(segment_last_timestamp_us[1]), .B(n1258), .Y(n1242) );
  mxi2_x1 U391 ( .A0(n1283), .A1(n1282), .S(n1281), .YN(n1293) );
  nand2b_x1 U392 ( .AN(n1216), .B(cur_fsm_state[0]), .Y(n1232) );
  nor2_x1 U393 ( .A(n1258), .B(n1256), .Y(n1223) );
  nor2b_x1 U394 ( .AN(cur_fsm_state[1]), .B(cur_fsm_state[2]), .Y(N73) );
  oai2bb2_x1 U395 ( .B0(n1452), .B1(n66), .A0N(n1454), .A1N(n1451), .Y(N118)
         );
  nand2_x1 U396 ( .A(n1276), .B(n1263), .Y(n1260) );
  or2_x1 U397 ( .A(segment_last_timestamp_us[0]), .B(n1256), .Y(n1233) );
  nor2_x1 U398 ( .A(n1227), .B(n984), .Y(N128) );
  nor2_x1 U399 ( .A(n1227), .B(n982), .Y(N127) );
  or2_x1 U400 ( .A(n604), .B(n562), .Y(n25) );
  and2_x1 U401 ( .A(n604), .B(n562), .Y(n26) );
  or2_x1 U402 ( .A(n677), .B(n238), .Y(n27) );
  and2_x1 U403 ( .A(n677), .B(n238), .Y(n28) );
  or2_x1 U404 ( .A(n758), .B(n264), .Y(n29) );
  and2_x1 U405 ( .A(n758), .B(n264), .Y(n30) );
  or2_x1 U406 ( .A(n778), .B(n280), .Y(n31) );
  and2_x1 U407 ( .A(n778), .B(n280), .Y(n32) );
  or2_x1 U408 ( .A(n815), .B(n331), .Y(n33) );
  and2_x1 U409 ( .A(n815), .B(n331), .Y(n34) );
  and2_x1 U410 ( .A(n760), .B(n348), .Y(n35) );
  or2_x1 U411 ( .A(n760), .B(n348), .Y(n36) );
  and2_x1 U412 ( .A(n824), .B(n365), .Y(n37) );
  or2_x1 U413 ( .A(n824), .B(n365), .Y(n38) );
  and2_x1 U414 ( .A(n549), .B(n420), .Y(n39) );
  or2_x1 U415 ( .A(n549), .B(n420), .Y(n40) );
  and2_x1 U416 ( .A(n570), .B(n438), .Y(n41) );
  or2_x1 U417 ( .A(n570), .B(n438), .Y(n42) );
  and2_x1 U418 ( .A(n659), .B(n496), .Y(n43) );
  or2_x1 U419 ( .A(n659), .B(n496), .Y(n44) );
  and2_x1 U420 ( .A(n694), .B(n515), .Y(n45) );
  or2_x1 U421 ( .A(n694), .B(n515), .Y(n46) );
  and2_x1 U422 ( .A(n724), .B(n535), .Y(n47) );
  or2_x1 U423 ( .A(n724), .B(n535), .Y(n48) );
  or2_x1 U424 ( .A(n842), .B(n841), .Y(n51) );
  and2_x1 U425 ( .A(n157), .B(n156), .Y(n52) );
  or2_x1 U426 ( .A(n752), .B(n781), .Y(n53) );
  and2_x1 U427 ( .A(n752), .B(n781), .Y(n54) );
  or2_x1 U428 ( .A(n322), .B(n785), .Y(n55) );
  and2_x1 U429 ( .A(n322), .B(n785), .Y(n56) );
  or2_x1 U430 ( .A(n750), .B(n354), .Y(n57) );
  and2_x1 U431 ( .A(n750), .B(n354), .Y(n58) );
  or2_x1 U432 ( .A(n782), .B(n337), .Y(n59) );
  and2_x1 U433 ( .A(n782), .B(n337), .Y(n60) );
  or2_x1 U434 ( .A(n463), .B(n464), .Y(n61) );
  and2_x1 U435 ( .A(n463), .B(n464), .Y(n62) );
  or2_x1 U436 ( .A(n483), .B(n484), .Y(n63) );
  and2_x1 U437 ( .A(n483), .B(n484), .Y(n64) );
  nand2_x1 U438 ( .A(n636), .B(n700), .Y(n157) );
  nand2_x1 U439 ( .A(n679), .B(n752), .Y(n158) );
  oai21_x1 U440 ( .A0(n52), .A1(n159), .B0(n158), .Y(n160) );
  nand2_x1 U441 ( .A(n370), .B(n371), .Y(n177) );
  oai21_x1 U442 ( .A0(n179), .A1(n178), .B0(n177), .Y(n180) );
  nand2_x1 U443 ( .A(n786), .B(n390), .Y(n183) );
  oai21_x1 U444 ( .A0(n185), .A1(n184), .B0(n183), .Y(n186) );
  nand2_x1 U445 ( .A(n410), .B(n411), .Y(n189) );
  oai21_x1 U446 ( .A0(n191), .A1(n190), .B0(n189), .Y(n192) );
  nand2_x1 U447 ( .A(n426), .B(n427), .Y(n195) );
  oai21_x1 U448 ( .A0(n197), .A1(n196), .B0(n195), .Y(n198) );
  nand2_x1 U449 ( .A(n504), .B(n505), .Y(n213) );
  oai21_x1 U450 ( .A0(n215), .A1(n214), .B0(n213), .Y(n216) );
  nand2_x1 U451 ( .A(n521), .B(n522), .Y(n219) );
  oai21_x1 U452 ( .A0(n221), .A1(n220), .B0(n219), .Y(n222) );
  nand2_x1 U453 ( .A(n810), .B(n295), .Y(n296) );
  oai21_x1 U454 ( .A0(n298), .A1(n297), .B0(n296), .Y(n299) );
  addf_x1 U455 ( .A(n784), .B(n243), .CI(n606), .CO(n254), .S(n244) );
  addf_x1 U456 ( .A(n259), .B(n703), .CI(n258), .CO(n274), .S(n261) );
  addf_x1 U457 ( .A(n275), .B(n756), .CI(n274), .CO(n289), .S(n277) );
  addf_x1 U458 ( .A(n290), .B(n795), .CI(n289), .CO(n307), .S(n292) );
  addf_x1 U459 ( .A(n308), .B(n792), .CI(n307), .CO(n327), .S(n310) );
  addf_x1 U460 ( .A(n328), .B(n802), .CI(n327), .CO(n342), .S(n320) );
  addf_x1 U461 ( .A(n343), .B(n798), .CI(n342), .CO(n359), .S(n344) );
  addf_x1 U462 ( .A(n360), .B(n744), .CI(n359), .CO(n376), .S(n362) );
  addf_x1 U463 ( .A(n377), .B(n804), .CI(n376), .CO(n395), .S(n379) );
  nor2_x1 U464 ( .A(ravens_spike_timestamp_us[1]), .B(n80), .Y(n903) );
  aoi2bb1_x1 U465 ( .A0N(n907), .A1N(n906), .B0(n905), .Y(n910) );
  addf_x1 U466 ( .A(n752), .B(n636), .CI(n85), .CO(n606), .S(n90) );
  nand2_x1 U467 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(n1311), 
        .Y(n997) );
  nand2_x1 U468 ( .A(segment_last_timestamp_us[8]), .B(n1311), .Y(n891) );
  addf_x1 U469 ( .A(n784), .B(n607), .CI(n606), .CO(n638), .S(n609) );
  addf_x1 U470 ( .A(n788), .B(n787), .CI(n786), .S(n794) );
  addf_x1 U471 ( .A(n781), .B(n639), .CI(n638), .CO(n680), .S(n641) );
  addf_x1 U472 ( .A(n794), .B(n793), .CI(n792), .S(n800) );
  nor2_x1 U473 ( .A(segment_last_timestamp_us[12]), .B(n1366), .Y(n901) );
  nand2_x1 U474 ( .A(ravens_spike_timestamp_us[9]), .B(n1193), .Y(n994) );
  addf_x1 U475 ( .A(n644), .B(n703), .CI(n643), .CO(n685), .S(n646) );
  nor2_x1 U476 ( .A(segment_last_timestamp_us[17]), .B(n1430), .Y(n928) );
  addf_x1 U477 ( .A(n604), .B(n603), .CI(n602), .CO(n649), .S(n616) );
  nor2_x1 U478 ( .A(n1107), .B(n1080), .Y(n1004) );
  addf_x1 U479 ( .A(n709), .B(n708), .CI(n798), .CO(n746), .S(n712) );
  nand2_x1 U480 ( .A(time_us_start_looking_for_new_sim_time[17]), .B(n1430), 
        .Y(n1014) );
  addf_x1 U481 ( .A(n618), .B(n778), .CI(n617), .CO(n652), .S(n620) );
  and2_x1 U482 ( .A(time_us_start_looking_for_new_sim_time[18]), .B(n1351), 
        .Y(n1016) );
  addf_x1 U483 ( .A(ravens_spike_timestamp_us[27]), .B(n318), .CI(n317), .CO(
        n334), .S(n817) );
  addf_x1 U484 ( .A(n827), .B(n826), .CI(n825), .S(n833) );
  nor2_x1 U485 ( .A(n1106), .B(n1124), .Y(n986) );
  nor2_x1 U486 ( .A(n948), .B(n946), .Y(n951) );
  nand2_x1 U487 ( .A(time_us_start_looking_for_new_sim_time[10]), .B(n1376), 
        .Y(n1192) );
  nand2_x1 U488 ( .A(time_us_start_looking_for_new_sim_time[37]), .B(n1285), 
        .Y(n1111) );
  nor2_x1 U489 ( .A(time_us_start_looking_for_new_sim_time[36]), .B(n1356), 
        .Y(n991) );
  addf_x1 U490 ( .A(ravens_spike_timestamp_us[39]), .B(n538), .CI(n537), .CO(
        n559), .S(n724) );
  nand2_x1 U491 ( .A(n1194), .B(n1193), .Y(n1195) );
  nand2_x1 U492 ( .A(time_us_start_looking_for_new_sim_time[13]), .B(n1414), 
        .Y(n1156) );
  nor2_x1 U493 ( .A(time_us_start_looking_for_new_sim_time[32]), .B(n1336), 
        .Y(n1144) );
  nand2_x1 U494 ( .A(time_us_start_looking_for_new_sim_time[25]), .B(n1422), 
        .Y(n1101) );
  nand2_x1 U495 ( .A(time_us_start_looking_for_new_sim_time[16]), .B(n1361), 
        .Y(n1062) );
  nor2_x1 U496 ( .A(time_us_start_looking_for_new_sim_time[41]), .B(n1304), 
        .Y(n1148) );
  nand2_x1 U497 ( .A(segment_last_timestamp_us[38]), .B(n1295), .Y(n865) );
  nand2_x1 U498 ( .A(n1152), .B(n1151), .Y(n1108) );
  nand2_x1 U499 ( .A(segment_last_timestamp_us[36]), .B(n1352), .Y(n1274) );
  xnor2_x1 U500 ( .A(n973), .B(n846), .Y(n852) );
  nor2_x1 U501 ( .A(n234), .B(n1435), .Y(n1327) );
  nor2_x1 U502 ( .A(segment_last_timestamp_us[3]), .B(n1256), .Y(n1252) );
  nand2_x1 U503 ( .A(segment_last_timestamp_us[1]), .B(n1258), .Y(n1241) );
  mxi2_x1 U504 ( .A0(n1280), .A1(n1279), .S(n1287), .YN(n1283) );
  nand2_x1 U505 ( .A(segment_last_timestamp_us[28]), .B(n1315), .Y(n1391) );
  nand2_x1 U506 ( .A(segment_last_timestamp_us[12]), .B(n1362), .Y(n1411) );
  nor2_x1 U507 ( .A(n904), .B(n1245), .Y(n1248) );
  addh_x1 U508 ( .A(n1293), .B(segment_last_timestamp_us[37]), .CO(n1296), .S(
        n1284) );
  and2_x1 U509 ( .A(n1240), .B(n1233), .Y(n1234) );
  nand2_x1 U510 ( .A(new_spike), .B(n1223), .Y(n1229) );
  nor2_x1 U511 ( .A(n1227), .B(n981), .Y(N129) );
  inv_x1 U512 ( .A(n66), .Y(n1453) );
  nor2_x1 U513 ( .A(cur_fsm_state[0]), .B(cur_fsm_state[1]), .Y(n1214) );
  and2_x1 U514 ( .A(cur_fsm_state[2]), .B(n1214), .Y(sent_spike) );
  and2_x1 U515 ( .A(sent_spike), .B(ravens_spike[6]), .Y(net251) );
  and2_x1 U516 ( .A(sent_spike), .B(ravens_spike[5]), .Y(net252) );
  and2_x1 U517 ( .A(sent_spike), .B(ravens_spike[7]), .Y(net250) );
  and2_x1 U518 ( .A(sent_spike), .B(ravens_spike[8]), .Y(net249) );
  and2_x1 U519 ( .A(sent_spike), .B(ravens_spike[9]), .Y(net248) );
  and2_x1 U520 ( .A(sent_spike), .B(ravens_spike[10]), .Y(net247) );
  and2_x1 U521 ( .A(sent_spike), .B(ravens_spike[11]), .Y(net246) );
  and2_x1 U522 ( .A(sent_spike), .B(ravens_spike[12]), .Y(net245) );
  inv_x1 U523 ( .A(N73), .Y(n67) );
  nand2_x1 U524 ( .A(cur_fsm_state[2]), .B(n1214), .Y(n1230) );
  nand2_x1 U525 ( .A(n67), .B(n1230), .Y(N140) );
  inv_x1 U526 ( .A(n1454), .Y(n1227) );
  inv_x1 U527 ( .A(cur_sim_time_timestep[1]), .Y(n980) );
  inv_x1 U528 ( .A(cur_sim_time_timestep[3]), .Y(n858) );
  inv_x1 U529 ( .A(segment_last_timestamp_us[22]), .Y(n241) );
  inv_x1 U530 ( .A(segment_last_timestamp_us[21]), .Y(n234) );
  inv_x1 U531 ( .A(segment_last_timestamp_us[20]), .Y(n69) );
  inv_x1 U532 ( .A(segment_last_timestamp_us[18]), .Y(n126) );
  inv_x1 U533 ( .A(segment_last_timestamp_us[17]), .Y(n130) );
  inv_x1 U534 ( .A(segment_last_timestamp_us[16]), .Y(n134) );
  inv_x1 U535 ( .A(segment_last_timestamp_us[15]), .Y(n101) );
  inv_x1 U536 ( .A(segment_last_timestamp_us[13]), .Y(n112) );
  inv_x1 U537 ( .A(segment_last_timestamp_us[12]), .Y(n88) );
  inv_x1 U538 ( .A(segment_last_timestamp_us[11]), .Y(n92) );
  inv_x1 U539 ( .A(segment_last_timestamp_us[10]), .Y(n71) );
  inv_x1 U540 ( .A(segment_last_timestamp_us[9]), .Y(n84) );
  inv_x1 U541 ( .A(segment_last_timestamp_us[7]), .Y(n95) );
  inv_x1 U542 ( .A(segment_last_timestamp_us[6]), .Y(n97) );
  inv_x1 U543 ( .A(segment_last_timestamp_us[5]), .Y(n73) );
  inv_x1 U544 ( .A(segment_last_timestamp_us[4]), .Y(n78) );
  inv_x1 U545 ( .A(segment_last_timestamp_us[3]), .Y(n82) );
  inv_x1 U546 ( .A(segment_last_timestamp_us[2]), .Y(n75) );
  inv_x1 U547 ( .A(segment_last_timestamp_us[0]), .Y(n76) );
  addf_x2 U548 ( .A(ravens_spike_timestamp_us[10]), .B(n71), .CI(n70), .CO(n91), .S(n790) );
  addh_x1 U549 ( .A(n76), .B(ravens_spike_timestamp_us[0]), .CO(n79), .S(n605)
         );
  addf_x2 U550 ( .A(ravens_spike_timestamp_us[9]), .B(n84), .CI(n83), .CO(n70), 
        .S(n750) );
  addf_x2 U551 ( .A(ravens_spike_timestamp_us[8]), .B(n1308), .CI(n86), .CO(
        n83), .S(n782) );
  addh_x1 U552 ( .A(n700), .B(n605), .CO(n85), .S(n93) );
  addf_x2 U553 ( .A(ravens_spike_timestamp_us[11]), .B(n92), .CI(n91), .CO(n87), .S(n786) );
  addf_x2 U554 ( .A(ravens_spike_timestamp_us[7]), .B(n95), .CI(n94), .CO(n86), 
        .S(n785) );
  addf_x2 U555 ( .A(ravens_spike_timestamp_us[6]), .B(n97), .CI(n96), .CO(n94), 
        .S(n781) );
  addh_x1 U556 ( .A(n152), .B(n605), .CO(n99), .S(n118) );
  nor2_x1 U557 ( .A(n679), .B(n752), .Y(n159) );
  inv_x1 U558 ( .A(n160), .Y(n163) );
  nor2_x1 U559 ( .A(n700), .B(n784), .Y(n162) );
  nand2_x1 U560 ( .A(n700), .B(n784), .Y(n161) );
  oai21_x1 U561 ( .A0(n163), .A1(n162), .B0(n161), .Y(n164) );
  aoi21_x1 U562 ( .A0(n164), .A1(n53), .B0(n54), .Y(n165) );
  inv_x1 U563 ( .A(n165), .Y(n166) );
  aoi21_x1 U564 ( .A0(n166), .A1(n55), .B0(n56), .Y(n167) );
  inv_x1 U565 ( .A(n167), .Y(n169) );
  aoi21_x1 U566 ( .A0(n169), .A1(n59), .B0(n60), .Y(n170) );
  inv_x1 U567 ( .A(n170), .Y(n173) );
  aoi21_x1 U568 ( .A0(n173), .A1(n57), .B0(n58), .Y(n179) );
  nor2_x1 U569 ( .A(n370), .B(n371), .Y(n178) );
  inv_x1 U570 ( .A(n180), .Y(n185) );
  nor2_x1 U571 ( .A(n786), .B(n390), .Y(n184) );
  inv_x1 U572 ( .A(n186), .Y(n191) );
  nor2_x1 U573 ( .A(n410), .B(n411), .Y(n190) );
  inv_x1 U574 ( .A(n192), .Y(n197) );
  nor2_x1 U575 ( .A(n426), .B(n427), .Y(n196) );
  inv_x1 U576 ( .A(n198), .Y(n203) );
  nor2_x1 U577 ( .A(n443), .B(n444), .Y(n202) );
  nand2_x1 U578 ( .A(n443), .B(n444), .Y(n201) );
  oai21_x1 U579 ( .A0(n203), .A1(n202), .B0(n201), .Y(n206) );
  aoi21_x1 U580 ( .A0(n206), .A1(n61), .B0(n62), .Y(n207) );
  inv_x1 U581 ( .A(n207), .Y(n210) );
  aoi21_x1 U582 ( .A0(n210), .A1(n63), .B0(n64), .Y(n215) );
  nor2_x1 U583 ( .A(n504), .B(n505), .Y(n214) );
  inv_x1 U584 ( .A(n216), .Y(n221) );
  nor2_x1 U585 ( .A(n521), .B(n522), .Y(n220) );
  inv_x1 U586 ( .A(n222), .Y(n227) );
  nor2_x1 U587 ( .A(n540), .B(n541), .Y(n226) );
  nand2_x1 U588 ( .A(n540), .B(n541), .Y(n225) );
  oai21_x1 U589 ( .A0(n227), .A1(n226), .B0(n225), .Y(n230) );
  aoi21_x1 U590 ( .A0(n230), .A1(n25), .B0(n26), .Y(n237) );
  addf_x1 U591 ( .A(ravens_spike_timestamp_us[21]), .B(n234), .CI(n233), .CO(
        n240), .S(n647) );
  nor2_x1 U592 ( .A(n581), .B(n647), .Y(n236) );
  nand2_x1 U593 ( .A(n581), .B(n647), .Y(n235) );
  oai21_x1 U594 ( .A0(n237), .A1(n236), .B0(n235), .Y(n239) );
  aoi21_x1 U595 ( .A0(n27), .A1(n239), .B0(n28), .Y(n250) );
  inv_x1 U596 ( .A(segment_last_timestamp_us[23]), .Y(n252) );
  addh_x1 U597 ( .A(n679), .B(n605), .CO(n253), .S(n243) );
  nor2_x1 U598 ( .A(n710), .B(n247), .Y(n249) );
  nand2_x1 U599 ( .A(n710), .B(n247), .Y(n248) );
  oai21_x1 U600 ( .A0(n250), .A1(n249), .B0(n248), .Y(n265) );
  inv_x1 U601 ( .A(segment_last_timestamp_us[24]), .Y(n268) );
  aoi21_x1 U602 ( .A0(n265), .A1(n29), .B0(n30), .Y(n266) );
  inv_x1 U603 ( .A(n266), .Y(n281) );
  inv_x1 U604 ( .A(segment_last_timestamp_us[25]), .Y(n283) );
  aoi21_x1 U605 ( .A0(n281), .A1(n31), .B0(n32), .Y(n298) );
  inv_x1 U606 ( .A(segment_last_timestamp_us[26]), .Y(n301) );
  nor2_x1 U607 ( .A(n810), .B(n295), .Y(n297) );
  inv_x1 U608 ( .A(n299), .Y(n316) );
  inv_x1 U609 ( .A(segment_last_timestamp_us[27]), .Y(n318) );
  nor2_x1 U610 ( .A(n817), .B(n313), .Y(n315) );
  nand2_x1 U611 ( .A(n817), .B(n313), .Y(n314) );
  oai21_x1 U612 ( .A0(n316), .A1(n315), .B0(n314), .Y(n332) );
  inv_x1 U613 ( .A(segment_last_timestamp_us[28]), .Y(n335) );
  aoi21_x1 U614 ( .A0(n332), .A1(n33), .B0(n34), .Y(n333) );
  inv_x1 U615 ( .A(n333), .Y(n349) );
  inv_x1 U616 ( .A(segment_last_timestamp_us[29]), .Y(n352) );
  aoi21_x1 U617 ( .A0(n349), .A1(n36), .B0(n35), .Y(n350) );
  inv_x1 U618 ( .A(n350), .Y(n366) );
  inv_x1 U619 ( .A(segment_last_timestamp_us[30]), .Y(n368) );
  aoi21_x1 U620 ( .A0(n366), .A1(n38), .B0(n37), .Y(n385) );
  inv_x1 U621 ( .A(segment_last_timestamp_us[31]), .Y(n388) );
  nor2_x1 U622 ( .A(n819), .B(n382), .Y(n384) );
  nand2_x1 U623 ( .A(n819), .B(n382), .Y(n383) );
  oai21_x1 U624 ( .A0(n385), .A1(n384), .B0(n383), .Y(n386) );
  inv_x1 U625 ( .A(n386), .Y(n404) );
  inv_x1 U626 ( .A(segment_last_timestamp_us[32]), .Y(n406) );
  nor2_x1 U627 ( .A(n530), .B(n401), .Y(n403) );
  nand2_x1 U628 ( .A(n530), .B(n401), .Y(n402) );
  oai21_x1 U629 ( .A0(n404), .A1(n403), .B0(n402), .Y(n421) );
  inv_x1 U630 ( .A(segment_last_timestamp_us[33]), .Y(n424) );
  aoi21_x1 U631 ( .A0(n421), .A1(n40), .B0(n39), .Y(n422) );
  inv_x1 U632 ( .A(n422), .Y(n439) );
  inv_x1 U633 ( .A(segment_last_timestamp_us[34]), .Y(n441) );
  aoi21_x1 U634 ( .A0(n439), .A1(n42), .B0(n41), .Y(n459) );
  nor2_x1 U635 ( .A(n589), .B(n456), .Y(n458) );
  nand2_x1 U636 ( .A(n589), .B(n456), .Y(n457) );
  oai21_x1 U637 ( .A0(n459), .A1(n458), .B0(n457), .Y(n460) );
  inv_x1 U638 ( .A(n460), .Y(n479) );
  inv_x1 U639 ( .A(segment_last_timestamp_us[36]), .Y(n481) );
  nor2_x1 U640 ( .A(n624), .B(n476), .Y(n478) );
  nand2_x1 U641 ( .A(n624), .B(n476), .Y(n477) );
  oai21_x1 U642 ( .A0(n479), .A1(n478), .B0(n477), .Y(n497) );
  inv_x1 U643 ( .A(segment_last_timestamp_us[37]), .Y(n500) );
  aoi21_x1 U644 ( .A0(n497), .A1(n44), .B0(n43), .Y(n498) );
  inv_x1 U645 ( .A(n498), .Y(n516) );
  inv_x1 U646 ( .A(segment_last_timestamp_us[38]), .Y(n519) );
  aoi21_x1 U647 ( .A0(n516), .A1(n46), .B0(n45), .Y(n517) );
  inv_x1 U648 ( .A(n517), .Y(n536) );
  inv_x1 U649 ( .A(segment_last_timestamp_us[39]), .Y(n538) );
  aoi21_x1 U650 ( .A0(n536), .A1(n48), .B0(n47), .Y(n557) );
  inv_x1 U651 ( .A(segment_last_timestamp_us[40]), .Y(n560) );
  nor2_x1 U652 ( .A(n765), .B(n554), .Y(n556) );
  nand2_x1 U653 ( .A(n765), .B(n554), .Y(n555) );
  oai21_x1 U654 ( .A0(n557), .A1(n556), .B0(n555), .Y(n558) );
  inv_x1 U655 ( .A(n558), .Y(n578) );
  inv_x1 U656 ( .A(segment_last_timestamp_us[41]), .Y(n595) );
  oai21_x1 U657 ( .A0(n578), .A1(n577), .B0(n576), .Y(n579) );
  inv_x1 U658 ( .A(segment_last_timestamp_us[42]), .Y(n601) );
  addf_x1 U659 ( .A(ravens_spike_timestamp_us[41]), .B(n595), .CI(n594), .CO(
        n600), .S(n837) );
  inv_x1 U660 ( .A(segment_last_timestamp_us[43]), .Y(n633) );
  addf_x1 U661 ( .A(ravens_spike_timestamp_us[42]), .B(n601), .CI(n600), .CO(
        n632), .S(n670) );
  inv_x1 U662 ( .A(segment_last_timestamp_us[44]), .Y(n631) );
  xor2_x1 U663 ( .A(ravens_spike_timestamp_us[44]), .B(n631), .Y(n635) );
  addf_x1 U664 ( .A(ravens_spike_timestamp_us[43]), .B(n633), .CI(n632), .CO(
        n634), .S(n697) );
  xor2_x1 U665 ( .A(n635), .B(n634), .Y(n766) );
  addh_x1 U666 ( .A(n784), .B(n700), .CO(n754), .S(n702) );
  addh_x1 U667 ( .A(n781), .B(n752), .CO(n783), .S(n755) );
  xnor2_x1 U668 ( .A(n774), .B(n771), .Y(n973) );
  inv_x1 U669 ( .A(n847), .Y(n854) );
  addh_x1 U670 ( .A(n782), .B(n781), .S(n788) );
  xor2_x1 U671 ( .A(n845), .B(n844), .Y(n846) );
  xnor2_x1 U672 ( .A(n852), .B(cur_sim_time_timestep[1]), .Y(n850) );
  aoi22_x1 U673 ( .A0(n971), .A1(n854), .B0(n853), .B1(
        cur_sim_time_timestep[1]), .Y(n855) );
  nand2b_x1 U674 ( .AN(segment_last_timestamp_us[44]), .B(
        ravens_spike_timestamp_us[44]), .Y(n970) );
  oai22_x1 U675 ( .A0(ravens_spike_timestamp_us[44]), .A1(n631), .B0(
        ravens_spike_timestamp_us[43]), .B1(n633), .Y(n864) );
  inv_x1 U676 ( .A(ravens_spike_timestamp_us[41]), .Y(n1304) );
  inv_x1 U677 ( .A(ravens_spike_timestamp_us[42]), .Y(n1314) );
  aoi22_x1 U678 ( .A0(segment_last_timestamp_us[41]), .A1(n1304), .B0(
        segment_last_timestamp_us[42]), .B1(n1314), .Y(n862) );
  nand2b_x1 U679 ( .AN(segment_last_timestamp_us[41]), .B(
        ravens_spike_timestamp_us[41]), .Y(n880) );
  nand3b_x1 U680 ( .AN(ravens_spike_timestamp_us[40]), .B(
        segment_last_timestamp_us[40]), .C(n880), .Y(n861) );
  nand2b_x1 U681 ( .AN(segment_last_timestamp_us[42]), .B(
        ravens_spike_timestamp_us[42]), .Y(n860) );
  nand2b_x1 U682 ( .AN(segment_last_timestamp_us[43]), .B(
        ravens_spike_timestamp_us[43]), .Y(n859) );
  nand2_x1 U683 ( .A(n860), .B(n859), .Y(n882) );
  aoi21_x1 U684 ( .A0(n862), .A1(n861), .B0(n882), .Y(n863) );
  nor2_x1 U685 ( .A(n864), .B(n863), .Y(n886) );
  inv_x1 U686 ( .A(ravens_spike_timestamp_us[39]), .Y(n1298) );
  nor2_x1 U687 ( .A(segment_last_timestamp_us[39]), .B(n1298), .Y(n874) );
  inv_x1 U688 ( .A(ravens_spike_timestamp_us[38]), .Y(n1295) );
  oai22_x1 U689 ( .A0(ravens_spike_timestamp_us[39]), .A1(n538), .B0(n874), 
        .B1(n865), .Y(n884) );
  oai22_x1 U690 ( .A0(ravens_spike_timestamp_us[32]), .A1(n406), .B0(
        ravens_spike_timestamp_us[33]), .B1(n424), .Y(n873) );
  nand2b_x1 U691 ( .AN(segment_last_timestamp_us[33]), .B(
        ravens_spike_timestamp_us[33]), .Y(n867) );
  nand2b_x1 U692 ( .AN(segment_last_timestamp_us[34]), .B(
        ravens_spike_timestamp_us[34]), .Y(n866) );
  nand2b_x1 U693 ( .AN(segment_last_timestamp_us[35]), .B(
        ravens_spike_timestamp_us[35]), .Y(n868) );
  nand3_x2 U694 ( .A(n867), .B(n866), .C(n868), .Y(n966) );
  inv_x1 U695 ( .A(n966), .Y(n872) );
  inv_x1 U696 ( .A(segment_last_timestamp_us[35]), .Y(n870) );
  inv_x1 U697 ( .A(ravens_spike_timestamp_us[34]), .Y(n1386) );
  nand3_x1 U698 ( .A(segment_last_timestamp_us[34]), .B(n1386), .C(n868), .Y(
        n869) );
  oai21_x1 U699 ( .A0(ravens_spike_timestamp_us[35]), .A1(n870), .B0(n869), 
        .Y(n871) );
  aoi21_x1 U700 ( .A0(n873), .A1(n872), .B0(n871), .Y(n879) );
  inv_x1 U701 ( .A(ravens_spike_timestamp_us[36]), .Y(n1356) );
  inv_x1 U702 ( .A(ravens_spike_timestamp_us[37]), .Y(n1285) );
  oai22_x1 U703 ( .A0(segment_last_timestamp_us[37]), .A1(n1285), .B0(
        segment_last_timestamp_us[38]), .B1(n1295), .Y(n875) );
  nor2_x1 U704 ( .A(n875), .B(n874), .Y(n876) );
  oai21_x1 U705 ( .A0(segment_last_timestamp_us[36]), .A1(n1356), .B0(n876), 
        .Y(n960) );
  aoi22_x1 U706 ( .A0(segment_last_timestamp_us[36]), .A1(n1356), .B0(
        segment_last_timestamp_us[37]), .B1(n1285), .Y(n878) );
  inv_x1 U707 ( .A(n876), .Y(n877) );
  oai22_x1 U708 ( .A0(n879), .A1(n960), .B0(n878), .B1(n877), .Y(n883) );
  inv_x1 U709 ( .A(ravens_spike_timestamp_us[40]), .Y(n1301) );
  oai21_x1 U710 ( .A0(segment_last_timestamp_us[40]), .A1(n1301), .B0(n880), 
        .Y(n881) );
  nor2_x1 U711 ( .A(n882), .B(n881), .Y(n964) );
  oai21_x1 U712 ( .A0(n884), .A1(n883), .B0(n964), .Y(n885) );
  nand2_x1 U713 ( .A(n886), .B(n885), .Y(n969) );
  nand2b_x1 U714 ( .AN(segment_last_timestamp_us[31]), .B(
        ravens_spike_timestamp_us[31]), .Y(n888) );
  oai22_x1 U715 ( .A0(ravens_spike_timestamp_us[30]), .A1(n368), .B0(
        ravens_spike_timestamp_us[31]), .B1(n388), .Y(n887) );
  nand2_x1 U716 ( .A(n888), .B(n887), .Y(n962) );
  nand2b_x1 U717 ( .AN(segment_last_timestamp_us[29]), .B(
        ravens_spike_timestamp_us[29]), .Y(n890) );
  nand2b_x1 U718 ( .AN(segment_last_timestamp_us[30]), .B(
        ravens_spike_timestamp_us[30]), .Y(n889) );
  nand3_x1 U719 ( .A(n890), .B(n889), .C(n888), .Y(n955) );
  aoi21_x1 U720 ( .A0(ravens_spike_timestamp_us[28]), .A1(n335), .B0(n955), 
        .Y(n959) );
  inv_x1 U721 ( .A(ravens_spike_timestamp_us[23]), .Y(n1418) );
  nand2_x1 U722 ( .A(ravens_spike_timestamp_us[23]), .B(n252), .Y(n945) );
  inv_x1 U723 ( .A(ravens_spike_timestamp_us[22]), .Y(n1331) );
  oai22_x1 U724 ( .A0(ravens_spike_timestamp_us[14]), .A1(n1323), .B0(
        ravens_spike_timestamp_us[15]), .B1(n101), .Y(n924) );
  nand2b_x1 U725 ( .AN(segment_last_timestamp_us[15]), .B(
        ravens_spike_timestamp_us[15]), .Y(n923) );
  inv_x1 U726 ( .A(ravens_spike_timestamp_us[13]), .Y(n1414) );
  inv_x1 U727 ( .A(ravens_spike_timestamp_us[12]), .Y(n1366) );
  inv_x1 U728 ( .A(ravens_spike_timestamp_us[10]), .Y(n1376) );
  nand2_x1 U729 ( .A(ravens_spike_timestamp_us[11]), .B(n92), .Y(n892) );
  oai21_x1 U730 ( .A0(segment_last_timestamp_us[10]), .A1(n1376), .B0(n892), 
        .Y(n900) );
  inv_x1 U731 ( .A(n900), .Y(n897) );
  inv_x1 U732 ( .A(ravens_spike_timestamp_us[9]), .Y(n1426) );
  nor2_x1 U733 ( .A(segment_last_timestamp_us[9]), .B(n1426), .Y(n902) );
  inv_x1 U734 ( .A(ravens_spike_timestamp_us[8]), .Y(n1311) );
  oai22_x1 U735 ( .A0(n902), .A1(n891), .B0(ravens_spike_timestamp_us[9]), 
        .B1(n84), .Y(n896) );
  inv_x1 U736 ( .A(n892), .Y(n894) );
  nand2_x1 U737 ( .A(segment_last_timestamp_us[10]), .B(n1376), .Y(n893) );
  oai22_x1 U738 ( .A0(n894), .A1(n893), .B0(ravens_spike_timestamp_us[11]), 
        .B1(n92), .Y(n895) );
  aoi21_x1 U739 ( .A0(n897), .A1(n896), .B0(n895), .Y(n898) );
  oai22_x1 U740 ( .A0(n901), .A1(n898), .B0(ravens_spike_timestamp_us[12]), 
        .B1(n88), .Y(n899) );
  aoi22_x1 U741 ( .A0(segment_last_timestamp_us[13]), .A1(n1414), .B0(n915), 
        .B1(n899), .Y(n921) );
  inv_x1 U742 ( .A(ravens_spike_timestamp_us[7]), .Y(n1445) );
  oai22_x1 U743 ( .A0(segment_last_timestamp_us[7]), .A1(n1445), .B0(
        segment_last_timestamp_us[8]), .B1(n1311), .Y(n918) );
  nor3_x1 U744 ( .A(n902), .B(n901), .C(n900), .Y(n917) );
  inv_x1 U745 ( .A(ravens_spike_timestamp_us[6]), .Y(n1292) );
  inv_x1 U746 ( .A(ravens_spike_timestamp_us[5]), .Y(n1270) );
  inv_x1 U747 ( .A(ravens_spike_timestamp_us[0]), .Y(n1235) );
  nor3_x1 U748 ( .A(n903), .B(segment_last_timestamp_us[0]), .C(n1235), .Y(
        n907) );
  inv_x1 U749 ( .A(ravens_spike_timestamp_us[1]), .Y(n1239) );
  inv_x1 U750 ( .A(ravens_spike_timestamp_us[2]), .Y(n1244) );
  oai22_x1 U751 ( .A0(segment_last_timestamp_us[1]), .A1(n1239), .B0(
        segment_last_timestamp_us[2]), .B1(n1244), .Y(n906) );
  inv_x1 U752 ( .A(segment_last_timestamp_us[2]), .Y(n904) );
  oai22_x1 U753 ( .A0(ravens_spike_timestamp_us[2]), .A1(n904), .B0(
        ravens_spike_timestamp_us[3]), .B1(n82), .Y(n905) );
  inv_x1 U754 ( .A(ravens_spike_timestamp_us[3]), .Y(n1250) );
  inv_x1 U755 ( .A(ravens_spike_timestamp_us[4]), .Y(n1262) );
  oai22_x1 U756 ( .A0(segment_last_timestamp_us[3]), .A1(n1250), .B0(
        segment_last_timestamp_us[4]), .B1(n1262), .Y(n909) );
  aoi22_x1 U757 ( .A0(segment_last_timestamp_us[4]), .A1(n1262), .B0(
        segment_last_timestamp_us[5]), .B1(n1270), .Y(n908) );
  oai21_x1 U758 ( .A0(n910), .A1(n909), .B0(n908), .Y(n911) );
  oai21_x1 U759 ( .A0(segment_last_timestamp_us[5]), .A1(n1270), .B0(n911), 
        .Y(n912) );
  oai21_x1 U760 ( .A0(ravens_spike_timestamp_us[6]), .A1(n97), .B0(n912), .Y(
        n913) );
  oai21_x1 U761 ( .A0(segment_last_timestamp_us[6]), .A1(n1292), .B0(n913), 
        .Y(n914) );
  oai21_x1 U762 ( .A0(ravens_spike_timestamp_us[7]), .A1(n95), .B0(n914), .Y(
        n916) );
  nand4b_x1 U763 ( .AN(n918), .B(n917), .C(n916), .D(n915), .Y(n920) );
  inv_x1 U764 ( .A(ravens_spike_timestamp_us[14]), .Y(n1326) );
  oai21_x1 U765 ( .A0(segment_last_timestamp_us[14]), .A1(n1326), .B0(n923), 
        .Y(n919) );
  aoi21_x1 U766 ( .A0(n921), .A1(n920), .B0(n919), .Y(n922) );
  aoi21_x1 U767 ( .A0(n924), .A1(n923), .B0(n922), .Y(n941) );
  inv_x1 U768 ( .A(ravens_spike_timestamp_us[17]), .Y(n1430) );
  aoi21_x1 U769 ( .A0(ravens_spike_timestamp_us[16]), .A1(n134), .B0(n928), 
        .Y(n926) );
  inv_x1 U770 ( .A(ravens_spike_timestamp_us[19]), .Y(n1434) );
  nor2_x1 U771 ( .A(segment_last_timestamp_us[19]), .B(n1434), .Y(n931) );
  aoi21_x1 U772 ( .A0(ravens_spike_timestamp_us[18]), .A1(n126), .B0(n931), 
        .Y(n934) );
  inv_x1 U773 ( .A(ravens_spike_timestamp_us[20]), .Y(n1371) );
  nor2_x1 U774 ( .A(segment_last_timestamp_us[20]), .B(n1371), .Y(n936) );
  inv_x1 U775 ( .A(n936), .Y(n925) );
  nand2b_x1 U776 ( .AN(segment_last_timestamp_us[21]), .B(
        ravens_spike_timestamp_us[21]), .Y(n938) );
  nand4_x1 U777 ( .A(n926), .B(n934), .C(n925), .D(n938), .Y(n940) );
  inv_x1 U778 ( .A(ravens_spike_timestamp_us[21]), .Y(n1438) );
  inv_x1 U779 ( .A(ravens_spike_timestamp_us[16]), .Y(n1361) );
  nand2_x1 U780 ( .A(segment_last_timestamp_us[16]), .B(n1361), .Y(n927) );
  oai22_x1 U781 ( .A0(n928), .A1(n927), .B0(ravens_spike_timestamp_us[17]), 
        .B1(n130), .Y(n933) );
  inv_x1 U782 ( .A(ravens_spike_timestamp_us[18]), .Y(n1351) );
  nand2_x1 U783 ( .A(segment_last_timestamp_us[18]), .B(n1351), .Y(n930) );
  inv_x1 U784 ( .A(segment_last_timestamp_us[19]), .Y(n929) );
  oai22_x1 U785 ( .A0(n931), .A1(n930), .B0(ravens_spike_timestamp_us[19]), 
        .B1(n929), .Y(n932) );
  aoi21_x1 U786 ( .A0(n934), .A1(n933), .B0(n932), .Y(n935) );
  oai22_x1 U787 ( .A0(n936), .A1(n935), .B0(ravens_spike_timestamp_us[20]), 
        .B1(n69), .Y(n937) );
  aoi22_x1 U788 ( .A0(segment_last_timestamp_us[21]), .A1(n1438), .B0(n938), 
        .B1(n937), .Y(n939) );
  oai21_x1 U789 ( .A0(n941), .A1(n940), .B0(n939), .Y(n942) );
  oai21_x1 U790 ( .A0(segment_last_timestamp_us[22]), .A1(n1331), .B0(n942), 
        .Y(n943) );
  oai21_x1 U791 ( .A0(ravens_spike_timestamp_us[22]), .A1(n241), .B0(n943), 
        .Y(n944) );
  aoi22_x1 U792 ( .A0(segment_last_timestamp_us[23]), .A1(n1418), .B0(n945), 
        .B1(n944), .Y(n954) );
  inv_x1 U793 ( .A(ravens_spike_timestamp_us[24]), .Y(n1341) );
  inv_x1 U794 ( .A(ravens_spike_timestamp_us[27]), .Y(n1410) );
  nor2_x1 U795 ( .A(segment_last_timestamp_us[27]), .B(n1410), .Y(n948) );
  inv_x1 U796 ( .A(ravens_spike_timestamp_us[26]), .Y(n1381) );
  inv_x1 U797 ( .A(ravens_spike_timestamp_us[25]), .Y(n1422) );
  oai22_x1 U798 ( .A0(segment_last_timestamp_us[26]), .A1(n1381), .B0(
        segment_last_timestamp_us[25]), .B1(n1422), .Y(n946) );
  oai21_x1 U799 ( .A0(segment_last_timestamp_us[24]), .A1(n1341), .B0(n951), 
        .Y(n953) );
  oai22_x1 U800 ( .A0(ravens_spike_timestamp_us[24]), .A1(n268), .B0(
        ravens_spike_timestamp_us[25]), .B1(n283), .Y(n950) );
  nand2_x1 U801 ( .A(segment_last_timestamp_us[26]), .B(n1381), .Y(n947) );
  oai22_x1 U802 ( .A0(n948), .A1(n947), .B0(ravens_spike_timestamp_us[27]), 
        .B1(n318), .Y(n949) );
  aoi21_x1 U803 ( .A0(n951), .A1(n950), .B0(n949), .Y(n952) );
  oai21_x1 U804 ( .A0(n954), .A1(n953), .B0(n952), .Y(n958) );
  inv_x1 U805 ( .A(n955), .Y(n957) );
  oai22_x1 U806 ( .A0(ravens_spike_timestamp_us[28]), .A1(n335), .B0(
        ravens_spike_timestamp_us[29]), .B1(n352), .Y(n956) );
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
  inv_x1 U829 ( .A(ravens_spike_timestamp_us[35]), .Y(n1406) );
  inv_x1 U830 ( .A(ravens_spike_timestamp_us[32]), .Y(n1336) );
  inv_x1 U831 ( .A(ravens_spike_timestamp_us[33]), .Y(n1402) );
  aoi22_x1 U832 ( .A0(time_us_start_looking_for_new_sim_time[32]), .A1(n1336), 
        .B0(time_us_start_looking_for_new_sim_time[33]), .B1(n1402), .Y(n987)
         );
  nor2_x1 U833 ( .A(time_us_start_looking_for_new_sim_time[35]), .B(n1406), 
        .Y(n1106) );
  nor2_x1 U834 ( .A(time_us_start_looking_for_new_sim_time[34]), .B(n1386), 
        .Y(n1124) );
  nand2b_x1 U835 ( .AN(time_us_start_looking_for_new_sim_time[33]), .B(
        ravens_spike_timestamp_us[33]), .Y(n1128) );
  nand2_x1 U836 ( .A(n986), .B(n1128), .Y(n1042) );
  nand2_x1 U837 ( .A(time_us_start_looking_for_new_sim_time[34]), .B(n1386), 
        .Y(n1126) );
  oai22_x1 U838 ( .A0(n987), .A1(n1042), .B0(n1106), .B1(n1126), .Y(n988) );
  aoi21_x1 U839 ( .A0(time_us_start_looking_for_new_sim_time[35]), .A1(n1406), 
        .B0(n988), .Y(n990) );
  aoi22_x1 U840 ( .A0(time_us_start_looking_for_new_sim_time[37]), .A1(n1285), 
        .B0(time_us_start_looking_for_new_sim_time[36]), .B1(n1356), .Y(n989)
         );
  oai21_x1 U841 ( .A0(n991), .A1(n990), .B0(n989), .Y(n992) );
  nand2_x1 U842 ( .A(n1040), .B(n992), .Y(n1047) );
  nor2_x1 U843 ( .A(time_us_start_looking_for_new_sim_time[23]), .B(n1418), 
        .Y(n1186) );
  nor2_x1 U844 ( .A(time_us_start_looking_for_new_sim_time[22]), .B(n1331), 
        .Y(n1076) );
  nor2_x1 U845 ( .A(n1186), .B(n1076), .Y(n1010) );
  nor2_x1 U846 ( .A(time_us_start_looking_for_new_sim_time[21]), .B(n1438), 
        .Y(n1100) );
  nand2_x1 U847 ( .A(time_us_start_looking_for_new_sim_time[20]), .B(n1371), 
        .Y(n1092) );
  nand2_x1 U848 ( .A(time_us_start_looking_for_new_sim_time[21]), .B(n1438), 
        .Y(n1151) );
  oai21_x1 U849 ( .A0(n1100), .A1(n1092), .B0(n1151), .Y(n993) );
  aoi22_x1 U850 ( .A0(n1010), .A1(n993), .B0(
        time_us_start_looking_for_new_sim_time[23]), .B1(n1418), .Y(n1028) );
  nand2_x1 U851 ( .A(time_us_start_looking_for_new_sim_time[22]), .B(n1331), 
        .Y(n1109) );
  inv_x1 U852 ( .A(ravens_spike_timestamp_us[15]), .Y(n1442) );
  nor2_x1 U853 ( .A(time_us_start_looking_for_new_sim_time[15]), .B(n1442), 
        .Y(n1107) );
  nand2_x1 U854 ( .A(time_us_start_looking_for_new_sim_time[14]), .B(n1326), 
        .Y(n1008) );
  nor2_x1 U855 ( .A(time_us_start_looking_for_new_sim_time[13]), .B(n1414), 
        .Y(n1094) );
  nor2_x1 U856 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(n1311), .Y(
        n996) );
  nor2b_x1 U857 ( .AN(time_us_start_looking_for_new_sim_time[7]), .B(
        ravens_spike_timestamp_us[7]), .Y(n1164) );
  inv_x1 U858 ( .A(ravens_spike_timestamp_us[11]), .Y(n1390) );
  nor2_x1 U859 ( .A(time_us_start_looking_for_new_sim_time[11]), .B(n1390), 
        .Y(n1099) );
  nor2_x1 U860 ( .A(time_us_start_looking_for_new_sim_time[10]), .B(n1376), 
        .Y(n1197) );
  nor2_x1 U861 ( .A(n1099), .B(n1197), .Y(n1000) );
  nand2b_x1 U862 ( .AN(time_us_start_looking_for_new_sim_time[12]), .B(
        ravens_spike_timestamp_us[12]), .Y(n1073) );
  inv_x1 U863 ( .A(time_us_start_looking_for_new_sim_time[9]), .Y(n1193) );
  nand4_x1 U864 ( .A(n1164), .B(n1000), .C(n1073), .D(n994), .Y(n995) );
  nor3_x1 U865 ( .A(n1094), .B(n996), .C(n995), .Y(n1006) );
  nor2_x1 U866 ( .A(time_us_start_looking_for_new_sim_time[9]), .B(n1426), .Y(
        n998) );
  oai22_x1 U867 ( .A0(ravens_spike_timestamp_us[9]), .A1(n1193), .B0(n998), 
        .B1(n997), .Y(n999) );
  aoi22_x1 U868 ( .A0(n1000), .A1(n999), .B0(
        time_us_start_looking_for_new_sim_time[11]), .B1(n1390), .Y(n1001) );
  oai21_x1 U869 ( .A0(n1099), .A1(n1192), .B0(n1001), .Y(n1002) );
  aoi22_x1 U870 ( .A0(time_us_start_looking_for_new_sim_time[12]), .A1(n1366), 
        .B0(n1073), .B1(n1002), .Y(n1003) );
  oai21_x1 U871 ( .A0(n1094), .A1(n1003), .B0(n1156), .Y(n1005) );
  nor2_x1 U872 ( .A(time_us_start_looking_for_new_sim_time[14]), .B(n1326), 
        .Y(n1080) );
  oai21_x1 U873 ( .A0(n1006), .A1(n1005), .B0(n1004), .Y(n1007) );
  oai21_x1 U874 ( .A0(n1107), .A1(n1008), .B0(n1007), .Y(n1009) );
  aoi21_x1 U875 ( .A0(time_us_start_looking_for_new_sim_time[15]), .A1(n1442), 
        .B0(n1009), .Y(n1013) );
  nand2b_x1 U876 ( .AN(time_us_start_looking_for_new_sim_time[20]), .B(
        ravens_spike_timestamp_us[20]), .Y(n1093) );
  oai21_x1 U877 ( .A0(time_us_start_looking_for_new_sim_time[21]), .A1(n1438), 
        .B0(n1093), .Y(n1011) );
  nand2b_x1 U878 ( .AN(n1011), .B(n1010), .Y(n1019) );
  nor2_x1 U879 ( .A(time_us_start_looking_for_new_sim_time[19]), .B(n1434), 
        .Y(n1091) );
  nor2_x1 U880 ( .A(time_us_start_looking_for_new_sim_time[18]), .B(n1351), 
        .Y(n1191) );
  nor2_x1 U881 ( .A(n1091), .B(n1191), .Y(n1018) );
  nand2b_x1 U882 ( .AN(time_us_start_looking_for_new_sim_time[16]), .B(
        ravens_spike_timestamp_us[16]), .Y(n1064) );
  nand2b_x1 U883 ( .AN(time_us_start_looking_for_new_sim_time[17]), .B(
        ravens_spike_timestamp_us[17]), .Y(n1190) );
  nand4b_x1 U884 ( .AN(n1019), .B(n1018), .C(n1064), .D(n1190), .Y(n1012) );
  oai22_x1 U885 ( .A0(n1186), .A1(n1109), .B0(n1013), .B1(n1012), .Y(n1023) );
  inv_x1 U886 ( .A(n1190), .Y(n1065) );
  oai21_x1 U887 ( .A0(n1065), .A1(n1062), .B0(n1014), .Y(n1017) );
  inv_x1 U888 ( .A(n1091), .Y(n1015) );
  aoi22_x1 U889 ( .A0(n1018), .A1(n1017), .B0(n1016), .B1(n1015), .Y(n1021) );
  nand2_x1 U890 ( .A(time_us_start_looking_for_new_sim_time[19]), .B(n1434), 
        .Y(n1020) );
  aoi21_x1 U891 ( .A0(n1021), .A1(n1020), .B0(n1019), .Y(n1022) );
  nor2_x1 U892 ( .A(n1023), .B(n1022), .Y(n1027) );
  nor2_x1 U893 ( .A(time_us_start_looking_for_new_sim_time[27]), .B(n1410), 
        .Y(n1105) );
  nor2_x1 U894 ( .A(time_us_start_looking_for_new_sim_time[25]), .B(n1422), 
        .Y(n1137) );
  nor2_x1 U895 ( .A(time_us_start_looking_for_new_sim_time[26]), .B(n1381), 
        .Y(n1189) );
  nor3_x1 U896 ( .A(n1105), .B(n1137), .C(n1189), .Y(n1029) );
  inv_x1 U897 ( .A(ravens_spike_timestamp_us[28]), .Y(n1320) );
  nor2_x1 U898 ( .A(time_us_start_looking_for_new_sim_time[28]), .B(n1320), 
        .Y(n1024) );
  nand2b_x1 U899 ( .AN(time_us_start_looking_for_new_sim_time[29]), .B(
        ravens_spike_timestamp_us[29]), .Y(n1153) );
  nand2b_x1 U900 ( .AN(time_us_start_looking_for_new_sim_time[30]), .B(
        ravens_spike_timestamp_us[30]), .Y(n1131) );
  nand2b_x1 U901 ( .AN(time_us_start_looking_for_new_sim_time[31]), .B(
        ravens_spike_timestamp_us[31]), .Y(n1143) );
  nand3_x1 U902 ( .A(n1153), .B(n1131), .C(n1143), .Y(n1034) );
  nor2_x1 U903 ( .A(n1024), .B(n1034), .Y(n1033) );
  or2_x1 U904 ( .A(time_us_start_looking_for_new_sim_time[24]), .B(n1341), .Y(
        n1025) );
  nand3_x1 U905 ( .A(n1029), .B(n1033), .C(n1025), .Y(n1026) );
  aoi21_x1 U906 ( .A0(n1028), .A1(n1027), .B0(n1026), .Y(n1045) );
  aoi22_x1 U907 ( .A0(time_us_start_looking_for_new_sim_time[24]), .A1(n1341), 
        .B0(time_us_start_looking_for_new_sim_time[25]), .B1(n1422), .Y(n1031)
         );
  inv_x1 U908 ( .A(n1029), .Y(n1030) );
  nand2_x1 U909 ( .A(time_us_start_looking_for_new_sim_time[26]), .B(n1381), 
        .Y(n1136) );
  oai22_x1 U910 ( .A0(n1031), .A1(n1030), .B0(n1105), .B1(n1136), .Y(n1032) );
  aoi21_x1 U911 ( .A0(time_us_start_looking_for_new_sim_time[27]), .A1(n1410), 
        .B0(n1032), .Y(n1039) );
  inv_x1 U912 ( .A(n1033), .Y(n1038) );
  inv_x1 U913 ( .A(ravens_spike_timestamp_us[31]), .Y(n1398) );
  inv_x1 U914 ( .A(n1143), .Y(n1085) );
  inv_x1 U915 ( .A(ravens_spike_timestamp_us[30]), .Y(n1346) );
  nand2_x1 U916 ( .A(time_us_start_looking_for_new_sim_time[30]), .B(n1346), 
        .Y(n1154) );
  inv_x1 U917 ( .A(ravens_spike_timestamp_us[29]), .Y(n1394) );
  aoi22_x1 U918 ( .A0(time_us_start_looking_for_new_sim_time[29]), .A1(n1394), 
        .B0(time_us_start_looking_for_new_sim_time[28]), .B1(n1320), .Y(n1035)
         );
  oai22_x1 U919 ( .A0(n1085), .A1(n1154), .B0(n1035), .B1(n1034), .Y(n1036) );
  aoi21_x1 U920 ( .A0(time_us_start_looking_for_new_sim_time[31]), .A1(n1398), 
        .B0(n1036), .Y(n1037) );
  oai21_x1 U921 ( .A0(n1039), .A1(n1038), .B0(n1037), .Y(n1044) );
  oai21_x1 U922 ( .A0(time_us_start_looking_for_new_sim_time[36]), .A1(n1356), 
        .B0(n1040), .Y(n1041) );
  nor3_x1 U923 ( .A(n1144), .B(n1042), .C(n1041), .Y(n1043) );
  oai21_x1 U924 ( .A0(n1045), .A1(n1044), .B0(n1043), .Y(n1046) );
  nand2_x1 U925 ( .A(n1047), .B(n1046), .Y(n1049) );
  nor2_x1 U926 ( .A(time_us_start_looking_for_new_sim_time[40]), .B(n1301), 
        .Y(n1134) );
  inv_x1 U927 ( .A(ravens_spike_timestamp_us[43]), .Y(n1448) );
  oai22_x1 U928 ( .A0(time_us_start_looking_for_new_sim_time[42]), .A1(n1314), 
        .B0(time_us_start_looking_for_new_sim_time[43]), .B1(n1448), .Y(n1051)
         );
  nor3_x1 U929 ( .A(n1148), .B(n1134), .C(n1051), .Y(n1048) );
  oai21_x1 U930 ( .A0(n1050), .A1(n1049), .B0(n1048), .Y(n1055) );
  inv_x1 U931 ( .A(n1051), .Y(n1090) );
  nand2_x1 U932 ( .A(time_us_start_looking_for_new_sim_time[40]), .B(n1301), 
        .Y(n1060) );
  aoi22_x1 U933 ( .A0(time_us_start_looking_for_new_sim_time[41]), .A1(n1304), 
        .B0(time_us_start_looking_for_new_sim_time[42]), .B1(n1314), .Y(n1052)
         );
  oai21_x1 U934 ( .A0(n1148), .A1(n1060), .B0(n1052), .Y(n1053) );
  aoi22_x1 U935 ( .A0(n1090), .A1(n1053), .B0(
        time_us_start_looking_for_new_sim_time[43]), .B1(n1448), .Y(n1054) );
  aoi22_x1 U936 ( .A0(ravens_spike_timestamp_us[44]), .A1(n1056), .B0(n1055), 
        .B1(n1054), .Y(n1211) );
  inv_x1 U937 ( .A(n1093), .Y(n1152) );
  aoi21_x1 U938 ( .A0(time_us_start_looking_for_new_sim_time[41]), .A1(n1304), 
        .B0(n1148), .Y(n1058) );
  aoi21_x1 U939 ( .A0(time_us_start_looking_for_new_sim_time[27]), .A1(n1410), 
        .B0(n1105), .Y(n1057) );
  oai22_x1 U940 ( .A0(n1134), .A1(n1058), .B0(n1189), .B1(n1057), .Y(n1059) );
  aoi21_x1 U941 ( .A0(n1076), .A1(n1108), .B0(n1059), .Y(n1089) );
  nand2_x1 U942 ( .A(time_us_start_looking_for_new_sim_time[32]), .B(n1336), 
        .Y(n1061) );
  oai22_x1 U943 ( .A0(n1085), .A1(n1061), .B0(n1130), .B1(n1060), .Y(n1070) );
  nand2_x1 U944 ( .A(time_us_start_looking_for_new_sim_time[18]), .B(n1351), 
        .Y(n1063) );
  oai22_x1 U945 ( .A0(n1065), .A1(n1063), .B0(n1107), .B1(n1062), .Y(n1069) );
  inv_x1 U946 ( .A(n1064), .Y(n1115) );
  aoi21_x1 U947 ( .A0(time_us_start_looking_for_new_sim_time[17]), .A1(n1430), 
        .B0(n1065), .Y(n1067) );
  aoi21_x1 U948 ( .A0(time_us_start_looking_for_new_sim_time[19]), .A1(n1434), 
        .B0(n1091), .Y(n1066) );
  oai22_x1 U949 ( .A0(n1115), .A1(n1067), .B0(n1191), .B1(n1066), .Y(n1068) );
  nor3_x1 U950 ( .A(n1070), .B(n1069), .C(n1068), .Y(n1088) );
  aoi21_x1 U951 ( .A0(time_us_start_looking_for_new_sim_time[39]), .A1(n1298), 
        .B0(n1130), .Y(n1071) );
  nor2b_x1 U952 ( .AN(n1186), .B(time_us_start_looking_for_new_sim_time[24]), 
        .Y(n1102) );
  inv_x1 U953 ( .A(n1137), .Y(n1188) );
  oai22_x1 U954 ( .A0(n1140), .A1(n1071), .B0(n1102), .B1(n1188), .Y(n1083) );
  aoi21_x1 U955 ( .A0(time_us_start_looking_for_new_sim_time[35]), .A1(n1406), 
        .B0(n1106), .Y(n1072) );
  nor2b_x1 U956 ( .AN(n1106), .B(time_us_start_looking_for_new_sim_time[36]), 
        .Y(n1112) );
  inv_x1 U957 ( .A(n1141), .Y(n1139) );
  oai22_x1 U958 ( .A0(n1124), .A1(n1072), .B0(n1112), .B1(n1139), .Y(n1082) );
  aoi21_x1 U959 ( .A0(time_us_start_looking_for_new_sim_time[15]), .A1(n1442), 
        .B0(n1107), .Y(n1079) );
  inv_x1 U960 ( .A(n1073), .Y(n1157) );
  nand2_x1 U961 ( .A(n1157), .B(n1156), .Y(n1116) );
  aoi21_x1 U962 ( .A0(time_us_start_looking_for_new_sim_time[23]), .A1(n1418), 
        .B0(n1186), .Y(n1075) );
  aoi21_x1 U963 ( .A0(time_us_start_looking_for_new_sim_time[11]), .A1(n1390), 
        .B0(n1099), .Y(n1074) );
  oai22_x1 U964 ( .A0(n1076), .A1(n1075), .B0(n1197), .B1(n1074), .Y(n1077) );
  aoi21_x1 U965 ( .A0(n1116), .A1(n1080), .B0(n1077), .Y(n1078) );
  oai21_x1 U966 ( .A0(n1080), .A1(n1079), .B0(n1078), .Y(n1081) );
  nor3_x1 U967 ( .A(n1083), .B(n1082), .C(n1081), .Y(n1087) );
  and2_x1 U968 ( .A(time_us_start_looking_for_new_sim_time[31]), .B(n1398), 
        .Y(n1084) );
  oai22_x1 U969 ( .A0(time_us_start_looking_for_new_sim_time[30]), .A1(n1346), 
        .B0(n1085), .B1(n1084), .Y(n1086) );
  nand4_x1 U970 ( .A(n1089), .B(n1088), .C(n1087), .D(n1086), .Y(n1210) );
  nor2_x1 U971 ( .A(time_us_start_looking_for_new_sim_time[42]), .B(n1314), 
        .Y(n1146) );
  aoi21_x1 U972 ( .A0(n1146), .A1(n1148), .B0(n1090), .Y(n1097) );
  aoi21_x1 U973 ( .A0(n1093), .A1(n1092), .B0(n1091), .Y(n1096) );
  nor2b_x1 U974 ( .AN(n1105), .B(time_us_start_looking_for_new_sim_time[28]), 
        .Y(n1104) );
  oai22_x1 U975 ( .A0(n1104), .A1(n1153), .B0(n1094), .B1(n1116), .Y(n1095) );
  nor3_x1 U976 ( .A(n1097), .B(n1096), .C(n1095), .Y(n1208) );
  aoi21_x1 U977 ( .A0(time_us_start_looking_for_new_sim_time[12]), .A1(n1366), 
        .B0(n1157), .Y(n1098) );
  oai22_x1 U978 ( .A0(n1100), .A1(n1108), .B0(n1099), .B1(n1098), .Y(n1123) );
  nand2_x1 U979 ( .A(time_us_start_looking_for_new_sim_time[29]), .B(n1394), 
        .Y(n1103) );
  oai22_x1 U980 ( .A0(n1104), .A1(n1103), .B0(n1102), .B1(n1101), .Y(n1122) );
  xnor3_alt_x1 U981 ( .A(ravens_spike_timestamp_us[28]), .B(n1105), .C(
        time_us_start_looking_for_new_sim_time[28]), .Y(n1120) );
  xnor3_alt_x1 U982 ( .A(ravens_spike_timestamp_us[36]), .B(n1106), .C(
        time_us_start_looking_for_new_sim_time[36]), .Y(n1119) );
  inv_x1 U983 ( .A(n1107), .Y(n1114) );
  inv_x1 U984 ( .A(n1108), .Y(n1110) );
  oai22_x1 U985 ( .A0(n1112), .A1(n1111), .B0(n1110), .B1(n1109), .Y(n1113) );
  aoi21_x1 U986 ( .A0(n1115), .A1(n1114), .B0(n1113), .Y(n1118) );
  nand3_x1 U987 ( .A(time_us_start_looking_for_new_sim_time[14]), .B(n1326), 
        .C(n1116), .Y(n1117) );
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
  nand2_x1 U1001 ( .A(time_us_start_looking_for_new_sim_time[42]), .B(n1314), 
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
  xnor3_alt_x1 U1034 ( .A(time_us_start_looking_for_new_sim_time[8]), .B(n1311), .C(n1187), .Y(n1200) );
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
  oai2bb2_x1 U1056 ( .B0(n66), .B1(n1235), .A0N(n1454), .A1N(n1234), .Y(N74)
         );
  inv_x1 U1057 ( .A(n1242), .Y(n1236) );
  nand2_x2 U1058 ( .A(n1241), .B(n1236), .Y(n1237) );
  xor2_x1 U1059 ( .A(n1237), .B(n1240), .Y(n1238) );
  oai2bb2_x1 U1060 ( .B0(n66), .B1(n1239), .A0N(n1454), .A1N(n1238), .Y(N75)
         );
  mxi2_x1 U1061 ( .A0(n1242), .A1(n1241), .S(n1240), .YN(n1253) );
  inv_x1 U1062 ( .A(n1253), .Y(n1245) );
  xor2_x1 U1063 ( .A(n1245), .B(n904), .Y(n1243) );
  oai2bb2_x1 U1064 ( .B0(n66), .B1(n1244), .A0N(n1454), .A1N(n1243), .Y(N76)
         );
  inv_x1 U1065 ( .A(n1252), .Y(n1246) );
  nand2_x2 U1066 ( .A(n1251), .B(n1246), .Y(n1247) );
  xnor2_x1 U1067 ( .A(n1248), .B(n1247), .Y(n1249) );
  oai2bb2_x1 U1068 ( .B0(n66), .B1(n1250), .A0N(n1454), .A1N(n1249), .Y(N77)
         );
  inv_x1 U1069 ( .A(n1251), .Y(n1255) );
  mxi2_x1 U1070 ( .A0(n1252), .A1(n1251), .S(n904), .YN(n1254) );
  mxi2_x1 U1071 ( .A0(n1255), .A1(n1254), .S(n1253), .YN(n1281) );
  inv_x1 U1072 ( .A(n1256), .Y(n1271) );
  inv_x1 U1073 ( .A(n1275), .Y(n1263) );
  xnor2_x1 U1074 ( .A(n1286), .B(n1260), .Y(n1261) );
  oai2bb2_x1 U1075 ( .B0(n66), .B1(n1262), .A0N(n1454), .A1N(n1261), .Y(N78)
         );
  inv_x1 U1076 ( .A(n1276), .Y(n1264) );
  mxi2_x1 U1077 ( .A0(n1264), .A1(n1263), .S(n1286), .YN(n1268) );
  inv_x1 U1078 ( .A(n1278), .Y(n1266) );
  nand2_x2 U1079 ( .A(n1277), .B(n1266), .Y(n1267) );
  xor2_x1 U1080 ( .A(n1268), .B(n1267), .Y(n1269) );
  oai2bb2_x1 U1081 ( .B0(n66), .B1(n1270), .A0N(n1454), .A1N(n1269), .Y(N79)
         );
  nand2_x1 U1082 ( .A(segment_last_timestamp_us[8]), .B(
        segment_last_timestamp_us[7]), .Y(n1423) );
  nor2_x1 U1083 ( .A(n1274), .B(n1306), .Y(n1280) );
  nor2_x1 U1084 ( .A(n1274), .B(n1307), .Y(n1279) );
  mxi2_x1 U1085 ( .A0(n1278), .A1(n1277), .S(n1276), .YN(n1288) );
  mxi2_x1 U1086 ( .A0(n1280), .A1(n1279), .S(n1288), .YN(n1282) );
  oai2bb2_x1 U1087 ( .B0(n66), .B1(n1285), .A0N(n1454), .A1N(n1284), .Y(N111)
         );
  mxi2_x1 U1088 ( .A0(n1288), .A1(n1287), .S(n1286), .YN(n1305) );
  inv_x1 U1089 ( .A(n1307), .Y(n1289) );
  nand2_x1 U1090 ( .A(n1306), .B(n1289), .Y(n1290) );
  xor2_x1 U1091 ( .A(n1305), .B(n1290), .Y(n1291) );
  oai2bb2_x1 U1092 ( .B0(n66), .B1(n1292), .A0N(n1454), .A1N(n1291), .Y(N80)
         );
  oai2bb2_x1 U1093 ( .B0(n66), .B1(n1295), .A0N(n1454), .A1N(n1294), .Y(N112)
         );
  addh_x1 U1094 ( .A(n1296), .B(segment_last_timestamp_us[38]), .CO(n1299), 
        .S(n1294) );
  oai2bb2_x1 U1095 ( .B0(n66), .B1(n1298), .A0N(n1454), .A1N(n1297), .Y(N113)
         );
  addh_x1 U1096 ( .A(n1299), .B(segment_last_timestamp_us[39]), .CO(n1302), 
        .S(n1297) );
  oai2bb2_x1 U1097 ( .B0(n66), .B1(n1301), .A0N(n1454), .A1N(n1300), .Y(N114)
         );
  addh_x1 U1098 ( .A(n1302), .B(segment_last_timestamp_us[40]), .CO(n1312), 
        .S(n1300) );
  oai2bb2_x1 U1099 ( .B0(n66), .B1(n1304), .A0N(n1454), .A1N(n1303), .Y(N115)
         );
  mxi2_x1 U1100 ( .A0(n1307), .A1(n1306), .S(n1305), .YN(n1316) );
  nand2_x1 U1101 ( .A(segment_last_timestamp_us[7]), .B(n1316), .Y(n1309) );
  inv_x1 U1102 ( .A(segment_last_timestamp_us[8]), .Y(n1308) );
  xor2_x1 U1103 ( .A(n1309), .B(n1308), .Y(n1310) );
  oai2bb2_x1 U1104 ( .B0(n66), .B1(n1311), .A0N(n1454), .A1N(n1310), .Y(N82)
         );
  addh_x1 U1105 ( .A(n1312), .B(segment_last_timestamp_us[41]), .CO(n1446), 
        .S(n1303) );
  oai2bb2_x1 U1106 ( .B0(n66), .B1(n1314), .A0N(n1454), .A1N(n1313), .Y(N116)
         );
  inv_x1 U1107 ( .A(n1315), .Y(n1317) );
  nor2_x1 U1108 ( .A(n1317), .B(n1443), .Y(n1318) );
  xnor2_x1 U1109 ( .A(n1318), .B(n335), .Y(n1319) );
  oai2bb2_x1 U1110 ( .B0(n66), .B1(n1320), .A0N(n1454), .A1N(n1319), .Y(N102)
         );
  inv_x1 U1111 ( .A(n1321), .Y(n1322) );
  nor2_x1 U1112 ( .A(n1322), .B(n1443), .Y(n1324) );
  inv_x1 U1113 ( .A(segment_last_timestamp_us[14]), .Y(n1323) );
  xnor2_x1 U1114 ( .A(n1324), .B(n1323), .Y(n1325) );
  oai2bb2_x1 U1115 ( .B0(n66), .B1(n1326), .A0N(n1454), .A1N(n1325), .Y(N88)
         );
  inv_x1 U1116 ( .A(n1327), .Y(n1328) );
  nor2_x1 U1117 ( .A(n1328), .B(n1443), .Y(n1329) );
  xnor2_x1 U1118 ( .A(n1329), .B(n241), .Y(n1330) );
  oai2bb2_x1 U1119 ( .B0(n66), .B1(n1331), .A0N(n1454), .A1N(n1330), .Y(N96)
         );
  inv_x1 U1120 ( .A(n1332), .Y(n1333) );
  nor2_x1 U1121 ( .A(n1333), .B(n1443), .Y(n1334) );
  xnor2_x1 U1122 ( .A(n1334), .B(n406), .Y(n1335) );
  oai2bb2_x1 U1123 ( .B0(n66), .B1(n1336), .A0N(n1454), .A1N(n1335), .Y(N106)
         );
  inv_x1 U1124 ( .A(n1337), .Y(n1338) );
  nor2_x1 U1125 ( .A(n1338), .B(n1443), .Y(n1339) );
  xnor2_x1 U1126 ( .A(n1339), .B(n268), .Y(n1340) );
  oai2bb2_x1 U1127 ( .B0(n66), .B1(n1341), .A0N(n1454), .A1N(n1340), .Y(N98)
         );
  inv_x1 U1128 ( .A(n1342), .Y(n1343) );
  nor2_x1 U1129 ( .A(n1343), .B(n1443), .Y(n1344) );
  xnor2_x1 U1130 ( .A(n1344), .B(n368), .Y(n1345) );
  oai2bb2_x1 U1131 ( .B0(n66), .B1(n1346), .A0N(n1454), .A1N(n1345), .Y(N104)
         );
  inv_x1 U1132 ( .A(n1347), .Y(n1348) );
  nor2_x1 U1133 ( .A(n1348), .B(n1443), .Y(n1349) );
  xnor2_x1 U1134 ( .A(n1349), .B(n126), .Y(n1350) );
  oai2bb2_x1 U1135 ( .B0(n66), .B1(n1351), .A0N(n1454), .A1N(n1350), .Y(N92)
         );
  inv_x1 U1136 ( .A(n1352), .Y(n1353) );
  nor2_x1 U1137 ( .A(n1353), .B(n1443), .Y(n1354) );
  xnor2_x1 U1138 ( .A(n1354), .B(n481), .Y(n1355) );
  oai2bb2_x1 U1139 ( .B0(n66), .B1(n1356), .A0N(n1454), .A1N(n1355), .Y(N110)
         );
  inv_x1 U1140 ( .A(n1357), .Y(n1358) );
  nor2_x1 U1141 ( .A(n1358), .B(n1443), .Y(n1359) );
  xnor2_x1 U1142 ( .A(n1359), .B(n134), .Y(n1360) );
  oai2bb2_x1 U1143 ( .B0(n66), .B1(n1361), .A0N(n1454), .A1N(n1360), .Y(N90)
         );
  inv_x1 U1144 ( .A(n1362), .Y(n1363) );
  nor2_x1 U1145 ( .A(n1363), .B(n1443), .Y(n1364) );
  xnor2_x1 U1146 ( .A(n1364), .B(n88), .Y(n1365) );
  oai2bb2_x1 U1147 ( .B0(n66), .B1(n1366), .A0N(n1454), .A1N(n1365), .Y(N86)
         );
  inv_x1 U1148 ( .A(n1367), .Y(n1368) );
  nor2_x1 U1149 ( .A(n1368), .B(n1443), .Y(n1369) );
  xnor2_x1 U1150 ( .A(n1369), .B(n69), .Y(n1370) );
  oai2bb2_x1 U1151 ( .B0(n66), .B1(n1371), .A0N(n1454), .A1N(n1370), .Y(N94)
         );
  inv_x1 U1152 ( .A(n1372), .Y(n1373) );
  nor2_x1 U1153 ( .A(n1373), .B(n1443), .Y(n1374) );
  xnor2_x1 U1154 ( .A(n1374), .B(n71), .Y(n1375) );
  oai2bb2_x1 U1155 ( .B0(n66), .B1(n1376), .A0N(n1454), .A1N(n1375), .Y(N84)
         );
  inv_x1 U1156 ( .A(n1377), .Y(n1378) );
  nor2_x1 U1157 ( .A(n1378), .B(n1443), .Y(n1379) );
  xnor2_x1 U1158 ( .A(n1379), .B(n301), .Y(n1380) );
  oai2bb2_x1 U1159 ( .B0(n66), .B1(n1381), .A0N(n1454), .A1N(n1380), .Y(N100)
         );
  inv_x1 U1160 ( .A(n1382), .Y(n1383) );
  nor2_x1 U1161 ( .A(n1383), .B(n1443), .Y(n1384) );
  xnor2_x1 U1162 ( .A(n1384), .B(n441), .Y(n1385) );
  oai2bb2_x1 U1163 ( .B0(n66), .B1(n1386), .A0N(n1454), .A1N(n1385), .Y(N108)
         );
  nor2_x1 U1164 ( .A(n1387), .B(n1443), .Y(n1388) );
  xnor2_x1 U1165 ( .A(n1388), .B(n92), .Y(n1389) );
  oai2bb2_x1 U1166 ( .B0(n66), .B1(n1390), .A0N(n1454), .A1N(n1389), .Y(N85)
         );
  nor2_x1 U1167 ( .A(n1391), .B(n1443), .Y(n1392) );
  xnor2_x1 U1168 ( .A(n1392), .B(n352), .Y(n1393) );
  oai2bb2_x1 U1169 ( .B0(n66), .B1(n1394), .A0N(n1454), .A1N(n1393), .Y(N103)
         );
  nor2_x1 U1170 ( .A(n1395), .B(n1443), .Y(n1396) );
  xnor2_x1 U1171 ( .A(n1396), .B(n388), .Y(n1397) );
  oai2bb2_x1 U1172 ( .B0(n66), .B1(n1398), .A0N(n1454), .A1N(n1397), .Y(N105)
         );
  nor2_x1 U1173 ( .A(n1399), .B(n1443), .Y(n1400) );
  xnor2_x1 U1174 ( .A(n1400), .B(n424), .Y(n1401) );
  oai2bb2_x1 U1175 ( .B0(n66), .B1(n1402), .A0N(n1454), .A1N(n1401), .Y(N107)
         );
  nor2_x1 U1176 ( .A(n1403), .B(n1443), .Y(n1404) );
  xnor2_x1 U1177 ( .A(n1404), .B(n870), .Y(n1405) );
  oai2bb2_x1 U1178 ( .B0(n66), .B1(n1406), .A0N(n1454), .A1N(n1405), .Y(N109)
         );
  nor2_x1 U1179 ( .A(n1407), .B(n1443), .Y(n1408) );
  xnor2_x1 U1180 ( .A(n1408), .B(n318), .Y(n1409) );
  oai2bb2_x1 U1181 ( .B0(n66), .B1(n1410), .A0N(n1454), .A1N(n1409), .Y(N101)
         );
  nor2_x1 U1182 ( .A(n1411), .B(n1443), .Y(n1412) );
  xnor2_x1 U1183 ( .A(n1412), .B(n112), .Y(n1413) );
  oai2bb2_x1 U1184 ( .B0(n66), .B1(n1414), .A0N(n1454), .A1N(n1413), .Y(N87)
         );
  nor2_x1 U1185 ( .A(n1415), .B(n1443), .Y(n1416) );
  xnor2_x1 U1186 ( .A(n1416), .B(n252), .Y(n1417) );
  oai2bb2_x1 U1187 ( .B0(n66), .B1(n1418), .A0N(n1454), .A1N(n1417), .Y(N97)
         );
  nor2_x1 U1188 ( .A(n1419), .B(n1443), .Y(n1420) );
  xnor2_x1 U1189 ( .A(n1420), .B(n283), .Y(n1421) );
  oai2bb2_x1 U1190 ( .B0(n66), .B1(n1422), .A0N(n1454), .A1N(n1421), .Y(N99)
         );
  nor2_x1 U1191 ( .A(n1423), .B(n1443), .Y(n1424) );
  xnor2_x1 U1192 ( .A(n1424), .B(n84), .Y(n1425) );
  oai2bb2_x1 U1193 ( .B0(n66), .B1(n1426), .A0N(n1454), .A1N(n1425), .Y(N83)
         );
  nor2_x1 U1194 ( .A(n1427), .B(n1443), .Y(n1428) );
  xnor2_x1 U1195 ( .A(n1428), .B(n130), .Y(n1429) );
  oai2bb2_x1 U1196 ( .B0(n66), .B1(n1430), .A0N(n1454), .A1N(n1429), .Y(N91)
         );
  nor2_x1 U1197 ( .A(n1431), .B(n1443), .Y(n1432) );
  xnor2_x1 U1198 ( .A(n1432), .B(n929), .Y(n1433) );
  oai2bb2_x1 U1199 ( .B0(n66), .B1(n1434), .A0N(n1454), .A1N(n1433), .Y(N93)
         );
  nor2_x1 U1200 ( .A(n1435), .B(n1443), .Y(n1436) );
  xnor2_x1 U1201 ( .A(n1436), .B(n234), .Y(n1437) );
  oai2bb2_x1 U1202 ( .B0(n66), .B1(n1438), .A0N(n1454), .A1N(n1437), .Y(N95)
         );
  nor2_x1 U1203 ( .A(n1439), .B(n1443), .Y(n1440) );
  xnor2_x1 U1204 ( .A(n1440), .B(n101), .Y(n1441) );
  oai2bb2_x1 U1205 ( .B0(n66), .B1(n1442), .A0N(n1454), .A1N(n1441), .Y(N89)
         );
  xor2_x1 U1206 ( .A(n1443), .B(n95), .Y(n1444) );
  oai2bb2_x1 U1207 ( .B0(n66), .B1(n1445), .A0N(n1454), .A1N(n1444), .Y(N81)
         );
  addh_x1 U1208 ( .A(n1446), .B(segment_last_timestamp_us[42]), .CO(n1449), 
        .S(n1313) );
  oai2bb2_x1 U1209 ( .B0(n66), .B1(n1448), .A0N(n1454), .A1N(n1447), .Y(N117)
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
  wire   net215, net217, net218, net221, n1;
  assign net215 = CLK;
  assign ENCLK = net217;
  assign net218 = EN;

  latchgd_x1 latch ( .G(n1), .D(net218), .Q(net221) );
  and2_x1 main_gate ( .A(net221), .B(net215), .Y(net217) );
  inv_x1 U2 ( .A(net215), .Y(n1) );
endmodule


module dvs_event_to_ravens ( clk, rst_n, fifo_grant, fifo_event, time_us, 
        fifo_req, fifo_rd_en, ravens_pkt );
  input [63:0] fifo_event;
  input [44:0] time_us;
  output [31:0] ravens_pkt;
  input clk, rst_n, fifo_grant;
  output fifo_req, fifo_rd_en;
  wire   new_spike, sent_spike, \next_fsm_state[0] , net227, n51, n52, n54,
         n55, \ravens_pkt[0] ;
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
  assign ravens_pkt[31] = \ravens_pkt[0] ;
  assign ravens_pkt[28] = \ravens_pkt[0] ;
  assign ravens_pkt[27] = \ravens_pkt[0] ;
  assign ravens_pkt[26] = \ravens_pkt[0] ;
  assign ravens_pkt[25] = \ravens_pkt[0] ;
  assign ravens_pkt[24] = \ravens_pkt[0] ;
  assign ravens_pkt[23] = \ravens_pkt[0] ;
  assign ravens_pkt[22] = \ravens_pkt[0] ;
  assign ravens_pkt[21] = \ravens_pkt[0] ;
  assign ravens_pkt[20] = \ravens_pkt[0] ;
  assign ravens_pkt[19] = \ravens_pkt[0] ;
  assign ravens_pkt[18] = \ravens_pkt[0] ;
  assign ravens_pkt[17] = \ravens_pkt[0] ;
  assign ravens_pkt[16] = \ravens_pkt[0] ;
  assign ravens_pkt[15] = \ravens_pkt[0] ;
  assign ravens_pkt[14] = \ravens_pkt[0] ;
  assign ravens_pkt[13] = \ravens_pkt[0] ;
  assign ravens_pkt[4] = \ravens_pkt[0] ;
  assign ravens_pkt[3] = \ravens_pkt[0] ;
  assign ravens_pkt[2] = \ravens_pkt[0] ;
  assign ravens_pkt[1] = \ravens_pkt[0] ;
  assign ravens_pkt[0] = \ravens_pkt[0] ;

  dvs_event_to_ravens_spike DVS_EVENT_TO_RAVENS_SPIKE_INST ( .dvs_event({
        \ravens_pkt[0] , dvs_event[62:55], \ravens_pkt[0] , \ravens_pkt[0] , 
        dvs_event[52:46], \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] }), .ravens_spike({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
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
        .ravens_spike({\ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        ravens_spike[12:5], \ravens_pkt[0] , \ravens_pkt[0] , \ravens_pkt[0] , 
        \ravens_pkt[0] , \ravens_pkt[0] }), .time_us(time_us), .sent_spike(
        sent_spike), .rdy_for_next_spike(fifo_req), .ravens_pkt({
        SYNOPSYS_UNCONNECTED__24, ravens_pkt[30:29], SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, ravens_pkt[12:5], SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45}) );
  SNPS_CLOCK_GATE_HIGH_dvs_event_to_ravens clk_gate_dvs_event_reg ( .CLK(clk), 
        .EN(n52), .ENCLK(net227) );
  ffrhq_x1 \dvs_event_reg[1]  ( .D(fifo_event[1]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[1]) );
  ffrhq_x1 \dvs_event_reg[0]  ( .D(fifo_event[0]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[0]) );
  ffr_x1 \dvs_event_reg[48]  ( .D(fifo_event[48]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[48]) );
  ffr_x1 \dvs_event_reg[32]  ( .D(fifo_event[32]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[32]) );
  ffr_x1 \dvs_event_reg[17]  ( .D(fifo_event[17]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[17]) );
  ffr_x1 \cur_fsm_state_reg[0]  ( .D(\next_fsm_state[0] ), .CLK(clk), .RSTN(
        rst_n), .Q(cur_fsm_state[0]) );
  ffr_x1 \cur_fsm_state_reg[1]  ( .D(fifo_rd_en), .CLK(clk), .RSTN(rst_n), .Q(
        cur_fsm_state[1]) );
  ffr_x1 \dvs_event_reg[62]  ( .D(fifo_event[62]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[62]) );
  ffr_x1 \dvs_event_reg[61]  ( .D(fifo_event[61]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[61]) );
  ffr_x1 \dvs_event_reg[60]  ( .D(fifo_event[60]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[60]) );
  ffr_x1 \dvs_event_reg[59]  ( .D(fifo_event[59]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[59]) );
  ffr_x1 \dvs_event_reg[58]  ( .D(fifo_event[58]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[58]) );
  ffr_x1 \dvs_event_reg[57]  ( .D(fifo_event[57]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[57]) );
  ffr_x1 \dvs_event_reg[56]  ( .D(fifo_event[56]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[56]) );
  ffr_x1 \dvs_event_reg[55]  ( .D(fifo_event[55]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[55]) );
  ffr_x1 \dvs_event_reg[52]  ( .D(fifo_event[52]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[52]) );
  ffr_x1 \dvs_event_reg[51]  ( .D(fifo_event[51]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[51]) );
  ffr_x1 \dvs_event_reg[50]  ( .D(fifo_event[50]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[50]) );
  ffr_x1 \dvs_event_reg[49]  ( .D(fifo_event[49]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[49]) );
  ffr_x1 \dvs_event_reg[47]  ( .D(fifo_event[47]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[47]) );
  ffr_x1 \dvs_event_reg[46]  ( .D(fifo_event[46]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[46]) );
  ffr_x1 \dvs_event_reg[44]  ( .D(fifo_event[44]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[44]) );
  ffr_x1 \dvs_event_reg[43]  ( .D(fifo_event[43]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[43]) );
  ffr_x1 \dvs_event_reg[42]  ( .D(fifo_event[42]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[42]) );
  ffr_x1 \dvs_event_reg[41]  ( .D(fifo_event[41]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[41]) );
  ffr_x1 \dvs_event_reg[40]  ( .D(fifo_event[40]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[40]) );
  ffr_x1 \dvs_event_reg[39]  ( .D(fifo_event[39]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[39]) );
  ffr_x1 \dvs_event_reg[38]  ( .D(fifo_event[38]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[38]) );
  ffr_x1 \dvs_event_reg[37]  ( .D(fifo_event[37]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[37]) );
  ffr_x1 \dvs_event_reg[36]  ( .D(fifo_event[36]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[36]) );
  ffr_x1 \dvs_event_reg[35]  ( .D(fifo_event[35]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[35]) );
  ffr_x1 \dvs_event_reg[34]  ( .D(fifo_event[34]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[34]) );
  ffr_x1 \dvs_event_reg[33]  ( .D(fifo_event[33]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[33]) );
  ffr_x1 \dvs_event_reg[31]  ( .D(fifo_event[31]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[31]) );
  ffr_x1 \dvs_event_reg[30]  ( .D(fifo_event[30]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[30]) );
  ffr_x1 \dvs_event_reg[29]  ( .D(fifo_event[29]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[29]) );
  ffr_x1 \dvs_event_reg[28]  ( .D(fifo_event[28]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[28]) );
  ffr_x1 \dvs_event_reg[27]  ( .D(fifo_event[27]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[27]) );
  ffr_x1 \dvs_event_reg[26]  ( .D(fifo_event[26]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[26]) );
  ffr_x1 \dvs_event_reg[25]  ( .D(fifo_event[25]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[25]) );
  ffr_x1 \dvs_event_reg[24]  ( .D(fifo_event[24]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[24]) );
  ffr_x1 \dvs_event_reg[23]  ( .D(fifo_event[23]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[23]) );
  ffr_x1 \dvs_event_reg[22]  ( .D(fifo_event[22]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[22]) );
  ffr_x1 \dvs_event_reg[21]  ( .D(fifo_event[21]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[21]) );
  ffr_x1 \dvs_event_reg[20]  ( .D(fifo_event[20]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[20]) );
  ffr_x1 \dvs_event_reg[19]  ( .D(fifo_event[19]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[19]) );
  ffr_x1 \dvs_event_reg[18]  ( .D(fifo_event[18]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[18]) );
  ffr_x1 \dvs_event_reg[16]  ( .D(fifo_event[16]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[16]) );
  ffr_x1 \dvs_event_reg[15]  ( .D(fifo_event[15]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[15]) );
  ffr_x1 \dvs_event_reg[14]  ( .D(fifo_event[14]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[14]) );
  ffr_x1 \dvs_event_reg[13]  ( .D(fifo_event[13]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[13]) );
  ffr_x1 \dvs_event_reg[12]  ( .D(fifo_event[12]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[12]) );
  ffr_x1 \dvs_event_reg[11]  ( .D(fifo_event[11]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[11]) );
  ffr_x1 \dvs_event_reg[10]  ( .D(fifo_event[10]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[10]) );
  ffr_x1 \dvs_event_reg[9]  ( .D(fifo_event[9]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[9]) );
  ffr_x1 \dvs_event_reg[8]  ( .D(fifo_event[8]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[8]) );
  ffr_x1 \dvs_event_reg[7]  ( .D(fifo_event[7]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[7]) );
  ffr_x1 \dvs_event_reg[6]  ( .D(fifo_event[6]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[6]) );
  ffr_x1 \dvs_event_reg[5]  ( .D(fifo_event[5]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[5]) );
  ffr_x1 \dvs_event_reg[4]  ( .D(fifo_event[4]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[4]) );
  ffr_x1 \dvs_event_reg[3]  ( .D(fifo_event[3]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[3]) );
  ffr_x1 \dvs_event_reg[2]  ( .D(fifo_event[2]), .CLK(net227), .RSTN(rst_n), 
        .Q(dvs_event[2]) );
  ffr_x1 new_spike_reg ( .D(n51), .CLK(clk), .RSTN(rst_n), .Q(new_spike) );
  tielo U10 ( .L(\ravens_pkt[0] ) );
  inv_x1 U11 ( .A(cur_fsm_state[1]), .Y(n55) );
  and2_x1 U12 ( .A(cur_fsm_state[0]), .B(n55), .Y(fifo_rd_en) );
  nor3b_x1 U13 ( .AN(fifo_grant), .B(cur_fsm_state[0]), .C(cur_fsm_state[1]), 
        .Y(\next_fsm_state[0] ) );
  nor2_x1 U14 ( .A(cur_fsm_state[0]), .B(n55), .Y(n52) );
  inv_x1 U15 ( .A(new_spike), .Y(n54) );
  oai22_x1 U16 ( .A0(cur_fsm_state[0]), .A1(n55), .B0(sent_spike), .B1(n54), 
        .Y(n51) );
endmodule


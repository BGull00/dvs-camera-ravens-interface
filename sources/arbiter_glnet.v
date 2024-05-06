/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Mon May  6 01:33:51 2024
/////////////////////////////////////////////////////////////


module dvs_ravens_arbiter ( req_m1, req_m2, fifo_empty, fifo_full, grant_m1, 
        grant_m2 );
  input req_m1, req_m2, fifo_empty, fifo_full;
  output grant_m1, grant_m2;


  nor2b_x1 U3 ( .AN(req_m1), .B(fifo_full), .Y(grant_m1) );
  nor3b_x1 U4 ( .AN(req_m2), .B(fifo_empty), .C(req_m1), .Y(grant_m2) );
endmodule


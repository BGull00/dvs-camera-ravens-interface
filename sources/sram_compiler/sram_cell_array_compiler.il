
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; #####################################
; # SRAM Compiler                     #
; # sram_cell_array_compiler.il       #
; # University of Tennessee Knoxville #
; # Md Badruddoja Majumder            #
; # 2020                              #
; #####################################
; 
; ###################
; # v0.1 - 20200921 #
; ###################
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


procedure(create_cell_array(M,N)
dbD_tx = dbOpenCellViewByType("sram_cells" "sram_cell_6t_3" "layout" "maskLayout" "r")
dbD_tx1 = dbOpenCellViewByType("sram_logic" "sram_cell_array_compiler" "layout" "maskLayout" "w")
;M=8
;N=8
xp=0
yp=0
for(i 0 M-1
	for(j 0 N-1
		xps=xp+j*1.2
		yps=yp-(i/2)*3.23
		if(mod(i,2)==0 then
			orient="R0"
		else
			orient="MX"
		)
		dbCreateInst(dbD_tx1 dbD_tx strcat("test" sprintf(nil "%d_%d" i,j)) xps:yps orient 1)
	)
)
dbClose(dbD_tx)
dbSave(dbD_tx1)
dbClose(dbD_tx1)
)
/*
xp=0
yps=0
orient="R0"

i=0
dbCreateInst(dbD_tx1 dbD_tx strcat("test" sprintf(nil "%d" i)) xp:yps orient 1)

yps=0
orient="MX"
i=1
dbCreateInst(dbD_tx1 dbD_tx strcat("test" sprintf(nil "%d" i)) xp:yps orient 1)

xp=0
yps=-3.23
orient="R0"

i=2
dbCreateInst(dbD_tx1 dbD_tx strcat("test" sprintf(nil "%d" i)) xp:yps orient 1)

xp=1.2
yps=0
orient="R0"

i=3
dbCreateInst(dbD_tx1 dbD_tx strcat("test" sprintf(nil "%d" i)) xp:yps orient 1)
*/

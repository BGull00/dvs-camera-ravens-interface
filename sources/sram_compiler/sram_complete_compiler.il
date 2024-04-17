
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; #####################################
; # SRAM Compiler                     #
; # sram_complete_compiler.il         #
; # University of Tennessee Knoxville #
; # Md Badruddoja Majumder            #
; #   John Murray                     #
; # 2020                              #
; #####################################
; 
; ####################
; # v0.32 - 20201121 #
; ####################
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


procedure(via_M2_M1_gen(cv_id,M1_wid,M2_wid,x,y)
	sp=0.04
	vs=0.13
	vw=0.1
	P=floor((M2_wid-sp*2+vs)/(vs+vw));number of via in each horizontal layer
	sp_x=(M2_wid-P*vw-(P-1)*vs)/2
	Q=floor((M1_wid-sp*2+vs)/(vs+vw));number of horizontal layer
	sp_y=(M1_wid-Q*vw-(Q-1)*vs)/2
	pitch=vs+vw
	
	for(i 0 Q-1
		for(j 0 P-1
			xs1=x+sp_x+j*pitch
			ys1=y+sp_y+i*pitch
			xs2=xs1+vw
			ys2=ys1+vw
			dbCreateRect(cv_id list("V1" "drawing") list(xs1:ys1 xs2:ys2))
		)
	)
)
procedure(via_M2_M1_gen_special(cv_id,M1_wid,M2_wid,x,y)
	sp_x=0.04
	sp_y=0
	vs=0.13
	vw=0.1
	P=floor((M2_wid-sp_x*2+vs)/(vs+vw));number of via in each horizontal layer
	sp_x=(M2_wid-P*vw-(P-1)*vs)/2
	Q=floor((M1_wid-sp_y*2+vs)/(vs+vw));number of horizontal layer
	sp_y=(M1_wid-Q*vw-(Q-1)*vs)/2
	pitch=vs+vw
	
	for(i 0 Q-1
		for(j 0 P-1
			xs1=x+sp_x+j*pitch
			ys1=y+sp_y+i*pitch
			xs2=xs1+vw
			ys2=ys1+vw
			dbCreateRect(cv_id list("V1" "drawing") list(xs1:ys1 xs2:ys2))
		)
	)
)

procedure(via_M2_M1_gen_vertical(cv_id,M1_wid,M2_wid,x,y)
	sp_x=0
	sp_y=0.04
	vs=0.13
	vw=0.1
	P=floor((M2_wid-sp_x*2+vs)/(vs+vw));number of via in each horizontal layer
	sp_x=(M2_wid-P*vw-(P-1)*vs)/2
	Q=floor((M1_wid-sp_y*2+vs)/(vs+vw));number of horizontal layer
	sp_y=(M1_wid-Q*vw-(Q-1)*vs)/2
	pitch=vs+vw
	
	for(i 0 Q-1
		for(j 0 P-1
			xs1=x+sp_x+j*pitch
			ys1=y+sp_y+i*pitch
			xs2=xs1+vw
			ys2=ys1+vw
			dbCreateRect(cv_id list("V1" "drawing") list(xs1:ys1 xs2:ys2))
		)
	)
)

procedure(via_M2_M1_main_top(cv_id,M1_wid,M2_wid,x,y)
	M1_enc_LR=0.04;M1 enclosure across left and right
	if(M1_wid<0.1 then
		M1_enc_TB=0.04 ; via enclosure in top bottom overlaps with horizontal M1 routing
	else
		M1_enc_TB=(M1_wid-0.1)/2 ; via enclosure in top bottom overlaps with horizontal M1 routing
	)
	M2_enc_LR=0
	M2_enc_TB=0.04
	dbCreateRect(cv_id list("V1" "drawing") list(x-0.05:y-0.05 x+0.05:y+0.05))
	dbCreateRect(cv_id list("M1" "drawing") list(x-0.05-M1_enc_LR:y-0.05-M1_enc_TB x+0.05+M1_enc_LR:y+0.05+M1_enc_TB))
	dbCreateRect(cv_id list("M2" "drawing") list(x-0.05-M2_enc_LR:y-0.05-M2_enc_TB x+0.05+M2_enc_LR:y+0.05+M2_enc_TB))
	
)		
		


/*
;;receiving parameter from python
childPID=ipcBeginProcess("/home/mmajumde/cadence/ravens/tsmc65_libs/SRAM_COMPILER/sram_complete_compiler.py")
ipcWaitForProcess(childPID)
command=ipcReadProcess(childPID 1)
ipcKillProcess(childPID)
println(command)
*/

M=512
N=512
wordSize=8; # of bit in each address
mx_inp=N/wordSize
arrayHeight=(M-2)/2*3.23+1.95

mx_layer=N/mx_inp
rowBits=int(log(M)/log(2))
colBits=int(ceiling(log(mx_inp)/log(2)))
pitch=1.3 ;decoder nand-inv pitch

nWL_row=int(log(M)/log(2))
nWL_col=int(log(mx_inp)/log(2))
row_colDecOffset=(nWL_row-nWL_col)*pitch*4
pitch_addr=0.3; pitch of vertical address lines

;origin for instances
x=0
y=0

xs=x-0.265-1.54-(4*(rowBits-1)+4-1)*pitch
ys=y+0.475-0.01

;calculating adjustment offset for NP,PP,NW layers for decoder and invDecoders
if(rowBits>colBits then
	layerOff1=0.23+(rowBits-1)*0.6+0.23
	layerOff2=layerOff1+(rowBits-colBits)*pitch*4
	layerOff3=0
	layerOff4=layerOff2-(colBits-1)*0.6-0.62+0.16
else
	layerOff2=0.23+(colBits-1)*0.6+0.23
	layerOff1=layerOff2+(colBits-rowBits)*pitch*4
	layerOff4=0
	layerOff3=layerOff1-(rowBits-1)*0.6-0.62+0.16
)

ori_invCol=xs+row_colDecOffset-(0.26+(2*colBits-1)*pitch_addr+0.06)
println("origin of RowDecoder")
println(ys)
;layerOffRight=0
layerOffRight= x-0.265-(ori_invCol+(colBits-1)*0.6+0.8);extending right NP,PP, NW layers for invCol 
;;instantiating all building block instances
load("/home/mmajumde/cadence/ravens/tsmc65_libs/SRAM_COMPILER/decoder_layout_new.il")
;instantiating row decoder

create_rowDecoder(rowBits,layerOff1)
;instantiating col decoder
create_colDecoder(colBits,layerOff2)

;instantiating sram cell array
load("/home/mmajumde/cadence/ravens/tsmc65_libs/SRAM_COMPILER/sram_cell_array_compiler.il")
create_cell_array(M,N)

;instantiating column mux
;load("/home/mmajumde/cadence/ravens/tsmc65_libs/SRAM_COMPILER/columnMux_layout.il")
load("/home/mmajumde/cadence/ravens/tsmc65_libs/SRAM_COMPILER/columnMux_layout_mod.il")
create_column_mux(N,mx_inp)

;instantiating inv Decoder
load("/home/mmajumde/cadence/ravens/tsmc65_libs/SRAM_COMPILER/invDecoder_compiler.il")
dbD_tx = dbOpenCellViewByType("sram_logic" "invDecoderRow_compiler" "layout" "maskLayout" "w")
createInvRow(dbD_tx,rowBits,layerOff3)
dbD_tx = dbOpenCellViewByType("sram_logic" "invDecoderCol_compiler" "layout" "maskLayout" "w")
reverse=mod(mx_inp/4,2) ;orientation of GND and PWR rail of invCol
/*
if(M<8 then ;M=4
	reverse=mod(reverse+1,2)
)
*/
createInvCol(dbD_tx,colBits,reverse,layerOff4,layerOffRight)


dbD_cellArray = dbOpenCellViewByType("sram_logic" "sram_cell_array_compiler" "layout" "maskLayout" "r")
dbD_rowDecoder = dbOpenCellViewByType("sram_logic" "rowDecoder_compiler1" "layout" "maskLayout" "r")
dbD_colDecoder = dbOpenCellViewByType("sram_logic" "colDecoder_compiler1" "layout" "maskLayout" "r")
dbD_columnMux = dbOpenCellViewByType("sram_logic" "columnMux" "layout" "maskLayout" "r")
dbD_writeDriver=  dbOpenCellViewByType("sram_logic" "write_driver_compiler" "layout" "maskLayout" "r")
dbD_senseAmp=  dbOpenCellViewByType("sram_logic" "sense_amp_clocked_compiler" "layout" "maskLayout" "r")
dbD_precharge= dbOpenCellViewByType("sram_logic" "precharge_compiler" "layout" "maskLayout" "r")
dbD_invRow= dbOpenCellViewByType("sram_logic" "invDecoderRow_compiler" "layout" "maskLayout" "r")
dbD_invCol= dbOpenCellViewByType("sram_logic" "invDecoderCol_compiler" "layout" "maskLayout" "r")
dbD_invClk= dbOpenCellViewByType("sram_logic" "inverter_compiler" "layout" "maskLayout" "r")
dbD_sram = dbOpenCellViewByType("sram_logic" "sram_complete_compiler" "layout" "maskLayout" "w")


x=0
y=0

xs=x-0.265-1.54-(4*(rowBits-1)+4-1)*pitch
ys=y+0.475-0.01

dbCreateInst(dbD_sram dbD_cellArray "cellArray" x:y "R0" 1)


;xs=x-20+3.9-0.005



dbCreateInst(dbD_sram dbD_rowDecoder "rowDecoder" xs:ys "R0" 1)
pitch_addr=0.3; pitch of vertical address lines
xss=xs-(0.26+(2*rowBits-1)*pitch_addr+0.06)
;xss=xs-1.86+0.04
xsr=xss
yss=y+1.615+0.69+0.34
ysr=yss
;row decoder inverter
M1_w_row=0.18 ; M1 width of addr# lines which have input pins placed on them
M1_s_row=0.16 ; M1 space of addr# lines which have input pins placed on them
M1_p_row=M1_s_row+M1_w_row

p2nGap_row=rowBits*M1_w_row+(rowBits+1)*M1_s_row+0.32
dbCreateInst(dbD_sram dbD_invRow "invRow" xss:yss "MX" 1)


decoder_height=6.46; needed to estimate the origin of column decoder placement
decoder_layer=M/4

ys=ys-decoder_layer*decoder_height
dbCreateInst(dbD_sram dbD_colDecoder "colDecoder" xs+row_colDecOffset:ys "R0" 1)


;;col inverter info
M1_w_col=0.18 ; M1 width of addr# lines which have input pins placed on them
M1_s_col=0.16 ; M1 space of addr# lines which have input pins placed on them
M1_p_col=M1_s_col+M1_w_col
pwr_con=0.68

p2nGap=colBits*M1_w_col+(colBits+1)*M1_s_col+0.32
p2nGap_col=p2nGap

tran2pwr=0.21
;xss=xs+row_colDecOffset-1.26+0.04
xss=xs+row_colDecOffset-(0.26+(2*colBits-1)*pitch_addr+0.06)

xsc=xss
yss=ys-p2nGap-4.97-tran2pwr-pwr_con-0.24-6.46*(mx_inp/4-1)
ysc=yss
if(reverse==1 then
	ysc_sp=yss
	dbCreateInst(dbD_sram dbD_invCol "invCol" xss:yss "MX" 1)
else
	yss1=ys-4.97-tran2pwr-pwr_con-0.48-6.46*(mx_inp/4-1)
	ysc_sp=yss1
	dbCreateInst(dbD_sram dbD_invCol "invCol" xss:yss1 "R0" 1)
	
)



intra_bit=0.33
inter_bit=0.67-0.26
trans_pitch=0.27+0.1*2+intra_bit+inter_bit-0.01
pitch_layer=trans_pitch*mx_inp
mx_inp_half=mx_inp/2
;colDecHeight=1.28+mx_inp_half*0.53+(mx_inp_half-1)*2.52+0.5
colDecHeight=0.975+0.61*mx_inp_half+2.62*(mx_inp_half-1)+1.28
;ys=y-arrayHeight-colDecHeight-0.465-0.27
ys=y-arrayHeight-colDecHeight
xs=x-0.26+0.335+0.05                                                  ; to move the whole colummux in x axis (added 0.05) (HD)
dbCreateInst(dbD_sram dbD_columnMux "columnMux" xs:ys "R0" 1)
ys=ys-3.96+0.12


;; Create write_en pin
xv1=xs+2.925
xv2=xv1+0.18
yv1=ys+0.80
yv2=yv1+0.18
; Performed in loop now
; ; Create M1 shape for DFM sized M1-M2 via to land on
; fig=dbCreateRect(dbD_sram list("M1" "drawing") list(xv1:yv1 xv2:yv2))
; Create pin shape and label
net=dbMakeNet(dbD_sram "write_en")
fig=dbCreateRect(dbD_sram list("M1" "pin") list(xv1:yv1 xv2:yv2))
trm=dbCreateTerm(net "write_en" "input")
pin=dbCreatePin(net fig "write_en")
dbCreateLabel(dbD_sram list("M1" "label") (xv1+0.18/2):(yv1+0.18/2) "write_en" "centerCenter" "R0" "roman" 0.05)


; Create write_driver_
for(i 0 mx_layer-1
	xs=x+i*pitch_layer
	dbCreateInst(dbD_sram dbD_writeDriver strcat("writeDriver" sprintf(nil "%d" i)) xs:ys "R0" 1)

  ;; Create M1-M3 stack and landing pad for din# inputs
  xv1=xs-0.290 ; xv1=(x-0.26+0.335)-val [x=0], want xv1=-0.315, val=-0.39
  xv2=xv1+0.23 ; xv2=xv1+0.23

  ; yv1=((y-arrayHeight-colDecHeight)-3.96+0.12)+val
  ;    arrayHeight=(M-2)/2*3.23+1.95
  ;    colDecHeight=0.975+0.61*((N/wordSize)/2)+2.62*(((N/wordSize)/2)-1)+1.28
  ; want yv1=0.595 from write_driver_compiler cell origin
  yv1=ys+0.57 ; yv1=(write_driver_compiler cell origin)+0.57
  yv2=yv1+0.23 ; yv2=yv1+0.23 =0.825

  ; Create M1 base
  dbCreateRect(dbD_sram list("M1" "drawing") list(xv1:yv1 xv2:yv2))    
  ; Create M2 layer
  dbCreateRect(dbD_sram list("M2" "drawing") list(xv1:yv1 xv2:yv2))
  ; Create M3 pad
  dbCreateRect(dbD_sram list("M3" "drawing") list(xv1:yv1 xv2:yv2))
  ; Via stack is enclosed on all sides by 0.065
  din_via_stack_enc=0.065
  ; Create M1-M2 connection with V1
  dbCreateRect(dbD_sram list("V1" "drawing")
    list(xv1+din_via_stack_enc:yv1+din_via_stack_enc 
         xv2-din_via_stack_enc:yv2-din_via_stack_enc
     )
  )
  ; Create M2-M3 connection with V2
  dbCreateRect(dbD_sram list("V2" "drawing")
    list(xv1+din_via_stack_enc:yv1+din_via_stack_enc 
         xv2-din_via_stack_enc:yv2-din_via_stack_enc
     )
  )

  ; Create pin shape and label
  net=dbMakeNet(dbD_sram strcat("din" sprintf(nil "%d" i)))
  fig=dbCreateRect(dbD_sram list("M3" "pin") list(xv1:yv1 xv2:yv2))
  trm=dbCreateTerm(net strcat("din" sprintf(nil "%d" i)) "input")
  pin=dbCreatePin(net fig strcat("din" sprintf(nil "%d" i)))
  dbCreateLabel(dbD_sram list("M3" "label") (xv1+0.23/2):(yv1+0.23/2) strcat("din" sprintf(nil "%d" i)) "centerCenter" "R0" "roman" 0.05)


  xv1_write_en_m1=xs+3.00 +0.05    ; 0.18*0.18 M1 layer moved in x axis (0.05) (HD)
  xv2_write_en_m1=xv1_write_en_m1+0.18 
  yv1_write_en_m1=ys+0.80
  yv2_write_en_m1=yv1_write_en_m1+0.18 
  ; Create M1 shape for DFM sized M1-M2 via to land on for write_en connections
  fig=dbCreateRect(dbD_sram list("M1" "drawing") list(xv1_write_en_m1:yv1_write_en_m1 xv2_write_en_m1:yv2_write_en_m1))


	;connect clk across all instances
	if(i==0 then
		dbCreateRect(dbD_sram list("M1" "drawing") list(xs-4.925:ys+1.07 xs:ys+1.07+.09))
		via_M2_M1_main_top(dbD_sram,.09,0.1,xs-4.925+0.1/2,ys+1.07+0.09/2)
	)
	if(i<mx_layer-1 then
	dbCreateRect(dbD_sram list("M1" "drawing") list(xs+2.7:ys+1.07 xs+pitch_layer-0.45:ys+1.07+.09))
	;connect sense_en across all instances
	dbCreateRect(dbD_sram list("M1" "drawing") list(xs+3:ys+0.89 xs+pitch_layer:ys+0.89+.09))
	
	;;extending NP,PP, NW layers to close the gap
	dbCreateRect(dbD_sram list("JX" "drawing") list(xs+4.925:ys+2.2 xs+pitch_layer-0.265:ys+2.2+2.23))
	dbCreateRect(dbD_sram list("JZ" "drawing") list(xs+4.925:ys+1.8 xs+pitch_layer-0.265:ys+2.2))
	dbCreateRect(dbD_sram list("JX" "drawing") list(xs+4.925:ys+0.95 xs+pitch_layer-0.265:ys+1.8))
	dbCreateRect(dbD_sram list("JZ" "drawing") list(xs+4.925:ys-0.43 xs+pitch_layer-0.265:ys+0.95))
	dbCreateRect(dbD_sram list("NW" "drawing") list(xs+4.925:ys-1.06 xs+pitch_layer-0.265:ys+0.95))
	;extending pwr  and vdd lines to close the gap
	;GND
	dbCreateRect(dbD_sram list("M1" "drawing") list(xs+4:ys+1.82 xs+pitch_layer+0.2:ys+2.18))
	dbCreateRect(dbD_sram list("RX" "drawing") list(xs+4:ys+1.82 xs+pitch_layer+0.2:ys+2.18))
	
	;VDD
	dbCreateRect(dbD_sram list("M1" "drawing") list(xs+4:ys-0.81 xs+pitch_layer+0.2:ys-0.45))
	dbCreateRect(dbD_sram list("RX" "drawing") list(xs+4:ys-0.81 xs+pitch_layer+0.2:ys-0.45))
	
	;dbCreateRect(dbD_sram list("RX" "drawing") list(-0.585:-11.315 -10.985:-11.295))   ;  to cover the gap of  RX in between row and column decoder (HD)	
	
	)

	if(M==256 then

	dbCreateRect(dbD_sram list("M1" "drawing") list(-50.925:6.975 -42.165:7.175)))      ;  to cover the gap of  M1 btwn invdecrow_compiler and global gnd, when NROWS==256 (HD)
) 




println("checking")
decoder_height=6.46; needed to estimate the origin of column decoder placement

xs=x+0.075+0.32
xsen=xs
ys=ys-(1.82+0.81)
ysen=ys
pitch_sense=pitch_layer


;;pin placement for sense_en
	xv1=xs-0.425
	xv2=xv1+0.36
	yv1=ys+0.54
	yv2=yv1+0.12
	net=dbMakeNet(dbD_sram "sense_en")
	fig=dbCreateRect(dbD_sram list("M1" "pin") list(xv1:yv1 xv2:yv2))
	trm=dbCreateTerm(net "sense_en" "input")
	pin=dbCreatePin(net fig "sense_en")
	dbCreateLabel(dbD_sram list("M1" "label") (xv1+0.18/2):(yv1+M1_w/2) "sense_en" "centerLeft" "R0" "roman" 0.05)
		

for(i 0 mx_layer-1
	dbCreateInst(dbD_sram dbD_senseAmp strcat("senseAmp" sprintf(nil "%d" i)) xs:ys "MX" 1)
	
	;;pin placement for dout
	xv1=xs-0.425
	xv2=xv1+0.36
	yv1=ys+0.85
	yv2=yv1+0.12
	net=dbMakeNet(dbD_sram strcat("dout" sprintf(nil "%d" i)))
	fig=dbCreateRect(dbD_sram list("M1" "pin") list(xv1:yv1 xv2:yv2))
	trm=dbCreateTerm(net strcat("dout" sprintf(nil "%d" i)) "output")
	pin=dbCreatePin(net fig strcat("dout" sprintf(nil "%d" i)))
	dbCreateLabel(dbD_sram list("M1" "label") (xv1+0.18/2):(yv1+M1_w/2) strcat("dout" sprintf(nil "%d" i)) "centerLeft" "R0" "roman" 0.05)
		
		
	if(i<mx_layer-1 then
	;;extending NP,PP, NW layers to close the gap
	dbCreateRect(dbD_sram list("JX" "drawing") list(xs-0.355+2.725:ys+1.13+0.67 xs+pitch_layer-0.305:ys+1.13+0.67+0.4))
	dbCreateRect(dbD_sram list("NW" "drawing") list(xs-0.355+2.725:ys+1.13+0.67-0.23 xs+pitch_layer-0.305:ys+1.13+0.67+0.4+0.23))
	dbCreateRect(dbD_sram list("JZ" "drawing") list(xs-0.355+2.725:ys+1.13-0.52 xs+pitch_layer-0.305:ys+1.13+0.67))
	dbCreateRect(dbD_sram list("JX" "drawing") list(xs-0.355+2.725:ys+1.13-1.56 xs+pitch_layer-0.305:ys+1.13-0.52))
	dbCreateRect(dbD_sram list("JZ" "drawing") list(xs-0.355+2.725:ys+1.13-1.56-0.4 xs+pitch_layer-0.305:ys+1.13-1.56))
	;extending GND rail to close gap
	dbCreateRect(dbD_sram list("M1" "drawing") list(xs+2.2:ys-0.81 xs+pitch_layer-0.37:ys-0.45))
	dbCreateRect(dbD_sram list("RX" "drawing") list(xs+2.2:ys-0.81 xs+pitch_layer-0.37:ys-0.45))
	;shorting sense_en signal across all instances 
	dbCreateRect(dbD_sram list("M1" "drawing") list(xs+0.45:ys+0.54 xs+pitch_layer-0.40:ys+0.54+0.12)))
	xs=xs+pitch_layer
) 

pitch_precharge=1.2
xinit=x+0.335-0.27
xpre=xinit
ys=y+1.73+0.445
ypre=ys

;global clk connection
for(i 0 N-1
	xs=xinit+i*pitch_precharge
	println(xs)
	dbCreateInst(dbD_sram dbD_precharge strcat("precharge" sprintf(nil "%d" i)) xs:ys "R0" 1)
) 



;;Power Routing

;reference point for drawing power rails 
if(rowBits>colBits then
	xpwr=xsr
	ypwr=ysr
else
	xpwr=xsc
	ypwr=ysc
	
)

pwr_wid=1
pwr_space=1

;creating left vertical PWR and GND strip
dbCreateRect(dbD_sram list("M2" "drawing") list(xpwr-2:ysc-5-5.45 xpwr-2+pwr_wid:ysr+3))
dbCreateRect(dbD_sram list("M2" "drawing") list(xpwr-pwr_space-pwr_wid-2:ysc-5 xpwr-pwr_space-pwr_wid-2+pwr_wid:ysr+3+4.25))

;connecting GND rail of invRow
x1=xpwr-pwr_space-pwr_wid-2
y1=ysr+p2nGap_row+0.45
x2=xsr+(rowBits-1)*0.6+0.5
y2=y1+0.68
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
via_M2_M1_gen(dbD_sram,0.68,pwr_wid,x1,y1)

;connecting PWR rail of rowDecoder
pitch_decVDD=12.92; pitch of VDD rail of decoder
for(i 0 (M/8)
x1=xpwr-2
y1=ysr-1.37-i*pitch_decVDD
x2=xsr+0.06+pitch_addr*2*rowBits+0.20
y2=y1+0.68
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
via_M2_M1_gen(dbD_sram,0.68,pwr_wid,x1,y1)
)

;connecting GND rail of rowDecoder
/*
if(M==4 then
	range_GND=0
else
	range_GND=(M/8)-1
)
*/	
for(i 0 (M/8)-1
x1=xpwr-2-pwr_space-pwr_wid
y1=ysr-7.83-i*pitch_decVDD
x2=xsr+0.06+pitch_addr*2*rowBits+0.20
y2=y1+0.68
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
via_M2_M1_gen(dbD_sram,0.68,pwr_wid,x1,y1)
)

if(reverse==1 then
	;connecting PWR rail of invCol
	x1=xpwr-2
	y1=ysc-1.37
	x2=xsc
	y2=y1+0.68
	dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
	via_M2_M1_gen(dbD_sram,0.68,pwr_wid,x1,y1)
	
	;connecting GND rail of colDecoder
	pitch_decVDD=12.92; pitch of VDD rail of decoder
	for(i 0 (mx_inp/4-1)
		x1=xpwr-pwr_space-pwr_wid-2
		y1=ysc+p2nGap+0.45+i*pitch_decVDD
		x2=xsc+0.6+pitch_addr*(2*colBits-1)+0.48
		y2=y1+0.68
		dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
		via_M2_M1_gen(dbD_sram,0.68,pwr_wid,x1,y1)
	)

	;connecting  PWR rail of colDecoder
	pitch_decVDD=12.92; pitch of VDD rail of decoder
	for(i 0 (mx_inp/4-2)
		x1=xpwr-2
		y1=ysc+p2nGap+0.45+6.46+i*pitch_decVDD
		x2=xsc+0.6+pitch_addr*(2*colBits-1)+0.48
		y2=y1+0.68
		dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
		via_M2_M1_gen(dbD_sram,0.68,pwr_wid,x1,y1)
	)
else
	;connecting GND rail of invCol
	x1=xpwr-pwr_space-pwr_wid-2
	y1=ysc-1.37
	x2=xsc
	y2=y1+0.68
	dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
	via_M2_M1_gen(dbD_sram,0.68,pwr_wid,x1,y1)
	
	;connecting PWR rail of colDecoder
	pitch_decVDD=12.92; pitch of VDD rail of decoder
	for(i 0 (mx_inp/4-1)
		x1=xpwr-2
		y1=ysc+p2nGap+0.45+i*pitch_decVDD
		x2=xsc+0.6+pitch_addr*(2*colBits-1)+0.48
		y2=y1+0.68
		dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
		via_M2_M1_gen(dbD_sram,0.68,pwr_wid,x1,y1)
	)

	;connecting  GND rail of colDecoder
	pitch_decVDD=12.92; pitch of VDD rail of decoder
	for(i 0 (mx_inp/4-2)
		x1=xpwr-pwr_space-pwr_wid-2
		y1=ysc+p2nGap+0.45+6.46+i*pitch_decVDD
		x2=xsc+0.6+pitch_addr*(2*colBits-1)+0.48
		y2=y1+0.68
		dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
		via_M2_M1_gen(dbD_sram,0.68,pwr_wid,x1,y1)
	)
)



;creating right vertical PWR and GND strip
x1=xpre+(N-1)*pitch_precharge+3
y2=ypre+3
y1=ysen-2
x2=x1+pwr_wid
dbCreateRect(dbD_sram list("M2" "drawing") list(x1:y1-3.72 x2:y2))
dbCreateRect(dbD_sram list("M2" "drawing") list(x2+pwr_space:y1 x2+pwr_space+pwr_wid:y2+4.72))

;creating GND for senseAmp
x1=xsen+(mx_layer-1)*pitch_sense
x2=xpre+(N-1)*pitch_precharge+3+2*pwr_wid+pwr_space
y1=ysen-0.81
y2=y1+0.36
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
via_M2_M1_gen(dbD_sram,0.36,pwr_wid,x2-pwr_wid,y2-0.36)
;creating pwr for senseAmp+writeDriver
x1=xsen+(mx_layer-1)*pitch_sense
x2=xpre+(N-1)*pitch_precharge+3+pwr_wid
y1=ysen+1.82
y2=y1+0.36
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
via_M2_M1_gen(dbD_sram,0.36,pwr_wid,x2-pwr_wid,y2-0.36)

;creating GND for writeDriver
x1=xsen+(mx_layer-1)*pitch_sense
x2=xpre+(N-1)*pitch_precharge+3+2*pwr_wid+pwr_space
y1=ysen+4.45
y2=y1+0.36
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
via_M2_M1_gen(dbD_sram,0.36,pwr_wid,x2-pwr_wid,y2-0.36)

;connecting VDD from precharge circuit
x1=xpre+(N-1)*pitch_precharge
x2=x1+3+pwr_wid
y1=ypre+1.245
y2=y1+0.38
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
via_M2_M1_gen(dbD_sram,0.38,pwr_wid,x2-pwr_wid,y2-0.36)

;connecting pwr for array
x1=xpre
x2=xpre+(N-1)*pitch_precharge+3+pwr_wid
sram_pitch_vdd=3.23
for(i 0 M/2
	y1=ypre-0.5-0.12-i*sram_pitch_vdd
	y2=y1+0.12
	dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
	via_M2_M1_gen_special(dbD_sram,0.12,pwr_wid,x2-pwr_wid,y2-0.12)

	
)

;Top GND rail
x1=xpwr-pwr_space-pwr_wid-2
x2=xpre+(N-1)*pitch_precharge+3+2*pwr_wid+pwr_space
y1=ypre+5
top_GND_width=0.68*4
y2=y1+top_GND_width
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))


;;pin placement for GND
	net=dbMakeNet(dbD_sram "gnd!")
	fig=dbCreateRect(dbD_sram list("M1" "pin") list(x1:y1 x2:y2))
	trm=dbCreateTerm(net "gnd!" "input")
	pin=dbCreatePin(net fig "gnd!")
	dbCreateLabel(dbD_sram list("M1" "label") (x1+(x2-x1)/2):(y1+(y2-y1)/2) "gnd!" "centerLeft" "R0" "roman" 2)
		

;connecting GND of sram cell array to the top GND rail
y1=ypre-1.26
y2=ypre+7.72
sram_pitch_gnd=1.2

for(i 0 N
	x1=xpre-0.115+i*sram_pitch_gnd +0.05   ; added 0.05nm to move all the m2 on the top that is connected with gnd and sram (HD)
	x2=x1+0.1
	dbCreateRect(dbD_sram list("M2" "drawing") list(x1:y1 x2:y2))
	via_M2_M1_gen_vertical(dbD_sram,top_GND_width,0.1,x1,y2-top_GND_width)

)

;via for connecting left vertical GND strip to top GND line
x1=xpwr-pwr_space-pwr_wid-2
y1=ypre+5
via_M2_M1_gen_vertical(dbD_sram,top_GND_width,pwr_wid,x1,y1)

;via for connecting right vertical GND strip to top GND line
x1=xpre+(N-1)*pitch_precharge+3+pwr_wid+pwr_space
y1=ypre+5
via_M2_M1_gen_vertical(dbD_sram,top_GND_width,pwr_wid,x1,y1)

;Bottom VDD rail
x1=xpwr-pwr_space-pwr_wid-2
x2=xpre+(N-1)*pitch_precharge+3+2*pwr_wid+pwr_space
y2=ysen-3
y1=y2-top_GND_width
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))

;;pin placement for VDD
	net=dbMakeNet(dbD_sram "vdd!")
	fig=dbCreateRect(dbD_sram list("M1" "pin") list(x1:y1 x2:y2))
	trm=dbCreateTerm(net "vdd!" "input")
	pin=dbCreatePin(net fig "vdd!")
	dbCreateLabel(dbD_sram list("M1" "label") (x1+(x2-x1)/2):(y1+(y2-y1)/2) "vdd!" "centerLeft" "R0" "roman" 2)
		


;via for connecting left vertical PWR strip to bottom PWR line
x1=xpwr-2
y1=ysen-3-top_GND_width
via_M2_M1_gen_vertical(dbD_sram,top_GND_width,pwr_wid,x1,y1)

;via for connecting right vertical PWR strip to bottom PWR line
x1=xpre+(N-1)*pitch_precharge+3
y1=ysen-3-top_GND_width
via_M2_M1_gen_vertical(dbD_sram,top_GND_width,pwr_wid,x1,y1)

;instantiating clk inverter
xi=x-6.2
yi=y+1.955+2.44
dbCreateInst(dbD_sram dbD_invClk "invClk" xi:yi "MX" 1)

;;pin placement for clk
	xv1=xi-0.455
	xv2=xv1+0.36
	yv1=yi-0.96
	yv2=yv1+0.1
	net=dbMakeNet(dbD_sram "clk")
	fig=dbCreateRect(dbD_sram list("M1" "pin") list(xv1:yv1 xv2:yv2))
	trm=dbCreateTerm(net "clk" "input")
	pin=dbCreatePin(net fig "clk")
	dbCreateLabel(dbD_sram list("M1" "label") (xv1+0.18/2):(yv1+.09/2) "clk" "centerLeft" "R0" "roman" 0.05)
		

;connecting global CLK to invClk instance
x1=xi+1.275
y1=yi-1.45
x2=x1+0.1
y2=yi-0.16
dbCreateRect(dbD_sram list("M2" "drawing") list(x1:y1 x2:y2))
via_M2_M1_main_top(dbD_sram,0.1,0.1,x2-0.1/2,y2-0.1/2)

;creating vertical M2 for connecting clk of precharge block
x1=xpre-0.45
x2=xpre-0.45+0.1
y1=ypre-0.24
y2=yi-0.16
dbCreateRect(dbD_sram list("M2" "drawing") list(x1:y1 x2:y2))
via_M2_M1_main_top(dbD_sram,0.1,0.1,x2-0.1/2,y2-0.1/2); connects at upper end: inverter
via_M2_M1_main_top(dbD_sram,0.1,0.1,x1+0.1/2,y1+0.1/2) ; connects at lower end: precharge
;creating horizontal M1 to connect clk from clkInv and precharge block
y1=yi-0.26
y2=yi-0.16
x1=xi+1
x2=xpre-0.45+0.1
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))
via_M2_M1_main_top(dbD_sram,0.1,0.1,x2-0.1/2,y2-0.1/2)

;connecting GND of invClk to top GND rail
x1=xi-0.28
x2=x1+1.235
y1=yi+0.93
y2=yi+5.5
dbCreateRect(dbD_sram list("M1" "drawing") list(x1:y1 x2:y2))


;completing OD on half of the supply rail in invCol
x1=xsc-0.08
x2=xpre-0.65
y1=ysc+p2nGap_col+0.24+0.21
y2=y1+0.34
dbCreateRect(dbD_sram list("RX" "drawing") list(x1:y1 x2:y2))



;;creating pin on address lines: RowDecoder
xv1=xsr-0.12
xv2=xv1+0.18
for(i 0 rowBits-1
		yv1=ysr+0.18+i*M1_p_row
		yv2=yv1+M1_w_row
		net=dbMakeNet(dbD_sram strcat("addr" sprintf(nil "%d" rowBits-1-i)))
		fig=dbCreateRect(dbD_sram list("M1" "pin") list(xv1:yv1 xv2:yv2))
		trm=dbCreateTerm(net strcat("addr" sprintf(nil "%d" rowBits-1-i)) "input")
		pin=dbCreatePin(net fig strcat("A" sprintf(nil "%d" rowBits-1-i)))
		dbCreateLabel(dbD_sram list("M1" "label") (xv1+0.18/2):(yv1+M1_w_row/2) strcat("addr" sprintf(nil "%d" rowBits-1-i)) "centerLeft" "R0" "roman" 0.05 )
)

;;creating pin on address lines: ColDecoder
if(reverse==1 then
xv1=xsc-0.12
xv2=xv1+0.18
for(i 0 colBits-1
		yv1=ysc+0.18+i*M1_p_col
		yv2=yv1+M1_w_col
		net=dbMakeNet(dbD_sram strcat("addr" sprintf(nil "%d" rowBits+colBits-1-i)))
		fig=dbCreateRect(dbD_sram list("M1" "pin") list(xv1:yv1 xv2:yv2))
		trm=dbCreateTerm(net strcat("addr" sprintf(nil "%d" rowBits+colBits-1-i)) "input")
		pin=dbCreatePin(net fig strcat("A" sprintf(nil "%d" rowBits+colBits-1-i)))
		dbCreateLabel(dbD_sram list("M1" "label") (xv1+0.18/2):(yv1+M1_w_col/2) strcat("addr" sprintf(nil "%d" rowBits+colBits-1-i)) "centerLeft" "R0" "roman" 0.05 )
)

else

xv1=xsc-0.12
xv2=xv1+0.18
for(i 0 colBits-1
		yv2=ysc_sp-0.18-i*M1_p_col
		yv1=yv2-M1_w_col
		net=dbMakeNet(dbD_sram strcat("addr" sprintf(nil "%d" rowBits+colBits-1-i)))
		fig=dbCreateRect(dbD_sram list("M1" "pin") list(xv1:yv1 xv2:yv2))
		trm=dbCreateTerm(net strcat("addr" sprintf(nil "%d" rowBits+colBits-1-i)) "input")
		pin=dbCreatePin(net fig strcat("A" sprintf(nil "%d" rowBits+colBits-1-i)))
		dbCreateLabel(dbD_sram list("M1" "label") (xv1+0.18/2):(yv1+M1_w_col/2) strcat("addr" sprintf(nil "%d" rowBits+colBits-1-i)) "centerLeft" "R0" "roman" 0.05 )
)
	
)

dbClose(dbD_cellArray)
dbClose(dbD_rowDecoder)
dbClose(dbD_colDecoder)
dbClose(dbD_columnMux)
dbClose(dbD_writeDriver)
dbClose(dbD_senseAmp)
dbClose(dbD_precharge)
dbClose(dbD_invRow)
dbClose(dbD_invCol)
dbClose(dbD_invClk)
dbSave(dbD_sram)
dbClose(dbD_sram)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; #####################################
; # SRAM Compiler                     #
; # columnMux_lauout-mod.il           #
; # University of Tennessee Knoxville #
; # Md Badruddoja Majumder            #
; # 2020                              #
; #####################################
; 
; ###################
; # v0.1 - 20200921 #
; ###################
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;This version of columnMux is attempted to fix the long poly issue found for higher (N/W) ratio of the sram


procedure(via_M2_M1(dbD_tx,M1_wid,M2_wid,x,y)
	M1_enc_LR=0.04;M1 enclosure across left and right
	if(M1_wid<0.1 then
		M1_enc_TB=0.04 ; via enclosure in top bottom overlaps with horizontal M1 routing
	else
		M1_enc_TB=(M1_wid-0.1)/2 ; via enclosure in top bottom overlaps with horizontal M1 routing
	)
	M2_enc_LR=0
	M2_enc_TB=0.04
	dbCreateRect(dbD_tx list("V1" "drawing") list(x-0.05:y-0.05 x+0.05:y+0.05))
	dbCreateRect(dbD_tx list("M1" "drawing") list(x-0.05-M1_enc_LR:y-0.05-M1_enc_TB x+0.05+M1_enc_LR:y+0.05+M1_enc_TB))
	dbCreateRect(dbD_tx list("M2" "drawing") list(x-0.05-M2_enc_LR:y-0.05-M2_enc_TB x+0.05+M2_enc_LR:y+0.05+M2_enc_TB))
	
)		

procedure(via_M1_PO(M1_wid,PO_wid,x,y)
	M1_enc_LR=0.04;M1 enclosure across left and right
	M1_enc_TB=(M1_wid-0.09)/2 ; via enclosure in top bottom overlaps with horizontal M1 routing
	PO_enc_LR=0.01
	PO_enc_TB=0.04
	dbCreateRect(dbD_tx list("CA" "drawing") list(x-0.045:y-0.045 x+0.045:y+0.045))
	dbCreateRect(dbD_tx list("M1" "drawing") list(x-0.045-M1_enc_LR:y-0.045-M1_enc_TB x+0.045+M1_enc_LR:y+0.045+M1_enc_TB))
	dbCreateRect(dbD_tx list("PC" "drawing") list(x-0.045-PO_enc_LR:y-0.045-PO_enc_TB x+0.045+PO_enc_LR:y+0.045+PO_enc_TB))
	
)		

procedure(dbD_mult_finger_tx(nf, width, x, y,dbD_tx)
W_M1=0.10
W_M2=0.10
                                     
;dbD_tx~>DBUPerUU = 2000.000000


length=0.20*(nf-1)+0.06*nf+0.15*2
nv=floor((width-.24)/0.24)+1

;print(nv)
dbCreateRect(dbD_tx list("RX" "drawing") list(x-0.01:y (x+length+0.01):(y+width))); extra 0.1 adjusted to meet CO enclosure of OD


for(i 0 nf 
if(width<0.42 then
	dbCreateRect(dbD_tx list("M1" "drawing") list((x+0.26*i):y (x+W_M1+0.26*i):(y+0.42))); extended M1 to meet min area of 0.042 with 0.1 width
else
	dbCreateRect(dbD_tx list("M1" "drawing") list((x+0.26*i):y (x+W_M1+0.26*i):(y+width)))
)
;if(i==nf
dbCreateRect(dbD_tx list("M2" "drawing") list((x+0.26*i):y (x+W_M2+0.26*i):(y+width)))
;)
)

for(i 0 nf-1 
dbCreateRect(dbD_tx list("PC" "drawing") list((x+0.15+0.26*i):(y-0.14) (x+0.15+.06+0.26*i):(y+width+0.14)))
)


for(j 0 nf
	for(i 0 nv-1 
	dbCreateRect(dbD_tx list("CA" "drawing") list((x+0.005+j*0.26):(y+0.075+i*0.24) (x+0.005+.09+j*0.26):(y+0.075+i*0.24+0.09)))
	;if(j==nf
		dbCreateRect(dbD_tx list("V1" "drawing") list((x+0.0+j*0.26):(y+0.070+i*0.24) (x+0.0+0.1+j*0.26):(y+0.070+i*0.24+0.1)))
	;)
	)
)


)

procedure(create_column_mux(N,mx_inp)
dbD_tx = dbOpenCellViewByType("sram_compiled" "columnMux" "layout" "maskLayout" "w")
;dbD_tx1 = dbOpenCellViewByType("sram_compiled" "decoder_compiler1" "layout" "maskLayout" "w")

nf=1
width=0.960
x=0
y=0
intra_bit=0.33
inter_bit=0.67-0.26
voff_bit=0.48; offset from the transistor to the common multiplexed bit line
voff_bit_bar=voff_bit+0.18+M1_wid ; offset from the transitor to the common multiplexed bit bar line
;N=8; number of columns
;mx_inp=4 ;column mux inputs
mx_layer=N/mx_inp; number of mux layers
trans_pitch=0.27+0.1*2+intra_bit+inter_bit-0.01;pitch of placed transistors corresponding to mux inputs
M1_wid=0.12
pitch_layer=trans_pitch*mx_inp
mx_inp_half=mx_inp/2
;colDecHeight=1.28+mx_inp_half*0.53+(mx_inp_half-1)*2.52+0.75
colDecHeight=1.28+3.84*(mx_inp/4)+2.62*(mx_inp/4-1)+1.22
for(k 0 mx_layer-1
	
for(i 0 mx_inp-1
	; gather bit lines for each bit in word
	
	xL=x+i*trans_pitch
	yL=y
	yL1=y+(i/2)*3.23
	dbD_mult_finger_tx(nf, width, xL, yL1,dbD_tx)

	;connecting muxed BL
	dbCreateRect(dbD_tx list("M2" "drawing") list(xL:yL-voff_bit xL+0.1:yL1))

	;connecting all BL from array (bottom left M1 to connect it all)
	dbCreateRect(dbD_tx list("M2" "drawing") list(xL+0.26:yL1 xL+0.26+0.1:yL+colDecHeight))
	if(i<mx_inp-1
		dbCreateRect(dbD_tx list("M1" "drawing") list(xL:yL-voff_bit xL+trans_pitch+0.1:yL-voff_bit+M1_wid))
	)
	via_M2_M1(dbD_tx,M1_wid,0.1,xL+0.05,yL-voff_bit+M1_wid/2)
	
	;bit bar
	xL=x+i*trans_pitch+0.38+0.31
	yL=y
	dbD_mult_finger_tx(nf, width, xL, yL1,dbD_tx)

	;connecting muxed BLN (bottom right M1 to connect it all)
	dbCreateRect(dbD_tx list("M2" "drawing") list(xL+0.26:yL-voff_bit_bar xL+0.26+0.1:yL1))
	;connecting BLN from array
	dbCreateRect(dbD_tx list("M2" "drawing") list(xL:yL1 xL+0.1:yL+colDecHeight))
	if(i<mx_inp-1
		dbCreateRect(dbD_tx list("M1" "drawing") list(xL+0.26:yL-voff_bit_bar xL+0.26+trans_pitch+0.1:yL-voff_bit_bar+M1_wid))
	)
	via_M2_M1(dbD_tx,M1_wid,0.1,xL+0.26+0.05,yL-voff_bit_bar+M1_wid/2)
)
x=x+pitch_layer
)

x=0
y=0
M1_wid_WL=0.09
;connecting column muxes gate to column decoder outputs
hor_offset=2
ver_offset=1.1+0.18
declare(off_gate[2]) ;offset of mx gates from each paired muxes

ys=y+ver_offset
xs1=x-hor_offset
for(i 0 mx_inp-1
	xs2=x+(mx_layer-1)*pitch_layer+i*trans_pitch+0.90
	if(i>0 then
		if(mod(i,2)==1 then
			ys=ys+0.52
		else
			ys=ys+2.71
		)
	)
	
	; generate M1 driving column MUX gates, driven by outputs of column decoder
	dbCreateRect(dbD_tx list("M1" "drawing") list(xs1:ys xs2:ys+M1_wid_WL))
)

;extending gate poly lines to respective column decoder horizontal line
ys1=y
M1_wid=0.1
PO_wid=0.06
for(i 0 mx_layer-1
	ys2=y+ver_offset+M1_wid_WL
	for(j 0 mx_inp-1
		;BL
		xs1=x+pitch_layer*i+j*trans_pitch+0.15
		xs2=xs1+0.06
		if(j>0 then
			if(mod(j,2)==1 then
				ys2=ys2+0.52
			else
				ys2=ys2+2.71
			)
		)
		
		dbCreateRect(dbD_tx list("PC" "drawing") list(xs1:ys1+(j/2)*3.23 xs2:ys2))
		;via BL
		via_M1_PO(M1_wid_WL,PO_wid,xs1+PO_wid/2,ys2-M1_wid_WL/2)

		;BLN
		xs1=x+pitch_layer*i+j*trans_pitch+0.84
		xs2=xs1+0.06
		dbCreateRect(dbD_tx list("PC" "drawing") list(xs1:ys1+(j/2)*3.23 xs2:ys2))
		;via BLN
		via_M1_PO(M1_wid_WL,PO_wid,xs1+PO_wid/2,ys2-M1_wid_WL/2)
		
	)
)	

;NP layer
xs1=x-0.34-0.05                                    ; to move JX lalayer in the x axis (-0.5) (HD)
xs2=x+mx_layer*pitch_layer-0.4+0.195+0.33+0.065 
ys1=y-0.4-0.37
ys2=ys2+0.5+0.475-0.025-0.75
dbCreateRect(dbD_tx list("JX" "drawing") list(xs1:ys1 xs2:ys2))
dbSave(dbD_tx)
dbClose(dbD_tx)
)


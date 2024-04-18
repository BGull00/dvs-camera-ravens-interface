
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; #####################################
; # SRAM Compiler                     #
; # decoder_layout_new.il             #
; # University of Tennessee Knoxville #
; # Md Badruddoja Majumder            #
; # 2020                              #
; #####################################
; 
; ###################
; # v0.1 - 20200921 #
; ###################
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;procedure for via placement across different layer
procedure(via_auto(x,bit,copy,layer)
	fix=int(log(copy)/log(2))
	flex=bit-fix
	binr=num2bin(layer,flex)
	;print(result[0])
	if(x>bit-1 then
		xmod=x-bit
	else
		xmod=x)
	if((xmod<fix) then
		y=x
	 else
		xmod=x-fix
	  	if(binr[xmod]==0 then
			y=x
		else
			y=x+bit)
	)
	y
)
		 

procedure(via_place(x,bit,layer)
	if(x<4 then ;first four lines directly maps to vertical global address lines because of both inv and non-inv 
		y=x 
	else
		binr=num2bin(layer,bit-2)
		x=x-4
		y=4+2*x+binr[x]	
	)
	y
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
	
procedure(via_M2_M1(M1_wid,M2_wid,x,y)
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

procedure(via_M2_M1_main(M1_wid,M2_wid,x,y)
	M1_enc_LR=0.04;M1 enclosure across left and right
	if(M1_wid<0.1 then
		M1_enc_TB=0.04 ; via enclosure in top bottom overlaps with horizontal M1 routing
	else
		M1_enc_TB=(M1_wid-0.1)/2 ; via enclosure in top bottom overlaps with horizontal M1 routing
	)
	M2_enc_LR=0
	M2_enc_TB=0.04
	dbCreateRect(dbD_tx1 list("V1" "drawing") list(x-0.05:y-0.05 x+0.05:y+0.05))
	dbCreateRect(dbD_tx1 list("M1" "drawing") list(x-0.05-M1_enc_LR:y-0.05-M1_enc_TB x+0.05+M1_enc_LR:y+0.05+M1_enc_TB))
	dbCreateRect(dbD_tx1 list("M2" "drawing") list(x-0.05-M2_enc_LR:y-0.05-M2_enc_TB x+0.05+M2_enc_LR:y+0.05+M2_enc_TB))
	
)		
		

;procedure for converting int to binary
procedure(num2bin(num,bit)
	
	declare(result[bit])
	for(i 0 bit-1
		result[i]=0
		)
	b=0
	while(num>0
		result[b]=mod(num,2)
		num=num/2
		b=b+1
		)
	result
	)


;procedure for calculating via position
procedure(via_pos(i,j,k,n_nand)
	result=num2bin(i,n_nand+1)
	if(j==0 then
		y=result[k]*(n_nand+1)+j+k+2
	else
		if(k==0 then
			y=1
		else
		  y=result[j+k]*(n_nand+1)+(j+k)+2
			)
		)
y
)


procedure(inv_config(dbD_tx,nf,pwid,nwid,pwr_con_p,pwr_con_n,xp,yp,xn,yn)
nf=1
;pwr_con1=power rail width
;pwr_con1=pwr_con-
dbD_mult_finger_tx(nf, pwid, xp, yp,dbD_tx)
dbD_mult_finger_tx(nf, nwid, xn, yn,dbD_tx)
;dbCreatePath(dbD_tx list("M1" "drawing") list(xp:(yp-.16-0.04) (xp+0.12+0.26*(nf/2)*2:(yp-0.16-0.04))) 0.12)

/*
for(i 0 nf/2 
dbCreateRect(dbD_tx list("M1" "drawing") list((xp+0.26*i*2):(yp-.16-.04) (xp+0.12+0.26*i*2:yp)))
)*/

dbCreateRect(dbD_tx list("M2" "drawing") list((xn+0.26*nf):yn (xp+0.10+0.26*nf):(yp+pwid)))
;dbCreateRect(dbD_tx list("M2" "drawing") list((xn+0.26*nf):yn (xp+0.12+0.26*nf):(yp+pwid)))
dbCreateRect(dbD_tx list("M1" "drawing") list(xp:yp+pwid xp+0.10:(yp+pwid+pwr_con_p+0.21)))
dbCreateRect(dbD_tx list("M1" "drawing") list(xn:yn xn+0.10:(yn-pwr_con_n+0.21)))
;Power RAIL
dbCreatePath(dbD_tx list("M1" "drawing") list(xp-0.08:yp+pwid+pwr_con_p/2+0.21 xp+0.36+0.08:yp+yp+pwid+pwr_con_p/2+0.21) pwr_con_p)
dbCreatePath(dbD_tx list("RX" "drawing") list(xp-0.08:yp+pwid+pwr_con_p/4+0.21+0.01 xp+0.36+0.08:yp+yp+pwid+pwr_con_p/4+0.21+0.01) pwr_con_p/2)  ; (x:y+0.01 x:y+0.01 pwr_con/2)  (HD)
dbCreatePath(dbD_tx list("M1" "drawing") list(xn-0.08:yn-pwr_con_n/2-0.21 xn+0.36+0.08:yn-pwr_con_n/2-0.21) pwr_con_n)
dbCreatePath(dbD_tx list("RX" "drawing") list(xn-0.08:yn-pwr_con_n/4-0.21 xn+0.36+0.08:yn-pwr_con_n/4-0.21) pwr_con_n/2)
for(i 0 nf-1 
;dbCreateRect(dbD_tx list("PC" "drawing") list((x+0.16+0.26*i):(y-0.14) (x+0.16+.06+0.26*i):(y+width+0.14)))
dbCreateRect(dbD_tx list("PC" "drawing") list((xn+0.15+0.26*i):(yn+nwid+0.14) (xp+0.15+.06+0.26*i):(yp-0.14)))
)
)



;
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
if(i==nf
dbCreateRect(dbD_tx list("M2" "drawing") list((x+0.26*i):y (x+W_M2+0.26*i):(y+width)))
)
)

for(i 0 nf-1 
dbCreateRect(dbD_tx list("PC" "drawing") list((x+0.15+0.26*i):(y-0.14) (x+0.15+.06+0.26*i):(y+width+0.14)))
)


for(j 0 nf
	for(i 0 nv-1 
	dbCreateRect(dbD_tx list("CA" "drawing") list((x+0.005+j*0.26):(y+0.075+i*0.24) (x+0.005+.09+j*0.26):(y+0.075+i*0.24+0.09)))
	if(j==nf
		dbCreateRect(dbD_tx list("V1" "drawing") list((x+0.0+j*0.26):(y+0.070+i*0.24) (x+0.0+0.1+j*0.26):(y+0.070+i*0.24+0.1)))
	)
	)
)



)

procedure(dbD_mult_finger_tx_clk(nf, width, x, y,dbD_tx)
W_M1=0.10
W_M2=0.10
                                     
;dbD_tx~>DBUPerUU = 2000.000000


length=0.20*(nf-1)+0.06*nf+0.15*2
nv=floor((width-.24)/0.24)+1

;print(nv)
dbCreateRect(dbD_tx list("RX" "drawing") list(x-0.01:y (x+length+0.01):(y+width))); extra 0.1 adjusted to meet CO enclosure of OD



for(i 0 nf 
dbCreateRect(dbD_tx list("M1" "drawing") list((x+0.26*i):y (x+W_M1+0.26*i):(y+width)))
if(i!=nf-1
dbCreateRect(dbD_tx list("M2" "drawing") list((x+0.26*i):y (x+W_M2+0.26*i):(y+width)))
)
)

for(i 0 nf-1 
dbCreateRect(dbD_tx list("PC" "drawing") list((x+0.15+0.26*i):(y-0.14) (x+0.15+.06+0.26*i):(y+width+0.14)))
)


for(j 0 nf
	for(i 0 nv-1 
	dbCreateRect(dbD_tx list("CA" "drawing") list((x+0.005+j*0.26):(y+0.075+i*0.24) (x+0.005+.09+j*0.26):(y+0.075+i*0.24+0.09)))
	if(j!=nf-1
		dbCreateRect(dbD_tx list("V1" "drawing") list((x+0.0+j*0.26):(y+0.070+i*0.24) (x+0.0+0.1+j*0.26):(y+0.070+i*0.24+0.1)))
	)
	)
)



)


procedure(nand_config(dbD_tx,nf,pwid,nwid,pwr_con,xp,yp,xn,yn)

dbD_mult_finger_tx(nf, pwid, xp, yp,dbD_tx)
dbD_mult_finger_tx(nf, nwid, xn, yn,dbD_tx)

dbCreatePath(dbD_tx list("M1" "drawing") list(xp:(yp-.12-0.1/2) (xp+0.10+0.26*(nf/2)*2:(yp-0.12-0.1/2))) 0.1) ;connects two terminal of p transistors


for(i 0 nf/2 
dbCreateRect(dbD_tx list("M1" "drawing") list((xp+0.26*i*2):(yp-.12-.09) (xp+0.10+0.26*i*2:yp)))

)

pitch=0.2*(nf-1)+0.06*nf+0.16*2+0.14 ; OD length  nand  
dbCreateRect(dbD_tx list("M2" "drawing") list((xn+0.26*nf):yn (xp+0.10+0.26*nf):(yp+pwid)));connects output terminal from p and n transistor
;dbCreateRect(dbD_tx list("M2" "drawing") list((xn+0.26*nf):yn (xp+0.10+0.26*nf):(yp+pwid)))
dbCreateRect(dbD_tx list("M1" "drawing") list(xp+0.26:yp+pwid xp+0.26+0.10:(yp+pwid+pwr_con+0.21)));connects to POWER RAIL
dbCreateRect(dbD_tx list("M1" "drawing") list(xn:yn xn+0.10:(yn-0.21-pwr_con)));connects to GND RAIL
dbCreatePath(dbD_tx list("M1" "drawing") list(xp-0.08:yp+pwid+0.21+pwr_con/2 xp+pitch-0.08:yp+pwid+0.21+pwr_con/2) pwr_con); POWER RAIL
dbCreatePath(dbD_tx list("RX" "drawing") list(xp-0.08:yp+pwid+0.21+pwr_con/4+0.01 xp+pitch-0.08:yp+pwid+0.21+pwr_con/4+0.01) pwr_con/2); NWELL TAP: OD   (x:y+0.01 x:y+0.01 pwr_con/2) (HD)
;dbCreatePath(dbD_tx list("CA" "drawing") list(xp+0.26:yp+pwid+0.21+pwr_con/4 xp+0.26+0.09:yp+pwid+0.21+pwr_con/4) 0.09); NWELL TAP: contact
dbCreatePath(dbD_tx list("M1" "drawing") list(xn-0.08:yn-pwr_con/2-0.21 xn+pitch-0.08:yn-pwr_con/2-0.21) pwr_con); GND RAIL
dbCreatePath(dbD_tx list("RX" "drawing") list(xn-0.08:yn-pwr_con/4-0.21 xn+pitch-0.08:yn-pwr_con/4-0.21) pwr_con/2); PWEL TAP: OD
;dbCreatePath(dbD_tx list("CA" "drawing") list(xn+0.26:yn-pwr_con/4-0.21 xn+0.26+0.09:yn-pwr_con/4-0.21) 0.09); PWEL TAP: contact
for(i 0 nf-1 
;dbCreateRect(dbD_tx list("PC" "drawing") list((x+0.16+0.26*i):(y-0.14) (x+0.16+.06+0.26*i):(y+width+0.14)))
dbCreateRect(dbD_tx list("PC" "drawing") list((xn+0.15+0.26*i):(yn+nwid+0.14) (xp+0.15+.06+0.26*i):(yp-0.14)))
pwid_inv=pwid
nwid_inv=nwid/2
length=0.2*(nf-1)+0.06*nf+0.16*2
pwr_con_p=pwr_con
pwr_con_n=pwr_con
inv_config(dbD_tx,1,pwid_inv,nwid_inv,pwr_con_p,pwr_con_n,xp+length+0.14,yp,xn+length+0.14,yn)
)
)

procedure(nand_clk_config(dbD_tx,nf,pwid,nwid,pwr_con,xp,yp,xn,yn)

dbD_mult_finger_tx_clk(nf, pwid, xp, yp,dbD_tx)
dbD_mult_finger_tx_clk(nf, nwid, xn, yn,dbD_tx)

dbCreatePath(dbD_tx list("M1" "drawing") list(xp:(yp-.205-0.52/2) (xp+0.10+0.26*(nf/2)*2:(yp-0.205-0.52/2))) 0.1) ;connects two terminal of p transistors, placed (0.205-0.52/2) between WL0 and WL1 


for(i 0 nf/2 
dbCreateRect(dbD_tx list("M2" "drawing") list((xp+0.26*i*2):(yp-.205-.52/2) (xp+0.10+0.26*i*2:yp)))

)

dbCreateRect(dbD_tx list("M2" "drawing") list((xn+0.26*nf):yn (xp+0.10+0.26*nf):(yp+pwid)));connects output terminal from p and n transistor
;dbCreateRect(dbD_tx list("M2" "drawing") list((xn+0.26*nf):yn (xp+0.10+0.26*nf):(yp+pwid)))
dbCreateRect(dbD_tx list("M1" "drawing") list(xp+0.26:yp+pwid xp+0.26+0.10:(yp+pwid+pwr_con+0.21)));connects to POWER RAIL
dbCreateRect(dbD_tx list("M1" "drawing") list(xn:yn xn+0.10:(yn-0.21-pwr_con)));connects to GND RAIL
dbCreatePath(dbD_tx list("M1" "drawing") list(xp-0.08:yp+pwid+0.21+pwr_con/2 xp+pitch-0.08:yp+pwid+0.21+pwr_con/2) pwr_con); POWER RAIL
dbCreatePath(dbD_tx list("RX" "drawing") list(xp-0.08:yp+pwid+0.21+pwr_con/4+0.01 xp+pitch-0.08:yp+pwid+0.21+pwr_con/4+0.01) pwr_con/2); NWELL TAP: OD  (x:y+0.01 x:y+0.01) to move the rx layer upword (HD)
;dbCreatePath(dbD_tx list("CA" "drawing") list(xp+0.26:yp+pwid+0.21+pwr_con/4 xp+0.26+0.09:yp+pwid+0.21+pwr_con/4) 0.09); NWELL TAP: contact
dbCreatePath(dbD_tx list("M1" "drawing") list(xn-0.08:yn-pwr_con/2-0.21 xn+pitch-0.08:yn-pwr_con/2-0.21) pwr_con); GND RAIL
dbCreatePath(dbD_tx list("RX" "drawing") list(xn-0.08:yn-pwr_con/4-0.21 xn+pitch-0.08:yn-pwr_con/4-0.21) pwr_con/2); PWEL TAP: OD
;dbCreatePath(dbD_tx list("CA" "drawing") list(xn+0.26:yn-pwr_con/4-0.21 xn+0.26+0.09:yn-pwr_con/4-0.21) 0.09); PWEL TAP: contact
for(i 0 nf-1 
;dbCreateRect(dbD_tx list("PC" "drawing") list((x+0.16+0.26*i):(y-0.14) (x+0.16+.06+0.26*i):(y+width+0.14)))
dbCreateRect(dbD_tx list("PC" "drawing") list((xn+0.15+0.26*i):(yn+nwid+0.14) (xp+0.15+.06+0.26*i):(yp-0.14)))
pwid_inv=pwid
nwid_inv=nwid/2
length=0.2*(nf-1)+0.06*nf+0.16*2
pwr_con_p=pwr_con
pwr_con_n=pwr_con
inv_config(dbD_tx,1,pwid_inv,nwid_inv,pwr_con_p,pwr_con_n,xp+length+0.14,yp,xn+length+0.14,yn)
)
)




procedure(decoder(dbD_tx,n_nand,copy,xp,yp,n_M1,n_wid,p_wid,layerOff)

;dbD_tx = dbOpenCellViewByType("RRAMgen" "decoder" "layout" "maskLayout" "w")
nf=2    
length=0.2*(nf-1)+0.06*nf+0.15*2 ; OD length  nand  
length1=0.2*(1-1)+0.06*1+0.15*2 ; OD length  inv 

;print(length1)                         
;pwid=.600
;nwid=0.3
pwr_con=0.68 ; stretched gate or source to connect to power rail
;n_M1=15; no. of horizontal routing metal lines between p and n transistor
space_M1=0.12; inter M1 spacing
M1_wid=0.1; M1 width
M1_pitch=M1_wid+space_M1
;offset=nwid+0.26+space_M1*(n_M1+1)+M1_wid*n_M1; distance between p_OD and n_OD
W_WL=0.09; width of word line M1
S1_WL=0.43; space between abutted word lines
S2_WL=2.62; space between non abutted word lines

offset=n_wid+W_WL*4+S1_WL*2+S2_WL+0.16*2 ;each single height of decoder includes 4 WLs Transistor to Power line=1.15; 2.62/2-1.15=0.16
;xp=
;yp=0
xn=xp+0
yn=yp-offset

count=0
;n_nand=3
;copy=2
;instantiating multiple two input nand gate
for(i 0 copy-1
while(count<n_nand
	nand_config(dbD_tx,nf,p_wid,n_wid,pwr_con,xp,yp,xn,yn)
	length=0.2*(nf-1)+0.06*nf+0.16*2 
	length1=0.2*(1-1)+0.06*1+0.16*2 
	xp=xp+length+0.14+length1+0.14
	xn=xn+length+0.14+length1+0.14
	count=count+1
	 )
count=0
; instantiating inverter at the end of nand gate

;inv_config(dbD_tx,1,pwid,nwid,pwr_con,xp,yp,xn,yn)
;xp=xp+length+0.14
;xn=xn+length+0.14
)
xp=0
yp=0
xn=xp+0
yn=yp-offset
nf=2    
length=0.2*(nf-1)+0.06*nf+0.15*2 ;OD length  
length1=0.2*(1-1)+0.06*1+0.15*2 ; OD length  
n_nand1=n_nand    
n_nand1=n_nand1*copy



;metal line connectivity for binary decoder
gap=0.16; gap between nand & inv
pitch=length+length1+gap*2 ;inter and pitch in a copy
pitch_copy=pitch*n_nand ;inter copy pitch

LA=0
bit=n_nand+1
declare(LA_x[2]) ;x coord left alone inputs in tree based multi input gate implementation
declare(LA_y[2]) ;y coord left alone inputs in tree based multi input gate implementation
yp_backup=yp
yp=yp-space_M1-M1_wid/2

M2_wid_s=0.18 ; M2 width for global input lines
M2_space_s=0.12
M2_pitch_s=M2_wid_s+M2_space_s
input_ext_left=0.18*2+M2_pitch_s*bit*2 ; extension of local input line to left to connect to vertical global input lines

for(i 0 copy-1
	offset_input=4; first 2 inputs will be changing across multiple decoded output 
	copyid=num2bin(i,bit)
	TG_mod=n_nand+1 ; initial input number
	TG=floor(TG_mod/2); initial 
	LA=TG_mod-2*TG; left alone input
	if(LA==1 then
		;LA_y[0]=yp-M1_pitch*(2*(TG_mod-1)+copyid[TG_mod-1]+1)
		LA_y[0]=yp-M1_pitch*((TG_mod-3)+offset_input+1)
		LA_x[0]=xp-input_ext_left
	)
	LA_flag=0
	TG_mod_prev=TG_mod
	TG_mod=TG+floor(LA/2)
	println(TG_mod)
	LA=mod(LA,2)	
	localcount=0
	stage=0
	for(j 0 n_nand-1
		;println(stage)
		;input1_nand
		
		if(stage==0 then
			
			;input1
			xt1=xp-input_ext_left
			xt2=i*pitch_copy+j*pitch+0.15+0.06
			input_id=2*localcount ;finds the input number from the gate number
			; println(input_id)
			if(localcount==0 then
				yt=yp-(2*input_id+copyid[input_id]+1)*M1_pitch ;calculates target y coordinates based on input number and whether it is inverted/non-inverted
				print(yt)
				println((2*input_id+copyid[input_id]+1)*M1_pitch)
			else
				input_id=2*(localcount-1) ;finds the input number from the gate number
				yt=yp-(input_id+offset_input+1)*M1_pitch ;calculates target y coordinates based on input number; only first two input will be changing as each unit of decoder has four word lines
			)
			dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
			via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
			;input2
			xt1=xp-input_ext_left
			xt2=i*pitch_copy+j*pitch+0.15+0.06+0.26
			input_id=2*localcount+1 ;finds the input number from the gate number
			if(localcount==0 then
				yt=yp-(2*input_id+copyid[input_id]+1)*M1_pitch ;calculates target y coordinates based on input number and whether it is inverted/non-inverted
			else
				input_id=2*(localcount-1)+1 ;finds the input number from the gate number
				yt=yp-(input_id+offset_input+1)*M1_pitch ;calculates target y coordinates based on input number; only first two input will be changing as each unit of decoder has four word lines
			)
			dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid) 
			via_M1_PO(M1_wid,0.06,xt2-0.03,yt) 
				
				
				
			
		else
			if((localcount==TG_mod-1)&&(LA_flag==1) then
				println("hi hi hi hi")
				LA_flag=0
				;input1
				xt1=LA_x[0]
				xt2=i*pitch_copy+j*pitch+0.15+0.06
				yt=LA_y[0]
				dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
				if(xt1>xp
					via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
				)
				via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
				;input2
				xt1=LA_x[1]
				xt2=i*pitch_copy+j*pitch+0.15+0.06+0.2+0.06
				yt=LA_y[1]
				if(xt1>xp
					via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
				)
				dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
				via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
			else
				;input1
				if(j==5 then
					println("debugging debugging debugging")
					print("IG_start")
					print(IG_start)
					print("TG_mod_prev")
					println(TG_mod_prev)
				)
				ind_prev=IG_start+2*(j-TG_mod_prev-IG_start)
				xt1=i*pitch_copy+ind_prev*pitch+1.04
				xt2=i*pitch_copy+j*pitch+0.15+.06
				;yt=yp-M1_pitch*bit*2-2*(j-TG_mod_prev-IG_start)*M1_pitch ;calculates target y coordinates based on input number and whether it is inverted/non-inverted
				yt=yp-M1_pitch*(5+(bit-2))-2*(j-TG_mod_prev-IG_start)*M1_pitch
				dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
				via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
				via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
				;input2
				ind_prev=IG_start+2*(j-TG_mod_prev-IG_start)+1
				xt1=i*pitch_copy+ind_prev*pitch+1.04
				xt2=i*pitch_copy+j*pitch+0.15+.06+0.2+0.06
				;yt=yp-M1_pitch*bit*2-(2*(j-TG_mod_prev-IG_start)+1)*M1_pitch ;calculates target y coordinates based on input number and whether it is inverted/non-inverted
				yt=yp-M1_pitch*(5+(bit-2))-(2*(j-TG_mod_prev-IG_start)+1)*M1_pitch ;
				dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
				via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
				via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
				
				
				
			)			
		
		)
		;connecting from nand to inv
		xt1=i*pitch_copy+j*pitch+0.52
		xt2=xt1+0.47
		no_int_wire=floor(bit/2)
		;yt=yp-M1_pitch*(bit+3+no_int_wire)
		yt=yp
		dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
		via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
		via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
		localcount=localcount+1
		if(localcount==TG_mod then
			TG=floor(TG_mod/2); initial
			LA_prev=LA 
			LA=LA_prev+TG_mod-2*TG; left alone input
			LA_diff=LA-LA_prev
			if(((LA==1)&&(LA_diff==1)) then
				LA_y[0]=yp-M1_pitch*(TG_mod+bit+3-1);??debug
				LA_x[0]=xp+i*pitch_copy+j*pitch+1.04
			)
			if(LA==2 then
				LA_flag=1
				LA_y[1]=yp-M1_pitch*(TG_mod+bit+3-1)
				LA_x[1]=xp+i*pitch_copy+j*pitch+1.04
				
				
			)
			TG_mod_prev=TG_mod
			TG_mod=TG+floor(LA/2)
			IG_start=j-TG_mod_prev+1 ;index of starting gate of the previous stage;??debug->checked: right :)
			LA=mod(LA,2)
			localcount=0
			stage=stage+1		
		)
	)
	;connecting decoder output
	if(i==copy-1 then
		xt1=(i+1)*pitch_copy-0.26
		xt2=copy*pitch_copy
		no_int_wire=floor(bit/2)
		dd=bit+2+no_int_wire
		yt=yp-M1_pitch*dd
		dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
		via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
		;via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
	else
		if(i==copy-2 then
			xt1=(i+1)*pitch_copy-0.26
			xt2=copy*pitch_copy
			no_int_wire=floor(bit/2)
			yt=yp-M1_pitch*3 ; placing the output to unused inverted input
			dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
			via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
			;via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
		else
			xt1=(i+1)*pitch_copy-0.26
			xt2=copy*pitch_copy
			no_int_wire=floor(bit/2)
			yt=yp-M1_pitch*(bit+2+no_int_wire+(i+1))
			dd=(bit+2+no_int_wire+(i+1))
			;yt=yp-M1_pitch*dd
			
			;avoid min spacing violation with WL lines
			if((i==1)&&((dd==14)||(dd==15)) then
				yt=yp-M1_pitch*16
			else
				yt=yp-M1_pitch*dd
			)
			
			
			dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
			via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
			;via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
		)
		
	)

)


;draw NW layer
yp=yp_backup
dbCreateRect(dbD_tx list("NW" "drawing") list(xp-0.4-layerOff:yp-offset/2 xp+pitch_copy*copy-0.16+0.4:yp+pwid+0.21+pwr_con+0.16))
;draw PP layer
dbCreateRect(dbD_tx list("JZ" "drawing") list(xp-0.4-layerOff:yp-offset/2 xp+pitch_copy*copy-0.16+0.4:yp+pwid+0.21-0.02+0.01))    ; (x:y x:y+0.01) (HD)
;draw NP:VDD layer
dbCreateRect(dbD_tx list("JX" "drawing") list(xp-0.4-layerOff:yp+pwid+0.21-0.02+0.01 xp+pitch_copy*copy-0.16+0.4:yp+pwid+0.21+pwr_con/2+0.05))     ; (x:y+0.01 x:y)  (HD)
;draw NP layer
dbCreateRect(dbD_tx list("JX" "drawing") list(xp-0.4-layerOff:yp-offset/2 xp+pitch_copy*copy-0.16+0.4:yn-0.21+0.02))
;draw PP:GND layer
dbCreateRect(dbD_tx list("JZ" "drawing") list(xp-0.4-layerOff:yn-0.21+0.02 xp+pitch_copy*copy-0.16+0.4:yn-0.21-pwr_con/2-0.05))

;supply rail tap OD_M1 CO
LW=pitch_copy*copy-0.16+0.16;width of power rail
CO_W=0.09
CO_S=0.16
SIDE_S=0.11
n_trial=floor((LW+CO_S-2*SIDE_S)/(CO_W+CO_S))
SIDE_S=(LW+CO_S-n_trial*(CO_S+CO_W))/2
CO_PITCH=CO_W+CO_S
for(i 0 n_trial-1
	dbCreatePath(dbD_tx list("CA" "drawing") list(xp+SIDE_S+i*CO_PITCH:yp+pwid+0.21+pwr_con/4 xp+SIDE_S+i*CO_PITCH+0.09:yp+pwid+0.21+pwr_con/4) 0.09); NWELL TAP: contact
)	
for(i 0 n_trial-1
	dbCreatePath(dbD_tx list("CA" "drawing") list(xp+SIDE_S+i*CO_PITCH:yn-0.21-pwr_con/4 xp+SIDE_S+i*CO_PITCH+0.09:yn-0.21-pwr_con/4) 0.09); PWELL TAP: contact	
)


)

procedure(decoder_clk(dbD_tx,n_nand,bit,copy,xp,yp,n_M1,n_wid,p_wid)

;dbD_tx = dbOpenCellViewByType("RRAMgen" "decoder" "layout" "maskLayout" "w")
nf=2    
length=0.2*(nf-1)+0.06*nf+0.15*2 ; OD length  nand  
length1=0.2*(1-1)+0.06*1+0.15*2 ; OD length  inv 

;print(length1)                         
;pwid=.600
;nwid=0.3
pwr_con=0.68 ; stretched gate or source to connect to power rail
;n_M1=15; no. of horizontal routing metal lines between p and n transistor
space_M1=0.12; inter M1 spacing
M1_wid=0.1; M1 width
M1_pitch=M1_wid+space_M1

;offset=nwid+0.26+space_M1*(n_M1+1)+M1_wid*n_M1; distance between p_OD and n_OD
W_WL=0.09; width of word line M1
S1_WL=0.43; space between abutted word lines
S2_WL=2.62; space between non abutted word lines

offset=n_wid+W_WL*4+S1_WL*2+S2_WL+0.16*2 ;each single height of decoder includes 4 WLs Transistor to Power line=1.15; 2.62/2-1.15=0.16
;xp=
;yp=0
xn=xp+0
yn=yp-offset

xp_backup=xp
xn_backup=xn
count=0
;n_nand=3
;copy=2
;instantiating multiple two input nand gate
for(i 0 copy-1
while(count<n_nand
	nand_clk_config(dbD_tx,nf,p_wid,n_wid,pwr_con,xp,yp,xn,yn)
	length=0.2*(nf-1)+0.06*nf+0.16*2 
	length1=0.2*(1-1)+0.06*1+0.16*2 
	xp=xp+length+0.14+length1+0.14
	xn=xn+length+0.14+length1+0.14
	count=count+1
	 )
count=0
; instantiating inverter at the end of nand gate

;inv_config(dbD_tx,1,pwid,nwid,pwr_con,xp,yp,xn,yn)
;xp=xp+length+0.14
;xn=xn+length+0.14
)
xp=xp_backup
xn=xn_backup
yp=0
yn=yp-offset
nf=2    
length=0.2*(nf-1)+0.06*nf+0.15*2 ;OD length  
length1=0.2*(1-1)+0.06*1+0.15*2 ; OD length  
n_nand1=n_nand    
n_nand1=n_nand1*copy



;metal line connectivity for binary decoder
gap=0.16; gap between nand & inv
pitch=length+length1+gap*2 ;inter and pitch in a copy
pitch_copy=pitch*n_nand ;inter copy pitch

LA=0
;bit=
declare(LA_x[2]) ;x coord left alone inputs in tree based multi input gate implementation
declare(LA_y[2]) ;y coord left alone inputs in tree based multi input gate implementation
yp_backup=yp
yp=yp-space_M1-M1_wid/2


input_ext_left=0.20
;clocked decoder input 2: output from decoder
no_int_wire=floor(bit/2)

if(bit<3 then
	print("hello hello hello")
	clk_d=4 ;5th slot is occupied by the decoder output line
else
	clk_d=5 ; 5th slot is free due to intermediate wire only limited within the main decoder block. not extended to clocked decoder part
)
for(i 0 2
	xt1=xp-input_ext_left
	xt2=xp+pitch*(i+1)+0.47 ;second input of nand gate
	dd=bit+2+no_int_wire+i
	;yt=yp-M1_pitch*dd
	
	if((i==2)&&((dd==14)||(dd==15)) then
		yt=yp-M1_pitch*16
	else
		yt=yp-M1_pitch*dd
	)
	
	dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
	;via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
	via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
	
	;clk input
	xt1=xp-input_ext_left
	xt2=xp+pitch*i+0.21 ;first input of nand gate
	yt=yp-M1_pitch*clk_d
	dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
	;via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
	via_M1_PO(M1_wid,0.06,xt2-0.03,yt)

) 

;last input moved to a upper slot due to congestion
xt1=xp-input_ext_left
xt2=xp+pitch*0+0.47 ;second input of nand gate
yt=yp-M1_pitch*3
dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
	;via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
via_M1_PO(M1_wid,0.06,xt2-0.03,yt)
	
;last clk input
xt1=xp-input_ext_left
xt2=xp+pitch*3+0.21 ;first input of nand gate
yt=yp-M1_pitch*clk_d
dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
;via_M2_M1(M1_wid,0.1,xt1+0.05,yt)
via_M1_PO(M1_wid,0.06,xt2-0.03,yt)

			
;final WL output
yp=yp_backup
declare(yt_arr[4])
yt_arr[0]=yp-0.16-W_WL/2
yt_arr[1]=yt_arr[0]-W_WL-S1_WL
yt_arr[2]=yt_arr[1]-W_WL-S2_WL
yt_arr[3]=yt_arr[2]-W_WL-S1_WL

for(i 0 3
	xt1=xp+pitch*(i+1)-0.16-0.1
	xt2=xp+pitch_copy+3
	yt=yt_arr[i]
	dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) W_WL)
	via_M2_M1(W_WL,0.1,xt1+0.05,yt)
	;via_M1_PO(M1_wid,0.06,xt2-0.16-0.1,yt)

) 

;connecting from nand to inv
for(i 0 3
xt0=xp+i*pitch
xt1=xp+i*pitch+0.52
xt2=xt1+0.47

yt=yp-0.205-0.52/2
dbCreatePath(dbD_tx list("M1" "drawing") list(xt1:yt xt2:yt) M1_wid)
via_M2_M1(M1_wid,0.1,xt0+0.05,yt); via for connecting two nand output: first  
via_M2_M1(M1_wid,0.1,xt1+0.05,yt); via for connecting two nand output: second 
via_M1_PO(M1_wid,0.06,xt2-0.03,yt); via for connecting nand output and inv input
)	

;draw NW layer

dbCreateRect(dbD_tx list("NW" "drawing") list(xp-0.4:yp-offset/2 xp+pitch_copy*copy-0.16+0.4:yp+pwid+0.21+pwr_con+0.16))
;draw PP layer
dbCreateRect(dbD_tx list("JZ" "drawing") list(xp-0.4:yp-offset/2 xp+pitch_copy*copy-0.16+0.4:yp+pwid+0.21-0.02+0.01))   ;HD (X1:y1 X2:Y2 +0.01)
;draw NP:VDD layer
dbCreateRect(dbD_tx list("JX" "drawing") list(xp-0.4:yp+pwid+0.21-0.02+0.01 xp+pitch_copy*copy-0.16+0.4:yp+pwid+0.21+pwr_con/2+0.05))  ;HD (x1:y1+0.01 x2:y2)
;draw NP layer
dbCreateRect(dbD_tx list("JX" "drawing") list(xp-0.4:yp-offset/2 xp+pitch_copy*copy-0.16+0.4:yn-0.21+0.02))
;draw PP:GND layer
dbCreateRect(dbD_tx list("JZ" "drawing") list(xp-0.4:yn-0.21+0.02 xp+pitch_copy*copy-0.16+0.4:yn-0.21-pwr_con/2-0.05))

;supply rail tap OD_M1 CO
LW=pitch_copy*copy-0.16+0.16;width of power rail
CO_W=0.09
CO_S=0.16
SIDE_S=0.11
n_trial=floor((LW+CO_S-2*SIDE_S)/(CO_W+CO_S))
SIDE_S=(LW+CO_S-n_trial*(CO_S+CO_W))/2
CO_PITCH=CO_W+CO_S
for(i 0 n_trial-1
	dbCreatePath(dbD_tx list("CA" "drawing") list(xp+SIDE_S+i*CO_PITCH:yp+pwid+0.21+pwr_con/4 xp+SIDE_S+i*CO_PITCH+0.09:yp+pwid+0.21+pwr_con/4) 0.09); NWELL TAP: contact
)	
for(i 0 n_trial-1
	dbCreatePath(dbD_tx list("CA" "drawing") list(xp+SIDE_S+i*CO_PITCH:yn-0.21-pwr_con/4 xp+SIDE_S+i*CO_PITCH+0.09:yn-0.21-pwr_con/4) 0.09); PWELL TAP: contact	
)



)

procedure(create_rowDecoder(bit,layerOff)
dbD_tx = dbOpenCellViewByType("sram_compiled" "rowDecoderUnit_compiler" "layout" "maskLayout" "w")
dbD_tx1 = dbOpenCellViewByType("sram_compiled" "rowDecoder_compiler1" "layout" "maskLayout" "w")
;dbD_tx = dbOpenCellViewByType("sram_compiled" "colDecoderUnit_compiler" "layout" "maskLayout" "w")
;dbD_tx1 = dbOpenCellViewByType("sram_compiled" "colDecoder_compiler1" "layout" "maskLayout" "w")

nf=2
width=0.480
x=0
y=0
;dbD_mult_finger_tx(nf, width, x, y,dbD_tx)

pwid=0.480
nwid=0.480
pwr_con=0.21+0.36
pwr_con1=0.36
xp=0
yp=0
xn=0
gap=0.5
yn=yp-nwid-gap
;inv_config(dbD_tx,nf,pwid,nwid,pwr_con,pwr_con1,xp,yp,xn,yn)

;nand_config(dbD_tx,2,pwid,nwid,pwr_con,xp,yp,xn,yn)



;bit=2
copy=4; fixed 4 decoded lines per layer
layer=(2**bit)/copy
n_nand=bit-1

pwid=.600
nwid=0.600
;pwid_large
;nwid_large=
;n_M1=2+n_nand+1+int(log(copy)/log(2))+copy*2
n_M1=2*bit+floor(bit/2)+copy+1
;print(n_M1)
space_M1=0.14; inter M1 spacing
M1_wid=0.12; M1 width
int_space=space_M1*(n_M1+2)+M1_wid*(n_M1+1)

xp=0
yp=0

;println(n_nand)
decoder(dbD_tx,n_nand,copy,xp,yp,n_M1,nwid,pwid,layerOff)
nf=2
length=0.2*(nf-1)+0.06*nf+0.15*2 ;OD length  
length1=0.2*(1-1)+0.06*1+0.15*2 ; OD length  
n_nand1=n_nand    
n_nand1=n_nand1*copy
;metal line connectivity for binary decoder
gap=0.16; gap between nand & inv
pitch=length+length1+gap*2 ;inter and pitch in a copy
pitch_copy=pitch*n_nand ;inter copy pitch
xp=xp+pitch_copy*copy-gap+0.08*2

layerwidth=xp+4*pitch-gap
clk_decoder_start=xp
println("new xp")
println(xp)
decoder_clk(dbD_tx,4,bit,1,xp,yp,n_M1,nwid,pwid)

xp=0
yp=0
decoder_height=6.46
decoder_height_flip=5.31*2

for(i 0 layer-1
if(mod(i,2)==0 then
	yps=yp-i*decoder_height
	orient="R0"
else
	yps=yp-(i/2)*2*decoder_height-decoder_height_flip
	orient="MX"
)

dbSave(dbD_tx)
dbClose(dbD_tx)
dbD_tx = dbOpenCellViewByType("sram_compiled" "rowDecoderUnit_compiler" "layout" "maskLayout" "r")

dbCreateInst(dbD_tx1 dbD_tx strcat("testRow" sprintf(nil "%d" i)) xp:yps orient 1)
)

;vertical M2 for connecting input across multiple unit decoder instances
off_hor=0.18
off_ver=0.18
M2_wid=0.18
M2_space=0.12
M2_pitch=M2_wid+M2_space

M1_wid=0.1
M1_space=0.12
M1_pitch=M1_wid+M1_space
for(i 0 bit*2-1
	xv2=xp-off_hor-i*M2_pitch
	yv2=yp+off_ver
	xv1=xv2-M2_wid
	yv1=yv2-layer*decoder_height+2
	dbCreateRect(dbD_tx1 list("M2" "drawing") list(xv1:yv1 xv2:yv2))
	
	;pins on address lines
	if(mod(i,2)==0 then
		yv1=yv2-0.36
		net=dbMakeNet(dbD_tx1 strcat("A" sprintf(nil "%d_inv" i/2)))
		print(net)
		fig=dbCreateRect(dbD_tx1 list("M2" "pin") list(xv1:yv1 xv2:yv2))
		print(fig)
		trm=dbCreateTerm(net strcat("A" sprintf(nil "%dinv" i)) "input")
		print(trm)
		pin=dbCreatePin(net fig strcat("A" sprintf(nil "%d_inv" (i/2))))
		dbCreateLabel(dbD_tx1 list("M2" "label") (xv1+M2_wid/2):(yv1+0.18) strcat("A" sprintf(nil "%d_inv" i/2)) "centerLeft" "R0" "roman" 0.05 )
	else
		yv1=yv2-0.36
		net=dbMakeNet(dbD_tx1 strcat("A" sprintf(nil "%d" i/2)))
		print(net)
		fig=dbCreateRect(dbD_tx1 list("M2" "pin") list(xv1:yv1 xv2:yv2))
		print(fig)
		trm=dbCreateTerm(net strcat("A" sprintf(nil "%d" i)) "input")
		print(trm)
		pin=dbCreatePin(net fig strcat("A" sprintf(nil "%d" (i/2))))
		dbCreateLabel(dbD_tx1 list("M2" "label") (xv1+M2_wid/2):(yv1+0.18) strcat("A" sprintf(nil "%d" i/2)) "centerLeft" "R0" "roman" 0.05 )
	)
	
)
declare(decout[4])
decout[0]=2
decout[1]=3
decout[2]=0
decout[3]=1

;offset of decoder outputs from y axis  in each layers
declare(dec_offset[4])
dec_offset[0]=0.16
dec_offset[1]=0.68
dec_offset[2]=3.39
dec_offset[3]=3.91
;pins on decoder output
;xaxis for pin placements
xd1=layerwidth+0.16
xd2=xd1+0.16

;println("layer from row Decoder")
;println(layer)
for(i 0 layer-1
	basey=-(i/2)*decoder_height*2;->OD to OD between 2 decoder layers
	for(j 0 3
		decout_id=4*i+decout[j] ;decoded output number
		if(mod(i,2)==0 then
			yd2=basey-dec_offset[j]
			yd1=yd2-0.09
			
		else
			yd1=basey-10.62+dec_offset[j]
			yd2=yd1+0.09
		)
		net=dbMakeNet(dbD_tx1 strcat("YF" sprintf(nil "%d" decout_id)))
		fig=dbCreateRect(dbD_tx1 list("M1" "pin") list(xd1:yd1 xd2:yd2))
		trm=dbCreateTerm(net strcat("YF" sprintf(nil "%d" decout_id)) "output")
		pin=dbCreatePin(net fig strcat("YF" sprintf(nil "%d" decout_id)))
		dbCreateLabel(dbD_tx1 list("M1" "label") xd1+0.09/2:(yd1+0.09/2) strcat("YF" sprintf(nil "%d" decout_id)) "centerLeft" "R0" "roman" 0.05 )
	)
)

;global CLK connect using M2 vertically
xd1=clk_decoder_start+0.78
xd2=xd1+M1_wid
yd2=2.5
if(layer==1 then
	yd1=-1.32-5.50
else
	yd1=-((layer/2)-1)*decoder_height*2-10.62+1.22-5.50
)
dbCreateRect(dbD_tx1 list("M2" "drawing") list(xd1:yd1-1.5 xd2:yd2))

;via connecting global decoder CLK line to local clk lines
if(bit<3 then
	shamt=M1_pitch ; when bit<3 horizontal clk lines are placed in the 4th slot instead of 5th 
else
	shamt=0		; clk lines placed in the 5th slot
)
for(i 0 layer-1
	xv=xd1+M1_wid/2
	basey=-(i/2)*decoder_height*2
	if(mod(i,2)==0 then
		yv=basey-1.22-M1_wid/2+shamt
	else
		yv=basey-10.62+1.22+M1_wid/2+shamt
	)
	via_M2_M1_main(M1_wid,M1_wid,xv,yv)
)

;pin on CLK
net=dbMakeNet(dbD_tx1 "CLK")
yd1=yd2-0.18
fig=dbCreateRect(dbD_tx1 list("M2" "pin") list(xd1:yd1 xd2:yd2))
trm=dbCreateTerm(net "CLK" "input")
pin=dbCreatePin(net fig "CLK")
dbCreateLabel(dbD_tx1 list("M2" "label") xd1+M1_wid/2:(yd1+M1_wid/2) "CLK" "centerLeft" "R0" "roman" 0.05 )

;placing via for connecting local and global inputs for the decoder
for(i 0 layer-1
	for(j 0 bit+2-1
		tar=via_place(j,bit,i)
		xt=xp-off_hor-tar*M2_pitch-M2_wid/2
		if(mod(i,2)==0 then
			yt=yp-i*decoder_height-j*M1_pitch-0.34-M1_wid/2
		else
			yt=yp-(i/2)*2*decoder_height-decoder_height_flip+j*M1_pitch+0.34+M1_wid/2
		)
		via_M2_M1_main(M1_wid,M2_wid,xt,yt);
	)
)
dbClose(dbD_tx)
dbSave(dbD_tx1)
dbClose(dbD_tx1)
)

procedure(create_colDecoder(bit,layerOff)
;dbD_tx = dbOpenCellViewByType("sram_compiled" "rowDecoderUnit_compiler" "layout" "maskLayout" "w")
;dbD_tx1 = dbOpenCellViewByType("sram_compiled" "rowDecoder_compiler1" "layout" "maskLayout" "w")
dbD_tx = dbOpenCellViewByType("sram_compiled" "colDecoderUnit_compiler" "layout" "maskLayout" "w")
dbD_tx1 = dbOpenCellViewByType("sram_compiled" "colDecoder_compiler1" "layout" "maskLayout" "w")

nf=2
width=0.480
x=0
y=0
;dbD_mult_finger_tx(nf, width, x, y,dbD_tx)

pwid=0.480
nwid=0.480
pwr_con=0.21+0.36
pwr_con1=0.36
xp=0
yp=0
xn=0
gap=0.5
yn=yp-nwid-gap
;inv_config(dbD_tx,nf,pwid,nwid,pwr_con,pwr_con1,xp,yp,xn,yn)

;nand_config(dbD_tx,2,pwid,nwid,pwr_con,xp,yp,xn,yn)



;bit=2
copy=4; fixed 4 decoded lines per layer
layer=(2**bit)/copy
n_nand=bit-1

pwid=.600
nwid=0.600
;pwid_large
;nwid_large=
;n_M1=2+n_nand+1+int(log(copy)/log(2))+copy*2
n_M1=2*bit+floor(bit/2)+copy+1
;print(n_M1)
space_M1=0.14; inter M1 spacing
M1_wid=0.12; M1 width
int_space=space_M1*(n_M1+2)+M1_wid*(n_M1+1)

xp=0
yp=0

;println(n_nand)
decoder(dbD_tx,n_nand,copy,xp,yp,n_M1,nwid,pwid,layerOff)
nf=2
length=0.2*(nf-1)+0.06*nf+0.15*2 ;OD length  
length1=0.2*(1-1)+0.06*1+0.15*2 ; OD length  
n_nand1=n_nand    
n_nand1=n_nand1*copy
;metal line connectivity for binary decoder
gap=0.16; gap between nand & inv
pitch=length+length1+gap*2 ;inter and pitch in a copy
pitch_copy=pitch*n_nand ;inter copy pitch
xp=xp+pitch_copy*copy-gap+0.08*2

layerwidth=xp+4*pitch-gap
clk_decoder_start=xp
println("new xp")
println(xp)
decoder_clk(dbD_tx,4,bit,1,xp,yp,n_M1,nwid,pwid)

xp=0
yp=0
decoder_height=6.46
decoder_height_flip=5.31*2

for(i 0 layer-1
if(mod(i,2)==0 then
	yps=yp-i*decoder_height
	orient="R0"
else
	yps=yp-(i/2)*2*decoder_height-decoder_height_flip
	orient="MX"
)

dbSave(dbD_tx)
dbClose(dbD_tx)
dbD_tx = dbOpenCellViewByType("sram_compiled" "colDecoderUnit_compiler" "layout" "maskLayout" "r")

dbCreateInst(dbD_tx1 dbD_tx strcat("testCol" sprintf(nil "%d" i)) xp:yps orient 1)
)

;vertical M2 for connecting input across multiple unit decoder instances
off_hor=0.18
off_ver=0.18
M2_wid=0.18
M2_space=0.12
M2_pitch=M2_wid+M2_space

M1_wid=0.1
M1_space=0.12
M1_pitch=M1_wid+M1_space
for(i 0 bit*2-1
	xv2=xp-off_hor-i*M2_pitch
	yv2=yp+off_ver
	xv1=xv2-M2_wid
	yv1=yv2-layer*decoder_height+2
	dbCreateRect(dbD_tx1 list("M2" "drawing") list(xv1:yv1 xv2:yv2))
	
	;pins on address lines
	if(mod(i,2)==0 then
		yv1=yv2-0.36
		net=dbMakeNet(dbD_tx1 strcat("A" sprintf(nil "%d_inv" i/2)))
		print(net)
		fig=dbCreateRect(dbD_tx1 list("M2" "pin") list(xv1:yv1 xv2:yv2))
		print(fig)
		trm=dbCreateTerm(net strcat("A" sprintf(nil "%dinv" i)) "input")
		print(trm)
		pin=dbCreatePin(net fig strcat("A" sprintf(nil "%d_inv" (i/2))))
		dbCreateLabel(dbD_tx1 list("M2" "label") (xv1+M2_wid/2):(yv1+0.18) strcat("A" sprintf(nil "%d_inv" i/2)) "centerLeft" "R0" "roman" 0.05 )
	else
		yv1=yv2-0.36
		net=dbMakeNet(dbD_tx1 strcat("A" sprintf(nil "%d" i/2)))
		print(net)
		fig=dbCreateRect(dbD_tx1 list("M2" "pin") list(xv1:yv1 xv2:yv2))
		print(fig)
		trm=dbCreateTerm(net strcat("A" sprintf(nil "%d" i)) "input")
		print(trm)
		pin=dbCreatePin(net fig strcat("A" sprintf(nil "%d" (i/2))))
		dbCreateLabel(dbD_tx1 list("M2" "label") (xv1+M2_wid/2):(yv1+0.18) strcat("A" sprintf(nil "%d" i/2)) "centerLeft" "R0" "roman" 0.05 )
	)
	
)
declare(decout[4])
decout[0]=2
decout[1]=3
decout[2]=0
decout[3]=1

;offset of decoder outputs from y axis  in each layers
declare(dec_offset[4])
dec_offset[0]=0.16
dec_offset[1]=0.68
dec_offset[2]=3.39
dec_offset[3]=3.91
;pins on decoder output
;xaxis for pin placements
xd1=layerwidth+0.16
xd2=xd1+0.16

for(i 0 layer-1
	basey=-(i/2)*decoder_height*2;->OD to OD between 2 decoder layers
	for(j 0 3
		decout_id=4*i+decout[j] ;decoded output number
		if(mod(i,2)==0 then
			yd2=basey-dec_offset[j]
			yd1=yd2-0.09
			
		else
			yd1=basey-10.62+dec_offset[j]
			yd2=yd1+0.09
		)
		net=dbMakeNet(dbD_tx1 strcat("YF" sprintf(nil "%d" decout_id)))
		fig=dbCreateRect(dbD_tx1 list("M1" "pin") list(xd1:yd1 xd2:yd2))
		trm=dbCreateTerm(net strcat("YF" sprintf(nil "%d" decout_id)) "output")
		pin=dbCreatePin(net fig strcat("YF" sprintf(nil "%d" decout_id)))
		dbCreateLabel(dbD_tx1 list("M1" "label") xd1+0.09/2:(yd1+0.09/2) strcat("YF" sprintf(nil "%d" decout_id)) "centerLeft" "R0" "roman" 0.05 )
	)
)

;global CLK connect using M2 vertically
xd1=clk_decoder_start+0.78
xd2=xd1+M1_wid
yd2=2.5
if(layer==1 then
	yd1=-1.32-5.50
else
	yd1=-((layer/2)-1)*decoder_height*2-10.62+1.22-5.50
)
dbCreateRect(dbD_tx1 list("M2" "drawing") list(xd1:yd1-1.5 xd2:yd2))

;via connecting global decoder CLK line to local clk lines
;via connecting global decoder CLK line to local clk lines
if(bit<3 then
	shamt=M1_pitch ; when bit<3 horizontal clk lines are placed in the 4th slot instead of 5th 
else
	shamt=0		; clk lines placed in the 5th slot
)
for(i 0 layer-1
	xv=xd1+M1_wid/2
	basey=-(i/2)*decoder_height*2
	if(mod(i,2)==0 then
		yv=basey-1.22-M1_wid/2+shamt
	else
		yv=basey-10.62+1.22+M1_wid/2+shamt
	)
	via_M2_M1_main(M1_wid,M1_wid,xv,yv)
)
;pin on CLK
net=dbMakeNet(dbD_tx1 "CLK")
yd1=yd2-0.18
fig=dbCreateRect(dbD_tx1 list("M2" "pin") list(xd1:yd1 xd2:yd2))
trm=dbCreateTerm(net "CLK" "input")
pin=dbCreatePin(net fig "CLK")
dbCreateLabel(dbD_tx1 list("M2" "label") xd1+M1_wid/2:(yd1+M1_wid/2) "CLK" "centerLeft" "R0" "roman" 0.05 )

;placing via for connecting local and global inputs for the decoder
for(i 0 layer-1
	for(j 0 bit+2-1
		tar=via_place(j,bit,i)
		xt=xp-off_hor-tar*M2_pitch-M2_wid/2
		if(mod(i,2)==0 then
			yt=yp-i*decoder_height-j*M1_pitch-0.34-M1_wid/2
		else
			yt=yp-(i/2)*2*decoder_height-decoder_height_flip+j*M1_pitch+0.34+M1_wid/2
		)
		via_M2_M1_main(M1_wid,M2_wid,xt,yt);
	)
)
dbClose(dbD_tx)
dbSave(dbD_tx1)
dbClose(dbD_tx1)
)

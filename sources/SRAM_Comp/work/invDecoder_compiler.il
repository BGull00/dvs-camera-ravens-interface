
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; #####################################
; # SRAM Compiler                     #
; # invDecoder_compiler.il            #
; # University of Tennessee Knoxville #
; # Md Badruddoja Majumder            #
; #   John Murray                     #
; # 2020                              #
; #####################################
; 
; ####################
; # v0.12 - 20201121 #
; ####################
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


procedure(via_M2_M1_main(M1_wid,M2_wid,x,y)
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
dbCreateRect(dbD_tx list("M1" "drawing") list(xn:(yn-pwr_con_n-0.21) xn+0.10:yn+nwid))
;Power RAIL
dbCreatePath(dbD_tx list("M1" "drawing") list(xp-0.08:yp+pwid+pwr_con_p/2+0.21 xp+0.36+0.20:yp+yp+pwid+pwr_con_p/2+0.21) pwr_con_p)
dbCreatePath(dbD_tx list("RX" "drawing") list(xp-0.08:yp+pwid+3*pwr_con_p/4+0.21-0.01 xp+0.36+0.20:yp+yp+pwid+3*pwr_con_p/4+0.21-0.01) pwr_con_p/2) 
;rx of inverterdecoderrow modified (x:y-0.01 x:y-0.01 pwr_con/2) (HD)
dbCreatePath(dbD_tx list("M1" "drawing") list(xn-0.08:yn-pwr_con_n/2-0.21 xn+0.36+0.20:yn-pwr_con_n/2-0.21) pwr_con_n)
dbCreatePath(dbD_tx list("RX" "drawing") list(xn-0.08:yn-3*pwr_con_n/4-0.21 xn+0.36+0.20:yn-3*pwr_con_n/4-0.21) pwr_con_n/2)

for(i 0 nf-1 
;dbCreateRect(dbD_tx list("PC" "drawing") list((x+0.16+0.26*i):(y-0.14) (x+0.16+.06+0.26*i):(y+width+0.14)))
dbCreateRect(dbD_tx list("PC" "drawing") list((xn+0.15+0.26*i):(yn+nwid+0.14) (xp+0.15+.06+0.26*i):(yp-0.14)))
)
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


;inv_config(dbD_tx,nf,pwid,nwid,pwr_con_p,pwr_con_n,xp,yp,xn,yn)
procedure(createInvRow(dbD_tx,addrNum,layerOff)

nf=1
;addrNum=3
M1_w=0.18 ; M1 width of addr# lines which have pins placed on them at the top level
M1_s=0.16 ; M1 space of addr# lines which have pins placed on them at the top level
M1_p=M1_s+M1_w
pwid=0.480
nwid=0.240
pwr_con_p=0.680
pwr_con_n=0.680
p2nGap=addrNum*M1_w+(addrNum+1)*M1_s+0.32
xp=0
yp=0
xn=0
yn=yp-p2nGap-nwid
tran2pwr=0.21

for(i 0 addrNum-1
	
	inv_config(dbD_tx,nf,pwid,nwid,pwr_con_p,pwr_con_n,xp+i*0.60,yp,xn+i*0.60,yn)

)
inv_config(dbD_tx,nf,pwid,nwid,pwr_con_p,pwr_con_n,xp,yp,xn,yn)
yc1=yp+pwid+tran2pwr+pwr_con_p/2+0.04
yc2=yc1+0.09

yc3=yp-p2nGap-nwid-tran2pwr-pwr_con_n/2-0.04
yc4=yc3-0.09
for(i 0 addrNum*3-1
	xc1=xp+i*0.20
	xc2=xc1+0.09
	dbCreateRect(dbD_tx list("CA" "drawing") list(xc1:yc1 xc2:yc2))
	dbCreateRect(dbD_tx list("CA" "drawing") list(xc1:yc4 xc2:yc3))
)

xs1=xp-0.12
pitch_inv=0.60


for(i 0 addrNum-1
	xs2=xp+i*pitch_inv+0.21
	ys2=yp-i*M1_p-0.18
	ys1=ys2-M1_w
	dbCreateRect(dbD_tx list("M1" "drawing") list(xs1:ys1 xs2:ys2))
	via_M1_PO(M1_w,0.06,xs2-0.06/2,ys2-M1_w/2)
)
;yt1=yp-p2nGap-tran2pwr-pwr_con_p-1
yt2= yp+0.480+tran2pwr+pwr_con_p+1; connection oriented towards GND rail
for(i 0 addrNum-1
/*
	xt1=xp-0.04+i*pitch_inv
	yt2=yp-i*M1_p-0.18
	xt2=xt1+0.1
*/	
	xt1=xp-0.04+i*pitch_inv
	yt1=yp-i*M1_p-0.18
	xt2=xt1+0.1
	
	
/*	
	
	dbCreateRect(dbD_tx list("M2" "drawing") list(xt1:yt1 xt2:yt2)) ; connecting non-inverted address
	via_M2_M1_main(M1_w,0.1,xt1+0.1/2,yt2-M1_w/2)
	;via_M2_M1_main(0.1,0.1,x2-0.1/2,y2-0.1/2)
	dbCreateRect(dbD_tx list("M2" "drawing") list(xt1+0.30:yt1 xt1+0.3+0.1:yt2)) ; connecting inverted address
*/
	dbCreateRect(dbD_tx list("M2" "drawing") list(xt1:yt1 xt2:yt2)) ; connecting non-inverted address
	via_M2_M1_main(M1_w,0.1,xt1+0.1/2,yt1-M1_w/2)
	dbCreateRect(dbD_tx list("M2" "drawing") list(xt1+0.30:yt1 xt1+0.3+0.1:yt2)) ; connecting inverted address

)
yL1=yp-p2nGap/2
yL2=yp+pwid+tran2pwr-0.02
xL1=xp-0.24
xL2=xp+pitch_inv*addrNum-0.22+0.32+0.1
dbCreateRect(dbD_tx list("JZ" "drawing") list(xL1-layerOff:yL1 xL2:yL2));PP->P transistor
dbCreateRect(dbD_tx list("JX" "drawing") list(xL1-layerOff:yL2 xL2:yL2+0.02+pwr_con_p+0.02-0.01));NP->Power     (x:y x:y-0.01) to modify the height of invDecoderrow_compiler (HD)
dbCreateRect(dbD_tx list("NW" "drawing") list(xL1-layerOff:yL1 xL2:yL2+0.02+pwr_con_p+0.02+0.24));NP->Power
yL3=yp-p2nGap-nwid-tran2pwr+0.02
dbCreateRect(dbD_tx list("JX" "drawing") list(xL1-layerOff:yL1 xL2:yL3));NP->n transistor
dbCreateRect(dbD_tx list("JZ" "drawing") list(xL1-layerOff:yL3-0.02-pwr_con_n-0.02 xL2:yL3));NP->n transistor
dbSave(dbD_tx)
dbClose(dbD_tx)
)

procedure(createInvCol(dbD_tx,addrNum,reverse,layerOff,layerOffRight)

nf=1
;addrNum=3
M1_w=0.18 ; M1 width of addr# lines which have pins placed on them at the top level
M1_s=0.16 ; M1 space of addr# lines which have pins placed on them at the top level
M1_p=M1_s+M1_w
pwid=0.480
nwid=0.240
pwr_con_p=0.680
pwr_con_n=0.680
p2nGap=addrNum*M1_w+(addrNum+1)*M1_s+0.32
xp=0
yp=0
xn=0
yn=yp-p2nGap-nwid
tran2pwr=0.21

for(i 0 addrNum-1
	
	inv_config(dbD_tx,nf,pwid,nwid,pwr_con_p,pwr_con_n,xp+i*0.60,yp,xn+i*0.60,yn)

)
inv_config(dbD_tx,nf,pwid,nwid,pwr_con_p,pwr_con_n,xp,yp,xn,yn)
yc1=yp+pwid+tran2pwr+pwr_con_p/2+0.125
yc2=yc1+0.09

yc3=yp-p2nGap-nwid-tran2pwr-pwr_con_n/2-0.125
yc4=yc3-0.09
pitch_inv=0.60
for(i 0 addrNum-1
	xc1=xp+i*pitch_inv+0.1
	xc2=xc1+0.09
	dbCreateRect(dbD_tx list("CA" "drawing") list(xc1:yc1 xc2:yc2))
	dbCreateRect(dbD_tx list("CA" "drawing") list(xc1+0.26:yc4 xc2+0.26:yc3))
)

xs1=xp-0.12



for(i 0 addrNum-1
	xs2=xp+i*pitch_inv+0.21
	ys2=yp-i*M1_p-0.18
	ys1=ys2-M1_w
	dbCreateRect(dbD_tx list("M1" "drawing") list(xs1:ys1 xs2:ys2))
	via_M1_PO(M1_w,0.06,xs2-0.06/2,ys2-M1_w/2)
)
yt2=yp+2.3; connection oriented towards VDD rail
yt3= yp-p2nGap-2.3; connection oriented towards GND rail


for(i 0 addrNum-1
	xt1=xp-0.04+i*pitch_inv
	;yt1=yp-i*M1_p-0.18-M1_s
	yt1=yp-i*M1_p-0.18
	xt2=xt1+0.1
	if(reverse==0 then
		dbCreateRect(dbD_tx list("M2" "drawing") list(xt1:yt1-M1_w xt2:yt2-M1_w)) ; connecting non-inverted address
		via_M2_M1_main(M1_w,0.1,xt1+0.1/2,yt1-M1_w+M1_w/2)
		dbCreateRect(dbD_tx list("M2" "drawing") list(xt1+0.30:yt1 xt1+0.3+0.1:yt2)) ; connecting inverted address
	else
		dbCreateRect(dbD_tx list("M2" "drawing") list(xt1:yt3 xt2:yt1)) ; connecting non-inverted address
		via_M2_M1_main(M1_w,0.1,xt1+0.1/2,yt1-M1_w/2)
		dbCreateRect(dbD_tx list("M2" "drawing") list(xt1+0.30:yt3 xt1+0.3+0.1:yt1)) ; connecting inverted address
		
	)
)
yL1=yp-p2nGap/2
yL2=yp+pwid+tran2pwr-0.02
xL1=xp-0.24
xL2=xp+pitch_inv*addrNum-0.22+0.32+0.1
if(reverse==0 then
	 LOFF1=layerOffRight
	 LOFF2=0
else
 	 LOFF2=layerOffRight
 	 LOFF1=0
)
	
dbCreateRect(dbD_tx list("JZ" "drawing") list(xL1-layerOff:yL1 xL2:yL2));PP->P transistor
dbCreateRect(dbD_tx list("JX" "drawing") list(xL1-layerOff:yL2 xL2+LOFF1:yL2+0.02+pwr_con_p+0.02-0.01));NP->Power     ;(x:y x:y-0.01) to modify the height of invDecodercol_compiler (HD)
dbCreateRect(dbD_tx list("NW" "drawing") list(xL1-layerOff:yL1 xL2+LOFF1:yL2+0.02+pwr_con_p+0.02+0.24));NW->Power
yL3=yp-p2nGap-nwid-tran2pwr+0.02
dbCreateRect(dbD_tx list("JX" "drawing") list(xL1-layerOff:yL1 xL2:yL3));NP->n transistor
dbCreateRect(dbD_tx list("JZ" "drawing") list(xL1-layerOff:yL3-0.02-pwr_con_n-0.02 xL2+LOFF2:yL3));PP->GND
dbSave(dbD_tx)
dbClose(dbD_tx)
)
;dbD_tx = dbOpenCellViewByType("sram_compiled" "invDecoderRow_compiler" "layout" "maskLayout" "w")
;createInvCol(dbD_tx,3)
;dbD_tx = dbOpenCellViewByType("sram_compiled" "invDecoderCol_compiler" "layout" "maskLayout" "w")
;createInvRow(dbD_tx,2)

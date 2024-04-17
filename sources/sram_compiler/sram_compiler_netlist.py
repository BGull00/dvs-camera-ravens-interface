
#####################################
# SRAM Compiler                     #
# sram_compiler_netlist.py          #
# University of Tennessee Knoxville #
# Md Badruddoja Majumder            #
# 2020                              #
#####################################

###################
# v0.1 - 20200921 #
###################


import math

def unitDecoder(f,inpList,outp,iname,blockID):
	level=int(math.ceil(math.log(len(inpList),2)))
	print(level)
	tempList=inpList[:] #keeps input node list for tree decoders
	
	LP=[] #lone paired node list
	for i in range(level):
		print(tempList)
		
		L=len(tempList)
		if L%2==1:
			LP.append(tempList[-1])
			tempList=tempList[0:-1]
		print(LP)
		for j in range(L//2):
			if i<level-1:
				ip0=tempList.pop(0)
				ip1=tempList.pop(0)
				op_int='imd_'+iname+str(i)+'_'+str(j)
				op=iname+str(i)+'_'+str(j)
				tempList.append(op)
				f.write('NANDC2x1'+' '+'inst_and_'+blockID+'_'+str(i)+'_'+str(j)+' '+'('+'.A('+ip0+')'+','+'.B('+ip1+')'+','+'.Y('+op_int+'))'+';\n')
				f.write('INVC'+' '+'inst_inv_'+blockID+'_'+str(i)+'_'+str(j)+' '+'('+'.A('+op_int+')'+','+'.Y('+op+'))'+';\n')
			else:
				ip0=tempList.pop(0)
				ip1=tempList.pop(0)
				op_int='imd_'+outp
				op=outp
				tempList.append(op)
				f.write('NANDC2x1'+' '+'inst_and_'+blockID+'_'+str(i)+'_'+str(j)+' '+'('+'.A('+ip0+')'+','+'.B('+ip1+')'+','+'.Y('+op_int+'))'+';\n')
				f.write('INVC'+' '+'inst_inv_'+blockID+'_'+str(i)+'_'+str(j)+' '+'('+'.A('+op_int+')'+','+'.Y('+op+'))'+';\n')
				
		if len(LP)==2:
			ip0=LP.pop(0)
			ip1=LP.pop(0)
			if i<level-1:
				op_int='imd_'+iname+str(i)+'_'+str(L//2)
				op=iname+str(i)+'_'+str(L//2)
			else:
				op_int='imd_'+outp
				op=outp
				
			tempList.append(op)
			f.write('NANDC2x1'+' '+'inst_and_'+blockID+'_'+str(i)+'_'+str(L//2)+' '+'('+'.A('+ip0+')'+','+'.B('+ip1+')'+','+'.Y('+op_int+'))'+';\n')
			f.write('INVC'+' '+'inst_inv_'+blockID+'_'+str(i)+'_'+str(L//2)+' '+'('+'.A('+op_int+')'+','+'.Y('+op+'))'+';\n')
	
			

def decoderFull(f,inpList,iname,modname):

	#f=open(fname+'.v','w')
	#inpList=['A0','A1','A2']
	outp='Y'
	#iname='ndec'
	#module declaration
	f.write('module '+modname+'(')
	for i in range(0,len(inpList)):
		f.write(inpList[i]+',')
		f.write(inpList[i]+'_inv'+',')
	f.write('CLK'+',')

	for i in range(0,2**len(inpList)):
		if i<2**len(inpList)-1:
			f.write('YF'+str(i)+',')
		else:
			f.write('YF'+str(i)+');\n')

	#input output declaration
	for i in range(0,len(inpList)):
		f.write('input'+' '+inpList[i]+';\n')
		f.write('input'+' '+inpList[i]+'_inv'+';\n')
	f.write('input'+' '+'CLK'+';\n')
	for i in range(0,2**len(inpList)):
		f.write('output'+' '+'YF'+str(i)+';\n')
	

	for i in range(0,2**len(inpList)):
		inpListMod=[]
		binTemp=format(i,'0'+str(len(inpList))+'b')
		print(binTemp)
		for j in range(len(inpList)):
			if binTemp[-1-j]=='1':
				inpListMod.append(inpList[j])
			else:
				inpListMod.append(inpList[j]+'_inv')
	
		print(inpListMod)
		blockID='b'+str(i)
		unitDecoder(f,inpListMod,outp+str(i),iname+str(i)+'_','b'+str(i))
		ip0='CLK'
		ip1=outp+str(i)
		outp1='YF'+str(i)
		op_int='imd_'+outp1
		op=outp1
	
		f.write('NANDC2x1'+' '+'inst_clockedAND_'+blockID+'_'+str(i)+' '+'('+'.A('+ip0+')'+','+'.B('+ip1+')'+','+'.Y('+op_int+'))'+';\n')
		f.write('INVC'+' '+'inst_clockedinv_'+blockID+'_'+str(i)+' '+'('+'.A('+op_int+')'+','+'.Y('+op+'))'+';\n')
		f.write('\n\n')


	f.write('endmodule\n')
	#f.close()


def invDecoder(f,inpList,outpList,N,iname,modname):
	#f=open(fname+'.v','w')
	#module def 
	f.write('module '+modname+'(')
	for i in range(0,N):
		f.write(inpList[i]+',')
	for i in range(0,N):
		if i<N-1:
			f.write(outpList[i]+',')
		else:
			f.write(outpList[i]+');\n')

	#input output declartion
	for i in range(0,N):
		f.write('input'+' '+inpList[i]+';\n')
	for i in range(0,N):
		f.write('output'+' '+outpList[i]+';\n')

	#body
	for i in range(0,N):
		f.write('INVD'+' '+iname+str(i)+' '+'('+'.A('+inpList[i]+')'+','+'.Y('+outpList[i]+'))'+';\n')
	f.write('endmodule\n')
	#f.close()

def colMux(f,inpList1,inpList2,outp1,outp2,M,iname):
	#M no of inputs
	#f=open(fname+'.v','w')
	#module def 
	f.write('module columnMux(')
	for i in range(0,M):
		f.write(inpList1[i]+',')
		f.write(inpList2[i]+',')

	for i in range(0,M):
		f.write('sel'+str(i)+',')
		
	
	f.write(outp1+',')
	f.write(outp2+');\n')
	
	#input output declartion
	for i in range(0,M):
		f.write('input'+' '+inpList1[i]+';\n')
		f.write('input'+' '+inpList2[i]+';\n')
	
	for i in range(0,M):
		f.write('input'+' '+'sel'+str(i)+';\n')	
	
	f.write('output'+' '+outp1+';\n')
	f.write('output'+' '+outp2+';\n')
	
	#body
	for i in range(M):
		f.write('muxTrans'+' '+iname+str(2*i+0)+' '+'('+'.A('+inpList1[i]+')'+','+'.S('+'sel'+str(i)+'),'+'.Y('+outp1+'))'+';\n')
		f.write('muxTrans'+' '+iname+str(2*i+1)+' '+'('+'.A('+inpList2[i]+')'+','+'.S('+'sel'+str(i)+'),'+'.Y('+outp2+'))'+';\n')
	f.write('endmodule\n')
	#f.close()
	



def sram_complete_compiler(W,M,N):
	fname='sram_complete_compiler'
	f=open(fname+'.v','w')

	#parameter
	#M=8
	#N=8
	wordSize=W
	mx_inp=int(N/wordSize)

	rBits=int(math.ceil(math.log(M,2)))
	cBits=int(math.ceil(math.log(mx_inp,2)))
	#creating supporting modules
	# invRow
	inpList=[]
	outpList=[]
	for i in range(rBits):
		inpList.append('A'+str(i))
	for i in range(rBits):
		outpList.append('Abar'+str(i))
	invDecoder(f,inpList,outpList,rBits,'wire','invRow')

	#inst: invCol
	inpList=[]
	outpList=[]
	for i in range(cBits):
		inpList.append('A'+str(i))
	for i in range(cBits):
		outpList.append('Abar'+str(i))
	invDecoder(f,inpList,outpList,cBits,'wire','invCol')

	#inst: 

	#creating top module

	#module declaration




	#inst: rowDec
	inpList=[]
	for i in range(rBits):
		inpList.append('A'+str(i))

	decoderFull(f,inpList,'wire','rowDecoder')

	#inst: colDec
	inpList=[]
	for i in range(cBits):
		inpList.append('A'+str(i))

	decoderFull(f,inpList,'wire','colDecoder')

	#inst: colMux
	inpList1=[]
	inpList2=[]
	for i in range(mx_inp):
		inpList1.append('A'+str(i))
	for i in range(mx_inp):
		inpList2.append('Abar'+str(i))
	outp1='Y'
	outp2='Ybar'

	colMux(f,inpList1,inpList2,outp1,outp2,mx_inp,'wire')






	#colMux(fname,'A','A_bar','Y','Y_bar',4,'wire')


	f.write('module sram_complete_compiler(')
	for i in range(0,rBits):
		f.write('addr'+str(i)+',')
	for i in range(0,cBits):
		f.write('addr'+str(i+rBits)+',')
	for i in range(0,wordSize):
		f.write('din'+str(i)+',')
	for i in range(0,wordSize):
		f.write('dout'+str(i)+',')
	f.write('clk'+','+'write_en'+','+'sense_en'+');\n')

	#input output declaration
	for i in range(0,rBits):
		f.write('input'+' '+'addr'+str(i)+';\n')
	for i in range(0,cBits):
		f.write('input'+' '+'addr'+str(i+rBits)+';\n')
	for i in range(0,wordSize):
		f.write('input'+' '+'din'+str(i)+';\n')
	for i in range(0,wordSize):
		f.write('output'+' '+'dout'+str(i)+';\n')

	f.write('input'+' '+'clk'+';\n')
	f.write('input'+' '+'write_en'+';\n')
	f.write('input'+' '+'sense_en'+';\n')

	#body

	#clk inverter
	f.write('inverter_compiler '+'inst_invComp'+' ('+'.A0(clk),.A0_bar(clk_bar));\n')

	#inv decoder row
	f.write('invRow'+' '+'inst_invRow(')
	
	for i in range(rBits):
		f.write('addr'+str(i)+',')
	for i in range(rBits):
		f.write('inv_addr'+str(i))
		if i<rBits-1:
			f.write(',')
		else:
			f.write(');\n')

	#inv decoder column
	f.write('invCol'+' '+'inst_invCol(')
	
	for i in range(cBits):
		f.write('addr'+str(rBits+i)+',')
	for i in range(cBits):
		f.write('inv_addr'+str(rBits+i))
		if i<cBits-1:
			f.write(',')
		else:
			f.write(');\n')

	#row decoder
	f.write('rowDecoder '+'inst_rowDec'+' (')
	for i in range(rBits):
		f.write('addr'+str(i)+','+'inv_addr'+str(i)+',')
	
	f.write('clk_bar,')
	for i in range(M):
		f.write('WL'+str(i))
		if i<M-1:
			f.write(',')
		else:
			f.write(');\n')

	#col decoder
	f.write('colDecoder '+'inst_colDec'+' (')
	for i in range(cBits):
		f.write('addr'+str(i+rBits)+','+'inv_addr'+str(i+rBits)+',')
	
	f.write('clk_bar,')
	for i in range(mx_inp):
		f.write('SL'+str(i))
		if i<mx_inp-1:
			f.write(',')
		else:
			f.write(');\n')


	#cell array
	for i in range(M):
		for j in range(N):
			f.write('sram_cell_6t_3 '+'inst_cell_'+str(i)+'_'+str(j)+' ('+'.BL('+'BL'+str(j)+'),'+'.BLN('+'BLN'+str(j)+'),'+'.WL('+'WL'+str(i)+'));\n') 

	#colMux
	for i in range(wordSize):
		f.write('columnMux '+'inst_colMux'+str(i)+' (')
		for j in range(mx_inp):
			f.write('BL'+str(mx_inp*i+j)+','+'BLN'+str(mx_inp*i+j)+',')
		for j in range(mx_inp):
			f.write('SL'+str(j)+',')
	
		f.write('DL'+str(i)+','+'DLN'+str(i)+');\n')

		f.write('write_driver_compiler '+'inst_writeDriver'+str(i)+' (.clk(clk_bar),'+'.data('+'din'+str(i)+'),'+'.write_en(write_en),'+'.BL('+'DL'+str(i)+'),'+'.BLN('+'DLN'+str(i)+'));\n')
		f.write('sense_amp_clocked_compiler '+'inst_senAmp'+str(i)+' (.bit('+'DL'+str(i)+'),'+'.bit_bar('+'DLN'+str(i)+'),'+'.sense_en(sense_en),'+'.sense('+'dout'+str(i)+'));\n')


	
	#precharge 
	for i in range(N):
		f.write('precharge_compiler'+' '+'inst_precharge'+str(i)+' '+'('+'.clk(clk_bar),'+'.B(BL'+str(i)+'),'+'.B_bar(BLN'+str(i)+'));\n')
	
	f.write('endmodule\n')
	f.close()






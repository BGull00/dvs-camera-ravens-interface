
#####################################
# SRAM Compiler                     #
# create_stimuli_sram_compiler.py   #
# University of Tennessee Knoxville #
# Md Badruddoja Majumder            #
# 2020                              #
#####################################

###################
# v0.1 - 20200921 #
###################


from stimuli_function import *
import math



W=64
M=256
N=256
mx_inp=int(N/W)
rBits=int(math.log(M,2))
cBits=int(math.log(mx_inp,2))

Bits=rBits+cBits

fstim=open('/home/mdickey6/ece551/dvs-camera-ravens-interface/sources/SRAM_Comp/work/stimuli_sram_compiler.scs','w')
fstim.write("simulator lang=spectre\n")
#creating clk
val1='0'
val2='1.0'
delay='0'
period='40n'
width='20n'
rise='0.1n'
fall='0.1n'
src_pulse(fstim,'Vclk','clk','0',val1,val2,delay,period,width,rise,fall)

#creating write_en
delay='0'
period='320n'
width='160n'

src_pulse(fstim,'Vwrite_en','write_en','0',val1,val2,delay,period,width,rise,fall)

#creating sense_en
delay='185n'
period='40n'
width='10n'
src_pulse(fstim,'Vsense_en','sense_en','0',val1,val2,delay,period,width,rise,fall)

#creating addr: variable->first 2 bits
for i in range(0,2):
	delay='40n'
	period=str(40*2*(i+1))+'n'
	width=str(20*2*(i+1))+'n'
	src_pulse(fstim,'Vaddr'+str(i),'addr'+str(i),'0',val1,val2,delay,period,width,rise,fall)


#creating addr: constant->remaining bits
for i in range(2,Bits):
	src_dc(fstim,'Vaddr'+str(i),'addr'+str(i),'0','0')

#creating data in
for i in range(0,W):
	delay='40n'
	period=str(40*2*(i+1))+'n'
	width=str(20*2*(i+1))+'n'
	src_pulse(fstim,'Vdin'+str(i),'din'+str(i),'0',val1,val2,delay,period,width,rise,fall)

#crate vdd!
src_dc(fstim,'Vvdd','vdd!','0','1.0')
#crate gnd!
src_dc(fstim,'Vgnd','gnd!','0','0')


		



	





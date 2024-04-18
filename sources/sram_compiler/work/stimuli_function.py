
#####################################
# SRAM Compiler                     #
# decoder_layout_new.il             #
# University of Tennessee Knoxville #
# Md Badruddoja Majumder            #
# 2020                              #
#####################################

###################
# v0.1 - 20200921 #
###################


#string literals
space=' ';
dspace='  '
leftpar='(';
rightpar=')';
newline='\n'
dnewline='\n\n'
gnd='GND';
vdd='VDD';

#dc source
def src_dc(fstim,name,nodefrom,nodeto,value):
	fstim.write(name+space+leftpar+nodefrom+space+nodeto+rightpar+space+'vsource'+space+'type=dc'+space+'dc='+value+newline)

#pulse source
def src_pulse(fstim,name,nodefrom,nodeto,val1,val2,delay,period,width,rise,fall):
	fstim.write(name+space+leftpar+nodefrom+space+nodeto+rightpar+space+'vsource'+space+'type=pulse'+space+'val0='+val1+space+'val1='+val2+space+'period='+period+space+'delay='+delay+space+'rise='+rise+space+'fall='+fall+space+'width='+width+newline)

#pwl source
def src_pwl(fstim,name,nodefrom,nodeto,time,value):
	fstim.write(name+space+leftpar+nodefrom+space+nodeto+rightpar+space+'vsource'+space+'type=pwl'+space+'wave=[')
	if len(time)!=len(value):
		print("time and value array must have same number of elements")
	else:
		for i in range(0,len(time)):
			fstim.write(time[i]+space+value[i])
			if i==len(time)-1:
				fstim.write(']'+newline)
			else:
				fstim.write(space)


		





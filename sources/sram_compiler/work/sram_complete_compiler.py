
#####################################
# SRAM Compiler                     #
# sram_complete_compiler.py         #
# University of Tennessee Knoxville #
# Md Badruddoja Majumder            #
# 2020                              #
#####################################

###################
# v0.1 - 20200921 #
###################


from sram_compiler_netlist import *
import argparse
import sys
import os

parser=argparse.ArgumentParser(description='compile a user defined sram')

parser.add_argument("-w", "--W", type=int, help='number of bits in a word in the sram')
parser.add_argument("-r", "--M", type=int, help='number of rows in the sram: must be a power of 2')
parser.add_argument("-c", "--N", type=int, help='number of columns in the sram: N/W must be a power of 2')

args=parser.parse_args()
W=args.W
M=args.M
N=args.N

sram_complete_compiler(W,M,N)




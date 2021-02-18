#!/bin/bash

SPECROOTDIR=/home/nanoproj/michael/spec2017
GEM5OPT=/home/nanoproj/michael/gem5/build/X86/gem5.opt
SPEC17CFG=/home/nanoproj/michael/gem5/src/DynamicCacheCtrl/no_dc_config.py

######################################################################
BENCHMARKS=(\
    perlbench_s \
    perlbench_r \
    parest_r \
    gcc_s \
    gcc_r \
    omnetpp_s \
    omnetpp_r \
    mcf_s \
    mcf_r \
    deepsjeng_s \
    nab_s \
    lbm_s \
    lbm_r
)
#BENCHMARKS=(\
#    perlbench_s \
#)

MAXINST=$1
 
######################################################################

 if [ ! $# -eq 1 ];
 then
    echo "./run_all <MAXINST>"
    exit 1
 fi

######################################################################

for B in ${BENCHMARKS[@]} 
do
    ./run_one.sh $B $MAXINST&
done

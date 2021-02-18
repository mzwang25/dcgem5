#!/bin/bash

SPECROOTDIR=/home/nanoproj/michael/spec2017
GEM5OPT=/home/nanoproj/michael/gem5/build/X86/gem5.opt
CFG=/home/nanoproj/michael/gem5/configs/dynamic-cache/config.py
OUTDIR=/home/nanoproj/michael/gem5/configs/dynamic-cache/RESULTS
 
######################################################################

BENCHMARK=$1
MAXINST=$2

#Check proper number of arguments
if [ ! $# -eq 2 ];
then
    echo "run_gem5_spec17_benchmarks.sh <BENCHMARK> <MAXINST>"
    exit 1
fi

# Set up enviorment
cd ${SPECROOTDIR}
source shrc

# Go to executable of that benchmark
go $BENCHMARK > /dev/null
ACTUALBENCHNAME=`basename "$PWD"`
echo "Found Benchmark: $ACTUALBENCHNAME" 
echo

# Attemt to enter into the run directory
{
    cd ./run/run*
} ||
{
    echo "Error: Benchmark $ACTUALBENCHNAME has not been built yet"
    exit
}

# Run gem5
#${GEM5OPT} --debug-flag=MMU --outdir=${OUTDIR}/${ACTUALBENCHNAME} --debug-flags=DynamicCacheCtrl ${CFG} -b ${ACTUALBENCHNAME} -i ${MAXINST} 
#${GEM5OPT} --outdir=${OUTDIR}/${ACTUALBENCHNAME} --debug-flags=DynamicCacheCtrl ${CFG} -b ${ACTUALBENCHNAME} -i ${MAXINST} 
${GEM5OPT} --outdir=${OUTDIR}/${ACTUALBENCHNAME} --debug-flags=DynamicCacheCtrl ${CFG} -f 1000000000 -b ${ACTUALBENCHNAME} -i ${MAXINST}


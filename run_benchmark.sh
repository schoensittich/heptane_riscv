#!/bin/bash


function printUsage {
    echo " usage: run_benchmark.sh benchmark_name entrypoint arch solver [ outputdir [-q]]"
    echo "   -q for quiet "
    echo "   outputdir:  subdir of benchmark_name. It will contain the results."
}

if [ $# -lt 1 ] || [ $# -gt 6 ]
then
    printUsage
    exit 1
fi

optExtract=
optAnalysis=
if [ $# == 6 ]
    then
    outputdir=$5
    if [ $6 == "-q" ]
	then
	optAnalysis="-t"
    else
        printUsage
	exit 1
    fi
else
    optExtract="-v"
    if [ $# == 4 ]
    then
     # or set to the arch
     outputdir=.
    else
     outputdir=$5
    fi
fi

./extract.sh $1 $2 $3 $outputdir $optExtract

status=$?
if [ "$status" == "0" ]
then
./analysis.sh $1 $2 $3 $4 $outputdir $optAnalysis
fi

#!/bin/bash

function printUsage {
    echo " usage: run_benchmark_forall_entrypoints.sh benchmark_name arch solver [-q]"
}

if [ $# -lt 1 ] || [ $# -gt 4 ]
then
    printUsage
    exit 1
fi

HERE=`pwd`
OPTION_ANALISYS=
BENCH=$1
ARCH=$2
SOLVER=$3
OPTION=$4
OUTPUTDIR=.
RESULT_DIR=${HERE}/benchmarks/${BENCH}

# (1)  Producing the user fonctions file user_functions.txt in  ${OUTPUTDIR} directory.
echo " **** Getting the entry points"
./extract.sh $BENCH main $ARCH ${OUTPUTDIR}
status=$?
if [ "$status" == "0" ]
then
 # (2) foreach entry point calling the wcept computation.
 ENTRYPOINTS=
 for line in $(cat ${RESULT_DIR}/user_functions.txt); do ENTRYPOINTS="${ENTRYPOINTS} $line" ; done 
 echo " **** ENTRY POINTS = ${ENTRYPOINTS}"
 echo ""
 for ENTRYPOINT in ${ENTRYPOINTS}
 do 
   echo " run_benchmark.sh ${BENCH} ${ENTRYPOINT} $ARCH ${SOLVER} ${ENTRYPOINT} ${OPTION}"
   ./run_benchmark.sh ${BENCH} ${ENTRYPOINT} $ARCH ${SOLVER} ${ENTRYPOINT} ${OPTION}
 done

else
  echo " *** ERROR on command: "
  echo " ./extract.sh $1 main $2 ${OUTPUTDIR}"
fi

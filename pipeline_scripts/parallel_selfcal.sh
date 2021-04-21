#!/bin/bash
#SBATCH -c 90

SOURCE=$1 #L626678
TO=/project/lofarvwf/Share/jdejong/output/${SOURCE}

SCRIPT_FOLDER=/home/lofarvwf-jdejong/scripts/lofar_helpers/pipeline_scripts

START_N=1
END_N=$(ls -dq ${TO}/extract/*.dysco.sub.shift.avg.weights.ms.archive* | wc -l)

#PARAMETER SWEEP
for ((i=${START_N};i<=${END_N};i++)); do
  sh ${SCRIPT_FOLDER}/selfcal_per_box.sh ${SOURCE} ${i} &
done
wait
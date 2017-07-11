#!/bin/bash
#PBS -l walltime=06:59:59
#PBS -l nodes=1:ppn=8:gpus=1

SER_PATH=/home/rcf-proj/pn4/krsharma/
# folder=$1
echo $folder

data_dir=$SER_PATH/bivec/data/${folder}_en
output_dir=$SER_PATH/bivec/trained/${folder}_en
bivec_dir=$SER_PATH/bivec

echo "Bivec training"
current_date_time="`date +%Y/%m/%d::%H::%M::%S`";
echo $current_date_time;

# uses ru-en.ru, ru-en.en and ru-en.aligned

# $bivec_dir/run_bi.sh 1 $output_dir $data_dir/ru-en 40 1 5 20 10

#  Mono model: run_mono.sh remake outputDir trainFile lang dim numIters numThreads neg [otherOpts]
$bivec_dir/run_mono.sh 1 $output_dir $data_dir/ru-en.en en 40 10 20 10 "-min-count 10"

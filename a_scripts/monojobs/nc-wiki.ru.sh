#!/bin/bash
#PBS -l walltime=23:59:59
#PBS -l nodes=1:ppn=8:gpus=1

SER_PATH=/home/rcf-proj/pn4/krsharma/
folder="4"
echo $folder

data_dir=$SER_PATH/bivec/data/${folder}_ru
output_dir=$SER_PATH/bivec/trained/${folder}_ru
bivec_dir=$SER_PATH/bivec

echo "Word2Vec training"
current_date_time="`date +%Y/%m/%d::%H::%M::%S`";
echo $current_date_time;

#  Mono model: run_mono.sh remake outputDir trainFile lang dim numIters numThreads neg [otherOpts]
$bivec_dir/run_word2vec.sh 0 $output_dir $data_dir/ru-en.ru ru 40 10 20 30 "-min-count 10"


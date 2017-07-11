#!/bin/bash
#PBS -l walltime=06:29:59
#PBS -l nodes=1:ppn=8:gpus=1

SER_PATH=/home/rcf-proj/pn4/krsharma
# folder=$1
echo $folder

data_dir=$SER_PATH/bivec/data/${folder}_ru-en
output_dir=$SER_PATH/bivec/trained/${folder}_ru-en

bivec_dir=$SER_PATH/bivec

echo "Modified Bivec training"
current_date_time="`date +%Y/%m/%d::%H::%M::%S`";
echo $current_date_time;

# uses ru-en.ru, ru-en.en and ru-en.aligned

$bivec_dir/run_mod.sh 1 $output_dir $data_dir/ru-en 40 1 5 20 10


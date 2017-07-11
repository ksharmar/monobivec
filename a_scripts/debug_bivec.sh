#!/usr/bin/env bash

SER_PATH=/home/rcf-proj/pn4/krsharma/
folder=2
echo $folder

data_dir=$SER_PATH/bivec/data/${folder}_ru-en
output_dir=$SER_PATH/bivec/trained/${folder}_ru-en
bivec_dir=$SER_PATH/bivec

echo "Bivec training"
current_date_time="`date +%Y/%m/%d::%H::%M::%S`";
echo $current_date_time;

# uses ru-en.ru, ru-en.en and ru-en.aligned

$bivec_dir/run_bi.sh 1 $output_dir $data_dir/ru-en 40 1 1 2 5


#!/usr/bin/env bash

SER_PATH=/nfs/isicvlnas01/users/ksharma/
# SER_PATH=~/Documents/MT

data_dir=$SER_PATH/bivec/data/1_ru-en
output_dir=$SER_PATH/bivec/trained/1_ru-en
fast_align_dir=$SER_PATH/fast_align/build
bivec_dir=$SER_PATH/bivec
moses_dir=$SER_PATH/MT/mosesdecoder

echo "Directories known"

fileA=$data_dir/ru-en.ru # source lang convention
fileB=$data_dir/ru-en.en # target lang convention

<<COMMENT
# actually before tokenization, do the cleaning
$moses_dir/scripts/training/clean-corpus-n.perl $data_dir/ru-en ru en $data_dir/ru-en.clean 1 80

fileA=$data_dir/ru-en.clean.ru # source lang convention
fileB=$data_dir/ru-en.clean.en # target lang convention
fileAlign=$data_dir/ru-en.clean.aligned

echo "Starting fast align"
</dev/null paste -d ' ||| ' $fileA - - - - $fileB > $data_dir/data.pipe
# run fast align forward, reverse and atools
echo "Forward"
$fast_align_dir/fast_align -i $data_dir/data.pipe -d -o -v > $data_dir/data.forward.align
echo "Reverse"
$fast_align_dir/fast_align -i $data_dir/data.pipe -d -o -v -r > $data_dir/data.reverse.align
echo "Full"
$fast_align_dir/atools -i $data_dir/data.forward.align -j $data_dir/data.reverse.align -c grow-diag-final-and > $fileAlign
COMMENT


# todo fix paths .clean etc
#!/usr/bin/env bash


SER_PATH=/nfs/isicvlnas01/users/ksharma/bivec

# train
for i in {2..2}
do
JO=${SER_PATH}/a_scripts/${i}_op.txt
JE=${SER_PATH}/a_scripts/${i}_err.txt

rm $JO
rm $JE
qsub -S /bin/bash -l gpu=0 -q glaive-isi.q -o $JO -e $JE -V -v folder="$i" learn_bivec.sh

done

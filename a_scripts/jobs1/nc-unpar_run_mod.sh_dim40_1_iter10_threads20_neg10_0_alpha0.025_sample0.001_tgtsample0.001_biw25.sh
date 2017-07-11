!/bin/bash
#PBS -l walltime=06:29:59
#PBS -l nodes=1:ppn=8:gpus=1

SER_PATH=/home/rcf-proj/pn4/krsharma
bivec_dir=$SER_PATH/bivec

echo "Modified Bivec training"
current_date_time="`date +%Y/%m/%d::%H::%M::%S`";
echo $current_date_time;

# uses ru-en.ru, ru-en.en and ru-en.aligned


$bivec_dir/run_mod.sh 1 $SER_PATH/bivec/trained/nc-unpar_run_mod.sh_dim40_1_iter10_threads20_neg10_0_alpha0.025_sample0.001_tgtsample0.001_biw25 $SER_PATH/bivec/data/nc-unpar/ru-en 40 1 10 20 10 0 0.025 0.001 0.001 25
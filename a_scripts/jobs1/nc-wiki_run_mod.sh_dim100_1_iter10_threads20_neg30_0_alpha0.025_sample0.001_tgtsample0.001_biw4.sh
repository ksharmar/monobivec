!/bin/bash
#PBS -l walltime=06:29:59
#PBS -l nodes=1:ppn=8:gpus=1

SER_PATH=/home/rcf-proj/pn4/krsharma
bivec_dir=$SER_PATH/bivec

echo "Modified Bivec training"
current_date_time="`date +%Y/%m/%d::%H::%M::%S`";
echo $current_date_time;

# uses ru-en.ru, ru-en.en and ru-en.aligned


$bivec_dir/run_mod.sh 1 $SER_PATH/bivec/trained/nc-wiki_run_mod.sh_dim100_1_iter10_threads20_neg30_0_alpha0.025_sample0.001_tgtsample0.001_biw4 $SER_PATH/bivec/data/nc-wiki/ru-en 100 1 10 20 30 0 0.025 0.001 0.001 4
workspace=/home/rcf-proj/pn4/krsharma/bivec/data/
folder=$1
# prefix=${folder}_ru-en

qsub -v folder="${folder}" learn_monovec.sh
qsub -v folder="${folder}" learn_monovec_l2.sh

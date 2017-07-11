# bivec.c and mod.c experiments: initially run vocab for each data_dir independent of exp configurations (except min_count)

# run_bi.sh remake outputDir trainPrefix dim alignOpt numIters numThreads neg [isCbow alpha sample tgt_sample bi_weight otherOpts]
jobs_folder = "jobs_07_25"
remake = 1
bivec_data = ["nc"]
modvec_data = ["nc", "nc-unpar", "nc-wiki"]
vector_dimensions = [40] # , 100]
alignOpt = 1
num_iterations = [10]
threads = 20
neg_samples = [10] # , 30] # 15
isCbow = 0
alpha = 0.025
sample = [10e-4] # [10e-3, 10e-4, 10e-5]
bi_weight = [1, 4, 15] # [1, 4, 10, 15, 25]
# min_count = [5, 10] (reduce vocab sizes to 50K/100K)

base_data_dir = "$SER_PATH/bivec/data/"
base_output_dir = "$SER_PATH/bivec/trained/"
run_files = ["run_bi.sh", "run_mod.sh"]
header="""#!/bin/bash
#PBS -l walltime=06:29:59
#PBS -l nodes=1:ppn=8:gpus=1

SER_PATH=/home/rcf-proj/pn4/krsharma
bivec_dir=$SER_PATH/bivec

echo "Modified Bivec training"
current_date_time="`date +%Y/%m/%d::%H::%M::%S`";
echo $current_date_time;

# uses ru-en.ru, ru-en.en and ru-en.aligned

"""


def get_cmds(run_fi, data):
    cmds = list()
    names = list()
    for folder in data:
        data_dir=base_data_dir + folder
        for dim in vector_dimensions:
            for epoch in num_iterations:
                for neg in neg_samples:
                    for samp in sample:
                            for bi_w in bi_weight:
                                post = str(dim) + " "+ str(alignOpt) +" " + str(epoch) + " "+ str(threads) +" "+ str(neg) +" " + \
                                       str(isCbow) + " " + str(alpha) + " " + str(samp) + " " + str(samp) + " " + str(bi_w)
                                name_post =  "dim" + str(dim) + " "+ str(alignOpt) +" " + "iter"+ str(epoch) + " "+ "threads"+ str(threads) +" "+ "neg"+ str(neg) +" " + \
                                             str(isCbow) + " " + "alpha" + str(alpha) + " " + "sample"+ str(samp) + " " + "tgtsample"+ str(samp) + " " + "biw"+str(bi_w)
                                output_dir = base_output_dir + folder + "_" + run_fi + "_" + name_post.replace(" ", "_")
                                name = folder + "_" + run_fi + "_" + name_post.replace(" ", "_")
                                cmds.append("$bivec_dir/" + run_fi + " " + str(remake) + " " + output_dir + " " + \
                                      data_dir + "/ru-en " + post)
                                names.append(name)
    return cmds, names


if __name__ == '__main__':
    cmds, names = get_cmds(run_files[0], bivec_data)
    for c, job_name in zip(cmds, names):
        job_str = header + "\n" + c
        job_fi_name = "./{}/{}.sh".format(jobs_folder, job_name)
        f = open(job_fi_name, 'w')
        f.write(job_str)
        f.close()
    cmds, names = get_cmds(run_files[1], modvec_data)
    for c, job_name in zip(cmds, names):
        job_str = header + "\n" + c
        job_fi_name = "./{}/{}.sh".format(jobs_folder, job_name)
        f = open(job_fi_name, 'w')
        f.write(job_str)
        f.close()





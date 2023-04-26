#!/bin/bash
#SBATCH --job-name=mpi_openmp
#SBATCH --output=%x.o%j
#SBATCH --time=01:00:00
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --partition=cpu_short

intel-mpi/2019.3.199/intel-19.0.3.199
module load python/3.7.6/intel-19.0.3.199
export DARSHAN_ENABLE_NONMPI=1
export DXT_ENABLE_IO_TRACE=1
for i in 8
do
 python /gpfs/users/racliuspa/StageM1_DDN/code_saturne-7.3.0.build/bin/code_saturne run -n $i --tool-args LD_PRELOAD=/gpfs/users/racliuspa/StageM1_DDN/darshan-lib/usr/local/lib/libdarshan.so
done

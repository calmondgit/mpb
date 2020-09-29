#!/bin/sh
#BSUB -J mpb
#BSUB -q fotonano
#BSUB -n 20

#BSUB -R "span[hosts=1]"

#BSUB -R "rusage[mem=0.5GB]"

###BSUB -R "select[model == XeonE5_2665]"
#BSUB -W 24:00

#BSUB -u ziwche@dtu.dk
#BSUB -N  
#BSUB -B

#BSUB -o Output_%J.out
###BSUB -e Error_%J.err

export OMP_NUM_THREADS=$LSB_DJOB_NUMPROC


# module load npa-cluster-setup
# module avail
if [ -d /dtu/sw/dcc ]; then
   source /dtu/sw/dcc/dcc-sw.bash
fi
module load mpb

INPUT="1551-1"
mpirun -np $LSB_DJOB_NUMPROC mpb-mpi ${INPUT}.ctl >& ${INPUT}.out

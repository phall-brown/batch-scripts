#!/bin/bash
#**********************
# SLURM JOB INFORMATION
#**********************
# SLURM Job Name
#SBATCH -J MySageJob 

# Walltime requested for job (24 hrs)
#SBATCH -t 24:00:00

# Request use of 1 core on a single node (-N 1)
#SBATCH -N 1
#SBATCH --cpus-per-task=1
#SABTCH --ntasks=1

# Request 32 GB of memory
#SBATCH --mem-per-cpu=32G

# Define Oscar partition to use
#SBATCH -p batch

# SLURM output and error file names
# Use '%x' for Job Name,'%A' for array-job ID, '%j' for job ID and '%a' for task ID`
#SBATCH -e %x-%j.err
#SBATCH -o %x-%j.out

# Notify user if job fails or ends (uncomment to use)
##SBATCH --mail-user=your_name@brown.edu
##SBATCH --mail-type=FAIL,END

#*****************
# EXECUTE COMMANDS
#*****************
# get time at beginning of execution step
t0=$(date +%s)
# bind path
export SINGULARITY_BINDPATH="/gpfs/home/$USER,/gpfs/scratch/$USER,/gpfs/data/"
# load desired SAGE module
module load sage/9.1
# change to execute directory
cd /gpfs/data/mchan2/sli71/eqStir
# commands to be executed
singularity exec /gpfs/rt/7.2/opt/sage/9.1/bin/sage.sif sage eqStir.sage
# get time at end of execution step
t1=$(date +%s)

#**************************************************************
# OUTPUT TIMING INFORMATION (optional, for diagnostic purposes)
#**************************************************************
dt=$(echo "$t1 - $t0" | bc)

printf "Total execution time (s): %08.1f\n" $dt



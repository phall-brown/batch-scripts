#!/bin/bash
#**********************
# SLURM JOB INFORMATION
#**********************
# SLURM Job Name
#SBATCH -J MyPythonJob 

# Walltime requested for job (2 hrs)
#SBATCH -t 2:00:00

# Request use of 1 core (--cpus-per-task=1, --ntasks=1)
# on a single node (-N 1)
#SBATCH -N 1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1

# Request 16 GB of memory
#SBATCH --mem-per-cpu=16G

# Define Oscar partition to use
#SBATCH -p batch

# SLURM output and error file names
# Use '%x' for Job Name,'%A' for array-job ID, '%j' for job ID and '%a' for task ID`
#SBATCH -e %x-%j.err
#SBATCH -o %x-%j.out

# Notify user if job fails or ends (uncomment and change email address to use)
##SBATCH --mail-user=YOUR_NAME@brown.edu
##SBATCH --mail-type=FAIL,END

#*****************
# EXECUTE COMMANDS
#*****************
# get time at beginning of execution step
t0=$(date +%s)
# load desired python module
module load python/3.9.0
# commands to be executed (change name of python script to use)
# note: -u flag has python run without buffering output
python3 -u MYPYTHONSCRIPT.py 
# get time at end of execution step
t1=$(date +%s)

#**************************************************************
# OUTPUT TIMING INFORMATION (optional, for diagnostic purposes)
#**************************************************************
dt=$(echo "$t1 - $t0" | bc)

printf "Total execution time (s): %08.1f\n" $dt



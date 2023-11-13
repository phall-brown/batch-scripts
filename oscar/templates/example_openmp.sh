#!/bin/bash
# Example batch script for running openmp on Oscar
#**********************
# SLURM JOB INFORMATION
#**********************
# Walltime requested for job (24 hrs)
#SBATCH --time=24:00:00

# Request use of 48 cores and 4GB of memory per core on 1 node
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G

# Define Oscar partition to use
#SBATCH --partition=batch

# Job Name
#SBATCH -J MyOpenMPJob 

# SLURM output (*.out) and error (*.err) file names
# Use '%x' for Job Name,'%A' for array-job ID, '%j' for job ID and '%a' for task ID`
#SBATCH -e %x-%j.err
#SBATCH -o %x-%j.out

# Notify user if job fails or ends (uncomment and add your email address to use)
##SBATCH --mail-user=your_name@brown.edu
##SBATCH --mail-type=FAIL,END

#********************
# COMMANDS TO EXECUTE
#********************
# load desired modules (change to suit your particular needs)
module load python/3.9.0
module load gcc/10.2 
# activate virtual environment
#source ~/envs/myvirtualenv.venv/bin/activate
# set environment variables (change to suit your needs)
EXAMPLE_VARIABLE="Hello!"
# commands to be executed (change to suit your needs)
echo $EXAMPLE_VARIABLE


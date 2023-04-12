#!/bin/bash
# Example batch script for running serial jobs on Oscar
#**********************
# SLURM JOB INFORMATION
#**********************
# Walltime requested for job (1 hour)
#SBATCH -t 01:00:00

# Request use of 1 core and 8GB of memory on 1 node
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=750G

# Define Oscar partition to use
#SBATCH -p bigmem

# Job Name
#SBATCH -J MySerialJob 

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
conda activate conda_environment_name
# commands to be executed (change to suit your needs)
python test.py


#!/bin/bash
# Example batch script for running mpi jobs on Oscar
#**********************
# SLURM JOB INFORMATION
#**********************
# Walltime requested for job (24 hrs)
#SBATCH -t 24:00:00

# Request use of 32 cores and 4GB of memory per core on 4 nodes
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4G

# Define Oscar partition to use
#SBATCH -p batch

# Job Name
#SBATCH -J MyMPIJob 

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
module load mpi/openmpi_4.0.7_gcc_10.2_slurm22
module load gcc/10.2 
# set environment variables (change to suit your needs)
EXAMPLE_VARIABLE="Hello!"
# commands to be executed (change to suit your needs)
echo $EXAMPLE_VARIABLE
srun --mpi=pmix echo $EXAMPLE_VARIABLE 

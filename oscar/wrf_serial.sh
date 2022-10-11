#!/bin/bash
#**********************
# SLURM JOB INFORMATION
#**********************
# SLURM Job Name
#SBATCH -J WRF_serial 

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
# load desired modules (load modules explicilty for reproducibility)
module load wrf/4.2.1_hpcx_2.7.0_intel_2020.2_slurm20
module load mpi/hpcx_2.7.0_intel_2020.2_slurm20
module load intel/2020.2
# report the modules loaded into the environment (for records)
echo '**************'
echo 'MODULES LOADED'
echo '**************'
module list 2>&1
echo '**************'
# report relevant environment variables
echo '******************************'
echo 'RELEVANT ENVIRONMENT VARIABLES'
echo '******************************'
echo 'WPS: '$WPS
echo 'WPS_GEO: '$WPS_GEOG
echo '******************************'
# run WRF
wrf.exe


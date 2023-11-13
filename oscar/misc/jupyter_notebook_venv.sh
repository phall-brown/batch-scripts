#!/bin/bash
#**********************
# SLURM JOB INFORMATION
#**********************
# SLURM Job Name
#SBATCH -J Tunnel-Jupyter 

# Walltime requested for job (4 hrs)
#SBATCH -t 4:00:00

# Request use of 4 cores on a single node (-N 1)
#SBATCH -N 1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4

# Request 8 GB of memory per core
#SBATCH --mem-per-cpu=8G

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
# set variables
VENV_PATH=/users/phall1/chorvat/SASIP/mom6_bathy.venv

# load desired modules
# relevant python module
module load python/3.9.0
# all other modules
module load esmf/8.3.0 
module load gcc/10.2
module load mpi/openmpi_4.0.5_gcc_10.2_slurm20
module load netcdf/4.7.4_gcc_10.2_hdf5_1.10.5
module load hdf5/1.10.5_openmpi_4.0.5_gcc_10.2_slurm20

# activate virtual environment
source $VENV_PATH/bin/activate

# commands to be executed
# get tunneling info
XDG_RUNTIME_DIR=""
ipnport=$(shuf -i8000-9999 -n1)
ipnip=$(hostname -i)

# write tunneling instructions to log file
echo -e "
    Copy/Paste this in your local terminal to ssh tunnel with remote
    -----------------------------------------------------------------
    ssh -N -L $ipnport:$ipnip:$ipnport $USER@ssh.ccv.brown.edu
    -----------------------------------------------------------------
    Then open a browser on your local machine to the following address
    ------------------------------------------------------------------
    localhost:$ipnport  (prefix w/ https:// if using password)
    ------------------------------------------------------------------
    "
# start an ipcluster instance and launch jupyter server
jupyter-notebook --no-browser --port-$ipnport --ip=$ipnip

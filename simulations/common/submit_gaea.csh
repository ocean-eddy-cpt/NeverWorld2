#!/bin/csh
#SBATCH --job-name=neverworld2
#SBATCH --time=01:00:00
#SBATCH --qos=normal
#SBATCH --partition=batch
#SBATCH --mail-user=neerajab@princeton.edu
#SBATCH --mail-type=ALL
#SBATCH --export=NONE
#SBATCH --clusters=c3,c4
#SBATCH --nodes=25
#SBATCH --account=gfdl_o

echo -n "Job start time "
date
echo -n "Running in directory "
pwd

if (-r RESTART/MOM.res.nc) then
  echo Copying restart files from RESTART to INPUT
  cp -f RESTART/MOM.res.nc INPUT/
endif

echo State of run directory:
ls -lR

time srun -n 800 ../build/MOM6

echo -n "Job completion time "
date

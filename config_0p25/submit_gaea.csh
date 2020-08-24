#!/bin/csh
#SBATCH --job-name=neverworld2
#SBATCH --time=550
#SBATCH --qos=normal
#SBATCH --partition=batch
#SBATCH --mail-type=fail
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

time srun -n 800 ./MOM6

echo -n "Job completion time "
date

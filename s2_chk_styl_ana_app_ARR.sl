#!/bin/bash -e
#SBATCH --job-name=CkSylArrayJob             # job name (shows up in the queue)
#SBATCH --output s2_logs.txt
#SBATCH --open-mode append                # append output into one file
#SBATCH --time=01:00:00                 # Walltime (HH:MM:SS)
#SBATCH --mem=8GB                     # Memory
#SBATCH --array=0-576                     # Array jobs

module load Maven/3.6.0
module load Python/3.9.5-gimkl-2020a


srun python s2_chk_styl_ana_app_ARR.py -idx "${SLURM_ARRAY_TASK_ID}" -n 577 -crd ../my_codesnippet_analysis/CheckStyle1 -ucrd -pd mvn_apps -upd -xrf checkstylexmlreports_xml -uxrf -ef checkstyleerrorsnippets_java -lf checkstyle_logs.txt
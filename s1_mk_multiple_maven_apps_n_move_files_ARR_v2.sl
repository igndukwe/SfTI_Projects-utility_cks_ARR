#!/bin/bash -e
#SBATCH --job-name=mvnArrayJob             # job name (shows up in the queue)
#SBATCH --output s1_logs.txt
#SBATCH --open-mode append                # append output into one file
#SBATCH --time=00:05:00                 # Walltime (HH:MM:SS)
#SBATCH --mem=1GB                     # Memory
#SBATCH --array=0-1                     # Array jobs

module load Maven/3.6.0
module load Python/3.9.5-gimkl-2020a

inArray=(11 12)
input=${inArray[$SLURM_ARRAY_TASK_ID]}

srun python s1_mk_multiple_maven_apps_n_move_files_ARR.py -idx "${inArray[$SLURM_ARRAY_TASK_ID]}" -n 577 -s ../my_codesnippet_analysis/pmdpasscodesnippets_java -crd ../my_codesnippet_analysis/CheckStyle1 -ucrd -pd mvn_apps -upd -libs checks_lib -rvaf
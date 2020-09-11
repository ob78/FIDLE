#!/bin/bash

#SBATCH --job-name="GTSRB Full conv."                  # nom du job
#SBATCH --ntasks=1                                     # nombre de tâche (un unique processus ici)
#SBATCH --gres=gpu:1                                   # nombre de GPU à réserver (un unique GPU ici)
#SBATCH --cpus-per-task=10                             # nombre de coeurs à réserver (un quart du noeud)
#SBATCH --hint=nomultithread                           # on réserve des coeurs physiques et non logiques
#SBATCH --time=02:00:00                                # temps exécution maximum demande (HH:MM:SS)
#SBATCH --output="_batch/GTSRB_%j.out"                 # nom du fichier de sortie
#SBATCH --error="_batch/GTSRB_%j.err"                  # nom du fichier d'erreur (ici commun avec la sortie)
#SBATCH --mail-user=Jean-Luc.Parouty@grenoble-inp.fr
#SBATCH --mail-type=ALL

# -----------------------------------------------
#         _           _       _
#        | |__   __ _| |_ ___| |__
#        | '_ \ / _` | __/ __| '_ \
#        | |_) | (_| | || (__| | | |
#        |_.__/ \__,_|\__\___|_| |_|
#                              Fidle at IDRIS
# -----------------------------------------------
#
# <!-- TITLE --> [BASH2] - SLURM batch script
# <!-- DESC --> Bash script for SLURM batch submission of GTSRB notebooks 
# <!-- AUTHOR : Jean-Luc Parouty (CNRS/SIMaP) -->

MODULE_ENV="tensorflow-gpu/py3/2.2.0"
RUN_DIR="$WORK/fidle/GTSRB"
RUN_SCRIPT="./run/full_convolutions.py"

# ---- Welcome...

echo '------------------------------------------------------------'
echo "Start : $0"
echo '------------------------------------------------------------'
echo "Job id        : $SLURM_JOB_ID"
echo "Job name      : $SLURM_JOB_NAME"
echo "Job node list : $SLURM_JOB_NODELIST"
echo '------------------------------------------------------------'
echo "Script        : $RUN_SCRIPT"
echo "Run in        : $RUN_DIR"
echo "With env.     : $MODULE_ENV"
echo '------------------------------------------------------------'


# ---- Module

module purge
module load "$MODULE_ENV"

# ---- Run it...
#
cd "$RUN_DIR"
ipython "$RUN_SCRIPT"
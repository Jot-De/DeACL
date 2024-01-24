#!/bin/bash

#SBATCH --gres=gpu:2
#SBATCH --partition=all
#SBATCH --mem=10G
#SBATCH -c 2
#SBATCH --ntasks-per-node 16
#SBATCH --nodelist=sprint1

# mitigates activation problems
eval "$(conda shell.bash hook)"
source .bashrc

# activate the correct environment
# conda activate pytorch
# source activate /sprint1/anaconda/envs/pytorch
# source activate /home/${USER}/.conda/envs/test-env
conda activate jd_deacl
source deacl_py310/bin/activate

# debug print-outs
echo USER: $USER
which conda
which python

# run the code
./bash_files/DeACL_imagenet_resnet50.sh

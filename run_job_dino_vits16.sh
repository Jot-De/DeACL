#!/bin/bash
#SBATCH --nodes=1
#SBATCH --gpus-per-node=2
#SBATCH --time=48:00:00
#SBATCH --job-name=LR01dino_vits16

# Recommended way if you want to enable gcc version 10 for the "sbatch" session 
source /opt/rh/devtoolset-10/enable

gcc --version  # if you print it out again here it'll be version 10 

python --version  # prints out the python version.  Replace this with a python call to whatever file.

source ~/miniconda3/etc/profile.d/conda.sh
conda activate deacl310
conda install pytorch==1.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia -y
pip install -r requirements.txt 

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/jan_dubinski/miniconda3/lib

# debug print-outs
echo USER: $USER
which conda
which python

./bash_files/DeACL_imagenet_dino_vits16.sh
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --time=0:30:00
#SBATCH --job-name=adv_slf
#SBATCH --partition=interactive

# Recommended way if you want to enable gcc version 10 for the "sbatch" session 
source /opt/rh/devtoolset-10/enable

gcc --version  # if you print it out again here it'll be version 10 

python --version  # prints out the python version.  Replace this with a python call to whatever file.

source ~/miniconda3/etc/profile.d/conda.sh
conda activate deacl310
pip install -r requirements.txt 
pip install git+https://github.com/fra31/auto-attack


#conda install pytorch==1.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia -y

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/jan_dubinski/miniconda3/lib

# debug print-outs
echo USER: $USER

which conda
which conda

which python






python adv_slf_vit.py --ckpt /data/jan_dubinski/DeACL/trained_models/mocov2_kd_at/qb0cb8et/dinov2_vits_lr0.05_k2_decay0_eps8-qb0cb8et-ep=35.ckpt  --batch_size=512 --learning_rate=0.5 --epochs=15
echo "lr 0.05"
#python adv_slf.py --ckpt /data/jan_dubinski/DeACL/trained_models/mocov2_kd_at/dokx7u4h/res18_simclr-cifar10_wrapper_test-dokx7u4h-ep=100.ckpt --batch_size=512 --learning_rate=0.5 --epochs=15

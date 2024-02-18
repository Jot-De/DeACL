#!/bin/bash
#SBATCH --nodes=1
#SBATCH --gpus-per-node=2
#SBATCH --time=48:00:00
#SBATCH --job-name=simsiam

# Recommended way if you want to enable gcc version 10 for the "sbatch" session 
source /opt/rh/devtoolset-10/enable

gcc --version  # if you print it out again here it'll be version 10 

python --version  # prints out the python version.  Replace this with a python call to whatever file.

source ~/miniconda3/etc/profile.d/conda.sh
conda activate deacl310
#pip install -r requirements.txt 
#conda install pytorch==1.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia -y

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/jan_dubinski/miniconda3/lib

# debug print-outs
echo USER: $USER

which conda
which conda

which python

python3 main_pretrain_AdvTraining.py \
    --dataset cifar10 \
    --backbone resnet18 \
    --data_dir ./data \
    --max_epochs 101 \
    --gpus 0 \
    --accelerator gpu \
    --precision 16 \
    --optimizer sgd \
    --scheduler warmup_cosine \
    --lr 0.5 \
    --classifier_lr 0.5 \
    --weight_decay 5e-4 \
    --batch_size 512 \
    --num_workers 4 \
    --brightness 0.4 \
    --contrast 0.4 \
    --saturation 0.4 \
    --hue 0.1 \
    --gaussian_prob 0.0 0.0 \
    --crop_size 32 \
    --num_crops_per_aug 1 1 \
    --name "res18_simclr-cifar10_wrapper_test" \
    --save_checkpoint \
    --checkpoint_frequency 25 \
    --method mocov2_kd_at \
    --limit_val_batches 0.2 \
    --distillation_teacher "simclr_cifar10" \
    --trades_k 2 \
    --wandb

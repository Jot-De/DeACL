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

python3 main_pretrain_AdvTraining.py \
    --dataset imagenet \
    --backbone vit_small \
    --data_dir /data/jan_dubinski \
    --val_dir /data/jan_dubinski/imagenet/val \
    --max_epochs 100 \
    --gpus 0,1 \
    --accelerator gpu \
    --precision 16 \
    --optimizer sgd \
    --scheduler warmup_cosine \
    --lr 0.01 \
    --classifier_lr 0.1 \
    --weight_decay 5e-7 \
    --batch_size 768 \
    --num_workers 4 \
    --brightness 0.4 \
    --contrast 0.4 \
    --saturation 0.4 \
    --hue 0.1 \
    --gaussian_prob 0.0 0.0 \
    --crop_size 224 \
    --num_crops_per_aug 1 1 \
    --name "dino_vits16_imagenet_lr0-01_k2_decay0" \
    --save_checkpoint \
    --checkpoint_frequency 1 \
    --method mocov2_kd_at \
    --limit_val_batches 0.1 \
    --distillation_teacher "dino_vits16_imagenet" \
    --trades_k 2 \
    --wandb \

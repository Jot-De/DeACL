python3 main_pretrain_AdvTraining.py \
    --dataset imagenet \
    --backbone resnet50 \
    --data_dir /data/jan_dubinski \
    --val_dir /data/jan_dubinski/imagenet/val \
    --max_epochs 100 \
    --gpus 0,1  \
    --accelerator gpu \
    --precision 16 \
    --optimizer sgd \
    --scheduler warmup_cosine \
    --lr 0.5 \
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
    --name "simsiam_resnet50_imagenet_lr0-0_k2_decay5e-7" \
    --save_checkpoint \
    --checkpoint_frequency 1 \
    --method mocov2_kd_at \
    --limit_val_batches 0.1 \
    --distillation_teacher "simsiam_resnet50_imagenet" \
    --trades_k 3 \
    --wandb \

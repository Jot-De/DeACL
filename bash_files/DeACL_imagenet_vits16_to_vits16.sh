python3 main_pretrain_AdvTraining.py \
    --dataset imagenet \
    --backbone vit_small \
    --data_dir /home/datasets \
    --max_epochs 100 \
    --gpus 1 \
    --accelerator gpu \
    --precision 16 \
    --optimizer sgd \
    --scheduler warmup_cosine \
    --lr 0.5 \
    --classifier_lr 0.5 \
    --weight_decay 5e-4 \
    --batch_size 32 \
    --num_workers 4 \
    --brightness 0.4 \
    --contrast 0.4 \
    --saturation 0.4 \
    --hue 0.1 \
    --gaussian_prob 0.0 0.0 \
    --crop_size 224 \
    --num_crops_per_aug 1 1 \
    --name "dino_vits16_imagenet" \
    --save_checkpoint \
    --checkpoint_frequency 1 \
    --method mocov2_kd_at \
    --limit_val_batches 0.2 \
    --distillation_teacher "dino_vits16_imagenet" \
    --trades_k 2 \
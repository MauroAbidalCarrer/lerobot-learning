#!/bin/bash

# Use Paris time for date formatting
TZ="Europe/Paris"
date_name=$(TZ=$TZ date +%Y-%m-%d_%H:%M)

echo outputs/our_new_dataset_smolVLA_$date_name

python lerobot/lerobot/scripts/train.py \
  --dataset.repo_id=SafwanAhmad/smol_test_safwan_odd_one_out \
  --policy.path=lerobot/smolvla_base \
  --steps=15000 \
  --save_freq=1000 \
  --output_dir=outputs/our_new_dataset_smolVLA_$date_name \
  --job_name=our_new_dataset_smolVLA_$date_name \
  --policy.device=cuda \
  --log_freq=10 \
  --batch_size=32 \
  --wandb.enable=true
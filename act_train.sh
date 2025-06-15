#!/bin/bash

# Use Paris time for date formatting
TZ="Europe/Paris"
date_name=$(TZ=$TZ date +%Y%m%d_%H%M)

python lerobot/lerobot/scripts/train.py \
  --dataset.repo_id=SafwanAhmad/smol_test_safwan_1 \
  --policy.type=act \
  --output_dir=outputs/train/act_so101_test$date_name \
  --job_name=act_so101_test_$date_name \
  --policy.device=cuda \
  --wandb.enable=true \
  --log_freq=20 \
  --steps=50000 \
  --save_freq=2000 \
  # --pretrained_path=outputs/train/act_so101_test_5k_steps

huggingface-cli upload \
  ${HF_USER}/act_so101_test$date_name \
  outputs/train/act_so101_test$date_name/checkpoints/last/pretrained_model

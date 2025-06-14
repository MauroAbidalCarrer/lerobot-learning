#!/bin/bash

date_name=$(date +%Y%m%d_%H%M)

python lerobot/lerobot/scripts/train.py \
  --dataset.repo_id=SafwanAhmad/smol_test_safwan_1 \
  --policy.type=act \
  --output_dir=outputs/train/act_so101_test_5k_steps_$date_name \
  --job_name=act_so101_test_$date_name \
  --policy.device=cuda \
  --wandb.enable=true \
  --log_freq=20 \
  --steps=50000 \
  --save_freq=2000

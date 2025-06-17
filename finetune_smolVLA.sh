#!/bin/bash

# Use Paris time for date formatting
TZ="Europe/Paris"
date_name=$(TZ=$TZ date +%Y-%m-%d_%H:%M)



# Warning: This will RE-finetune the  training of the 8k chkpoint model
python lerobot/lerobot/scripts/train.py \
  --dataset.repo_id=SafwanAhmad/smol_test_safwan_odd_one_out_camTop \
  --policy.path=Mauro-Abidal-Carrer/8k_camTop_vanilla_smolVLA \
  --steps=15000 \
  --save_freq=1000 \
  --output_dir=outputs/train/post_8k_trained_camTop_dataset_smolVLA_$date_name \
  --job_name=post_8k_trained_camTop_dataset_smolVLA_$date_name \
  --policy.device=cuda \
  --log_freq=10 \
  --batch_size=32 \
  --wandb.enable=true
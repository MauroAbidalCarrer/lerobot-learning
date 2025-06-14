python lerobot/lerobot/scripts/train.py \
  --dataset.repo_id=SafwanAhmad/smol_test_safwan_1 \
  --policy.type=act \
  --output_dir=outputs/train/act_so101_test \
  --job_name=act_so101_test \
  --policy.device=cuda \
  --wandb.enable=true \
  --log_freq=1


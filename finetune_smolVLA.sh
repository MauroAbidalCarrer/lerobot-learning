python my_train.py \
  --policy.path=lerobot/smolvla_base \
  --dataset.repo_id=SafwanAhmad/smol_test_safwan_1 \
  --batch_size=64 \
  --steps=200 \
  --output_dir=outputs/train/ \
  --job_name=SafwanAhmad_smolvla_finetuned_2000steps \
  --policy.device=cuda \
  --log_freq=10
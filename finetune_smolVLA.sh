# python my_train.py \
python lerobot/lerobot/scripts/train.py \
  --policy.path=lerobot/smolvla_base \
  --dataset.repo_id=SafwanAhmad/smol_test_safwan_1 \
  --batch_size=64 \
  --steps=200 \
  --output_dir=outputs/SafwanAhmad_smolvla_finetuned_2000steps_og_train \
  --job_name=SafwanAhmad_smolvla_finetuned_2000steps_og_train \
  --policy.device=cuda \
  --log_freq=10
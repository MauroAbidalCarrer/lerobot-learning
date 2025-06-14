#!/bin/bash

echo "Cloning repo."
git clone --quiet https://github.com/huggingface/lerobot.git

echo "Creating lerobot conda env."
conda create -yn lerobot python=3.10

echo "Installing dependencies into lerobot env."
conda run -n lerobot conda install -y ffmpeg -c conda-forge
conda run -n lerobot pip install -e ./lerobot
conda run -n lerobot pip install -e "./lerobot[smolvla]"

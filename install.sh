#!/bin/bash

if [ ! -d "lerobot" ]; then
    echo "Cloning lerobot repo..."
    git clone --quiet https://github.com/huggingface/lerobot.git
else
    echo "lerobot repo already exists. Skipping cloning."
fi

echo "Creating lerobot conda env."
conda create -yn lerobot python=3.10

echo "Installing dependencies into lerobot env."
conda run -n lerobot conda install -y -c \
conda-forge \
ffmpeg==7.1.1 \
plotly==5.19.0 \
matplotlib==3.10.0 \
nbformat==5.10.4 \
ipywidgets==8.1.5 \

conda run -n lerobot pip install -e ./lerobot

echo "Installing extra smolvla dependencies."
conda run -n lerobot pip install -e "./lerobot[smolvla]"
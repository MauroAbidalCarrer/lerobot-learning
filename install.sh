echo "Cloning repo."
git clone --quiet https://github.com/huggingface/lerobot.git
echo "Creating lerobot conda env."
conda create -yn lerobot python=3.10
conda activate lerobot
echo "Installing lerobot and its dependencies."
conda install -y ffmpeg -c conda-forge
pip install -e ./lerobot
pip install -e "./lerobot[smolvla]"


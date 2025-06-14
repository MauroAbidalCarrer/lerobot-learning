from typing import Callable
from pathlib import Path

from torch import Tensor
from tqdm import tqdm

from lerobot.common.datasets.lerobot_dataset import LeRobotDataset


class DeviceAwareDataset(LeRobotDataset):

    def __init__(
        self,
        repo_id: str,
        root: str | Path | None = None,
        episodes: list[int] | None = None,
        image_transforms: Callable | None = None,
        delta_timestamps: dict[list[float]] | None = None,
        tolerance_s: float = 1e-4,
        revision: str | None = None,
        force_cache_sync: bool = False,
        download_videos: bool = True,
        video_backend: str | None = None,
    ):
        super().__init__(
            repo_id,
            root,
            episodes,
            image_transforms,
            delta_timestamps,
            tolerance_s,
            revision,
            force_cache_sync,
            download_videos,
            video_backend,
        )
        self.cuda_frames = []    
        nb_frames = super().__len__()
        for idx in tqdm(range(nb_frames), total=nb_frames, desc="Moving frames to cuda device..."):
            self.cuda_frames.append(frame_to_cuda(super().__getitem__(idx)))

    def __getitem__(self, idx) -> dict:
        return self.cuda_frames[idx]

def frame_to_cuda(frame: dict) -> dict:
    """Moves all the tensors in the frame to the cuda device."""
    cuda_frame = {}
    for k, v in frame.items():
        if isinstance(v, Tensor):
            cuda_frame[k] = v.cuda()
        else:
            cuda_frame[k] = v
    return cuda_frame

# ollama 0.5.8 + rocm 5.4.1 for gfx803


```
Feb 12 12:12:03 NUC8i7HNK ollama[57879]: time=2025-02-12T12:12:03.367Z level=INFO source=routes.go:1237 msg="Listening on [::]:11434 (version 0.0.0)"
Feb 12 12:12:03 NUC8i7HNK ollama[57879]: time=2025-02-12T12:12:03.367Z level=INFO source=gpu.go:217 msg="looking for compatible GPUs"
Feb 12 12:12:03 NUC8i7HNK ollama[57879]: time=2025-02-12T12:12:03.391Z level=INFO source=amd_linux.go:386 msg="amdgpu is supported" gpu=0 gpu_type=gfx803
Feb 12 12:12:03 NUC8i7HNK ollama[57879]: time=2025-02-12T12:12:03.391Z level=INFO source=types.go:130 msg="inference compute" id=0 library=rocm variant="" compute=gfx803 driver=5.18 name=1002:694e total="4.0 GiB" available="4.0 GiB"
```
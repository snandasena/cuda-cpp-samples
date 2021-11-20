# Install CUDA 
- https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html  
- https://developer.nvidia.com/cuda-downloads  
- https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile-nouveau-ubuntu(Don't forget)  
- https://docs.nvidia.com/gpudirect-storage/troubleshooting-guide/index.html#mofed-req-install
- https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915

# Build and Run
```bash

mkdir build
cmake ../
make

# Run Device query sample
./devicequery
```
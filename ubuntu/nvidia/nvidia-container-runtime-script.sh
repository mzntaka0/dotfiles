curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | \
    apt-key add -
distribution=ubuntu20.04
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
    tee /etc/apt/sources.list.d/nvidia-container-runtime.list
sudo apt-get update

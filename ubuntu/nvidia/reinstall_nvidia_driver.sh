apt-get --purge remove nvidia-*
apt-get --purge remove cuda-*
add-apt-repository ppa:graphics-drivers/ppa
apt-get update
apt-cache search 'nvidia-[0-9]+$'$ 
apt install nvidia-410
reboot

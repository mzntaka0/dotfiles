apt-get --purge remove nvidia-*
apt-get --purge remove cuda-*
add-apt-repository --sk ppa:graphics-drivers/ppa
apt-get update
apt-cache search 'nvidia-[0-9]+$'$ 
apt install -y nvidia-410
reboot

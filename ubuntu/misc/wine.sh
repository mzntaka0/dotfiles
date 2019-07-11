dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/Release.key
apt-key add Release.key
apt-add-repository -y -n https://dl.winehq.org/wine-builds/ubuntu/
rm Release.key
apt update
apt install wine-stable winetricks
apt install winehq-stable

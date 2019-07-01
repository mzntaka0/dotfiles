wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- |apt-key add -
add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
apt update && sudo apt install virtualbox-6.0

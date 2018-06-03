echo '#############################'
echo '# set caps lock to ctrl key'
echo '#############################'
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
#gsettings reset org.gnome.desktop.input-sources xkb-options  # reset setting above


echo '#############################'
echo '# install ansible'
echo '#############################'
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

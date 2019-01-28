echo '#############################'
echo '# set caps lock to ctrl key'
echo '#############################'
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
#gsettings reset org.gnome.desktop.input-sources xkb-options  # reset setting above

echo '#############################'
echo '# make japanese available'
echo '#############################'
apt-get install -y ibus-mozc
killall ibus-daemon
ibus-daemon -d -x &
echo 'you can setup japanese available, refering https://qiita.com/pg_naoyuki/items/238f6e5060fb838827f6' 

echo '#############################'
echo '# install ansible'
echo '#############################'
apt-get update
apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible

echo '#############################'
echo '# run ansible roles'
echo '#############################'
ansible-playbook ansible/run.yml -vvv


echo '#############################'
echo '# install nvidia-driver'
echo '#############################'
#sh ./nvidia/reinstall_nvidia_driver.sh

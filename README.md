# dotfiles
dotfiles and initial PC settings with ansible.
# This repository provides...
- initial settings for macOS or ubuntu.
- backup dotfiles

# Usage
## ubuntu
```
# go to home directory
cd ~
sudo apt-get install git
git clone https://github.com/mzntaka0/dotfiles.git
cd dotfiles/ubuntu
sh ./init.sh
```

## macOS
```
coming soon...
```

# Features
## ubuntu
### shell script
- set caps lock to ctrl key
- make japanese available
- run ansible roles
#### install list
- ansible

### ansible
- install basictools
- make symlink of .vimrc to ~/.vimrc from ~/dotfiles/.vimrc
#### install list
- vim-gtk
- fish
- gdebi
- python-pexpect
- libgconf2-4
- gnome-panel

## macOS
coming soon...

# TODO
## ubuntu
- change the way to get user name to decide home directory path
- write fish to shell list automatically

## macOS
coming soon...

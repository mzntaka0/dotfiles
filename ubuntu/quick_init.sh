apt update
apt install curl git tmux vim-gtk zsh
ln -si $HOME/dotfiles/.vimrc $HOME
ln -si $HOME/dotfiles/.vimrc.local $HOME
ln -si $HOME/dotfiles/.zshrc $HOME
ln -si $HOME/dotfiles/.tmux.conf $HOME
ln -si $HOME/dotfiles/.tmux $HOME
mkdir -p $HOME/.vim/templates
ln -si $HOME/dotfiles/templates/python.txt $HOME/.vim/templates/

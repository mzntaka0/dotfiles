#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#brew update

#brew cask install xquartz
#brew install vim --with-client-server --with-python3
#brew install git
#brew install pyenv
#brew install peco
#brew install zsh zsh-completions
#brew install sox
#brew install mysql
#brew install pyenv-virtualenv
#brew install mysql-server mysql-client
#brew install nginx
#brew install uwsgi
#brew install gnuplot
#brew install php
#brew install gcc
#brew install wget
#brew install sqlite3
#brew install ffmpeg
#brew install cmake
#brew install cmake pkg-config
#brew install jpeg libpng libtiff openexr
#brew install eigen tbb
#brew install tmux reattach-to-user-namespace
#brew tap Goles/battery
#brew install battery


#mkdir ~/Work/sh/mecab
#cd ~/Work/sh/mecab
#curl -L -o mecab-0.996.tar.gz 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE'
#curl -L -o mecab-ipadic-2.7.0-20070801.tar.gz 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM'
#tar zxfv mecab-0.996.tar.gz
#tar zxfv mecab-ipadic-2.7.0-20070801.tar.gz
#cd ~/Work/sh/mecab/mecab-0.996
#./configure --with-charset=utf8
#make
#make check
#sudo make install
#cd ..
#cd ~/Work/sh/mecab/mecab-ipadic-2.7.0-20070801
#nkf -w --overwrite *.csv
#nkf -w --overwrite *.def
#vi dicrc
#./configure --with-charset=utf8
#make
#sudo make install
#cd ..

#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#shdo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
#chsh -s /usr/local/bin/zsh
#mkdir ‾/Work
#cd ‾/Work
#mkdir ‾/Work/git
#mkdir ‾/Work/Programming
#cd ‾/Work/git
#git clone https://github.com/mzntaka0/dotfiles.git
#cp ‾/Work/git/dotfiles/vimrc 窶ｾ/.vimrc
#cp ‾/Work/git/dotfiles/.zshrc 窶ｾ/.zshrc
#source .zshrc
#pyenv install anaconda3-4.1.1
#pyenv install anaconda2-4.1.1
#pyenv global anaconda2-4.1.1
#conda install opencv3
#brew tap homebrew/science
#brew install hdf5
#brew search 
#conda update hdf5
#cd /usr/local/lib
#unlink libhdf5.10.dylib
#brew link --overwrite --dry-run hdf5
#brew tap homebrew/science
#brew install hdf5
#brew search 
#conda update hdf5
#pyenv global anaconda3-4.1.1
#source .zshrc
#conda install -c https://conda.anaconda.org/menpo opencv3
#cd ~/Work/sh/tools/
#git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
#cd ~/Work/sh/tools/mecab-ipadic-neologd
#./bin/install-mecab-ipadic-neologd -n
#echo `mecab-config --dicdir`"/mecab-ipadic-neologd"
# /usr/local/lib/mecab/dic/mecab-ipadic-neologd
#read ans
#./bin/install-mecab-ipadic-neologd -h

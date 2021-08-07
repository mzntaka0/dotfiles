# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
bindkey -v              # set a keybind to vi mode
export EDITOR=vim        # set editor to vim
export LANG=en_US.utf-8
export KCODE=u           # set KCODE to UTF-8
export AUTOFEATURE=true  # run feature w/ autotest
export CPATH=/usr/local/opt/openssl/include:$LD_LIBRARY_PATH
setopt auto_pushd        # run pushd to directory stack when run cd command
setopt prompt_subst
setopt notify
setopt nonomatch

### Complement ###
autoload -U compinit; compinit # enable a complement
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### History ###
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
function history-all { history -E 1 }


# ------------------------------
# Look And Feel Settings
# ------------------------------
ZSH_THEME="agnoster"
autoload -U colors; colors
export LSCOLORS=Exfxcxdxbxegedabagacad
#export LS_COLORS='di=00;94:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
#export LS_COLORS='ow=6;96:tw=2;35:di=2;35'
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
tmp_prompt="%F{green}[%n@%D{%m/%d %T}]%f "
PROMPT=$tmp_prompt    # 通常のプロンプト



# ------------------------------
# Other Settings
# ------------------------------

### Aliases ###
alias dirs="dirs -v | sort -k 2 | uniq -f 1 | sort -n -k 1 | head -n $(( LINES - 3 ))"
alias history='history -E'
alias la='ls -a'
alias ll='ls -l'
alias ls='ls -F --color'
alias mkdir='sudo mkdir'
alias ngrokurl="curl --silent http://127.0.0.1:4040/api/tunnels | jq '.tunnels[0].public_url' | sed 's/\"//g'"
alias reload='exec $SHELL -l'
alias tig='sudo tig'
alias vi="sudo vim -u $HOME/.vimrc"
alias vim="sudo vim -u $HOME/.vimrc"
alias vimrc='vi ~/.vimrc'
alias vpn='cat /home/mzntaka0pdt/Work/Backups/vpn.txt'
alias zshrc='vi ~/.zshrc'
alias gls="gls --color"
alias ipm="sudo /usr/lib/inkdrop/resources/app/ipm/bin/ipm"
alias aws="sudo docker run --rm -it amazon/aws-cli"

### Exports ###
export CC="/usr/bin/gcc"
export CXX="/usr/bin/g++"
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
export LC_ALL
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH=${PYENV_ROOT}/bin:$PATH
export PIPENV_VENV_IN_PROJECT=true
export PYENV_ROOT="${HOME}/.pyenv"



### Functions ###
function cd() {
  builtin cd $@ && ls;
}


function md () {
  pandoc $1 | lynx -stdin
}


function cd {
    if [ -z "$1" ] ; then
        # won't add unnecessary $DIRSTACK when type cd continuously
        test "$PWD" != "$HOME" && pushd $HOME > /dev/null
    else
        #builtin pushd "$1" && ls > /dev/null
        builtin pushd "$1" > /dev/null && ls
    fi
}


function cdh {
    local dirnum
    dirs -v | sort -k 2 | uniq -f 1 | sort -n -k 1 | head -n $(( LINES - 3 ))
    read dirnum\?'enter num: '
    if [ -z "$dirnum" ] ; then
        echo "$FUNCNAME: Abort." 1>&2
    elif ( echo $dirnum | egrep '^[[:digit:]]+$' > /dev/null ) ; then
        cd "$( echo ${dirstack[$dirnum]} | sed -e "s;^~;$HOME;" )"
    else
        echo "$FUNCNAME: Wrong." 1>&2
    fi
}


function cdb {
    local num=$1 i
    if [ -z "$num" -o "$num" = 1 ] ; then
        popd >/dev/null
        return
    elif [[ "$num" =~ ^[0-9]+$ ]] ; then
        for (( i=0 ; i<num ; i++ )) ; do
            popd >/dev/null
        done
        return
    else
        echo "cdback: argument is invalid." >&2
    fi
}


function gdrive_download () {
  CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
}


### Run ###
# pyenv
eval "$(pyenv init -)"

# tmux
if [ $SHLVL = 1 ]; then
    alias tmux="tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session"
fi
if [ $SHLVL = 1 ]; then
    tmux
fi



export PATH="$HOME/.amplify/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


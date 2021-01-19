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
alias task="sudo vim -u $HOME/.vimrc $HOME/Work/task"
alias tig='sudo tig'
alias vi="sudo vim -u $HOME/.vimrc"
alias vim="sudo vim -u $HOME/.vimrc"
alias vimrc='vi ~/.vimrc'
alias vpn='cat /home/mzntaka0pdt/Work/Backups/vpn.txt'
alias zshrc='vi ~/.zshrc'

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


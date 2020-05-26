# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
export ZSH=/Users/takao/.oh-my-zsh
export EDITOR=vim        # set editor to vim
# export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export LANG=en_US.utf-8
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす
bindkey -v              # キーバインドをviモードに設定
export CPATH=/usr/local/opt/openssl/include:$LD_LIBRARY_PATH

ZSH_THEME="Solarized"
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
#setopt correct           # コマンドのスペルを訂正する
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
#setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=6000000
SAVEHIST=6000000
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=00;94:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
#export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
alias gls="gls --color"
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%F{cyan}[%n@%D{%m/%d %T}]%f "
#tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

#Title
precmd() {
    [[ -t 1 ]] || return
    case $TERM in
        *xterm*|rxvt|(dt|k|E)term)
        print -Pn "\e]2;[%~]\a"
	;;
        # screen)
        #      #print -Pn "\e]0;[%n@%m %~] [%l]\a"
        #      print -Pn "\e]0;[%n@%m %~]\a"
        #      ;;
    esac
}


# ------------------------------
# Other Settings
# ------------------------------

### Aliases ###
#時刻を表示させる
alias history='history -E'

# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls;
}




#--------------------------------
#エイリアスの設定
#--------------------------------
#alias ls='ls -FG'
alias ls='ls -F --color'
alias la='ls -a'
alias vi='sudo vim'
alias mkdir='sudo mkdir'

export PYTHONPATH=$PYTHONPATH:/User/takao/.pyenv/versions/anaconda2-4.3.0/lib/python2.7/site-packages
export PYENV_ROOT="${HOME}/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"
export LC_ALL=en_US.utf-8
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$(brew --prefix openssl)/lib
export DYLD_LIBRARY_PATH=/usr/local/Cellar/openssl/1.0.21/lib
export DYLD_LIBRARY_PATH=/usr/local/Cellar/openssl/1.0.21/lib
export DYLD_LIBRARY_PATH=/usr/local/Cellar/openssl/1.0.21/lib



# tmuxが起動していない場合にalias設定を行う
if [ $SHLVL = 1 ]; then
    # tmuxにセッションがなかったら新規セッションを立ち上げた際に分割処理設定を読み込む
    alias tmux="tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session"
fi
if [ $SHLVL = 1 ]; then
    tmux
fi
setopt nonomatch
alias ll='ls -l'

alias vimrc='vi ~/.vimrc'
alias zshrc='vi ~/.zshrc'

export CC="/usr/bin/gcc"
export CXX="/usr/bin/g++"

export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"

export PATH="/usr/local/cuda-9.0/bin:${PATH}"
export LD_LIBRARY_PATH="/usr/local/cuda-9.0/lib64:${LD_LIBRARY_PATH}"
export LANG=en_US.utf-8
export LC_ALL
alias act="source $PYENV_ROOT/versions/anaconda3-5.2.0/bin/activate"
alias ipm="sudo /usr/lib/inkdrop/resources/app/ipm/bin/ipm"
alias ngrokurl="curl --silent http://127.0.0.1:4040/api/tunnels | jq '.tunnels[0].public_url' | sed 's/\"//g'"
alias reload='exec $SHELL -l'


md () {
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

alias dirs="dirs -v | sort -k 2 | uniq -f 1 | sort -n -k 1 | head -n $(( LINES - 3 ))"

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

export PIPENV_VENV_IN_PROJECT=true


function gdrive_download () {
  CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
}

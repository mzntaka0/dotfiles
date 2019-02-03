# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
export ZSH=/Users/takao/.oh-my-zsh
export EDITOR=vim        # set editor to vim
# export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export LANG=en_US
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
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
#export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
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
alias ls='ls -FG'
alias la='ls -a'  
alias activate="source ~/.pyenv//versions/anaconda3-4.0.0/bin/activate"
alias deactivate="source ~/.pyenv//versions/anaconda3-4.0.0/bin/deactivate"
alias py352con="py352"
alias vi='sudo vim'
alias mkdir='sudo mkdir'

export PYTHONPATH=$PYTHONPATH:/User/takao/.pyenv/versions/anaconda2-4.3.0/lib/python2.7/site-packages
export PYENV_ROOT="${HOME}/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"
export LC_ALL=ja_JP.UTF-8
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mzntaka0/Work/9DW/6CNS/project/6CNS/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mzntaka0/Work/9DW/6CNS/project/6CNS/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mzntaka0/Work/9DW/6CNS/project/6CNS/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mzntaka0/Work/9DW/6CNS/project/6CNS/google-cloud-sdk/completion.zsh.inc'; fi

alias vimrc='vi ~/.vimrc'
alias zshrc='vi ~/.zshrc'

export CC="/usr/bin/gcc"
export CXX="/usr/bin/g++"

export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH="/usr/local/cuda-9.0/bin:${PATH}"
export LD_LIBRARY_PATH="/usr/local/cuda-9.0/lib64:${LD_LIBRARY_PATH}"
export LANG=en_US.utf-8
alias act="source $PYENV_ROOT/versions/anaconda3-5.2.0/bin/activate"
alias ipm="sudo /usr/lib/inkdrop/resources/app/ipm/bin/ipm"

md () {
  pandoc $1 | lynx -stdin
}

source ~/catkin_ws/devel/setup.zsh

" release autogroup in MyAutoCmd
augroup MyAutoCmd
    autocmd!
augroup END

syntax enable 
filetype plugin on
filetype indent on
filetype plugin indent on
colorscheme desert
syntax on

" settings
set autoindent      " オートインデント
set autoread
set autochdir
set background=dark
set backspace=indent,eol,start
set cindent
set clipboard&
set clipboard^=unnamedplus
set clipboard=unnamed,autoselect
set encoding=utf-8
set expandtab       " タブをスペース
set enc=utf-8
"set fileencodings=sjis,utf-8,ucs-bomiso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1,
set fileencoding=UTF-8
set fileformats=unix,dos,mac
set hidden
set hlsearch        " 検索ハイライトをEscでクリア
set ignorecase      " 検索文字列文字列が小文字の場合は大文字小文字区別なし
set incsearch       " インクリメンタルサーチ
set infercase           " 補完時に大文字小文字を区別しない
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set nocompatible
set noincsearch     " 検索文字列入力時に順次文字列にヒットさせない
set nostartofline
set noswapfile      " swapファイルを作成しない
set novisualbell
set nowrapscan
set nrformats=
set number          " 行番号表示
set ruler
set shiftround
set shiftwidth=4    " タブ幅(自動挿入)
set showcmd         " 入力中コマンド表示
set showmatch       " 入力時対応括弧強調
set smartcase       " 検索文字列に大文字が含まれる場合は大文字小文字区別する
set smartindent     " オートインデント
set termencoding=UTF-8
set laststatus=2    " ステータスバーを表示
set t_Co=256
set tabstop=3       " タブ幅
set title
set ttyfast
set vb t_vb=
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll
set wrapscan        " 検索時に最後に達したら最初に戻る
set splitbelow
set splitright

let g:netrw_liststyle=3
let g:netrw_altv = 1
let g:netrw_alto = 1

nmap <silent> <Esc><Esc> :nohlsearch<CR>

noremap PP "0p
noremap x "_x

nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

inoremap {<Enter> {}<Left>
inoremap [<Enter> []<Left>
inoremap (<Enter> ()<Left>
inoremap '<Enter> ''<Left>
inoremap "<Enter> ""<Left>
inoremap <C-l> <Right>


" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)


set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor


" python
filetype plugin on
autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif
let s:cpo_save = &cpo
syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self
hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special
let b:current_after_syntax = 'python'
let &cpo = s:cpo_save
unlet s:cpo_save

" c_CTRL-X
"   Input current buffer's directory on command line.
cnoremap <C-X> <C-R>=<SID>GetBufferDirectory()<CR>
function! s:GetBufferDirectory()
  let path = expand('%:p:h')
  let cwd = getcwd()
  let dir = '.' 
  if match(path, escape(cwd, '\')) != 0
    let dir = pat 
  elseif strlen(path) > strlen(cwd)
    let dir = strpart(path, strlen(cwd) + 1)
  endif
  return dir . (exists('+shellslash') && !&shellslash ? '\' : '/')
endfunction'

autocmd BufNewFile *.py 0r $HOME/.vim/templates/python.txt

function! s:clang_format()
  let now_line = line(".")
  exec ":%! clang-format"
  exec ":" . now_line
endfunction

if executable('clang-format')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
  augroup END
endif


""dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_path = expand('~/.vim/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

" if don't have dein.vim, clone from github
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
endif

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  let g:config_dir  = expand('~/.vim/userconfig')
  let s:toml        = g:config_dir . '/plugins.toml'
  let s:lazy_toml   = g:config_dir . '/plugins_lazy.toml'

  " read TOML
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif


" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

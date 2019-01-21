" releash autogroup in MyAutoCmd
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
set autoindent      " auto indent
set autoread
set autochdir
set background=dark
set backspace=indent,eol,start
set cindent
set clipboard&
set clipboard^=unnamedplus
set clipboard=unnamed,autoselect
set encoding=utf-8
set expandtab       " tab to space
set enc=utf-8
"set fileencodings=sjis,utf-8,ucs-bomiso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1,
set fileencoding=UTF-8
set fileformats=unix,dos,mac
set hidden
set hlsearch        " clear highlight with esc
set ignorecase      " search both lower and upper when search lowercase
set incsearch       " incremental search
set infercase           " complement both lower and upper
set matchpairs& matchpairs+=<:> " add <> to brackets
set nocompatible
set noincsearch
set nostartofline
set noswapfile      " will not make swap
set novisualbell
set nowrapscan
set nrformats=
set number          " show raw number
set ruler
set shiftround
set shiftwidth=4    " width of tab
set showcmd         " show command when typing
set showmatch       " emphesize pair bracket
set smartcase       " distinguish lower and upper when search with starting uppercase
set smartindent     " autoindent
set termencoding=UTF-8
set laststatus=2    " show statusbar
set t_Co=256
set tabstop=3       " width of tab 
set title
set ttyfast
set vb t_vb=
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll
set wrapscan        " research when over the end of search result
set splitbelow
set splitright

" for markdown
hi link htmlItalic LineNr
hi link htmlBold WarningMsg
hi link htmlBoldItalic ErrorMsg

let g:netrw_liststyle=3
let g:netrw_altv = 1
let g:netrw_alto = 1

nmap <silent> <Esc><Esc> :nohlsearch<CR>

noremap PP "0p
noremap x "_x
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
nnoremap し” ci"
nnoremap し’ ci'


nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

inoremap {<Enter> {}<Left>
inoremap [<Enter> []<Left>
inoremap (<Enter> ()<Left>
inoremap '<Enter> ''<Left>
inoremap "<Enter> ""<Left>
inoremap <C-l> <Right>


" make directory when not exists directory with :e
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
autocmd BufNewFile,BufRead *.py nnoremap <C-p> :!python %<CR>

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

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

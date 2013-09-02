" TODO: HIghlight search results as you type? Seems to be a default that I
" disabled. Also, there seems to be a smart wrap-to-80-columns for these vim
" script files. That is cool and very, very useful! Get for other prog
" langauge things. (Is it just comments?)
" Also, set the backup directory w/ unique filenames!

set nocompatible

execute pathogen#infect()

"General settings
set backspace=indent,eol,start

set wildmenu
set wildmode=list:longest,full

"set backupdir=

" Style Options
filetype on
filetype plugin on
filetype indent on
syntax on

"line numbers!
set number 

" Enable 256 color terminals.
" TODO What if we can't get 256 colors?!
set t_Co=256
if has("gui_running")
    colorscheme redplanet
else
    colorscheme distinguished
endif

if has("gui_gtk")
    set guifont=Envy\ Code\ R\ 11
else
    set guifont=Envy\ Code\ R:h11:cANSI
endif

"" Tab length
set shiftwidth=4
set softtabstop=4

" Shortcuts

"" map jj to <Esc> -- very useful, if "laggy"
inoremap jj <Esc>

"" Vim-Latex .vimrc settings
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

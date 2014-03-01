" TODO: HIghlight search results as you type? Seems to be a default that I
" disabled. Also, there seems to be a smart wrap-to-80-columns for these vim
" script files. That is cool and very, very useful! Get for other prog
" langauge things. (Is it just comments?)
" Also, set the backup directory w/ unique filenames!

set nocompatible

execute pathogen#infect()

""General settings
" Basic formatting/editing
set backspace=indent,eol,start
set textwidth=80

" Match search string as it's entered
set incsearch

" Menus!
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
    " colorscheme lucius
    " LuciusLight
    set background=light
    colorscheme solarized
else
    set background=dark
    colorscheme solarized
endif

if has("gui_gtk")
    set guifont=Envy\ Code\ R\ 11
else
    set guifont=Envy\ Code\ R:h11:cANSI
endif

"" Tab length
set shiftwidth=4
set softtabstop=4
set expandtab

"" GUI size options
if has("gui_running")
    set lines=24 columns=90
endif

"" Relative line numbers -- show line numbers, but they're relative to view!
set relativenumber

" Always show line numbers, but only in current window.
:au WinEnter * :setlocal relativenumber
:au WinLeave * :setlocal norelativenumber

" Absolute Line Numbers in Insert Mode
:au InsertEnter * :set number
:au InsertLeave * :set relativenumber

" Shortcuts

"" map jj to <Esc> -- very useful, if "laggy"
"inoremap jj <Esc>

"" map \tt to :tabnew, \tr to :tabp, \ty to :tabn, \tc to :tabc
nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>tr :tabp<CR>
nnoremap <Leader>ty :tabnext<CR>
nnoremap <Leader>tc :tabclose<CR>

"" Vim-Latex .vimrc settings
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"" Golang settings
autocmd FileType go compiler go

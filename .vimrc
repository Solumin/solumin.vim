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
"set formatoptions-=t

" Match search string as it's entered
set incsearch

" Menus!
set wildmenu
set wildmode=list:longest,full

" Filetypes to ignore -- possibly put this in a config script elsewhere?
"" Object files
set wildignore+=*.o
"" Haskell files
set wildignore+=*.hi,*.ho
"" (La)TeX files -- maybe add *.log only when looking at pdfs?
set wildignore+=*.pdf,*.aux,*.bbl,*.log

" Dir for .swp files
"set backupdir=

" Style Options
filetype on
filetype plugin on
filetype indent on
syntax on

"line numbers!
set number

" split settings -- more natural than default
set splitbelow
set splitright
"" Switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" GUI Options and Colorschemes
" Enable 256 color terminals.
" TODO What if we can't get 256 colors?!
set t_Co=256
if has("gui_running")
    colorscheme molokai
    set background=dark
else
    let g:rehash256=1
    set background=dark
    colorscheme molokai
endif

"" GUI layout options
if has("gui_running")
    set lines=24 columns=90
    " remove toolbar and menu
    set guioptions-=T
    set guioptions-=m
endif

"" Set font for different gui types
if has("gui_gtk")
    set guifont=Envy\ Code\ R\ 11
else
    set guifont=Envy\ Code\ R:h11:cANSI
endif

"" Always display the 'tabline', which shows the active tabs
"" Will show for both GUI and CLI vim
set showtabline=2 " 2 = always, 1 = only if 2+ tabs open, 0 = never

"" Tab length
set shiftwidth=4
set softtabstop=4
set expandtab

"" Relative line numbers -- show line numbers, but they're relative to view!
set relativenumber

" Always show line numbers, but only in current window.
:au WinEnter * :setlocal relativenumber
:au WinLeave * :setlocal norelativenumber

" Absolute Line Numbers in Insert Mode
:au InsertEnter * :set number
:au InsertLeave * :set relativenumber

" Shortcuts

"" map jj to <Esc> -- very useful, if 'laggy'
"inoremap jj <Esc>

"" map \tt to :tabnew, \tr to :tabp, \ty to :tabn, \tc to :tabc
"" Note: some of these have g<char> equivalents?
nnoremap <Leader>tt :tabnew<CR>
" equiv to gT:
nnoremap <Leader>tr :tabp<CR>
" equiv to gt:
nnoremap <Leader>ty :tabnext<CR>
nnoremap <Leader>tc :tabclose<CR>

"" catch typos!
command! W w

" Plugin management
"" vim-airline
set laststatus=2
set noshowmode
"let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶ '
let g:airline_right_sep = '◀'
if has('gui_running')
    let g:airline_symbols.branch = '⎇ '
else
    let g:airline_symbols.branch = '↬ '
endif


"" Vim-Latex .vimrc settings
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"" Golang settings
"" Runs go fmt on current file on every write:
"" SUPER LAGGY AND ANNOYING AS HELL!!!
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go compiler go

" TODO: Highlight search results as you type? Seems to be a default that I
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

" setting a default encoding
if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
endif

"line numbers!
set number
"" Relative line numbers -- show line numbers, but they're relative to view!
" set relativenumber
" Unfortunately it is very slow. Disabling it makes scrolling smoother in large
" files.

" split settings -- more natural than default
set splitbelow
set splitright
"" Switching between splits
"" C-J conflicts with vim-latex plugin
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" GUI Options and Colorschemes
if has("gui_running")
    set t_Co=256    " doesn't actually do anything...?
    set background=dark
    colorscheme molokai
else
    if has("win32")
        set t_Co=16 "seems to work fine
    else
        set t_Co=256 "enables 256 colors for other terminals
    endif
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

    "" Set font for different gui types
    if has("gui_gtk")
        set guifont=Envy\ Code\ R\ 11
    else
        set guifont=Envy\ Code\ R:h11:cANSI
    endif
endif

"" Tab length
set shiftwidth=4
set softtabstop=4
set expandtab
"" Since Go uses tabs and we autoformat, set tabs to something reasonable:
set tabstop=4

" SPECIAL LINE NUMBERING: Disabled due to performance hit
" Always show line numbers, but only in current window.
" :au WinEnter * :setlocal relativenumber
" :au WinLeave * :setlocal norelativenumber

" Absolute Line Numbers in Insert Mode
" :au InsertEnter * :set number
" :au InsertLeave * :set relativenumber

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
"" Always display the 'tabline', which shows the active tabs
"" Will show for both GUI and CLI vim
set showtabline=2 " 2 = always, 1 = only if 2+ tabs open, 0 = never
"let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
if has('win32')
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_symbols.branch = '$ '
else
    let g:airline_left_sep = '▶ '
    let g:airline_right_sep = '◀'
    if has('gui_running')
        let g:airline_symbols.branch = '⎇ '
    else
        let g:airline_symbols.branch = '↬ '
    endif
endif

"" Vim-Latex .vimrc settings
set shellslash
" Hopefully this sets the grep program for windows correctly...
if has('win32')
  set grepprg=findstr
else
  set grepprg=grep\ -nH\ $*
endif
" Disable those annoying placeholders!
let g:Imap_UsePlaceHolders=0
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFromat='pdf'
let g:Tex_MultipleCompileFormats='pdf,dvi'

"" Golang settings
"" Runs go fmt on current file on every write:
autocmd FileType go compiler go
"" The vim-go plugin does a lot for me. Here are additional settings
"" (See :help vim-go)
"" Highlight whitespace errors when channels aren't written idiomatically
let g:go_highlight_chan_whitespace_error = 1
"" Highlight functions and methods
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
"" Automatically save after :GoFmt and use GoImports instead of GoFmt
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

"" Rust settings
"" Run rustfmt on save
" let g:rustfmt_autosave = 1

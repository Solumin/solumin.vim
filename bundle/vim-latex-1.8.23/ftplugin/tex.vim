" Set default target
let g:Tex_DefaultTargetFormat = 'pdf'

" Change viewer to use SumatraPDF
let g:Tex_ViewRule_pdf = 'sumatrapdf -reuse-instance'

" Make sure pdf-output files are compiled multiple times
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

" Enable alt-key mappings by ignoring menu hotkeys (Alt+...)
set winaltkeys=no

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

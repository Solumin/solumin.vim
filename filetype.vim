if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead *.md setf markdown
    au! BufNewFile,BufRead *.ts setf typescript
augroup END

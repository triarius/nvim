augroup myAuCmd
    autocmd!
augroup END

" terminal
autocmd myAuCmd TermOpen * setlocal nonumber norelativenumber

" share shada between instances
autocmd myAuCmd User CursorHold * rshada|wshada

" smaller tabs for some files
autocmd myAuCmd Filetype xml,yaml,json,groovy,Jenkinsfile setlocal ts=2 sw=2

" spelling for certain files
autocmd myAuCmd FileType text,latex,tex,md,markdown setlocal spell

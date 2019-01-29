let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 2
let g:airline#extensions#tabline#formatter = "unique_tail_improved"

" wordcount filetypes
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = 'pandoc\|markdown\|rst\|org\|help\|text\|tex\|mail'

" ale + airline
let g:airline#extensions#ale#enabled = 1

" vimtex + airline
let g:airline#extensions#vimtex#enabled = 1

let g:airline_theme='papercolor'

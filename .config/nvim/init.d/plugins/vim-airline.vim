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

" coc.nvim
" if you want to disable auto detect, comment out those two lines
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions#coc#enabled = 1
let g:airline_extensions#branch#enabled = 1
let g:airline_extensions#hunk#enabled = 1

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" theme
let g:airline_theme='papercolor'

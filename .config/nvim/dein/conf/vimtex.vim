let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_progname = "nvr"
let g:vimtex_compiler_latexmk = { 'options': [
            \ '-pdf',
            \ '-verbose',
            \ '-bibtex-cond1',
            \ '-shell-escape',
            \ '-file-line-error',
            \ '-synctex=1',
            \ '--interaction=nonstopmode'
    \]
\}
let g:vimtex_indent_enabled = 0
let g:vimtex_fold_enabled = 1

" clean on quit
autocmd myAuCmd User VimtexEventQuit call vimtex#compiler#clean(0)

" ale in quickfix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" ale keep gutter open
let g:ale_sign_column_always = 1

" ale linters
let g:ale_linters= {
    \ 'haskell': ['stack-ghc-mod', 'hlint'],
    \ 'c':['clangtidy', 'clang'],
    \ 'java':['checkstyle', 'javac'],
    \ 'python3':['prospector', 'pyls'],
\}

" enable completion
let g:ale_completion_enabled = 1

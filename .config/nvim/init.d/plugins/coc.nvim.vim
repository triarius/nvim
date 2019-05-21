let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
let g:coc_global_extensions = [
    \ 'coc-ccls',
    \ 'coc-css',
    \ 'coc-docker',
    \ 'coc-emoji',
    \ 'coc-eslint',
    \ 'coc-gocode',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-python',
    \ 'coc-rls',
    \ 'coc-sh',
    \ 'coc-solargraph',
    \ 'coc-tslint',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-vimtex',
    \ 'coc-yaml',
    \]

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

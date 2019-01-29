let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

"" use tab to expand snippet or forward cycle press tab again to expand snippet
"imap <expr><TAB> <SID>coc_complete()
"" use tab to backward cycle
"imap <expr><S-TAB> pumvisible() ? '\<C-p>' : '\<S-TAB>'

"function! s:coc_complete()
  "if pumvisible()
    "return '\<C-n>'
  "else
    "return '\<TAB>'
  "endif
"endfunction

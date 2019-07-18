let g:unicoder_cancel_normal = 1
let g:unicoder_cancel_insert = 1
let g:unicoder_cancel_visual = 1
nnoremap <C-t> :call unicoder#start(0)<CR>
inoremap <C-t> <Esc>:call unicoder#start(1)<CR>
vnoremap <C-t> :<C-u>call unicoder#selection()<CR>

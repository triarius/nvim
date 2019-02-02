" disable ex mode
nnoremap Q <Nop>

" skip X clipboard for delete commands, send d to * clipboard (PRIMARY)
if g:os == 'Linux'
    nnoremap d "*d
    xnoremap d "*d
    nnoremap D "*D
    xnoremap D "*D
endif

nnoremap c "_c
xnoremap c "_c
nnoremap x "_x
xnoremap x "_x
nnoremap s "_s
"xnoremap s "_s
nnoremap C "_C
xnoremap C "_C
nnoremap X "_X
xnoremap X "_X
nnoremap S "_S
"xnoremap S "_S
nnoremap <Del> "_x
xnoremap <Del> "_<Del>

" Prevent paste in visual mode overwriting register
" https://stackoverflow.com/questions/290465/how-to-paste-over-without-overwriting-register
xnoremap <expr> p 'pgv"'.v:register.'y`>'

"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" Make escape work in the Neovim terminal.
tnoremap <C-\><Esc> <C-\><C-n>

" navigate buffers
nnoremap gh :bp<CR>
nnoremap gl :bn<CR>
vnoremap gh <ESC>:bp<CR>
vnoremap gl <ESC>:bn<CR>

" interleave lines
" https://vi.stackexchange.com/questions/4575/merge-blocks-by-interleaving-lines
" Select your two contiguous, same-sized blocks, and use it to Interleave ;)
vnoremap <leader>il <esc>:call Interleave()<CR>
function! Interleave()
    " retrieve last selected area position and size
    let start = line(".")
    execute 'normal! gvo\<esc>'
    let end = line(".")
    let [start, end] = sort([start, end], "n")
    let size = (end - start + 1) / 2
    " and interleave!
    for i in range(size - 1)
        execute (start + size + i). 'm' .(start + 2 * i)
    endfor
endfunction

"run macro on only matching lines
"https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" delete trailing whitespace
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
command! TrimWhitespace call TrimWhitespace()
noremap <Leader>w :call TrimWhitespace()<CR>
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
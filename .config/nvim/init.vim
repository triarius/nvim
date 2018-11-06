if &compatible
    set nocompatible               " Be iMproved
endif

augroup myAuCmd
    autocmd!
augroup END

source ~/.config/nvim/plugins.vim

" GUI clipboard
set clipboard=unnamedplus

" disable ex mode
nnoremap Q <Nop>

" skip X clipboard for delete commands, send d to * clipboard (PRIMARY)
nnoremap d "*d
vnoremap d "*d
nnoremap c "_c
vnoremap c "_c
nnoremap x "_x
vnoremap x "_x
nnoremap s "_s
"vnoremap s "_s
nnoremap D "*D
vnoremap D "*D
nnoremap C "_C
vnoremap C "_C
nnoremap X "_X
vnoremap X "_X
nnoremap S "_S
"vnoremap S "_S
nnoremap <Del> "_x
vnoremap <Del> "_<Del>

" more colours
if (has("termguicolors"))
    set termguicolors
endif

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8


filetype plugin indent on
syntax enable

" to get better indenting for tex files
let g:tex_flavor='latex'

" indentation
set autoindent       " use indentation of current line for new line
set smartindent      " use intelligent indentation, follow {, etc
set tabstop=4        " tab width is 4 charaters
set shiftwidth=4     " indent width is 4 charaters
set expandtab        " convert tabs to spaces

" smaller tabs for some files
autocmd myAuCmd Filetype xml,yaml setlocal ts=2 sw=2

" show whitespace
set listchars=tab:>·,trail:~,extends:>,precedes:<
set list

" indents after soft wrapping
set breakindent

" hybrid line numbers
set relativenumber
set number

" highlight matching braces
set showmatch

" spelling for certain files
autocmd myAuCmd FileType text,latex,tex,md,markdown setlocal spell

" fix some backspace issues
set backspace=indent,eol,start

" incremental substitution
set inccommand=nosplit

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" cursor shape in insert mode
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
" revert cursor on exit
autocmd myAuCmd VimLeave * set guicursmr=a:block-blinkon0

" highlight column
let &colorcolumn='80,100'

" folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" allow use of mouse
set mouse=a

" open new split below and to the right by default
set splitbelow
set splitright

" terminal
" Make escape work in the Neovim terminal.
tnoremap <C-\><Esc> <C-\><C-n>

autocmd myAuCmd TermOpen * setlocal nonumber norelativenumber

" interleave lines
" https://vi.stackexchange.com/questions/4575/merge-blocks-by-interleaving-lines
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

" Select your two contiguous, same-sized blocks, and use it to Interleave ;)
vnoremap <leader>il <esc>:call Interleave()<CR>

" Ag integration
let g:ackprg = 'ag --vimgrep'

" neovim-drop-in
set runtimepath^=/usr/share/vim/vimfiles

" delete trailing whitespace
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
noremap <Leader>w :call TrimWhitespace()<CR>

"https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
"run macro on only matching lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" share shada between instances
autocmd myAuCmd User CursorHold * rshada|wshada

" navigate buffers
nnoremap gh :bp<CR>
nnoremap gl :bn<CR>
vnoremap gh <ESC>:bp<CR>
vnoremap gl <ESC>:bn<CR>

" hide insert at bottom
set noshowmode

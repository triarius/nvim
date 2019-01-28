if &compatible
    set nocompatible               " Be iMproved
endif

augroup myAuCmd
    autocmd!
augroup END

" detect os
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" source the plugins file
if g:os != 'Windows'
    source $HOME/.config/nvim/plugins.vim
    source $HOME/.config/nvim/remap.vim
endif

" GUI clipboard
set clipboard=unnamedplus

" more colours
if has("termguicolors")
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
autocmd myAuCmd Filetype xml,yaml,groovy,Jenkinsfile setlocal ts=2 sw=2

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
autocmd myAuCmd TermOpen * setlocal nonumber norelativenumber

" Ag integration
let g:ackprg = 'ag --vimgrep'

" neovim-drop-in
set runtimepath^=/usr/share/vim/vimfiles

" share shada between instances
autocmd myAuCmd User CursorHold * rshada|wshada

" hide insert at bottom
set noshowmode

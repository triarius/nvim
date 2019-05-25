set secure

" allow switching buffer without write
set hidden

" GUI clipboard
if g:os == 'Linux' || g:os == 'Darwin'
    set clipboard^=unnamedplus
endif

if g:os == 'Darwin'
    let g:clipboard = {
          \   'name': 'macOSClipboard',
          \   'copy': {
          \      '+': 'pbcopy -pboard general',
          \      '*': 'pbcopy -pboard ruler',
          \    },
          \   'paste': {
          \      '+': 'pbpaste -pboard general',
          \      '*': 'pbpaste -pboard ruler',
          \   },
          \   'cache_enabled': 1,
          \ }
endif

" more colours
if has("termguicolors")
    set termguicolors
endif

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" to get better indenting for tex files
let g:tex_flavor='latex'

" indentation
set autoindent       " use indentation of current line for new line
set smartindent      " use intelligent indentation, follow {, etc
set tabstop=4        " tab width is 4 charaters
set shiftwidth=4     " indent width is 4 charaters
set expandtab        " convert tabs to spaces

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

" fix some backspace issues
set backspace=indent,eol,start

" incremental substitution
set inccommand=nosplit

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

set ignorecase " searches are case insensitive
set smartcase  " unless they contain at least one capital letter

" highlight column
let &colorcolumn='80,100'

" more characters will be sent to the screen for redrawing
set ttyfast

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

" Ag integration
let g:ackprg = 'ag --vimgrep'

" neovim-drop-in
set runtimepath^=/usr/share/vim/vimfiles

" hide insert at bottom
set noshowmode

" persisten undo
set undofile

" hide the hjkl at the bottom right
set noshowcmd

" make netrw behave like nerdtree
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'

"toggle netrw on the left side of the editor
nnoremap <leader>n :Lexplore<CR>

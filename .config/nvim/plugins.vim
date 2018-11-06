function! BuildLanguageClient(info)
    if a:info.status == 'installed' || a:info.force
        !./install.sh
    endif
endfunction

function! BuildGoBinaries(info)
    if a:info.status == 'installed' || a:info.force
        :GoUpdateBinaries
    endif
endfunction

call plug#begin()
    " themes
    Plug 'zanglg/nova.vim'
    Plug 'NLKNguyen/papercolor-theme'

    " comments
    Plug 'scrooloose/nerdcommenter'

    " sensible defualts
    Plug 'tpope/vim-sensible'

    " graphical undo
    Plug 'sjl/gundo.vim'

    " send to repl in terminal
    Plug 'jalvesaq/vimcmdline'

    " restore cursor position
    Plug 'farmergreg/vim-lastplace'

    " quickscope
    Plug 'unblevable/quick-scope'

    " latex 2 unicode
    Plug 'joom/latex-unicoder.vim'

    " status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " mark bar
    Plug 'Yilin-Yang/vim-markbar'

    " file tree
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " fuzzy finder
    Plug 'junegunn/fzf.vim'

    " text objects (line w/o newline)
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-line'

    " git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " hex editing
    Plug 'fidian/hexmode'

    " visual block increment
    Plug 'triglav/vim-visual-increment'

    " swap splits
    Plug 'wesQ3/vim-windowswap'

    " aligning (after the fact)
    Plug 'godlygeek/tabular'

    " closing brackets
    Plug 'vim-scripts/auto-pairs-gentle'

    " surround with brackets
    Plug 'tpope/vim-surround'

    " case preserving subsitution
    Plug 'tpope/vim-abolish'

    " transpose matrices
    Plug 'salsifis/vim-transpose'

    " NVim-Ghost, allows editing browser textboxes in nvim
    Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

    " cd into right dir for projects
    Plug 'airblade/vim-rooter'

    " linter
    Plug 'w0rp/ale'

    " autocompletion
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    Plug 'zchee/deoplete-jedi', {'for': ['python3', 'python2', 'python']}
    Plug 'zchee/deoplete-go', {'do': 'make', 'for': 'go'}
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': function('BuildLanguageClient')}

    " languages
    Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
    Plug 'lervag/vimtex'
    Plug 'jalvesaq/Nvim-R', {'for': 'R'}
    Plug 'JuliaEditorSupport/julia-vim'

    " haskell
    Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'} " better haskell syntax highlighting
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

    " json
    Plug 'elzr/vim-json'

    " toml
    Plug 'cespare/vim-toml', {'for': 'toml'}
    Plug 'maralla/vim-toml-enhance', {'depends': 'cespare/vim-toml', 'for': 'toml'}

    " go
    Plug 'fatih/vim-go' , {'do': function('BuildGoBinaries')}
    Plug 'sebdah/vim-delve', {'for': 'go'}

    " elixir
    "Plug 'elixir-lang/vim-elixir'
    "Plug 'thinca/vim-ref'
    "Plug 'awetzel/elixir.nvim', {'do': 'yes \| ./install.sh'}

    " pandoc
    Plug 'vim-pandoc/vim-pandoc', {'for': 'markdown'}
    Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'markdown'}
call plug#end()


"""""""""""
" Options "
"""""""""""

""" latex-unicoder.vim
let g:unicoder_cancel_normal = 1
let g:unicoder_cancel_insert = 1
let g:unicoder_cancel_visual = 1
nnoremap <C-l> :call unicoder#start(0)<CR>
inoremap <C-l> <Esc>:call unicoder#start(1)<CR>
vnoremap <C-l> :<C-u>call unicoder#selection()<CR>

""" vimcmdline
" vimcmdline mappings
let cmdline_map_start          = '<LocalLeader>rs'
let cmdline_map_send           = '<LocalLeader>r<Space>'
let cmdline_map_send_and_stay  = '<LocalLeader>rt'
let cmdline_map_source_fun     = '<LocalLeader>rf'
let cmdline_map_send_paragraph = '<LocalLeader>rp'
let cmdline_map_send_block     = '<LocalLeader>rb'
let cmdline_map_quit           = '<LocalLeader>rq'

" vimcmdline options
let cmdline_vsplit             = 0      " Split the window vertically
let cmdline_esc_term           = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
let cmdline_in_buffer          = 1      " Start the interpreter in a Neovim's terminal
let cmdline_term_height        = 15     " Initial height of interpreter window or pane
let cmdline_term_width         = 100    " Initial width of interpreter window or pane
let cmdline_tmp_dir            = '/tmp' " Temporary directory to save files
let cmdline_outhl              = 1      " Syntax highlight the output
let cmdline_auto_scroll        = 1      " Keep the cursor at the end of terminal (nvim)
let cmdline_follow_colorscheme = 1      " follow default colourscheme

" define repls
let cmdline_app           = {}
let cmdline_app['python'] = 'ptipython3'
let cmdline_app['julia']  = 'julia'
let cmdline_app['ruby']   = 'pry'
let cmdline_app['sh']     = 'bash'


""" julia
" disable latex to unicode
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_auto = 0
let g:latex_to_unicode_suggestions = 0


""" hexmode
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.so'


""" vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"


""" vim-rooter
let g:rooter_use_lcd = 1
let g:rooter_patterns = ['stack.yaml', 'pom.xml', 'build.gradle']


""" vim-lastplace
let g:lastplace_ignore_buftype = 'quickfix,nofile,help,term'


""" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_before_where = 2     " indent where by smaller amounts
let g:haskell_indent_after_bare_where = 2 " indent where by smaller amounts


""" colorscheme
set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'


""" gundo
nnoremap <F6> :GundoToggle<CR>


""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 2
let g:airline#extensions#tabline#formatter = "unique_tail_improved"

" ale + airline
let g:airline#extensions#ale#enabled = 1
" vimtex + airline
let g:airline#extensions#vimtex#enabled = 1

" wordcount filetypes
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = 'pandoc\|markdown\|rst\|org\|help\|text\|tex\|mail'


""" ale
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


""" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>


""" fzf.vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" dictionary
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

" custom statusline
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd myAuCmd User FzfStatusLine call <SID>fzf_statusline()

" fix for fzf startup
let $FZF_DEFAULT_OPTS .= ' --no-height'

" line text-objects
call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction


""" vim-markdown enable tex
let g:tex_conceal = ""
let g:vim_markdown_math = 1


""" vimtex
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

" clean on quit
autocmd myAuCmd User VimtexEventQuit call vimtex#compiler#clean(0)


""" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1

" use tab to expand snippet or forward cycle press tab again to expand snippet
imap <expr><TAB> <SID>neosnippet_complete()
" use tab to backward cycle
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" enter to close popup

function! s:neosnippet_complete()
  if pumvisible()
    return "\<C-n>"
  else
    if neosnippet#expandable_or_jumpable()
      return "\<Plug>(neosnippet_expand_or_jump)"
    endif
    return "\<TAB>"
  endif
endfunction


""" LanguageClient
" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Required for operations modifying multiple buffers like rename.
set hidden

" sign column always on
autocmd myAuCmd FileType javascript,javascript.jsx,java,haskell,julia,python set signcolumn=yes

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'java': ['jdtls'],
    \ 'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', 'using LanguageServer; server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false); server.runlinter = true; run(server);']
\ }
    "\ 'haskell': ['hie-wrapper', '--lsp']
    "\ 'haskell': ['hie-wrapper', '--lsp', '-r', getcwd() + '/.hie']

"let g:LanguageClient_settingsPath = '~/.config/nvim/hie/settings.json'

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


""" pandoc-syntax
let g:pandoc#syntax#conceal#use = 0

""" markbar
map <Leader>m <Plug>ToggleMarkbar

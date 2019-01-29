let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let g:dein#install_log_filename = '~/.tmp/dein.log'

let $CACHE = expand('~/.cache')
let s:path = expand('$CACHE/dein')

if dein#load_state(s:path)
    call dein#begin(s:path, expand('<sfile>'))

    "call dein#add('JuliaEditorSupport/julia-vim')
    call dein#load_toml(g:initDir . 'dein/dein.toml', {'lazy': 0})
    call dein#load_toml(g:initDir . 'dein/dein_lazy.toml', {'lazy' : 1})

    call dein#end()
    call dein#save_state()

    "if  dein#check_install()
      "" Installation check.
      "call dein#install()
    "endif
endif

filetype plugin indent on
syntax enable

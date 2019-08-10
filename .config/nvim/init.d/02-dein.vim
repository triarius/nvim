if g:os == 'Darwin'
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
    set runtimepath+=/usr/local/opt/fzf
endif

let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let g:dein#install_log_filename = '~/.cache/dein.log'

let s:path = expand('~/.cache/dein')

filetype off

if dein#load_state(s:path)
    call dein#begin(s:path, expand('<sfile>'))

    call dein#load_toml(configDir . 'dein/dein.toml', {'lazy': 0})
    call dein#load_toml(configDir . 'dein/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()

    if dein#check_install()
      call dein#install()
    endif
endif

filetype plugin indent on
syntax enable

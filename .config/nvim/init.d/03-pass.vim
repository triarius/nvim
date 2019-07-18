au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
au BufNewFile,BufRead $PASSWORD_STORE_DIR/* setlocal noswapfile nobackup noundofile

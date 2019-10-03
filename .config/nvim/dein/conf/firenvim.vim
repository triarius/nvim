let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': '',
            \ 'priority': 0,
        \ }
        \ 'github\.com': {
            \ 'selector': 'textarea',
            \ 'priority': 1,
        \ }
    \ }
\ }

function! OnUIEnter(event)
    let l:ui = nvim_get_chan_info(a:event.channel)
    if has_key(l:ui, 'client') && has_key(l:ui.client, "name")
        if l:ui.client.name == "Firenvim"
            set laststatus=0
        endif
    endif
endfunction

autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

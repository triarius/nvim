set shell=/bin/bash

" source a file in a path relative to the nvim config dir
function! s:source_init(path, ...) abort
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand(g:initDir . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath), 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute 'source' fnameescape(tempfile)
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction

if &compatible
    set nocompatible
endif

" don't use the fish shell as it is not POSIX compatible
if &shell =~# 'fish$'
    set shell=bash
endif

" detect os
" Darwin for macOS, Linux for GNU/Linux
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" paths for unix machine are different than windows
if g:os != 'Windows'
    let g:configDir = '~/.config/nvim/'
    let g:initDir = g:configDir . 'init.d/'
    let g:pluginDir = g:configDir . 'dein/conf/'
endif

" source every .vim file in init.d
for f in split(globpath(g:initDir, '*.vim'), '\n')
    call s:source_init(fnamemodify(f, ':t'))
endfor

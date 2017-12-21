" IDL folding
"if exists("g:loaded_idlang_fold")
"  finish
"endif
"let g:loaded_idlang_fold = 1

let s:save_cpo = &cpo
set cpo&vim

setlocal foldmethod=expr
setlocal foldexpr=IDLFold(v:lnum)
let g:idl_inside_switch = 0
function! IDLFold(lnum)
  let line = getline(a:lnum)
  let idl_envs = '\(for\|if\|switch\)'

  " fold syntax
  " procedure
  if line =~ '^\s*pro\s\+'
    return 'a1'
  endif
  " function
  if line =~ '^\s*function\s\+'
    return 'a1'
  endif
  if line =~ '^\s*end\s*\(;.*\)\?$'
    if g:idl_inside_switch == 0
      return 's1'
    else
      let g:idl_inside_switch = 0
    endif
  endif
  if line =~ '^\s*\d\+:\s*begin'
    let g:idl_inside_switch = 1
  endif
  return '='

  " fold marker
  if line =~ '^[^%]*%[^{]*{{{'
    return 'a1'
  endif
  if line =~ '^[^%]*%[^}]*}}}'
    return 's1'
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

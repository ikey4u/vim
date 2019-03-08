" Modified from https://github.com/CodeFalling/fcitx-remote-for-osx 
 " ---------------------------------------------------------------------
 "

let s:scriptpath = expand("<sfile>:p")

" Load Once:
if exists('g:fcitx_remote')
  finish
endif

set ttimeoutlen=50

if(g:os != "mac")
  finish
endif

if exists('$SSH_TTY')
  finish
endif

let s:fcitx = expand("<sfile>:p:h") . "/fcitx-remote"

if !filereadable(s:fcitx)
    echomsg s:scriptpath . "." . expand("<slnum>") . " => No fcitx-remote is found!"
    finish
endif

let s:keepcpo = &cpo
let g:loaded_fcitx = 1
set cpo&vim
" ---------------------------------------------------------------------
" Functions:
function Fcitx2en()
  let inputstatus = system(s:fcitx)
  if inputstatus == 2
    let b:inputtoggle = 1
    let t = system(s:fcitx . " -c")
  endif
endfunction
function Fcitx2zh()
  try
    if b:inputtoggle == 1
      let t = system(s:fcitx . " -o")
      let b:inputtoggle = 0
    endif
  catch /inputtoggle/
    let b:inputtoggle = 0
  endtry
endfunction
" ---------------------------------------------------------------------
" Autocmds:
function Fcitx2zhOnce()
  call Fcitx2zh()
  call UnBindAu()
endfunction

function BindAu2zhOnce()
  augroup Fcitx
   au InsertEnter * call Fcitx2zhOnce()
  augroup END
endfunction

function BindAu()
  augroup Fcitx
   au InsertLeave * call Fcitx2en()
   au InsertEnter * call Fcitx2zh()
   au VimEnter * call Fcitx2en()
  augroup END
endfunction

function UnBindAu()
  au! Fcitx InsertLeave *
  au! Fcitx InsertEnter *
endfunction

call BindAu()

"Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  call UnBindAu()
  call BindAu2zhOnce()
endfunction

function! Multiple_cursors_after()
  call Fcitx2en()
  call BindAu()
endfunction

" ---------------------------------------------------------------------
"  Restoration And Modelines:
let &cpo=s:keepcpo
unlet s:keepcpo
"vim:fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1

let g:fcitx_remote = 1

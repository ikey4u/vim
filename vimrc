"===========================================================================
"                           Configuration Variables
"===========================================================================

let g:pyhome = "/usr/local/opt/python/Frameworks/Python.framework/Versions/3.7"
let g:idapro = "/Applications/IDAPro7.0/ida.app/Contents/MacOS/python"
let g:idaprotag = "/Applications/IDAPro7.0/ida.app/Contents/MacOS/python/tags"
let g:terminal = "/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal"
let g:openex = "open"
"TODO (set winpos)

"TODO
" - set guifont
" - install browser-sync

"**************DO NOT TOUCH BELOW UNLESS YOU KNOW WHAT YOU ARE DOING**************
" Detect operating system
if !exists("g:os")
    if has("mac")
        let g:os = "mac"
    elseif has("unix")
        let g:os = "linux"
    elseif has("win32")
        let g:os = "win"
    else
        let g:os = "unknown"
    endif
endif

" Set variables of python binary and python dll
let g:pybin = g:pyhome."/bin/python3"
function! SetPydll()
python3 << EOF
"""
set pythonthreedll value, it cannot set from variable dynamic for security,
so here I set it through environment  DYNAMIC_PYTHON3_DLL
Using echo $DYNAMIC_PYTHON3_DLL to examine the value.
"""
import vim
import os
pyhome = vim.eval("g:pyhome")
os.environ['DYNAMIC_PYTHON3_DLL'] = pyhome + "/lib"
EOF
endfunction
call SetPydll()

if has('python3')
   command! -nargs=1 Py py3 <args>
   let &pythonthreehome=g:pyhome
   let &pyx=3
endif

" IDApython autocomplete
python3 << EOF
import os
import vim
idapro = vim.eval("g:idapro")
if idapro.strip() != "":
    os.environ['PYTHONPATH']="$PYTHONPATH:" + idapro
EOF

if has("win32")
    " [windows] Configuration without any external dependencies
    source $HOME/vimfiles/settings/basic.vim
    source $HOME/vimfiles/settings/basicx.vim
else
    " [*nix] Configuration without any external dependencies
    source $HOME/.vim/settings/basic.vim
    source $HOME/.vim/settings/basicx.vim
endif

" Require some extra stuffs to make it work
source $HOME/.vim/settings/ext.vim
if has("gui_running")
    source $HOME/.vim/settings/plugin.vim
    source $HOME/.vim/settings/plugincfg.vim
endif

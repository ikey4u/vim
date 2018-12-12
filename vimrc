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

if has("gui_running")
   if has('python3')
       if g:os == "mac"
           command! -nargs=1 Py py3 <args>
           set pythonthreedll="/usr/local/opt/python/Frameworks/Python.framework/Versions/3.7/lib"
           set pythonthreehome="/Library/Frameworks/Python.framework/Versions/3.7"
           set pyx=3
        elseif g:os == "linux"
           command! -nargs=1 Py py3 <args>
           set pythonthreedll=$HOME/.pyenv/versions/3.6.5/lib
           set pythonthreehome=$HOME/.pyenv/versions/3.6.5
           set pyx=3
       endif
   endif
endif

" IDApython 自动补全
"if has("gui_running")
"python3 << EOF
"import os
"os.environ['PYTHONPATH']="$PYTHONPATH:/Applications/IDAPro7.0/ida.app/Contents/MacOS/python/"
"#os.environ['PYTHONPATH']="$PYTHONPATH:/usr/local/Cellar/python@2/2.7.14_3/Frameworks/Python.framework/Versions/2.7/lib/python2.7/"
"os.environ['PYTHONPATH']="$PYTHONPATH:/usr/local/Cellar/python/3.6.5/Frameworks/Python.framework/Versions/3.6/lib/python3.6/multiprocessing"
"EOF
"endif

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

" Set variables of python binary and python dll
if g:os == "win"
    let g:pybin = g:pyhome."/python"
    let &pythonthreedll=g:pydll
else
    let g:pybin = g:pyhome."/bin/python3"
endif


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
if vim.eval("g:os") == "win":
    os.environ['DYNAMIC_PYTHON3_DLL'] = pyhome
else:
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
function! SetIDAPro()
python3 << EOF
import os
import vim
idapro = vim.eval("g:idapro")
if idapro.strip() != "":
    os.environ['PYTHONPATH']="$PYTHONPATH:" + idapro
EOF
endfunction
call SetIDAPro()

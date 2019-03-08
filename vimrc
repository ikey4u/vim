"===========================================================================
"                           Configuration Variables
"===========================================================================
"
" Adjust the values below and put it into user.vim in current direcotry
"
" let g:pyhome = "/usr/local/opt/python/Frameworks/Python.framework/Versions/3.7"
" let g:idapro = "/Applications/IDAPro7.0/ida.app/Contents/MacOS/python"
" let g:idaprotag = "/Applications/IDAPro7.0/ida.app/Contents/MacOS/python/tags"
" let g:terminal = "/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal"
" let g:openex = "open"
"

" TODO
" - set winpos
" - set guifont
" - install browser-sync

"**************DO NOT TOUCH BELOW UNLESS YOU KNOW WHAT YOU ARE DOING**************
" Detect operating system
if !exists("g:os")
    if has("mac")
        let g:os = "mac"
        let g:home = "$HOME/\.vim"
    elseif has("unix")
        let g:os = "linux"
        let g:home = "$HOME/\.vim"
    elseif has("win32")
        let g:os = "win"
        let g:home = "$HOME/vimfiles"
    else
        let g:os = "unknown"
        finish
    endif
endif

exec "source " . g:home . "/" . "user.vim"
exec "source " . g:home . "/" . "settings/python.vim"
exec "source " . g:home . "/" . "settings/basic.vim"
exec "source " . g:home . "/" . "settings/basicx.vim"
exec "source " . g:home . "/" . "settings/ext.vim"
if has("gui_running")
    exec "source " . g:home . "/" . "settings/plugin.vim"
    exec "source " . g:home . "/" . "settings/plugincfg.vim"
endif

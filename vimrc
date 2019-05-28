"  Use \man command to open manual, and read it to config.

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
exec "source " . g:home . "/" . "settings/defuser.vim"
exec "source " . g:home . "/" . "settings/python.vim"
exec "source " . g:home . "/" . "settings/basic.vim"
exec "source " . g:home . "/" . "settings/basicx.vim"
exec "source " . g:home . "/" . "settings/ext.vim"
if has("gui_running")
    exec "source " . g:home . "/" . "settings/plugin.vim"
    exec "source " . g:home . "/" . "settings/plugincfg.vim"
endif


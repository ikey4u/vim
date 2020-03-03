" 设置工作目录
"
" 从当前文件路径向上回溯, 直到找到一个目录包含有一个文件 .vimroot 为止,
" 含有 .vimroot 的目录即被设置为工作目录, 该工作目录的值被放到 g:VimRoot 中.
" 如果找不到含有 .vimroot 的目录, 那么就设置工作目录为当前文件所在的目录.
function! FindWorkingDir()
python3 << EOF
import vim
import os
curdir = vim.eval("expand('%:h')")
curdir = os.path.abspath(curdir)
if not os.path.isdir(curdir):
    curdir = os.path.dirname(curdir)

rootdir = curdir
while True:
    # reach filesytem root directory
    if curdir == os.path.dirname(curdir):
        break
    if os.path.exists(os.path.join(curdir, '.vimroot')):
        rootdir = curdir
        break
    else:
        curdir = os.path.dirname(curdir)
vim.command(f"let g:VimRoot = '{rootdir}' ")
EOF
endfunction

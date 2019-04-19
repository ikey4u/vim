" 本文件依赖外部环境

" ==================== Live HTML Preview ====================
"实时预览html,使用方法":call Pre()", 需要安装 browser-sync
function! Pre()
    let curdir = expand("%:p:h")
    let cdcurdir = 'cd '. curdir
    let runcmd = cdcurdir . ' && browser-sync start --server --files "css/*.css, *.html" --index '.  expand("%:t") . ' &'
    call system(runcmd)
    " 比如输出为如下(echom runcmd):
    " cd /Users/bugnofree/Documents/ && browser-sync start --server --files "css/*.css, *.html" --index xyz.html &
    " 注意需要切换到文档所在目录, 然后指定监视的文件, 并指定当前起始页为当前文件
endfunction
"函数Pre执行次数过多,将会导致livehtml以及内部实际进程browser-sync进程很多,杀死方法如下:
"ps -elf | grep livehtml | awk '{print $4}'| xargs kill -9 $1
function! KillPre()
    if g:os == "linux"
        call system("ps -elf | grep livehtml | awk '{print $4}'| xargs kill -9 $1")
        call system("ps -elf | grep browser-sync | awk '{print $4}'| xargs kill -9 $1")
    elseif g:os == "mac"
        call system("ps aux | grep livehtml | awk '{print $2}'| xargs kill -9 $1")
        call system("ps aux | grep browser-sync | awk '{print $2}'| xargs kill -9 $1")
    endif
endfunction

" normal 模式下输入 os 在当前目录打开终端
function! OpenShell()
    call system(g:terminal." . &")
endfunction
nnoremap <leader>os :call OpenShell()<CR>

" normal 模式下输入 oe 在当前目录打开文件浏览器
function! OpenExp()
    call system(g:openex." .")
endfunction
nnoremap <leader>oe :call OpenExp()<CR>

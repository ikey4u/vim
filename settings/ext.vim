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

"在当前目录打开terminator
"在normal模式下输入sh以在当前目录打开命令行
function! OpenShell()
    call system(g:terminal." &")
endfunction
nmap sh :call OpenShell()<CR>

"在当前目录打开文件浏览器]
function! OpenExp()
    call system(g:openex." .")
endfunction
nmap se :call OpenExp()<CR>

" [Json Unicode]
" 这个方法在 windows 下无法正常工作,只好写个脚本处理了:
" #! /usr/bin/env python3
" #! coding:utf-8
" import json
" import sys
" import os
" import glob
" jfiles = glob.glob("*.json")
" for jf in jfiles:
"     with open(jf,'r') as _:
"         j = json.load(_)
"     with open(os.path.splitext(jf)[0] + "-unicode.json","w") as _:
"         json.dump(j,_,ensure_ascii = False,indent = 4)
command! JsonFormat :execute '%!python -m json.tool'
\ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
\ | :set ft=javascript
\ | :1

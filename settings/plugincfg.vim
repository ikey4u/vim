" ==================== LargeFile ====================
let g:LargeFile=10									  "优化大文件编辑

" ==================== YouCompleteMe ====================
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/.ycm_extra_conf.py'
"关闭语法检测,太碍眼了
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_show_diagnostics_ui = 0
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0
"让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu
let g:ycm_path_to_python_interpreter = g:pybin
let g:ycm_server_python_interpreter=g:pybin
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_add_preview_to_completeopt=1
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关闭预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 打印日志
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_keep_logfiles = 1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings=1
" 黑名单
"打开pdf,无后缀的文件时禁用ycm,文件类型可以使用 :set ft? 来查看
let g:ycm_filetype_blacklist = {
      \ 'pdf':1,
      \ 'java':1,
      \'':1}
"启用ycm的文件
"let g:ycm_filetype_whitelist = {
"      \ 'C':1,
"      \ 'CPP':1,
"      \ 'Python':1
"      \}
"离开插入模式后自动关闭预览窗口"
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 启用语义补全, 绑定快捷键为 ctrl+z, 如果冲突了请更换
" 语义补全和符号补全不同, 符号补全是根据当前 buffer 中收集到的符号进行补全
" 而语义即使 buffer 中没有, 也会自动去库里面找, 比如你以前没有输入过 strstr
" 这个函数, 那么符号补全就不会找出 strstr 这个符号, 但是当你输入 str 然后按下
" ctrl+z 的时候就会找到该函数
let g:ycm_key_invoke_completion = '<c-z>'
noremap <c-z> <NOP>
" 自动弹出语义补全, 输入两个字符后自动弹出语义补全
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ 'css': [ 're!^\s{4}', 're!:\s+'],
            \ 'html': [ '</' ],
            \ }

" 关闭错误警告
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

 "上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" ==================== fcitx-vim-osx ====================
" 这个其实挺烦人的, 不对, 可以说是相当的烦人了! 怎么解决呢?
" 1: brew tap codefalling/fcitx-remote-for-osx
" 2: brew info codefalling/fcitx-remote-for-osx/fcitx-remote-for-osx
"    这个命令可以列出支持的输入法, 比如我用的是搜狗输入法, 那么就可以使用下面
"    命令安装
" 3: brew install codefalling/fcitx-remote-for-osx/fcitx-remote-for-osx --with-sogou-pinyin
"   对于一般输入法可以使用如下方法安装
"   brew install fcitx-remote-for-osx
" 4: 打开系统配置, 进入 keyboard/Shortcuts/Input Sources/Select next source Input menu
"   设置快捷键为 ctrl+shift+z
" 5: 打开系统配置, 进入 keyboard/Input Sources/ 添加 US 输入法
" 6: 但是这个时候有一个地方很不爽, 就是看你边用 vim, 然后到其他应用程序上比如
" 命令中, 然后输入了中文, 回到 vim 中后, 还是中文输入法, 这就特么尴尬了,
" 如果是 normal 模式中文使用很不方便, 怎么弄呢? 搜狗输入法的高级选项中有个
" 自动英文的配置, 将 macvim 加入即可.
" 更多详情参考:https://github.com/CodeFalling/fcitx-vim-osx

" ==================== fcitx ====================
" Linux 下进入 normal 模式自动禁用 fcitx 框架的输入法
" cheetsheet:https://docs.emmet.io/cheat-sheet/

" ==================== nerdcommenter ====================
" 其快捷键如下(以C/C++为例):
" \cc: // 方式注释行 coment current line
" \cm: /**/ 方式注释行,或者将选中的行紧凑的包起来:comment minimal line
" \c<space> :切换行的状态(注释->非注释,非注释->注释)
" \cs:良好格式的块注释 /**/:comment sexy line
" \cu:取消注释:comment undo
" \ca:切换可选的注释方式, 如 C/C++ 的块注释和行注释
" 注释后面自动加空格
let g:NERDSpaceDelims=1


" ==================== semantic-highlight ====================
" run :SemanticHighlight to convert variables into colors. Run :SemanticHighlightRevert to revert
"

" ==================== ultisnips;vim-snippets ====================
let g:UltiSnipsExpandTrigger="<leader>i"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" 使用 :UltiSnipsEdit 水平划分窗口
"let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsEditSplit="horizontal"
" 在 3.3 Snippet Search Path  中提到了如何配置搜索路径,
" 如果只在下面变量中声明了一个绝对路径,那么 ultiSnips 将不会加载第三方
" snippet 文件,这将对性能有一个明显的提升,但是却导致了无法使用第三方文件,
" 然而你可以拷贝第三方文件到指定目录,这里指定目录为 ~/.vim/UltiSnips
" 注意下面的方法会导致出错
"let g:UltiSnipsSnippetDirectories=$HOME.'/.vim/UltiSnips'
" 而可行的方法如下:
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" 如果你想编辑某个 Snippet 文件,使用 :UltiSnipsEdit 然后按下 tab
" 即可查看所有支持的类型


" ==================== vimtex ====================
" > 禁用 quickfix 窗口
"     let g:vimtex_quickfix_enabled=0
" > 声明使用的主程序, 需要在主文件的第一行写入如下指令
"     %! TEX program = xelatex
" > 主文件(采用如下几种方法之一)
"     1. 也可以在 .vimrc 中加入下面这行,设置主文件为 main.tex,但这个我试了一下并不行
"       autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'
"     2. 假如主文件为 main.tex, 那么设置一个空的文件名字为 main.tex.latexmain 即可.
"     这种感觉比较方便.
" > 快捷键(使用 :help vimtex-default-mappings 即可查看所有的):
"   预览: <leader>ll 选项信息: <leader>li 编译输出: <leader>lo
" > 自动编译 bibtex 的问题:
"   对于 bibtex 文件, vimtex 第一次会编译失败, 不要灰心, 再让 vimtex 执行一次即可.

let g:tex_flavor = 'xelatex'
let g:vimtex_quickfix_enabled = 1
let g:vimtex_compiler_latexmk = {
      \ 'build_dir': 'out',
      \ 'options' : [
      \   '-xelatex',
      \   '-silent',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \   '-file-line-error',
      \   '-bibtex',
      \ ],
      \}

" ==================== markdown-preview;mathjax-support-for-mkdp ====================
" MarkdownPreview:打开预览
" MarkdownPreviewStop:关闭预览
"

" ==================== vim-table-mode ====================
" :TableModeToggle进入表格模式,
" 输入 | name | addr | phone|
" 下一行连续输入两个"||",自动补全
" 它的命令前缀是<Leader>t，可以通过 g:table_mode_map_prefix 来更改。
"<Leader>tm table mode 开关
"<Leader>tt 使用g:table_mode_delimiter定义的分隔符插入表格
"<Leader>T 使用用户输入的分隔符插入表格
"<Leader>tr 重新对齐
"[| 移动到前一个表格
"]| 移动到下一个表格
"{| 移动到上面一个表格
"}| 移动到下面一个表格
"|| 插入表头边框
"<Leader>tdd 删除一行
"<Leader>tdc 删除一列
"

" ==================== vim-javacomplete2 ====================
autocmd FileType java setlocal omnifunc=javacomplete#Complete


" ==================== ctags;gtags ====================
" ctag和cscope不属于vim插件,可以通过apt安装到系统
" sudo apt install exuberant-ctags cscope
" 进入源码目录,执行以下命令生成索引文件:
" ctag -R * && cscope -Rbq
" tags 文件设置
set tags=./tags;,tags;
set tags+=g:idaprotag;
" gtags 设置
"替换默认的 ctags 和 cscope
"set cscopetag
"set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
let Gtags_Auto_Update = 1
"[ autotags ]
"g:autotagmaxTagsFileSize	a cap on what size tag file to strip etc
"g:autotagExcludeSuffixes	suffixes to not ctags on
"g:autotagVerbosityLevel	logging verbosity (as in Python logging module)
let g:autotagCtagsCmd="exctags"
let g:autotagTagsFile="tags"
"g:autotagDisabled	Disable autotag (enable by setting to any non-blank value)
"g:autotagStopAt	stop looking for a tags file (and make one) at this directory (defaults to $HOME)

" ==================== tagbar ====================
"设置 tagbar 的快捷键为F8
nmap <F8> :TagbarToggle<CR>

" ==================== vim-autotag ====================
" 自动更新 tags 文件
"
" ==================== AnsiEsc ====================
" 显示linux终端颜色,比如将 [[0;32m  OK  [0m]
" 转换为颜色高亮显示,命令:':AnsiEsc' 执行转换,
" 再执行一次则返回原有状态
"

" ==================== markdown-preview ====================
" 禁止切换 buffer 时关闭预览
let g:mkdp_auto_close = 0

" ==================== nerdtree ====================

" ==================== tern for vim ====================
" cd ~/.vim/plugged/tern_for_vim && npm install
let g:tern_show_signature_in_pum = 1


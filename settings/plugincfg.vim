" ===================================
" 各插件配置参见 @[../man/plugin.txt]
" ===================================

" LargeFile
let g:LargeFile=10									  "优化大文件编辑

" ==================== YouCompleteMe ====================
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = g:home . '/' . '.ycm_extra_conf.py'
"关闭语法检测,太碍眼了
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_show_diagnostics_ui = 0
"打开vim时不再询问是否加载ycm_extra_conf.py配置
"let g:ycm_confirm_extra_conf=0
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

" [semantic highlight]
let g:semanticEnableFileTypes = ['javascript', 'vim', 'cpp', 'c', 'go', 'python', 'tex']

" [ultisnips]
let g:UltiSnipsExpandTrigger="<leader>i"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=[expand(g:home).'/UltiSnips']

" ==================== markdown-preview;mathjax-support-for-mkdp ====================
" MarkdownPreview:打开预览
" MarkdownPreviewStop:关闭预览
"

" ==================== vim-table-mode ====================
" :TableModeToggle进入表格模式,
" 输入 | name | addr | phone|
" 下一行连续输入两个"||",自动补全
" 它的命令前缀是<Leader>t,可以通过 g:table_mode_map_prefix 来更改.
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

" ctags, gtags, autotag {
    set tags=./tags;,tags;
    set tags+=g:idaprotag;

    if g:os != "win"
        let g:autotagCtagsCmd="exctags"
        let g:autotagTagsFile="tags"

        set cscopetag
        set cscopeprg=gtags-cscope
        let GtagsCscope_Auto_Load = 1
        let GtagsCscope_Auto_Map = 1
        let GtagsCscope_Quiet = 1
    endif
" }

" leaderf {
    let g:Lf_Ctags = "exctags"
    let g:Lf_RootMarkers = ['.git', '.svn', '.leaderf']
    let g:Lf_WorkingDirectoryMode = 'Ac'
" }


" ==================== AnsiEsc ====================
" 显示linux终端颜色,比如将 [[0;32m  OK  [0m]
" 转换为颜色高亮显示,命令:':AnsiEsc' 执行转换,
" 再执行一次则返回原有状态

" ==================== markdown-preview ====================
" 禁止切换 buffer 时关闭预览
let g:mkdp_auto_close = 0

" tern for vim {
"   cd ~/.vim/plugged/tern_for_vim && npm install

    let g:tern_show_signature_in_pum = 1
" }

" nerdtree {
    " <leader>r 自动刷新 nerdtree 目录到当前工作目录
    noremap <leader>r :NERDTreeFind<cr>
    " 忽略的文件列表
    let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.db$']
" }

" [vimtex]
let g:vimtex_quickfix_enabled = 1
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_latexmk = {
      \ 'build_dir': 'out',
      \ 'continuous' : 1,
      \ 'options' : [
      \   '-xelatex',
      \   '-verbose',
      \   '-silent',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \   '-file-line-error',
      \   '-bibtex',
      \ ],
      \}
set conceallevel=2
let g:tex_conceal='abdmg'

" auto-pairs {
    " 更换 auto-pairs 的默认快捷键为 alt+shift+p
    let g:AutoPairsShortcutToggle = "<A-s-p>"
" }

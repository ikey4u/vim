" 初始化配置
source $VIMRUNTIME/vimrc_example.vim
set nocompatible                                      "关闭 vim 兼容模式, 如果不关闭 vim 就会像 vi 一样, 感觉不到任何爽快

" 基础选项
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
set smartindent                                       "启用智能对齐方式
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set expandtab       "(et)编辑时将所有 Tab 替换为空格
                    "该选项只在编辑时将 Tab 替换为空格,
                    "如果打开一个已经存在的文件,并不会将已有的 Tab替换为空格.
                    "如果希望进行这样的替换的话,可以使用这条命令":retab".
set shiftwidth=4    "(sw)自动缩进时所使用的缩进长度
set tabstop=4       "(ts)定义与一个 tab 等长的空格长度
set softtabstop=4   "(sts)这个主要是和 tabastop 配合使用,
                    "这个一般在 set expandtab 时用处不大, 否则在启用 tab 时,
                    "表示混合输入. 加入 tabstop 的值是 8, 如果 softtabstop 是 16,
                    "那么一个 tab 键就会输入两个 tab, 如果 softtabstop 是 17,
                    "那么就会输入两个 tab 加上一个空格.
                    "如果 softtabstop 是 4, 那么输入 tab, 会输入 4 个空格,
                    "当再按下一个 tab 时, 就会生成一个制表符.
                    "简单来说, softtabstop 根据自身值与 tabstop 的值进行行为控制,
                    "一般和 tabstop 配置一致即可. 当该值为 0 时, 关闭该功能

let $LANG = 'en'                                      " 设置消息语言(比如弹出框什么的)
set langmenu=zh_CN.UTF-8                              "设置菜单语言,解决消息乱码问题
set timeoutlen=1000 ttimeoutlen=0                     "消除 ESC 按键延迟
set number                                            "显示行号
set virtualedit=all                                   "启用虚拟编辑(也就是让光标可以达到没有任何文字的地方)
set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
set cryptmethod=blowfish2                             "使用 vim ":X" 来加密文件时的加密方式
set showmatch 										  "显示括号配对
set cindent 										  "打开C/C++风格自动缩进
set autoindent 										  "打开普通文件类型的自动缩进.
set ambiwidth=double                            "防止特殊符号无法正常显示.
set mouse=a                                     "启用鼠标
set showcmd                                     "正常模式下状态行显示输入的命令
syntax on                                       "开启代码着色
let html_use_css = 1                            "设置 TOhtml 使用样式表而不是行内样式
let html_number_lines = 0                       "取消 TOhtml 的行号
"set mouse-=a									"禁用鼠标

" 编码设置 {

    " 注:使用utf-8格式后,软件与程序源码,文件路径不能有中文,否则报错

    set encoding=utf-8                                    "设置gvim内部编码
    if g:os == 'win'
        " 这两行代码必须位于 set encoding=utf-8 之前, 用于解决 windows 下 gvim
        " 的乱码问题
        source $vimruntime/delmenu.vim
        source $vimruntime/menu.vim
    endif
    set fileencoding=utf-8                                " 设置当前文件编码,可以更改,如:gbk(同cp936)
    set fileencodings=ucs-bom,utf-8,gbk,cp936             " 设置支持打开的文件的编码,这一行搞不好就会乱码
    set tenc=utf-8                                        " 设置终端编码
    set fileformat=unix                                   " 设置新(当前)文件的<EOL>格式,可以更改,
                                                          " 如:dos(windows系统最好设置为dos否则容易出现^M等字符)
    set fileformats=unix,dos,mac                          " 给出文件的<EOL>格式类型
" }

" 设置字体 {
    if has('unix')
        if has('mac')
            " Mac
            set guifont=Source\ Code\ Pro:h12
        else
            " Linux
            " git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
            " fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
            set guifontwide=Source\ Code\ Pro\ Semi-Bold\ 10
        endif
    elseif has('win32') || has('win64')
        " Windows
        set guifont=Source\ Code\ Pro:h10
    endif
" }

" 折叠
set foldlevel=99									  "默认情况下不折叠
set foldenable                                        "启用折叠
set foldmethod=indent                                 "indent 折叠方式
set foldmethod=marker                                 "marker 折叠方式, :help marker

" 搜索设置
set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符,不使用 'ignorecase' 选项,
set noincsearch                                       "在输入要搜索的文字时,取消实时匹配

" 水平垂直线显示
if has("gui_running")
    set cursorline                                        "突出显示当前行
    set cursorcolumn                                      "突出显示当前列
endif


"文本格式化 命令为"gq"
set textwidth=80            " textwidth,设置文本行宽度
set formatoptions+=mM       "formatoptions,设置自动换行的条件, m 表示允许对 multi_byte 字符换行

" 启动窗口大小设置 {
    " 设置lines或者columns会导致控制台中的vim使用异常
    " 因此这里使用if语句判断, 如果是gvim则启用.

    " 设置 vim 启动后的窗口大小, 有如下几个命令

    " - 设置行数 set lines=50
    " - 设置列数 set columns=141
    " - 设置窗口位置 winpos 244 93

        " 第一个参数表示距离屏幕左侧的距离, 第二个参数表示距离屏幕上侧的距离
    if has("gui_running")
        " windows 下默认启用最大窗口, linux 和 mac 平台也计划启用最大窗口,
        " 但是还未测试
        if g:os == "win"
            au GUIEnter * simalt ~x
        endif
    endif
" }


" 文件备份设置
set nowritebackup                                     "编辑时不需要备份文件
set nobackup                                          "设置无备份文件
set noswapfile                                        "设置无临时文件
set noundofile                                        "不创建撤销文件

"状态栏的设置
set ruler                                            "使状态栏显示光标位置
set laststatus=2                                     "启用状态栏信息
" highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
set cmdheight=2                                       "设置命令行的高度为2,默认为1
"%b==>十进制显示光标下的字符,%B十六进制显示光标下的字符
set statusline=[%n]\ %F%m%r%h\ %=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%B\ \|
set statusline+=\ %{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}\ \|

" 设置代码默认配色方案
set background=dark
colorscheme desert
set t_Co=256
hi Terminal ctermbg=lightgrey ctermfg=red guibg=#44115a guifg=white

"弹出菜单的着色
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#2A2A2A guibg=#E8E8E8

"自动切换目录为当前编辑文件所在目录
set autochdir

" 不要存储会话的全局和局部变量值以及折叠(因为 Utilsnippet 无法正常恢复这些选项)
set ssop-=options
set ssop-=folds

if has("gui_running")
    " 超过 90 个字符时设置高亮
    " guibg 设置为全值, 比如要写为 #FFFFFF 而不要写为简写形式 #FFF
    highlight OverLength ctermbg=red ctermfg=white guibg=#6666FF
    match OverLength /\%91v.\+/
endif

" 根据文件类型自动设置缩进宽度
augroup cusindent
    autocmd!
    " html, css 缩进为 2
    autocmd FileType javascript,vue,html,css,yaml,dart,typescript setlocal ts=2 sw=2 sts=0 et
    " txt 缩进为 0
    autocmd FileType text setlocal nocindent
    " vim 异步高亮, 在多语言文件比如 vue 中, 会导致语言高亮失效
    " 在 vue 中我们禁用这个特性
    autocmd FileType vue syntax sync fromstart
augroup END

" 复制粘贴 {
    " normal, select 模式下用 alt + c 复制, alt + p 粘贴
    noremap <m-c> "+y
    noremap <m-p> "+p

    " Insert 和命令行模式下 alt + p 粘贴, 映射为内置的粘贴快捷键 CTRL-R +
    noremap! <m-p> <C-R>+
" }

" shebang 设定 {
    function! CinOptions()
        " sh 类型的文件启用 shebang 缩进, 其他文件则取消
        if &filetype == "sh"
            set cinoptions=#1
        else
            set cinoptions=#0
        endif
    endfunction
    autocmd WinEnter * :call CinOptions()
" }

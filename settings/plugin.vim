call plug#begin(g:home . "/" . "plugged")

" 注释插件
Plug 'scrooloose/nerdcommenter'

" 文件树插件
Plug 'scrooloose/nerdtree'

" latex 实时预览
Plug 'lervag/vimtex'

" vue, dart 高亮
Plug 'posva/vim-vue'
Plug 'dart-lang/dart-vim-plugin'

" 词法高亮(每个变量都是不同颜色)
" Plug 'jaxbot/semantic-highlight.vim'

"大文件打开加速
Plug 'vim-scripts/LargeFile'

" 显示每一行的尾部空格
Plug 'vim-scripts/ShowTrailingWhitespace'

" markdown预览以及数学公式支持
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp'

" 插入表格
Plug 'dhruvasagar/vim-table-mode'

" ctags 文件自动更新
Plug 'craigemery/vim-autotag'

" 显示 linux 终端颜色
Plug 'vim-scripts/AnsiEsc.vim'

" 自动补全系列 {
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'jiangmiao/auto-pairs'
    " Plug 'artur-shaik/vim-javacomplete2'
    Plug 'mattn/emmet-vim', { 'commit': 'dcf8f6efd8323f11e93aa1fb1349c8a1dcaa1e15' }
    Plug 'marijnh/tern_for_vim'
    Plug 'majutsushi/tagbar'
    " 使用 frozen 选项禁止更新 YCM, 这个需要手动编译
    Plug 'Valloric/YouCompleteMe',  { 'frozen': 1 }
" }

" 多光标插件
Plug 'terryma/vim-multiple-cursors'

" 状态栏
Plug 'itchyny/lightline.vim'

" 文件搜索
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" vim-surround
Plug 'tpope/vim-surround'

" LeaderF
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" typescript 插件
Plug 'leafgarland/typescript-vim'

Plug 'udalov/kotlin-vim'
call plug#end()

call plug#begin('~/.vim/plugged')

" ------- 扩展插件 -------
" Macos 下自动禁用中文输入法
Plug 'CodeFalling/fcitx-vim-osx'

" Linux 下进入 normal 模式自动禁用 fcitx 框架的输入法
Plug 'lilydjwg/fcitx.vim'

"注释插件
Plug 'scrooloose/nerdcommenter'

" 词法高亮(每个变量都是不同颜色)
Plug 'jaxbot/semantic-highlight.vim'

"NERDTree插件
Plug 'scrooloose/nerdtree'

"latex实时预览
Plug 'lervag/vimtex'

"Vue syntax highlight
Plug 'posva/vim-vue'

"主题浏览器
Plug 'jlanzarotta/colorschemeexplorer'

"大文件打开加速
Plug 'vim-scripts/LargeFile'

"显示每一行的尾部空格
Plug 'vim-scripts/ShowTrailingWhitespace'

"markdown预览以及数学公式支持
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp'

"vim插入表格
Plug 'dhruvasagar/vim-table-mode'

" tagbar
Plug 'majutsushi/tagbar'

" ctags 文件自动更新
Plug 'craigemery/vim-autotag'

" 显示 linux 终端颜色
Plug 'vim-scripts/AnsiEsc.vim'

" VIM 终极代码段解决方案插件
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"括号自动补全
Plug 'jiangmiao/auto-pairs'
"强迫症的java补全
Plug 'artur-shaik/vim-javacomplete2'
" vim-go
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" HTML补全工具
Plug 'mattn/emmet-vim', { 'commit': 'dcf8f6efd8323f11e93aa1fb1349c8a1dcaa1e15' }
" JavaScript 自动补全
Plug 'marijnh/tern_for_vim'
""安装YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" deoplete 自动补全插件, 需要安装 pip3 install neovim
let g:python3_host_prog = g:pybin
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'

" 模糊搜索 :Files
Plug 'junegunn/fzf.vim'

call plug#end()            " required

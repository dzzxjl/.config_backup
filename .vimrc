"remember last update or view postion"
 " Only do this part when compiled with support for autocommands
 if has("autocmd")
 " In text files, always limit the width of text to 78 characters
 autocmd BufRead *.txt set tw=78
 " When editing a file, always jump to the last cursor position
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
 \ endif
 endif

set foldmethod=marker

set cmdheight=1
" colorscheme
" isyntax enable
" iset background=light
" colorscheme solarized
" colorscheme Molokai

highlight clear SignColumn
" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config_backup/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell

" make Y to copy till the end of the line
nnoremap Y y$
" Copy to system clipboard
vnoremap Y "+y
" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Save & quit
" noremap Q :q<CR>
" noremap <C-q> :qa<CR>
" noremap S :w<CR>
set scrolloff=7
let mapleader=" "
noremap ; :
"h Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()"{{{
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc}}}

" 设置语言环境
set langmenu=en_US 
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim 
source $VIMRUNTIME/menu.vim
"  配置Vundle.vim
set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Step: 
" 0. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 1. Launch vim and run :PluginInstall
" 2. To install from command line: vim +PluginInstall +qall

Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
" The NERD Tree Plutin
Plugin 'scrooloose/nerdtree'
" 代码补全插件
Plugin 'honza/vim-snippets'
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'mhinz/vim-startify'
Plugin 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plugin 'preservim/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ap/vim-css-color'


" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

map <F4> <leader>ci <CR>

" toggle the paste mode
set pastetoggle=<F3>

" The NERD Tree Settings
map <F2> :NERDTreeToggle<CR>
" map <C-F> <C-W>h
" autocmd VimEnter * nested :NERDTreeToggle

" ==========================================================
" 基础设置
" 参考自：https://www.ruanyifeng.com/blog/2018/09/vimrc.html
" ==========================================================

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" inoremap键位映射
inoremap jj <esc>

" 设置鼠标
" set mouse=a

" 打开语法高亮。自动识别代码，使用多种颜色显示
syntax on

" 在底部显示，当前处于命令模式还是插入模式
set showmode

" 使用 utf-8 编码
" set encoding=utf-8

" 启用256色
set t_Co=256

" 开启文件类型检查，并且载入与该类型对应的缩进规则
" 比如，如果编辑的是.py文件，Vim 就是会找 Python 的缩进规则~/.vim/indent/python.vim
" filetype indent on

" =======
" 缩进设置
" =======

" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent

" 按下 Tab 键时，Vim 显示的空格数
set tabstop=4

" 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set shiftwidth=4

" 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set expandtab

" Tab 转为多少个空格
set softtabstop=4

" ========
" 外观设置
" ========

" 显示行号
set number

" 显示光标所在的当前行的行号，其他行都为相对于该行的相对行号
set relativenumber

" 光标所在的当前行高亮
" set cursorline

" 光标所在的当前列高亮
" set cursorcolumn

" 设置行宽，即一行显示多少个字符
" set textwidth=80

" 自动折行，即太长的行分成几行显示
set wrap

" 关闭自动折行
" set nowrap

" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行
set linebreak

" 指定折行处与编辑窗口的右边缘之间空出的字符数
" set wrapmargin=2

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）
" set scrolloff=5

" 水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用
" set sidescrolloff=15

" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set laststatus=2
set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" 在状态栏显示光标的当前位置（位于哪一行哪一列）
" set ruler

" ========
" 搜索设置
" ========

" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showmatch

" 搜索时，高亮显示匹配结果
set hlsearch

" 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set incsearch

" 搜索时忽略大小写
set ignorecase

" 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感
" 比如，搜索Test时，将不匹配test；搜索test时，将匹配Test
" set smartcase

" ========
" 编辑设置
" ========

" 打开英语单词的拼写检查
" set spell spelllang=en_us

" 不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件
" 它的文件名是在原文件名的末尾，再添加一个波浪号（〜）
" set nobackup

" 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
" set noswapfile

" 保留撤销历史
"
" Vim 会在编辑时保存操作历史，用来供用户撤消更改
" 默认情况下，操作记录只在本次编辑时有效，一旦编辑结束、文件关闭，操作历史就消失了
"
" 打开这个设置，可以在文件关闭后，操作记录保留在一个文件里面，继续存在
" 这意味着，重新打开一个文件，可以撤销上一次编辑时的操作。撤消文件是跟原文件保存在一起的隐藏文件，文件名以.un~开头
" set undofile

" 设置备份文件、交换文件、操作历史文件的保存位置
" 结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名
" set backupdir=~/.vim/.backup//
" set directory=~/.vim/.swp//
" set undodir=~/.vim/.undo//

" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。
" 该配置可以将工作目录自动切换到，正在编辑的文件的目录
set autochdir

" 出错时，不要发出响声
set noerrorbells

" 出错时，发出视觉提示，通常是屏幕闪烁
" set visualbell

" Vim 需要记住多少次历史操作
set history=1000

" 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示
set autoread

" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
set listchars=tab:»■,trail:■
set list

" 命令模式下，底部操作指令按下 Tab 键自动补全。
" 第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full

" 禁止使用上下左右键
nnoremap <Up> :echomsg "Use k"<cr>
nnoremap <Down> :echomsg "Use j"<cr>
nnoremap <Left> :echomsg "Use h"<cr>
nnoremap <Right> :echomsg "Use l"<cr>

" ========
" 常用文档
" ========
"
" autocmd: http://vimcdoc.sourceforge.net/doc/autocmd.html

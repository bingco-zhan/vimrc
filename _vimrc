" vundle 环境设置 
set su
set nocompatible
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'  "状态栏，buffer美化
Plugin 'vim-airline/vim-airline-themes'
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdtree' " 目录树
Plugin 'Valloric/YouCompleteMe' " 语法提示 
Plugin 'winmanager'

call vundle#end()  
filetype plugin indent on

" 常用命令
" :BundleList      - 显示插件列表
" :BundleInstall   - 安装插件
" :BundleInstall!  - 更新插件
" :BundleClean     - 清理无用插件
set nu
" 显示光标的坐标
set ruler

" 自动缩进
set noautoindent
set cindent
set smartindent

" Tab键的宽度
set shiftwidth=4
set tabstop=4


" 设置buffer的主题
syntax on
syntax enable
set background=light
set t_Co=128
let g:airline_theme='sierra'

set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
" 开启高亮光标行
set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep='»'
let g:airline_left_sep='>'
let g:airline_right_sep='«'
let g:airline_right_sep='<'


"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
set encoding=utf-8
set laststatus=2
set bs=2
set guifont=Courier_New:h12:cANSI
set rop=type:directx
let symbols={'maxlinenr': "\u33d1", 'linenr':"\u2630" }
let &stl='%f %{g:symbols.linenr}%2l/%L%{g:symbols.maxlinenr}'

" taglist
let Tlist_Show_One_file=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_right_Window=1
let Tlist_Sort_Type="name"

" 目录树快捷键
" autocmd VimEnter * NERDTree " 默认显示目录树
map <C-n> :NERDTreeMirror<CR>
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable=">"
let g:NERDTreeDirArrowCollapsible="v"
" 视窗快捷键 =====================
" 保存快捷键Ctrl+s

execute pathogen#infect()

set completeopt=longest,menu
let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全

" 清理C++编译文件
map <C-l> :call Clear() <CR>
func Clear()
	exec "w"
	exec "!make clean"
endfunc

" 编译C++
map <F5> :call Compiler() <CR>
func Compiler()
	exec "w"
	exec "!make"
	exec "!./main"
endfunc

" Main 函数模板
imap <C-t> :call InitTemplate() <CR>
func InitTemplate()
    let l = 0
    let l = l + 1 | call setline(l, '/**')
    let l = l + 1 | call setline(l, ' * [Template File]')
    let l = l + 1 | call setline(l, ' * Author    bingco')
    let l = l + 1 | call setline(l, ' * Email     bingco.zn@gmail.com')
    let l = l + 1 | call setline(l, ' */')
    let l = l + 1 | call setline(l, '')
    let l = l + 1 | call setline(l, '')
    let l = l + 1 | call setline(l, '#include <stdio.h>')
    let l = l + 1 | call setline(l, '#include <iostream>')
    let l = l + 1 | call setline(l, '')
    let l = l + 1 | call setline(l, '')
    let l = l + 1 | call setline(l, 'using namespace std;')
    let l = l + 1 | call setline(l, 'int main(void)')
    let l = l + 1 | call setline(l, '{')
    let l = l + 1 | call setline(l, '    // TODO - dothing    ===================')
    let l = l + 1 | call setline(l, '    return 0;')
    let l = l + 1 | call setline(l, '}')
endfunc

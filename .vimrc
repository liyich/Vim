set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar' 
Plugin 'Raimondi/delimitMate'
Plugin 'easymotion/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'ervandew/supertab'
call vundle#end()            " required
filetype plugin indent on    " required


"==============================================================================================================
set laststatus=2
" 显示光标当前位置
 set ruler
" " 开启行号显示
 set number
" " 高亮显示当前行/列
set cursorline
set cursorcolumn
set hlsearch
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
 syntax on
" 自适应不同语言的智能缩进
nnoremap <Leader>l <C-W>l
" 跳转至左方的窗口
 nnoremap <Leader>h <C-W>h



imap <Leader>i <Plug>Tex_InsertItemOnThisLine
nmap <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><leader>f <Plug>(easymotion-overwin-f)
nmap <F8> :TagbarToggle<CR>
nmap <F2> :NERDTreeToggle<CR>



"ultisnips
"==============================================================================================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"syntastic
"==============================================================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"supertab
"==============================================================================================================
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-x><c-k>"



"Latex
"==============================================================================================================
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


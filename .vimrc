set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'easymotion/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'myint/clang-complete'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()            " required
filetype plugin indent on    " required

""===============================
let mapleader=' '
map <F6> :call CompileRun()<CR>
func SetTitle()
	call append(line(".")+1, "/#/bin/bash")
endfunc
func! CompileRun()
	exec "w"
	if &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == "java"
		exec "!javac %"
		exec "!java %<"
	endif
endfunc
"==============================================================================================================
set laststatus=2
" 显示光标当前位置
set ruler
set number
set relativenumber
" 高亮显示当前行/列
set cursorline
set cursorcolumn
set hlsearch
syntax enable
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completeopt=menu
set si
"complete
"======================================================================================
autocmd BufNewFile,BufRead *.js,*.php,*,html let g:SuperTabDefaultCompletionType = "<c-x><c-o><c-p>"
autocmd BufNewFile,BufRead *.tex let g:SuperTabDefaultCompletionType = "<c-x><c-k><c-p>"
inoremap <expr> <CR> pumvisible() ? "<c-y>":"<CR>"


"Spelling check
"==============================================================================================
autocmd BufNewFile,BufRead *.tex set spell

"latex table
"===============================================================================================
autocmd BufNewFile,BufRead *.sh ":call SetTile()"

" key map
" ===============================================================================================

nmap <Leader>i o<Plug>Tex_InsertItemOnThisLine
nmap <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><leader>f <Plug>(easymotion-overwin-f)
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> gg=G
nnoremap <F4> :set ft=html<cr>gg=G:set ft=php<cr>gg=G
nnoremap <F5> :!cd /var/www/html;ctags -R;<cr><cr>:set tags+=/var/www/html/tags<cr>
nnoremap <Leader>l <C-W>l
nnoremap <Leader>h <C-W>h
nnoremap <Leader>k <C-W>k
nnoremap <Leader>j <C-W>j
nnoremap <Leader><Leader>k :lp<cr>
nnoremap <Leader><Leader>j :lne<cr>
nnoremap <Leader><Leader>k :lp<cr>
nnoremap <Leader>1 :set ft=php<cr>
nnoremap <Leader>2 :set ft=html<cr>
"clang
"=================================================================================
let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so.1'

"ultisnips
"==============================================================================================================
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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



"commenter
"====================================================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1



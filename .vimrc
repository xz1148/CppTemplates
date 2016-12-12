set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic setups"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2


""""""""""""""""""""""""""""""""""""""""""""""""""
" the useful keymappings
"""""""""""""""""""""""""""""""""""""""""""""""""" 
" read the templates of cpp
nnoremap <leader>class :read ~/CppTemplates/class.cpp<cr>A<space>
nnoremap <leader>for :read ~/CppTemplates/for.cpp<cr>f*xi
nnoremap <leader>icld :read ~/CppTemplates/include.cpp<cr>a
nnoremap <leader>com :II//<Esc>
" autocompletion of brackets
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
"comment and uncomment"
vnoremap <leader>c 0I//<Esc>


function! s:insert_gates()
	let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	execute "normal! i#ifndef " . gatename
	execute "normal! o#define " . gatename
	execute "normal! Go#endif /* " .gatename . " */"
	normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'davidhalter/jedi-vim'
Plugin 'rudrab/vimf90'
" Bundle 'Valloric/YouCompleteMe'
    
" The bundles you install will be listed here

filetype plugin indent on

" The rest of your config follows here

set number


" Python-Mode setups
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


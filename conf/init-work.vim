set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set clipboard+=unnamedplus
set spelllang=en_us
set background=dark

syntax on
filetype plugin indent on
call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'hdima/python-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'ajorgensen/vim-markdown-toc'
Plug 'neovimhaskell/haskell-vim'
Plug 'dense-analysis/ale'
call plug#end()

colorscheme dracula

nmap <silent> ,s :set spell!
vmap [% [%m'gv``
vmap ]% ]%m'gv``
vmap a% [%v]%
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:.
map <F8> :!java "%:r"
map <F11> :cnext
map <F10> :cprevious
map <F9> :make:cwindow
set wildignore=*/build/**,*/target/**
set wildmode=longest,list
set window=116
set splitbelow
set previewheight=20
" The default mapleader is "\"
"let mapleader="\" 
" Groovy 
au BufNewFile,BufRead *.groovy,*.pipeline  setf groovy

"FZF"
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
map T :FZF<CR>
let g:fzf_buffers_jump = 1

" Yaml
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead *-template  setf yaml


" Pyhon
au FileType python set tabstop=4  softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent colorcolumn=80
au BufNewFile,BufRead *.py  set tabstop=4  softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent colorcolumn=80
let g:python_highlight_all=1
let g:pymode_python = 'python3'
 set clipboard=unnamed
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
" Json and js
"au BufNewFile,BufRead *.js, *.html, *.css
"     \ set tabstop=2
"     \ set softtabstop=2
"     \ set shiftwidth=2


let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
" typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" YouCompleteMe
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_use_vim_stdout = 1
let g:ycm_use_clangd = 0
let g:ycm_goto_buffer_command='split'
" Got to deglaration or definition CTLR-O to get back
map <leader>d  :rightbelow vertical YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>i  :rightbelow vertical YcmCompleter GoToImplementation<CR>
"Get the doc
map <leader>q  :YcmCompleter GetDoc<CR>


" Java
au FileType java set tabstop=2  softtabstop=2 shiftwidth=3 textwidth=119 expandtab autoindent colorcolumn=120
au BufNewFile,BufRead *.java  set tabstop=2  softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent colorcolumn=120


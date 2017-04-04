" An example for a vimrc file.
set nocompatible
set backspace=indent,eol,start
set nobackup 
set noswapfile
set expandtab
set shiftwidth=4
set tabstop=4
set textwidth=0
set history=1000    " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set ignorecase  " ignore the case 
set smartcase   " nice
set hlsearch
set showmatch
set wrap
set formatoptions=tcq

color desert
set laststatus=2
set wildmode=longest,list,full

call plug#begin()

"Plug 'derekwyatt/vim-scala'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
"Plug '/home/iatanasov/.vim/bundle/vim-sbt'
Plug 'Shougo/deoplete.nvim'
Plug 'rustushki/JavaImp.vim'
Plug 'artur-shaik/vim-javacomplete2'
"Plug 'mileszs/ack.vim'
Plug 'vim-syntastic/syntastic'
"Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sheerun/vim-polyglot'
call plug#end()

:tnoremap <Esc> <C-\><C-n>
set nottimeout

map Q gq
filetype plugin on
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")
set directory=/tmp
set isfname=@,48-57,/,.,_,+,,,#,$,%,~,=,:
" highlight Search ctermbg=6
" maped keys 
map <F1> :terminal<CR>
map <F2> :ls<CR>:e #
map <F12> :set number!<CR>

" JAVA
let java_comment_strings=1
let java_highlight_java_lang_ids=1
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150

" syntastic

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_mode_map = { "mode":"active","passive_filetypes":["java"]}

set wildignore+=*/build/**,*/target/**
set wildignore+=*.jar,*.zip,\.git,*.class,*/pacific-fit/*

"ag
if executable('ag')
      let g:ackprg = 'ag --vimgrep'
endif
"let g:ag_prg="ag --vimgrep --smart-case"

let g:mapleader = ","
nmap <leader>ag :Ack! <C-R><C-W>
nmap <leader>agf :AckFile! <C-R><C-W>
nmap <leader>gf :AckFile! 

let g:vim_json_syntax_conceal = 0

let g:bufferline_echo=0

au BufNewFile,BufRead *.groovy  setf groovy 
au BufRead /tmp/mutt-* set tw=240

autocmd BufNewFile,BufRead *.json set ft=javascript

augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END


filetype plugin on
set omnifunc=syntaxcomplete#Complete

"let g:airline#extensions#tabline#enabled = 0
set dictionary=/usr/share/dict/words
nmap <silent> <leader>s :set spell!<CR>
map  <leader>jf <Esc>:%!json_xs<CR>

"Use <leader>t to open ctrlp
set wildignore+=*/build/**
set wildignore+=*/target/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"Set this to 1 to set searching by filename (as opposed to full path) as the default: 
let g:ctrlp_by_filename = 1
"Set this to 1 to set regexp search as the default: Can be toggled on/off by pressing <c-r> inside the prompt.
let g:ctrlp_regexp = 1
let g:ctrlp_map = '<Leader>t'
"let g:ctrlp_match_window_bottom = 0
"let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
"let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

:nmap ; :CtrlPBuffer<CR>

"JavaImp
let g:JavaImpPaths="/home/iatanasov/.m2/repository/,./,/opt/java/latest/lib/,/opt/java/latest/src"
let g:JavaImpDocPaths="/opt/javadocs"

" javacomplete
"
let g:JavaComplete_JavaviDebug = 1
let g:JavaCompleteviLogfileDirectory = './'
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
au BufReadCmd *.class setl readonly nomodified | %!jad -p <afile>

"FZF 
let $FZF_DEFAULT_OPTS .= ' --inline-info --no-color'

"silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

"fix the terminal mouse
set mouse-=a
let g:terminal_scrollback_buffer_size=99999

"deoplate
let g:deoplete#enable_at_startup = 1
autocmd FileType java setlocal omnifunc=javacomplete#Complete


" from https://statico.github.io/vim.html
"
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

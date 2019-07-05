" plugin may not be present
" filetype plugin indent o

" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
set number
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null % 



set termguicolors
syntax enable
" let g:airline_theme='powerlineish'
set tabstop=4
set softtabstop=4
set expandtab       " tabs are spaces
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
filetype indent on  " load filetype-specific indent files
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"""""""""""""""""""""""""""
""   Grafikart config
"""""""""""""""""""""""""""

filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set hidden
set hlsearch
set laststatus=2
set noshowmode
set mouse=a
set noundofile
set number
set wildmenu
set autochdir
set noswapfile
let mapleader = ","   


call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'chr4/nginx.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Theme
colorscheme base16-tomorrow
" colorscheme base16-github
" colorscheme material-theme
" colorscheme base16-darktooth
" set background=dark
" colorscheme base16-nord
" let g:lightline = {'colorscheme': 'nord'}

" Buffer
nnoremap gb :ls<CR>:b<Space>

" Finder
set path=.,**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

" CtrlP
let g:ctrlp_show_hidden = 1

" Wildmenu
set wildmode=list:full
set wildignorecase
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*,*/node_modules/**/*
set wildignore+=tags
set wildignore+=*.tar.*

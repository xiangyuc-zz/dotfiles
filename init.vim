call plug#begin('~/.config/nvim/plugged')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'hdima/python-syntax'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Airline buffer
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
set encoding=utf8

filetype on
colorscheme Tomorrow-Night-Eighties
syntax enable

" buffer
set hidden

" python-syntax
let python_highlight_all = 1


"set nocompatible
set nu
set showmatch 

" Add a bit extra margin to the left
set foldcolumn=1

" Search
set ignorecase
set smartcase

" netrw
let g:netrw_liststyle=3
map <C-n> :E<CR> 

" NERDTree
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

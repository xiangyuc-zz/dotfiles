set nocompatible

call plug#begin('~/.config/nvim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'hdima/python-syntax'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'zchee/deoplete-jedi'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'tacahiroy/ctrlp-funky'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jelera/vim-javascript-syntax'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'kchmck/vim-coffee-script'

function! DoRemote(arg)
 UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" ignore filetypes
set wildignore+=*.so,*.swp,*.zip,*.pyc,*.map,*.ttf,*.woff,*.woff2

" set python
let g:python_host_prog = '/Library/Frameworks/Python.framework/Versions/2.7/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

set background=dark
colorscheme hybrid
" let g:gruvbox_contrast_dark = 'soft'
let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
set encoding=utf8

" Airline buffer
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='gruvbox'
"let g:airline#extensions#tmuxline#enabled = 1

" Tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'nightly_fox'

" nvim and tmux
if has('nvim')
   set ttimeout
   set ttimeoutlen=0
endif

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
"autocmd VimEnter * nested TagbarOpen

" ctrlp-funky
nnoremap <Leader>/ :CtrlPFunky<Cr>
nnoremap <Leader>/U :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

" gitgutter
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterUndoHunk
nmap <Leader>gv <Plug>GitGutterPreviewHunk

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Syntastic
let g:syntastic_javascript_checkers = ['standard']
"autocmd bufwritepost *.js silent !standard-format -w %
"set autoread

" autoformat
au FileType python setlocal formatprg=autopep8\ -
au FileType javascript setlocal formatprg=standard-format\ -

filetype on
filetype plugin on
filetype indent on
"syntax on
syntax enable

if has('mouse')
    set mouse=a
    set selectmode=mouse,key
    set nomousehide
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

" buffer
set hidden

" python-syntax
let python_highlight_all = 1

set number
set relativenumber
set showmatch 
set cursorline
set autochdir

" Set fold
set foldcolumn=1
set foldmethod=syntax
set foldlevel=99

" Search
set ignorecase
set smartcase
nnoremap <esc> :nohl<cr>

" netrw
let g:netrw_liststyle=3
"map <C-n> :E<CR> 

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\~$']

" commentary
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType jinja setlocal commentstring=<!--\ %s\ -->

" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

autocmd FileType py :setlocal sw=2 ts=2 sts=2 tw=2 autoindent " Two spaces for python files "
autocmd FileType jinja :setlocal sw=4 ts=4 sts=4 " Two spaces for jinja2 files "
autocmd FileType html :setlocal sw=4 ts=4 sts=4 " Two spaces for HTML files "
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2 " Two spaces for javascript files "

" Linebreak on 500 characters
set lbr
"set textwidth=80
autocmd BufRead,BufNewFile *.py setlocal textwidth=80
autocmd BufRead,BufNewFile *.py setlocal colorcolumn=80
set fo+=mB
highlight ColorColumn ctermbg=238

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
map <leader>bq :bp <BAR> bd #<CR>

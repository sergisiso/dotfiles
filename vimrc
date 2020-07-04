" To install do:
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
" ~/.fzf/install
" $ git clone https://github.com/universal-ctags/ctags.git --depth=1
" $ cd ctags
" $ ./autogen.sh
" $ ./configure
" $ make
" $ sudo make install
" $ mkdir -p $HOME/.vim/undo

set clipboard=exclude:.*
set encoding=utf8
set nocompatible
filetype off

" set the runtime path to include fzf and vim-plug
set rtp+=~/.fzf
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'natebosch/vim-lsc'
Plug 'liuchengxu/vista.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'git://github.com/petRUShka/vim-opencl.git'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/ListToggle'

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showcmd
set number
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=2
set noautoindent
set formatoptions=c,q,r,t
set ruler
set lazyredraw
set rnu
set cursorline
set spell
" set cursorcolumn
" set ttyfast

" Set highlights as underlines
highlight Search ctermbg=black ctermfg=yellow cterm=underline
highlight SpellBad ctermbg=black ctermfg=red cterm=underline

filetype plugin on
syntax on

" Toggle information/plugins
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-t> :Vista!!<CR>
nnoremap <C-p> :Files<Cr>
nnoremap <C-y> :Vista finder<Cr>
let g:lt_location_list_toggle_map = '<C-l>'
let g:lt_quickfix_list_toggle_map = '<C-k>'

" NerdTree configuration
let g:NERDTreeDirArrows=1

" Pane navigation mappings
nnoremap J <C-W>j
nnoremap K <C-W>k
nnoremap L <C-W>l
nnoremap H <C-W>h

" Buffer navigation with Ctrl-\ and Ctrl-/
set hidden
nmap <C-_> :bn<CR>
vmap <C-_> :bn<CR>gv
nmap <C-\> :bp<CR>
vmap <C-\> :bp<CR>gv

if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Remember last changes
if has('persistent_undo')      "check if your vim version supports it
    set undofile                 "turn on the feature
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

" Lightline settings
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" ALE
" let g:ale_linters = {'python': ['pycodestyle']}
let g:ale_linters = {'python': ['pylint']}

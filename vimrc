" To install do:
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" $ sudo apt get install exuberant-ctags
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
"Plugin 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call plug#end()            " required
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
" set cursorcolumn
" set ttyfast

" hi CursorLine cterm=NONE ctermbg=59
" hi CursorColumn cterm=NONE ctermbg=59
filetype plugin on
syntax on

" NerdTree and TagBar settings
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=1
nnoremap <C-t> :Vista!!<CR>

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

" fzf settings
nnoremap <C-p> :Files<Cr>
nnoremap <C-y> :Vista finder<Cr>

" Remember last changes
if has('persistent_undo')      "check if your vim version supports it
    set undofile                 "turn on the feature
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

" Syntastic settings
" let g:syntastic_python_checkers = ['pycodestyle']
let g:syntastic_python_checkers = ['pylint']

" Lightline settings
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" ALE
let g:ale_linters = {'python': ['pycodestyle']}
" let g:ale_linters = {'python': ['plint']}

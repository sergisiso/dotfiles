" To install do:
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" $ sudo apt get install exuberant-ctags
" $ mkdir -p $HOME/.vim/undo


set clipboard=exclude:.*
set encoding=utf8
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'chriskempson/base16-vim'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'git://github.com/petRUShka/vim-opencl.git'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
set ttyfast

au BufNewFile,BufRead *.rg set filetype=regent

"hi CursorLine cterm=NONE ctermbg=59
" hi CursorColumn cterm=NONE ctermbg=59
filetype plugin on
syntax on

" NerdTree and TagBar settings
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=1
noremap <C-t> :TagbarToggle<CR>

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

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" Remember last changes
if has('persistent_undo')      "check if your vim version supports it
    set undofile                 "turn on the feature
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

" Syntastic settings
let g:syntastic_python_checkers = ['pycodestyle']
" let g:syntastic_python_checkers = ['pylint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline settings
"set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

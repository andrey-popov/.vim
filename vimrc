if !has('nvim')
  set nocompatible
endif

" Mouse support
set mouse=a
if !has('nvim') && has('mouse_sgr')
  " Mouse handling for a modern xterm.  Allows resizing of split panels.
  set ttymouse=sgr
endif

set number
syntax enable
" Detect file types and load type-specific plugins and indent files
filetype plugin indent on

if !has('nvim')
  " Allow backspacing over everything in insert mode.
  set backspace=indent,eol,start
endif


" Use 24-bit colours in terminal
if has('termguicolors')
  set termguicolors
endif

" Colour theme
let g:vrunchbang_light_LineNr='off'
colorscheme vrunchbang-light


" Indentation with spaces and a 'smart' <BS>
set tabstop=2
set shiftwidth=0    " Set to the value of tabstop
set softtabstop=-1  " Set to the value of shiftwidth
set expandtab
set autoindent

" Display tabs and trailing spaces
set list
set listchars=tab:⇥·,trail:·

" Wrap long lines, but do not break words in the middle
set wrap
set linebreak

" When splitting windows, new windows are added to the right or below
set splitright
set splitbelow

" Ignore case in search unless pattern contains a capital letter or \C flag
set ignorecase
set smartcase

" <C-L> to clear search highlights.  Adjusted from [1].
" [1] https://github.com/tpope/vim-sensible/blob/2d9f34c09f548ed4df213389caa2882bfe56db58/plugin/sensible.vim#L33-L36
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

if !has('nvim')
  set hlsearch
  set ruler
endif


" Default language for spellcheck
set spelllang=en_gb


set hidden

" Map Shift and left or right arrow to navigate tabs
noremap <S-Left> :tabprevious<CR>
inoremap <S-Left> <ESC>:tabprevious<CR>a
noremap <S-Right> :tabnext<CR>
inoremap <S-Right> <ESC>:tabnext<CR>a


" Automatically install vim-plug plugin manager if needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Autocompletion with deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

" Block comments
Plug 'tpope/vim-commentary'

Plug 'lervag/vimtex'

call plug#end()


" Setting for deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" https://jdhao.github.io/2019/03/26/nvim_latex_write_preview
call deoplete#custom#var('omni', 'input_patterns',
  \ { 'tex': g:vimtex#re#deoplete })


set number
syntax on

" Indentation with spaces and a 'smart' <BS>
set tabstop=4
set shiftwidth=0    " Set to the value of tabstop
set softtabstop=-1  " Set to the value of shiftwidth
set expandtab
set autoindent

" Show the current position in the file
set ruler

" Wrap long lines, but do not break words in the middle
set wrap
set linebreak

" Highlight for search
set hlsearch

" Enable file type detection and loading of plugins and indent files for
" specific file types
filetype on
filetype plugin on
filetype indent on


"Adjust the leader
let mapleader = ","
let maplocalleader = ","

" Set up vundle
filetype plugin indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Need to set the git proto to http because cntlm is buggy 
" on Linux Mint 11
let vundle_default_git_proto = "http"

" let Vundle manage Vundle required! 
Bundle 'gmarik/vundle'

" Github plugins
Bundle 'ervandew/supertab'
Bundle 'jamessan/vim-gnupg'
Bundle 'msanders/snipmate.vim'
Bundle 'othree/xml.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/AutoClose'

" General configurations
filetype plugin on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
"Show the filename in the window
set laststatus=2
syntax on
nnoremap <F2> :set number!<cr>
map <F3> <Leader>c 
hi LineNr ctermfg=darkgrey

" Python specific settings
autocmd Filetype python setlocal tabstop=4
autocmd Filetype python setlocal softtabstop=4
autocmd Filetype python setlocal shiftwidth=4

" Puppet specific settings
autocmd Filetype puppet setlocal tabstop=2
autocmd Filetype puppet setlocal softtabstop=2
autocmd Filetype puppet setlocal shiftwidth=2

" Ruby specific settings
autocmd Filetype ruby setlocal tabstop=2
autocmd Filetype ruby setlocal softtabstop=2
autocmd Filetype ruby setlocal shiftwidth=2

" XML specific settings
autocmd Filetype xml setlocal tabstop=2
autocmd Filetype xml setlocal softtabstop=2
autocmd Filetype xml setlocal shiftwidth=2


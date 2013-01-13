"Adjust the leader
let mapleader = ","
let maplocalleader = ","

" Set up vundle
filetype plugin indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle required! 
Bundle 'gmarik/vundle'

" Github plugins
Bundle 'ervandew/supertab.git'
Bundle 'jamessan/vim-gnupg.git'
Bundle 'msanders/snipmate.vim'
Bundle 'othree/xml.vim.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

" General configurations
filetype plugin on
set expandtab
set tabstop=4
set autoindent
"Show the filename in the window
set laststatus=2
syntax on
nnoremap <F2> :set number!<cr>
map <F3> <Leader>c 
hi LineNr ctermfg=darkgrey

" Puppet specific settings
autocmd Filetype puppet setlocal tabstop=2

" Ruby specific settings
autocmd Filetype ruby setlocal tabstop=2

" XML specific settings
autocmd Filetype xml setlocal tabstop=2

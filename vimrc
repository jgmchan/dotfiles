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
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/AutoClose'
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

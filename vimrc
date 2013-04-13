"Adjust the leader
let mapleader = ","
let maplocalleader = ","

set nocompatible

"Set up vundle
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Let Vundle manage Vundle required! 
Bundle 'gmarik/vundle'

"Github plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'benmills/vimux'
Bundle 'ervandew/supertab'
Bundle 'jamessan/vim-gnupg'
Bundle 'msanders/snipmate.vim'
Bundle 'mileszs/ack.vim'
Bundle 'othree/xml.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tyok/nerdtree-ack'
Bundle 'vim-ruby/vim-ruby'

"Need to switch this back on afterwards
filetype plugin indent on

"""""""""""""""""""""""""
" General configurations
"""""""""""""""""""""""""
"Set some standard indent related stuff
set expandtab autoindent
set tabstop=4 softtabstop=4 shiftwidth=4 
"Show line numbers by default
set number
"Highlight the line which the cursor is on
set cursorline
"Show cursor position
set ruler
"We should be able to backspace anyway in insert mode
set backspace=indent,eol,start
"Show the filename in the window
set laststatus=2
"Turn on the syntax highlighting
syntax on
"Allow paste toggling
set pastetoggle=<F4>

"""""""""""""""""""""""
" Some custom mappings
"""""""""""""""""""""""
"Easily turn on and off the line numbers
nnoremap <F2> :set number!<cr>
"Comment and uncomment the line (note the space at the end)
map <F3> <leader>c 
"Remap Esc
imap ;; <Esc>
"Bring up NerdTree easily
map <leader>n :NERDTree<cr>
"Switch list on and off
map <leader>w :set list!<cr>
"Map Vimux commands to easily execute commands
map <leader><space> :VimuxRunLastCommand<cr>
map <leader>f :VimuxPromptCommand<cr>

"""""""""""""""""""""""""""""
" Filetype specific settings
"""""""""""""""""""""""""""""
"Python
autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4

"Ruby
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

"XML
autocmd Filetype xml setlocal tabstop=2 softtabstop=2 shiftwidth=2

"""""""""""""""""""""
" Colours and themes
"""""""""""""""""""""
"Solarize
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

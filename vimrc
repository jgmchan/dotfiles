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
Bundle 'elzr/vim-json'
Bundle 'honza/vim-snippets'
Bundle 'jamessan/vim-gnupg'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'jnwhiteh/vim-golang'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'moll/vim-node'
Bundle 'othree/xml.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tyok/nerdtree-ack'
Bundle 'undx/vim-gocode'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-ruby/vim-ruby'

"Need to switch this back on afterwards
filetype plugin indent on

"""""""""""""""""""""""""
" General configurations
"""""""""""""""""""""""""
"Set some standard indent related stuff
set expandtab autoindent
set tabstop=2 softtabstop=2 shiftwidth=2 
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
" Activate modeline so we can use file specific settings
set modeline

"""""""""""""""""""""""
" Some custom mappings
"""""""""""""""""""""""
"Easily turn on and off the line numbers
nnoremap <F2> :set number!<cr>
"Comment and uncomment the line (note the space at the end)
map <F3> <leader>c 
"Bring up NerdTree easily
map <leader>n :NERDTree<cr>
"Switch list on and off
map <leader>w :set list!<cr>
"Map Vimux commands to easily execute commands
map <leader><space> :VimuxRunLastCommand<cr>
map <leader>f :VimuxPromptCommand<cr>
"Bring up Tagbar
map <leader>t :TagbarToggle<cr>
"Switch from single to double quote and vice versa
map <leader>' cs"'
map <leader>" cs'"

"""""""""""""""""""""""""""""
" Filetype specific settings
"""""""""""""""""""""""""""""
"Golang
autocmd Filetype go setlocal tabstop=8 softtabstop=0 shiftwidth=0 noexpandtab
"Python
autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4
"Eyaml
autocmd BufNewFile,BufRead *.eyaml set filetype=yaml

"""""""""""""""""""""""""""""
" Plugin specific settings
"""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.pyc$']

"""""""""""""""""""""
" Colours and themes
"""""""""""""""""""""
"Solarize
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

"""""""""""""""""""""""""
" UltiSnipsConfiguration
"""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"


""""""""""""""""""""""""""""""
" YouCompleteMe Configuration
""""""""""""""""""""""""""""""
set completeopt=menu,menuone

""""""""""""""""""""""""""""""
" Golang Configuration
""""""""""""""""""""""""""""""
" Set tagbar to generate Golang CTags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"""""""""""""""""""""""
" Tagbar configuration
"""""""""""""""""""""""
let g:tagbar_type_asciidoc = {
    \ 'ctagstype' : 'asciidoc',
    \ 'kinds' : [
        \ 's:Table of Contents'
    \ ]
\ }

"Adjust the leader
let mapleader = ","
let maplocalleader = ","

set nocompatible

" Set up vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Github plugins
"
" General Workflow
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'

" Language specific (syntax highlighting etc.)
Plug 'slashmili/alchemist.vim'
Plug 'plasticboy/vim-markdown'
Plug 'robbles/logstash.vim'
Plug 'neomake/neomake'
Plug 'rust-lang/rust.vim'
Plug 'saltstack/salt-vim'
Plug 'smerrill/vcl-vim-plugin'
Plug 'dag/vim2hs'
Plug 'bitc/vim-hdevtools'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'rodjek/vim-puppet'
Plug 'vim-ruby/vim-ruby'
Plug 'derekwyatt/vim-scala'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'othree/xml.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Aesthetics
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'romainl/Apprentice'
Plug 'vim-airline/vim-airline'
" Plug 'ryanoasis/vim-devicons'

" Search and find
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tyok/nerdtree-ack'

" General tools
Plug 'jamessan/vim-gnupg'

call plug#end()

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
" Bring up NerdTree on startup
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" Remove whitespace on write
autocmd BufWritePre * :%s/\s\+$//e
" Switch NerdTree
"autocmd BufEnter * silent! if bufname('%') !~# 'NERD_tree_' | cd %:p:h | NERDTreeCWD | wincmd p | endif
" Split properly
set splitbelow
set splitright

"""""""""""""""""""""""
" Some custom mappings
"""""""""""""""""""""""
"Easily turn on and off the line numbers
nnoremap <F2> :set number!<cr>
"Comment and uncomment the line (note the space at the end)
map <leader>a <leader>c
"Bring up NerdTree easily
map <leader>n :NERDTree<cr>
"Switch list on and off
map <leader>w :set list!<cr>
"Bring up Tagbar
map <leader>t :TagbarToggle<cr>
"Switch from single to double quote and vice versa
map <leader>' cs"'
map <leader>" cs'"
"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

"""""""""""""""""""""""""""""
" Filetype specific settings
"""""""""""""""""""""""""""""
"Golang
autocmd Filetype go setlocal tabstop=8 softtabstop=0 shiftwidth=0 noexpandtab
"Python
autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4
"Groovy
autocmd Filetype groovy setlocal tabstop=4 softtabstop=4 shiftwidth=4
"Eyaml
autocmd BufNewFile,BufRead *.eyaml set filetype=yaml
"Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"CloudFormation
autocmd BufNewFile,BufReadPost *.template set filetype=json
"Jenkinsfile
autocmd BufNewFile,BufReadPost Jenkinsfile* set filetype=groovy

"""""""""""""""""""""""""""""
" Plugin specific settings
"""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.pyc$']

"""""""""""""""""""""
" Colours and themes
"""""""""""""""""""""
"Solarize
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termtrans = 1
set background=dark
"let base16colorspace=56
"colorscheme base16-paraiso
colorscheme base16-default

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
" Enable more syntax highlighting
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints= 1

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

"""""""""""""""""""""""""""
" Git-gutter configuration
"""""""""""""""""""""""""""
let g:gitgutter_updatetime = 750

let g:syntastic_json_checkers=['jsonlint']

""""""""""""""
" Indentation
""""""""""""""
"map <leader>s :IndentLinesToggle<cr>
"
"let g:indentLine_color_term = 6
"let g:indentLine_color_gui = '#1c1c1c'
"let g:indentLine_color_tty_light = 7
"let g:indentLine_color_dark = 1

"let g:indentLine_enabled = 0
"map <leader>s :IndentLinesToggle<cr>
let g:vim_markdown_folding_disabled = 1

""""""""""""""""
" Fuzzy Finder
""""""""""""""""
map <C-p> :FZF<space>
map <C-o> :Ag<space>


"""""""""""""""""""""""""""
" Neovim configuration
"""""""""""""""""""""""""""
if has('nvim')
  let g:python_host_prog='/usr/local/bin/python'
  " Terminal Escape
  :tnoremap <C-n> <C-\><C-n>

  " Zoom mode
  map <C-n>z :tab split<cr>

  " Set up terminal
  :tnoremap <C-n>v <C-\><C-n>:vsp \| :terminal<cr>
  :tnoremap <C-n>s <C-\><C-n>:sp \| :terminal<cr>
  :nnoremap <C-n>v :vsp \| :terminal<cr>
  :nnoremap <C-n>s :sp \| :terminal<cr>
   autocmd BufWinEnter,WinEnter term://* startinsert

  " Easier to navigate
  :tnoremap <C-n>h <C-\><C-n><C-w>h
  :tnoremap <C-n>j <C-\><C-n><C-w>j
  :tnoremap <C-n>k <C-\><C-n><C-w>k
  :tnoremap <C-n>l <C-\><C-n><C-w>l
  :nnoremap <C-n>h <C-w>h
  :nnoremap <C-n>j <C-w>j
  :nnoremap <C-n>k <C-w>k
  :nnoremap <C-n>l <C-w>l

  " Easy copy and paste
  vnoremap  <leader>y  "+y
  nnoremap  <leader>Y  "+yg_
  nnoremap  <leader>y  "+y
  nnoremap  <leader>yy  "+yy

  " Paste from clipboard
  nnoremap <leader>p "+p
  nnoremap <leader>P "+P
  vnoremap <leader>p "+p
  vnoremap <leader>P "+P
  tnoremap <leader><leader>p <C-\><C-n>"+p:startinsert<cr>
  tnoremap <leader><leader>p <C-\><C-n>"+p:startinsert<cr>
endif

"""""""""""""""""""""""""""
" Elixir configuration
"""""""""""""""""""""""""""
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }

"""""""""""""""""""""""""""
" Haskell configuration
"""""""""""""""""""""""""""
augroup NeomakeHaskell
  autocmd!
  autocmd! BufWritePost *.hs Neomake
augroup END

"""""""""""""""""""""""""""
" Rust configuration
"""""""""""""""""""""""""""
let g:rustfmt_autosave = 1

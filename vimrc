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
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
" Plug 'Valloric/YouCompleteMe'

" Language specific (syntax highlighting etc.)
Plug 'slashmili/alchemist.vim'
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'plasticboy/vim-markdown'
Plug 'robbles/logstash.vim'
Plug 'neomake/neomake'
Plug 'rust-lang/rust.vim'
Plug 'saltstack/salt-vim'
Plug 'smerrill/vcl-vim-plugin'
Plug 'dag/vim2hs'
Plug 'bitc/vim-hdevtools'
Plug 'elzr/vim-json'
Plug 'mhinz/vim-mix-format'
Plug 'moll/vim-node'
Plug 'rodjek/vim-puppet'
Plug 'vim-ruby/vim-ruby'
Plug 'derekwyatt/vim-scala'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'othree/xml.vim'
"Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

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
Plug 'rizzatti/dash.vim'

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
" Split properly
set splitbelow
set splitright
" Airline already tells me what mode is on
set noshowmode

" Allow hidden buffers
set hidden
" Allow mouseclicks in Vim
set mouse=a
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

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
"Dockerfile
autocmd BufNewFile,BufReadPost Dockerfile* set filetype=dockerfile

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
colorscheme base16-default-dark

"""""""""""""""""""""""""
" UltiSnipsConfiguration
"""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
let g:UltiSnipsListSnippets = "<c-l>"


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

"let g:syntastic_json_checkers=['jsonlint']

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
let $FZF_DEFAULT_COMMAND = 'ag -l --skip-vcs-ignores -g ""'
map <C-p> :FZF<cr>
map <C-o> :Ag<space>
map <C-i> :Buffers<cr>



"""""""""""""""""""""""""""
" Neovim configuration
"""""""""""""""""""""""""""
if has('nvim')
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
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
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }
let g:mix_format_on_save = 1
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
let g:ycm_rust_src_path = $HOME."/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
let g:syntastic_rust_checkers = ['rustc']

"""""""""""""""""""""""""""
" Deoplete configuration
"""""""""""""""""""""""""""
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 10
let g:deoplete#auto_refresh_delay = 10
let g:deoplete#enable_refresh_always = 1

"""""""""""""""""""""""""""
" Neomake configuration
"""""""""""""""""""""""""""
autocmd! BufWritePost * Neomake
" Don't open the problem area until I want to with :lopen
let g:neomake_open_list = 0
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

"""""""""""""""""""""""""""
" Supertab configuration
"""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-n>"

"""""""""""""""""""""""""""
" Dash configuration
"""""""""""""""""""""""""""
:nmap <silent> <leader>d <Plug>DashSearch

"""""""""""""""""""""""""""
" Airline configuration
"""""""""""""""""""""""""""
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""""""
" Vim JSX configuration
"""""""""""""""""""""""""""
let g:jsx_ext_required = 0

"""""""""""""""""""""""""""
" Vim Prettier configuration
"""""""""""""""""""""""""""
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

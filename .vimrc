" Universal Code Runner (F5)

map <F5> :call CompileAndRun() <CR> 

func! CompileAndRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %< && ./%<"
    elseif &filetype == 'cpp' 
        exec "silent !foot -H sh -c 'g++ % -o %< && ./%<'"
    elseif &filetype == 'python' 
        exec "!python3 % -o %< && ./%<"
    elseif &filetype == 'rust'
        exec "!rustc % -o %< && ./%<"
    elseif &filetype == 'java'
        exec "!javac % && java %<"
    elseif &filetype == 'javascript'|| &filetype == 'javascriptreact' 
        exec "!node %"
    elseif &filetype == 'typescript'|| &filetype == 'typescriptreact'
        exec "!ts-node %"
    elseif &filetype == 'html'
        exec "!xdg-open %"
    elseif &filetype == 'sh'
        exec "!bash %"
    elseif &filetype == 'go'
        exec "!go run %"
    endif
endfunc 

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set updatetime=100
set signcolumn=yes

"--- THEME STUFF ---
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
silent! colorscheme tokyonight
silent! colorscheme tokyonight-vim
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'tokyonight'

"--- CODING ESSENTIALS ---

syntax on
set number
"--set relativenumber
set mouse=a
set tabstop=4 
set shiftwidth=4
set expandtab
set smartindent
set cursorline
set ignorecase
set smartcase
set noswapfile
set clipboard=unnamedplus
set noerrorbells
set novisualbell
set t_vb=
set shortmess=atI
set inccommand=
set backspace=indent,eol,start
set completeopt=menu,preview
set guicursor=

inoremap jk <Esc>

let mapleader = " "

nnoremap <leader>w :w<CR>

nnoremap <leader>q :q<CR>

vnoremap <C-y> y:call system("wl-copy", @")<CR>




 

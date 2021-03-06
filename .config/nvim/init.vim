let mapleader = ","
syntax on

set noerrorbells
set nu relativenumber
set smartcase
set smartindent
set shiftwidth=4
set tabstop=4 softtabstop=4
set expandtab
set incsearch
set linebreak
set nocompatible
set viminfo=""
set clipboard=unnamedplus   "Allows paste to other vim/terms 
set scrolloff=20            "Adds 20 viewlines below/above cursor
filetype plugin on

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vimwiki/vimwiki'
Plug 'ayu-theme/ayu-vim'
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'
call plug#end()

let g:netrw_banner          = 0
let g:netrw_winsize         = 20
let g:netrw_browse_split    = 4

let g:vimwiki_list 	= [{'path'  : '~/vimwiki/',
                       \'syntax': 'markdown'  , 
                       \'ext'   : '.md'}]
au Filetype vimwiki set syntax=markdown

let g:user_emmet_mode       = 'n' "Only available on normal mode
let g:user_emmet_leader_key = ','

let g:airline_powerline_fonts=1

set termguicolors
let ayucolor="dark"
colorscheme ayu 

"BINDINGS
"Open file on browser
nmap <leader>p :w! \| !xdg-open %<CR><CR>
"Reload .Xresources
nmap <leader>r :w! \| !xrdb .Xresources %<CR><CR>
"Add Datetime
nmap <leader>d i<C-R>=strftime("%m-%d-%Y")<CR><Esc>
"Save 
nmap <leader>s :w<CR>
"Quit 
nmap <leader>q :q<CR>
"Save & Quit 
nmap <leader>Q :wq<CR>

"Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

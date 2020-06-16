

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
filetype plugin on

call plug#begin('~/.local/share/nvim/site/plugged')
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

set termguicolors
let ayucolor="dark"
colorscheme ayu 

"BINDINGS
"For Opening html files on browser
nmap <leader>p :w! \| !xdg-open %<CR><CR>

"Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

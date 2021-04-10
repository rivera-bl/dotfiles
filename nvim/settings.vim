
syntax enable
set shell=zsh
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
set termguicolors
set splitright              "Opens vertical split on the right
set splitbelow              "Opens horizontal split below
filetype plugin on

" let g:coc_global_extensions = [
"     \ 'coc-tsserver',
"     \ 'coc-eslint',
"     \ ]

let g:go_auto_sameids = 0
let g:go_auto_info = 0

" NerdTree
let NERDTreeMapOpenInTab='l'
let NERDTreeMapOpenVSplit='L'
let NERDTreeMapActivateNode='<Space>'
" Just to unmap this commands that are mapped to <C-j> and <C-k>
let NERDTreeMapJumpNextSibling='<C-8>'
let NERDTreeMapJumpPrevSibling='<C-9>'
let g:NERDTreeWinSize=20
let g:NERDTreeQuitOnOpen = 1

"Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"Calcurse notes with markdown
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

syntax enable
set shell=zsh
set colorcolumn=80
set noerrorbells
set nu relativenumber
set smartcase
set smartindent
set shiftwidth=4
set list
set listchars=tab:\|\  
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
set gdefault                "By default match every ocurrence in a line
set foldmethod=manual       "Fold manually zf, open/close za, jump zj/k
" set foldnestmax=2
" set foldlevelstart=1
" set foldclose=all
" set foldopen=all
filetype plugin on

" let g:coc_global_extensions = [
"     \ 'coc-tsserver',
"     \ 'coc-eslint',
"     \ ]

let g:go_auto_sameids = 0
let g:go_auto_info = 0

"Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"Calcurse notes with markdown
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
" automatically wraps text at column 92 for markdown files
au FileType markdown
    \ setlocal textwidth=0 wrapmargin=0 wrap columns=92 colorcolumn=95

" Save manual folds on file close
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

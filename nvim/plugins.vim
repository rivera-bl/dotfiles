
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'vim-airline/vim-airline'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
call plug#end()

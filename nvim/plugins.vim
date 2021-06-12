
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
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'hashivim/vim-terraform' " terraform commands
Plug 'jvirtanen/vim-hcl' " hcl syntax highlighting
Plug 'pearofducks/ansible-vim' " ansible syntax highlighting
Plug 'KabbAmine/zeavim.vim' " use Zeal within Vim
Plug 'jkramer/vim-checkbox' " create and toggle simple checkboxs

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

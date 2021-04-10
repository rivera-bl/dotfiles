
let mapleader = ","

"BINDINGS
"Open file on browser
" nmap <leader>b :w! \| !xdg-open %<CR><CR>
" Sources init.vim
nnoremap <leader>v :source ~/.config/nvim/init.vim <CR>
"Open Bracey Live Server
nmap <leader>b :Bracey <CR><CR>
" Open NERDTree. t open in new tab, s open in vsplit
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
"Reload .Xresources
nmap <C-x> :w! \| !xrdb .Xresources %<CR><CR>
"Add Datetime
nmap <leader>d i<C-R>=strftime("%m-%d-%Y")<CR><Esc>
"Start FZF
" CTRL-T, CTRL-X or CTRL-V open file in new tab, horizontal splits, or in vertical splits respectively
nmap <leader>f :FZF /home/rvv/dev/ <CR>
"Easy moving between splits
nnoremap <s-j> <C-w>h
nnoremap <s-k> <C-w>l
" " Tab Management (no more tabs)
" nnoremap <S-k> :tabnext<CR>
" nnoremap <S-j> :tabprev<CR>
" Write
nmap <leader>s :w<CR>
"Quit 
nmap <leader>q :q<CR>
"So every time we ESC it clear the search highlighting
nnoremap <esc> :noh<return><esc>

" Mappings for auto closing brackets in insert mode
inoremap " ""<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Inserts a line break
nnoremap <leader>g i<CR><Esc>O
" to not enter insert mode before inserting multiple lines
nnoremap o o<Esc>i
nnoremap O O<Esc>i

" Runs the command depending on its filetype
autocmd FileType python     nnoremap <buffer> <leader>r :w! \| !python %<CR>
autocmd FileType javascript nnoremap <buffer> <leader>r :! node %<CR>
autocmd FileType go         nnoremap <buffer> <leader>r :GoRun %<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


let mapleader = ","

"BINDINGS
"Open file on browser
" nmap <leader>b :w! \| !xdg-open %<CR><CR>
"Open Bracey Live Server
nmap <leader>b :Bracey <CR><CR>
"Run python script
nmap <leader>p :w! \| !python %<CR>
" Run Go Script
nmap <leader>g :GoRun %<CR>
" Run Node Script
nmap <leader>a :! node %<CR>
"Reload .Xresources
nmap <leader>r :w! \| !xrdb .Xresources %<CR><CR>
"Add Datetime
nmap <leader>d i<C-R>=strftime("%m-%d-%Y")<CR><Esc>
"Start FZF
" CTRL-T, CTRL-X or CTRL-V open file in new tab, horizontal splits, or in vertical splits respectively
nmap <leader>f :FZF /home/rvv/dev/ <CR>
"Easy moving between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Tab Management
nnoremap tn :tabnew<space>
" Tab Management
nnoremap tn :tabnew<CR>
nnoremap <S-l> :tabnext<CR>
nnoremap <S-h> :tabprev<CR>
"Save (:tabdo to save the file in every file, this only to triggers the saving of the html file when doing web-dev so it reloads the :Bracey Live Server)
" nmap <leader>s :tabdo w<CR>
nmap <leader>s :w<CR>
"Quit 
nmap <leader>q :q<CR>
"So every time we ESC it clear the search highlighting
nnoremap <esc> :noh<return><esc>

" Mappings for auto closing brackets in insert mode
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

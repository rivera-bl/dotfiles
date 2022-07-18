vim.g.mapleader = ","

vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', {noremap = true}) -- Write
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {noremap = true}) -- Quit window
vim.api.nvim_set_keymap('n', '<leader>Q', ':qa<CR>', {noremap = true}) -- Quit all windows

-----------------------------
-- SPLITS
-----------------------------

-- Navigation
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Relocate
vim.api.nvim_set_keymap('n', '<leader>ww', '<C-W>=', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wf', '<C-W>|', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wv', '<C-W>v', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ws', '<C-W>s', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wh', ':wincmd H<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wl', ':wincmd L<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wj', ':wincmd J<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wk', ':wincmd K<CR>', {noremap = true, silent = true})

-- Jumplist
-- Add j,k motion movements to the jumplist
vim.cmd([[:nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>]])
vim.cmd([[:nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>]])

-----------------------------
-- BUFFERS
-----------------------------

-- using ton/vim-bufsurf to navigate consistently between buffers
vim.api.nvim_set_keymap('n', '<leader>a'    , ':BufSurfBack<CR>'                                  , {noremap = true, silent = true}) -- Go to previous buffer history
vim.api.nvim_set_keymap('n', '<leader>d'    , ':BufSurfForward<CR>'                               , {noremap = true, silent = true}) -- Go to next buffer history
vim.api.nvim_set_keymap('n', '<leader>c'    , ':bn|bw #<CR>'                                      , {noremap = true, silent = true}) -- Delete current buffer
vim.api.nvim_set_keymap('n', '<leader><S-c>', ":let var=expand('%:p') | %bw | exec 'edit' var<CR>", {noremap = true, silent = true}) -- Delete all opened buffers but current

-----------------------------
-- COMMAND MODE
-----------------------------

vim.api.nvim_set_keymap('c', '<C-j>', '<down>'    , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-k>', '<up>'      , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-h>', '<left>'    , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-l>', '<right>'   , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-b>', '<C-left>'  , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-e>', '<C-right>' , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-n>', '<C-f>'     , {noremap = true})

-----------------------------
-- VIMUX
-----------------------------

vim.api.nvim_set_keymap('n', '<leader>tt', ':VimuxPromptCommand<CR><BS>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tg', ':VimuxTogglePane<CR>'       , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tr', ':VimuxRunLastCommand<CR>'   , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tq', ':VimuxCloseRunner<CR>'      , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ti', ':VimuxInterruptRunner<CR>'  , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tf', ':VimuxZoomRunner<CR>'       , {noremap = true})

-----------------------------
-- TELESCOPE
-----------------------------

project_files = function()
  local opts = {
    prompt_title = vim.fn.expand("%:p:h"),
    cwd = vim.fn.expand("%:p:h"),
    hidden = true
  } -- define here if you want to define something
  require"telescope.builtin".find_files(opts)
end
search_dev = function()
  require("telescope.builtin").find_files({
    prompt_title = "<Dev Folder>",
    cwd = "~/dev",
    hidden = true
  })
end
search_config = function()
  require("telescope.builtin").find_files({
    prompt_title = "<Dotfiles>",
    cwd = "~/.config",
    hidden = true
  })
end
search_git = function()
  require("telescope.builtin").git_files({
    prompt_title = "<Git>",
    hidden = true
  })
end
search_vim = function()
  require("telescope.builtin").find_files({
    prompt_title = "<Vim>",
    cwd = "~/editor",
    hidden = true
  })
end
search_nixpkgs = function()
  require("telescope.builtin").find_files({
    prompt_title = "<nixpkgs>",
    cwd = "~/dev/nix/nixpkgs",
    hidden = true
  })
end

search_grep = function()
  require('telescope.builtin').live_grep(require('telescope.themes').get_ivy{
    prompt_title = "Grep",
    hidden = true
  })
end

vim.api.nvim_set_keymap('n', '<leader>fb',  ':Telescope buffers<CR>'  , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ff',  ':lua require("telescope.builtin").find_files({ prompt_title = vim.fn.expand("%:p:h"), cwd = vim.fn.expand("%:p:h"), hidden = true })<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fd',  ':lua search_dev()<CR>'     , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fc',  ':lua search_config()<CR>'  , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg',  ':lua search_git()<CR>'     , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fv',  ':lua search_vim()<CR>'     , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fn',  ':lua search_nixpkgs()<CR>' , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fz',  ':lua search_grep()<CR>'    , {noremap = true})

-----------------------------
-- SPELL CHECKING
-----------------------------

-- ,¿¿ - C-N - <TAB>
-- Set spell
vim.cmd('nnoremap <leader>¿¿ :setlocal spell!<CR>') -- toggle spellcheck
vim.cmd('nnoremap <leader>¿s :setlocal spell <bar> setlocal spelllang=es<CR>')
vim.cmd('nnoremap <leader>¿n :setlocal spell <bar> setlocal spelllang=en<CR>')
-- Bind only when spell is set on
vim.cmd('nnoremap <expr> <TAB> ( &spell ) ? "1z=" : "<TAB>"') -- accept first suggestion
vim.cmd('nnoremap <expr> <CR>  ( &spell ) ? "zg"  : "<CR>"')  -- add to dictionary
vim.cmd('nnoremap <expr> <C-N> ( &spell ) ? "]S"  : "<C-N>"') -- next word
vim.cmd('nnoremap <expr> <C-P> ( &spell ) ? "[S"  : "<C-P>"') -- previous word

-----------------------------
-- MISC
-----------------------------

-- Open Lazygit
vim.api.nvim_set_keymap('n', '<leader>g', ':cd %:p:h | LazyGit<CR>', {noremap = true})

-- Edit file in split in the same directory of current buffer
vim.api.nvim_set_keymap('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/"<CR>', {noremap = true})

-- Save the 'wd path' to clipboard
vim.cmd("command! CWD redir @+ | echo expand('%:p:h') | redir END")

-- Change to directory of current file
vim.cmd("command CDC cd %:p:h")

-- Toggle netrw
vim.api.nvim_set_keymap('n', '<leader>n', ':Lexplore<CR>', {noremap = true, silent = true})

-- Don't enter Insert mode before inserting multiple lines
-- Commenting because it messes up indentation
-- vim.api.nvim_set_keymap('n',   'o', 'o<esc>i', {noremap = true})
-- vim.api.nvim_set_keymap('n',   'O', 'O<esc>i', {noremap = true})

-- Clear the search Highlight with ESC
vim.api.nvim_set_keymap('n',   '<esc>'    , ':noh<return><esc>', {noremap = true, silent = true})

-- Auto source when saving
vim.cmd('autocmd BufWritePost tmux.conf silent !tmux source %')
vim.cmd('autocmd BufWritePost .Xresources silent !xrdb %')
vim.cmd('autocmd BufWritePost .zshrc,.zshenv,.zsyntax,.zprompt,.zalias silent !source ~/.config/zsh/.zshrc')

-- Replace every word of the last search
vim.api.nvim_set_keymap('n', '<leader>r', ':%s//', {})

-- Don't yank the string to the unnamed register when using 'c' or 'C' in normal or visual mode
vim.cmd([[noremap c "_c]])
vim.cmd([[noremap C "_C]])

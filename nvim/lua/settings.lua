-- o  = global
-- wo = local to window
-- bo = local to buffer

-- -- indentline
-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

vim.cmd('syntax on')
vim.cmd('filetype plugin on')
vim.cmd('set nofoldenable')
vim.cmd('set noswapfile')

vim.g.shell         = 'zsh'
vim.o.clipboard     = 'unnamedplus'
vim.o.mouse         = 'a'
vim.o.wildmode      = 'longest:full,full'     -- shell autocompletion
vim.o.hidden        = true
vim.o.termguicolors = true
vim.wo.signcolumn   = "number"

-- the two bellow highlight the current line number
vim.wo.number       = true 		      -- shows linenumbers
vim.wo.rnu          = true 	        -- shows linenumbers and relative

vim.o.scrolloff     = 10
vim.o.showmode      = false
vim.o.ruler         = false
vim.wo.cursorline   = true

vim.o.splitright    = true
vim.o.splitbelow    = true
vim.o.gdefault      = true		      -- by default match every ocurrence in a line

vim.o.autoread      = true          -- reload if file has been changed outside of ivm
vim.bo.smartindent  = true
vim.wo.breakindent  = true          -- continue indenting on next line
vim.wo.linebreak    = true          -- break a line by word not by character
vim.opt.expandtab   = true          -- converts tabs to spaces
vim.opt.tabstop     = 2             -- insert 2 spaces for a tab
vim.opt.shiftwidth  = 2             -- number of space characters for tabs
vim.opt.softtabstop = -1            -- treat tabs as tabs and not spaces when editing

-- Hides tilde chars on endofbuffer
vim.cmd("set fillchars=fold:\\ ,vert:\\│,eob:\\ ,msgsep:‾")

-- Set versplit separator to the same color of the background
vim.cmd("hi VertSplit guifg=#1d2225 guibg=#1d2225")

-- Disables automatic commenting on newline:
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- For some reason treesitter is not recognizing .nix files
vim.cmd('autocmd FileType nix TSBufEnable highlight')

-- Calcurse notes with markdown
vim.cmd('autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown')
vim.cmd('autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown')

-- cursorline only in Insert Mode
vim.cmd('autocmd InsertLeave,InsertEnter * set cul!')
vim.cmd('hi CursorLine guibg=#252e33')

-- Maintain same size of splits when resizing the window
-- Not so useful when resizing a vim window with 2 splits in tmux with 2 vertical panes
-- vim.cmd('autocmd VimResized * wincmd =')

-- Shows cursorline only in focused window
vim.cmd([[
  augroup CursorLine
      au!
      au VimEnter * setlocal cursorline
      au WinEnter * setlocal cursorline
      au BufWinEnter * setlocal cursorline
      au WinLeave * setlocal nocursorline
  augroup END
]])

-- Startify Unmap q key and others
vim.cmd([[autocmd User Startified for key in ['q','s','t','v'] | silent execute 'nunmap <buffer>' key | endfor]])

-- Source tmux config after saving
vim.cmd('autocmd BufWritePost tmux.conf silent !tmux source %')

-- Autoformat nix code with alejandra
-- wget https://github.com/kamadorueda/alejandra/releases/download/1.5.0/alejandra-x86_64-unknown-linux-musl
vim.cmd('autocmd BufWritePost *.nix silent !alejandra %:p')

-- Jenkisfile syntax highlight as groovy files
vim.cmd('au BufNewFile,BufRead Jenkinsfile setf groovy')

-- flake.lock syntax highlight as json files
vim.cmd('au BufNewFile,BufRead flake.lock setf json')

-- Markdown format options
-- t: auto-wrap based on tw, a: format paragraph, w: trailing white space continues paragraph
vim.cmd('au filetype markdown setlocal fo=wnt')
-- vim.cmd('command MarkdownParagraphFormat g/\\S $/norm A ') -- add 2nd whitespace to break line on paragraph

-- Create .pdf out of current .md file
vim.cmd('autocmd BufWritePost ~/dev/jekyll/codeblog/_posts/*.md silent !mkdir -p /tmp/blog-preview && pandoc %:p -o /tmp/blog-preview/tmp.pdf &')

-----------------------
--- BUFSURF
-----------------------
vim.g['BufSurfIgnore'] = 'NetrwTreeListing,NetrwTreeListing[-]'

-----------------------
--- LAZYGIT
-----------------------
vim.g['lazygit_floating_window_scaling_factor'] = 1.0

-----------------------
--- NETRW
-----------------------
vim.g["netrw_preview"]       = 1
vim.g["netrw_liststyle"]     = 3
vim.g["netrw_banner"]        = 0
vim.g["netrw_winsize"]       = 15

-----------------------
--- TERRAFORM
-----------------------
vim.g["terraform_fmt_on_save"]  = 1
vim.g["terraform_align"]        = 1

-----------------------
--- ZEAVIM
-----------------------
vim.g["zv_get_docset_by"] = "['ext', 'file', 'ft']"
vim.g["_file_types"] = [[{
            \   'tf'                : 'terraform',
            \   'pkr.hcl'           : 'packer',
            \   'yml'               : 'kubernetes,ansible',
            \   'yaml'              : 'kubernetes,ansible',
            \   'tex'               : 'latex',
            \   'Vagrantfile'       : 'vagrant'
            \ }]]

-----------------------
--- MARKDOWN
-----------------------
vim.g["m_markdown_folding_disabled"] = 1

-----------------------
--- VIMUX
-----------------------
vim.g["VimuxHeight"]      = "20"
vim.g["VimuxOrientation"] = "v"
vim.g["VimuxUseNearest"]  = 1
vim.g["VimuxCloseOnExit"] = 1

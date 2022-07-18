-- auto install packer.nvim if not exists
local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd('packadd packer.nvim')

-- source this file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source %
  augroup end
]])

-- packer as a floating window
require("packer").init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- completion
  use { 'hrsh7th/nvim-cmp' } -- completion
  use { 'hrsh7th/cmp-buffer' } -- sources
  use { 'hrsh7th/cmp-path' } -- sources
  use { 'hrsh7th/cmp-cmdline' } -- sources
  use { 'hrsh7th/cmp-nvim-lsp' } --  sources
  use { 'saadparwaiz1/cmp_luasnip' } -- sources
  -- snippets
  use { 'L3MON4D3/LuaSnip' } -- snippet engine
  use { 'honza/vim-snippets' } -- snippets
  -- lsp
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  -- highlight
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'plasticboy/vim-markdown' }
  use { 'hashivim/vim-terraform' }

  -- fuzzy search
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { "nvim-telescope/telescope.nvim" }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- looks
  use { 'tjdevries/colorbuddy.nvim',    commit = 'cdb5b06' }
  use { 'norcalli/nvim-colorizer.lua',  commit = '36c610a' }
  use { 'hoob3rt/lualine.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }

  -- functions
  use { 'godlygeek/tabular' }
  use { 'chaoren/vim-wordmotion' }              -- treat caps as word delimitiers, and others
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-eunuch' }                    -- :Delete a file on disk and the buffer too.
  use { 'tpope/vim-obsession' }
  use { 'jiangmiao/auto-pairs' }
  use { 'ton/vim-bufsurf' }

  -- external
  use { 'KabbAmine/zeavim.vim' }
  use { 'kdheepak/lazygit.nvim' }
  use { 'christoomey/vim-tmux-navigator' }
  use { 'preservim/vimux'                }

  -- misc
  use { 'folke/which-key.nvim' }
  use { 'lukas-reineke/indent-blankline.nvim' }
end)

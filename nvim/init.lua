require('settings')
require('mappings')
require('plugins')
require('telescope_lua')
require('lualine_lua')
require('user.cmp')
require('user.lsp')
require('user.colorizer')
require('user.indentline')

local status_ok, colorbuddy = pcall(require, "colorbuddy")
if not status_ok then
	return
end

colorbuddy.colorscheme('user.colorscheme')

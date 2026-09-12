vim.pack.add { { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }

require('luasnip').setup {}

-- load custom lua snippets and set them as high priority
require('luasnip.loaders.from_lua').load { paths = { './snippets' }, default_priority = 9999 }

-- add friendly snippets
vim.pack.add { 'https://github.com/rafamadriz/friendly-snippets' }

-- use vs code style snippets from plugins
require('luasnip.loaders.from_vscode').lazy_load()

-- snippet choice change keymap
local ls = require 'luasnip'
vim.keymap.set({ 'i', 's' }, '<C-E>', function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

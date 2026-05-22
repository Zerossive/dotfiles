vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
	flavour = 'mocha',
	transparent_background = true,
	integrations = {
		which_key = true,
		mason = true,
		notify = true,
		noice = true,
		fidget = true,
		nvim_surround = true,
		snacks = { enabled = true },
	},
	custom_highlights = function(colors)
		return {
			-- HI_GROUP = { fg = "COLOR", bg = "COLOR", style = { "STYLE" } },
			CmpBorder = { fg = colors.surface2 },
			Pmenu = { bg = colors.none },
			['@markup.italic'] = { fg = colors.mauve, style = { 'italic' } },
		}
	end,
}

vim.cmd.colorscheme 'catppuccin-nvim'

-- You can configure highlights by doing something like
-- vim.cmd.hi 'Comment gui=none'
-- local mocha = require('catppuccin.palettes').get_palette 'mocha'
vim.o.pumblend = 0
vim.o.winblend = 0

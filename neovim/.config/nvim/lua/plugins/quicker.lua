vim.pack.add { 'https://github.com/stevearc/quicker.nvim' }

require('quicker').setup {
	keys = {
		{
			'>',
			function()
				require('quicker').expand { before = 2, after = 2, add_to_existing = true }
			end,
			desc = 'expand qflist context',
		},
		{
			'<',
			function()
				require('quicker').collapse()
			end,
			desc = 'collapse qflist context',
		},
	},
}

local quicker = require 'quicker'

vim.keymap.set('n', '<leader>lq', function()
	quicker.toggle {
		focus = true,
	}
end, { desc = 'toggle qflist' })
vim.keymap.set('n', '<leader>ll', function()
	quicker.toggle {
		focus = true,
		loclist = true,
	}
end, { desc = 'toggle loclist' })

vim.pack.add { 'https://github.com/stevearc/quicker.nvim' }

require('quicker').setup {
	keys = {
		{
			'>',
			function()
				require('quicker').expand { before = 2, after = 2, add_to_existing = true }
			end,
			desc = 'Expand quickfix context',
		},
		{
			'<',
			function()
				require('quicker').collapse()
			end,
			desc = 'Collapse quickfix context',
		},
	},
}

local quicker = require 'quicker'

vim.keymap.set('n', '<leader>lq', function()
	quicker.toggle {
		focus = true,
	}
end, { desc = 'toggle quickfix' })
vim.keymap.set('n', '<leader>ll', function()
	quicker.toggle {
		focus = true,
		loclist = true,
	}
end, { desc = 'toggle loclist' })

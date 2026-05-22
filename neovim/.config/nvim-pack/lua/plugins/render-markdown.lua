vim.pack.add {
	'https://github.com/MeanderingProgrammer/render-markdown.nvim',
	-- dependencies
	-- 'https://github.com/nvim-treesitter/nvim-treesitter'
	'https://github.com/echasnovski/mini.nvim',
}

-- TODO: lazy load in markdown files
require('render-markdown').setup {
	render_modes = { 'n', 'i', 'c' },
	-- anti_conceal = { enabled = false },
	preset = 'obsidian',
	pipe_table = {
		preset = 'round',
	},
	heading = { left_pad = 1 },
}

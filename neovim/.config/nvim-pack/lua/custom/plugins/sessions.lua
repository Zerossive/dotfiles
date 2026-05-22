return {
	{
		'rmagatti/auto-session',
		lazy = false,
		opts = {
			log_level = vim.log.levels.ERROR,
			allowed_dirs = { '~/Elysium/Projects/*', '~/Elysium/Projects/*/*', '~/.config/nvim', '~/Elysium/Obsidian Vault/' },
		},
		keys = {
			{ '<leader>os', '<cmd>AutoSession restore<cr>', desc = 'open session of current directory' },
			{ '<leader>or', '<cmd>RecentSession<cr>', desc = 'open recent session' },
		},
	},
}

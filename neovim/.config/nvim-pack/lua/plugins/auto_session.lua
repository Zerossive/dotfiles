vim.pack.add {
	'https://github.com/rmagatti/auto-session',
	-- dependency for search
	'https://github.com/folke/snacks.nvim',
}

require('auto-session').setup {
	allowed_dirs = { '~/Elysium/Projects/*', '~/Elysium/Projects/*/*', '~/.config/nvim*', '~/Elysium/Obsidian Vault/' },
}

vim.keymap.set('n', '<leader>os', '<cmd>AutoSession restore<cr>', { desc = 'open session of current directory' })
vim.keymap.set('n', '<leader>or', '<cmd>RecentSession<cr>', { desc = 'open recent session' })

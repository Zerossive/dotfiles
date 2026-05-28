vim.schedule(function()
	vim.pack.add { 'https://github.com/folke/todo-comments.nvim' }

	-- dependencies
	vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }

	require('todo-comments').setup {
		signs = false,
		keywords = {
			H1 = {
				icon = '󰉫',
				color = '#74c7ec',
				alt = { 'h1', 'TITLE', 'title' },
			},
			H2 = {
				icon = '󰉬',
				color = '#CBA6F7',
				alt = { 'h2', 'SUBTITLE', 'subtitle' },
			},
			H3 = {
				icon = '󰉭',
				color = '#F38BA8',
				alt = { 'h3' },
			},
			H4 = {
				icon = '󰉮',
				color = '#A6E3A1',
				alt = { 'h4' },
			},
		},
	}

	vim.keymap.set('n', '<leader>lt', '<cmd>TodoQuickFix<cr>', { desc = 'todo to quickfix' })
end)

vim.pack.add { 'https://github.com/catgoose/nvim-colorizer.lua' }

require('colorizer').setup {
	lazy_load = true,
	filetypes = {
		'*',
		markdown = { names = false },
	},
	options = {
		parsers = {
			tailwind = {
				enable = true,
				lsp = true,
			},
			css = true,
		},
	},
}

vim.keymap.set('n', '<leader>tc', '<cmd>ColorizerToggle<cr>', { desc = 'toggle colorizer highlight' })

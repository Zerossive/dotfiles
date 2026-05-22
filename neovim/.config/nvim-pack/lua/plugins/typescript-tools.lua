vim.pack.add {
	'https://github.com/pmizio/typescript-tools.nvim',
	-- dependencies
	-- `typescript` e.g. `npm install -g typescript`
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/neovim/nvim-lspconfig',
}

require('typescript-tools').setup {}

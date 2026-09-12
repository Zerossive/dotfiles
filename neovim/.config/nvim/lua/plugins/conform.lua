vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
	notify_on_error = false,
	-- sets up format on save autocmd
	format_on_save = {
		timeout_ms = 500,
		-- lsp_format = 'first', -- not needed if default_format_opts.lsp_format is set
	},
	default_format_opts = {
		lsp_format = 'first',
	},
	-- You can also specify external formatters in here.
	formatters_by_ft = {
		-- web languages
		javascript = { 'prettierd', 'prettier', stop_after_first = true },
		typescript = { 'prettierd', 'prettier', stop_after_first = true },
		javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
		typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
		svelte = { 'prettierd', 'prettier', stop_after_first = true },
		css = { 'prettierd', 'prettier', stop_after_first = true },
		html = { 'prettierd', 'prettier', stop_after_first = true },
		json = { 'prettierd', 'prettier', stop_after_first = true },
		yaml = { 'prettierd', 'prettier', stop_after_first = true },
		graphql = { 'prettierd', 'prettier', stop_after_first = true },
		-- other languages
		lua = { 'stylua' },
		sh = { 'shfmt' },
		rust = { 'rustfmt' },
		-- ['*'] = { 'codespell' }, -- for all filetypes (enabling this disables '_' case below)
		['_'] = { 'trim_whitespace' }, -- for filetypes not listed (enabling this disables lsp fallback)
	},
	formatters = {
		prettierd = {
			prepend_args = {
				'--tab-width=4',
				'--use-tabs',
				'--no-semi',
				'--single-quote',
				'--jsx-single-quote',
				'--trailing-comma=all',
				'--html-whitespace-sensitivity=ignore',
			},
		},
		prettier = {
			prepend_args = {
				'--tab-width=4',
				'--use-tabs',
				'--no-semi',
				'--single-quote',
				'--jsx-single-quote',
				'--trailing-comma=all',
				'--html-whitespace-sensitivity=ignore',
			},
		},
		stylua = {
			prepend_args = { '--indent-type=Tabs', '--indent-width=4' },
		},
	},
}

vim.keymap.set('n', '<leader>bf', function()
	require('conform').format { async = true }
end, { desc = 'format buffer' })

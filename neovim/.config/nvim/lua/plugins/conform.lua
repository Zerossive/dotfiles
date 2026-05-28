vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
	notify_on_error = false,
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = 'fallback',
	},
	default_format_opts = {
		lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
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
		markdown = {},
		graphql = { 'prettierd', 'prettier', stop_after_first = true },
		-- other languages
		lua = { 'stylua' },
		sh = { 'shfmt' },
		-- rust = { 'rustfmt' },
		rust = { 'custom_rustfmt' }, -- use pre-installed rustfmt with rustup
		-- ['*'] = { 'codespell' }, -- for all filetypes
		['_'] = { 'trim_whitespace' }, -- for filetypes not listed
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
		custom_rustfmt = {
			command = 'rustfmt',
		},
	},
}

vim.keymap.set('n', '<leader>bf', function()
	require('conform').format { async = true }
end, { desc = 'format buffer' })

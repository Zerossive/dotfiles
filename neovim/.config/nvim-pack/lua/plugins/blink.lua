vim.pack.add { { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' } }

require('blink.cmp').setup {
	keymap = {
		preset = 'default',
	},
	appearance = {
		nerd_font_variant = 'mono',
	},
	completion = {
		-- Optionally, set `auto_show = true` to show the documentation after a delay.
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
	},
	sources = {
		default = { 'lsp', 'path', 'snippets' },
	},
	snippets = { preset = 'luasnip' },

	-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
	-- which automatically downloads a prebuilt binary when enabled.
	fuzzy = { implementation = 'prefer_rust_with_warning' },

	-- Shows a signature help window while you type arguments for a function
	signature = { enabled = true },
}

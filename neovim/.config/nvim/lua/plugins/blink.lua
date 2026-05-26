-- TODO: maybe lazy load on insertenter?
-- TODO: try nvim-cmp from kickstart to see if bugs are fixed ($runes not showing up at first)
vim.pack.add {
	{ src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
	-- optional dependencies
	'https://github.com/Kaiser-Yang/blink-cmp-git',
}

require('blink.cmp').setup {
	keymap = { preset = 'default' },
	appearance = { nerd_font_variant = 'mono' },
	completion = {
		documentation = { auto_show = true },
		list = {
			selection = {
				auto_insert = false,
			},
		},
	},
	sources = {
		default = { 'git', 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
		providers = {
			lazydev = {
				name = 'LazyDev',
				module = 'lazydev.integrations.blink',
				score_offset = 100, -- make lazydev completions top priority (see `:h blink.cmp`)
			},
			git = {
				module = 'blink-cmp-git',
				name = 'Git',
				-- only enable this source when filetype is gitcommit, markdown, or 'octo'
				enabled = function()
					return vim.tbl_contains({ 'octo', 'gitcommit', 'markdown' }, vim.bo.filetype)
				end,
			},
		},
	},
	snippets = { preset = 'luasnip' },
	fuzzy = { implementation = 'prefer_rust_with_warning' },
	signature = { enabled = true }, -- Shows a signature help window while you type arguments for a function
}

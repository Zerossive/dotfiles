-- TODO: lazy load
vim.pack.add { 'https://github.com/nguyenvukhang/nvim-toggler' }

require('nvim-toggler').setup {
	inverses = {
		['dark'] = 'light',
		['!=='] = '===',
		['[ ]'] = '[x]',
		['accept'] = 'deny',
	},
	remove_default_keybinds = true,
	autoselect_longest_match = true,
}

vim.keymap.set('n', '<leader>tt', function()
	require('nvim-toggler').toggle()
end, { desc = 'toggle/invert selection' })

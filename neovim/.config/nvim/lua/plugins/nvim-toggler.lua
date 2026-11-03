vim.schedule(function()
	vim.pack.add { 'https://github.com/nguyenvukhang/nvim-toggler' }

	require('nvim-toggler').setup {
		inverses = {
			['TRUE'] = 'FALSE',
			['dark'] = 'light',
			['Dark'] = 'Light',
			['DARK'] = 'LIGHT',
			['!=='] = '===',
			['!='] = '==',
			['[ ]'] = '[x]',
			['accept'] = 'deny',
			['Accept'] = 'Deny',
			['ACCEPT'] = 'DENY',
			['Off'] = 'On',
			['OFF'] = 'ON',
			['+'] = '-',
			['Up'] = 'Down',
			['UP'] = 'DOWN',
			['Left'] = 'Right',
			['LEFT'] = 'RIGHT',
			['all'] = 'none',
			['All'] = 'None',
			['ALL'] = 'NONE',
			['Enable'] = 'Disable',
			['ENABLE'] = 'DISABLE',
		},
		remove_default_keybinds = true,
		autoselect_longest_match = true,
	}

	vim.keymap.set('n', '<leader>tt', function()
		require('nvim-toggler').toggle()
	end, { desc = 'toggle/invert selection' })
end)

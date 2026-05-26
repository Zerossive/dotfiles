vim.pack.add { 'https://github.com/mikavilpas/yazi.nvim' }

-- TODO: lazy load
require('yazi').setup {
	-- if you want to open yazi instead of netrw, see below for more info
	open_for_directories = false,

	-- enable these if you are using the latest version of yazi
	use_ya_for_events_reading = true,
	use_yazi_client_id_flag = true,

	keymaps = {
		show_help = 'g?',
	},
}

vim.keymap.set('n', '<leader>-', '<cmd>Yazi<cr>', { desc = 'open yazi at current file' })
vim.keymap.set('n', '<leader>_', '<cmd>Yazi toggle<cr>', { desc = 'resume yazi session' })

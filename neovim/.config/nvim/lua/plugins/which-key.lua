-- TODO: lazy load
vim.pack.add { 'https://github.com/folke/which-key.nvim' }

require('which-key').setup { -- delay = 0,
	icons = {
		-- set icon mappings to true if you have a Nerd Font
		mappings = vim.g.have_nerd_font,
		-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
		-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
		keys = vim.g.have_nerd_font and {} or {
			Up = '<Up> ',
			Down = '<Down> ',
			Left = '<Left> ',
			Right = '<Right> ',
			C = '<C-…> ',
			M = '<M-…> ',
			D = '<D-…> ',
			S = '<S-…> ',
			CR = '<CR> ',
			Esc = '<Esc> ',
			ScrollWheelDown = '<ScrollWheelDown> ',
			ScrollWheelUp = '<ScrollWheelUp> ',
			NL = '<NL> ',
			BS = '<BS> ',
			Space = '<Space> ',
			Tab = '<Tab> ',
			F1 = '<F1>',
			F2 = '<F2>',
			F3 = '<F3>',
			F4 = '<F4>',
			F5 = '<F5>',
			F6 = '<F6>',
			F7 = '<F7>',
			F8 = '<F8>',
			F9 = '<F9>',
			F10 = '<F10>',
			F11 = '<F11>',
			F12 = '<F12>',
		},
	},

	-- Document existing key chains
	spec = {
		-- normal mode
		{ '<leader><leader>', group = 'filetype specific commands', icon = { icon = '󰵆' } },
		{ '<leader>b', group = 'buffer', icon = { icon = '' } },
		{ '<leader>n', group = 'notifications', icon = { icon = '󰍡' } },
		{ '<leader>o', group = 'open', icon = { icon = '' } },
		{ '<leader>s', group = 'search', icon = { icon = '' } },
		{ '<leader>t', group = 'toggle', icon = { icon = '' } },
		{ '<leader>f', group = 'find', icon = { icon = '󰈞' } },
		{ '<leader>p', group = 'plugin', icon = { icon = '󱐥' } },
		{ '<leader>l', group = 'lists', icon = { icon = '' } },
		-- visual mode
		{ '<leader>g', group = 'git', mode = { 'v', 'n' }, icon = { icon = '󰊢' } },
		{ '<leader>gh', group = 'hunk', mode = { 'v', 'n' }, icon = { icon = '' } },
		{ '<leader>gb', group = 'buffer', mode = { 'v', 'n' }, icon = { icon = '' } },
		{ '<leader>a', group = 'ai', mode = { 'v', 'n' }, icon = { icon = '󰧑' } },
		-- change icons for other commands
		{ '<leader>w', icon = { icon = '󰆓', color = 'green' } },
		{ '<leader>W', icon = { icon = '', color = 'green' } },
		{ '<leader>q', icon = { icon = '󰅗', color = 'red' } },
		{ '<leader>Q', icon = { icon = '', color = 'red' } },
		{ '<leader>x', group = 'toggle checkbox', icon = { icon = '󰄲' } },
	},
}

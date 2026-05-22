vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup {
	notifier = { enabled = true },
	image = { enable = true },
	picker = { enable = true },
	scroll = { enable = true, animate_repeat = { delay = 1000 } },
	gh = { enable = true },
	input = { enable = true },
}

-- find
vim.keymap.set('n', '<leader>fs', function()
	require('snacks').picker.smart()
end, { desc = 'find files smart' })
vim.keymap.set('n', '<leader>ft', function()
	require('snacks').picker()
end, { desc = 'find picker types' })
vim.keymap.set('n', '<leader>fr', function()
	require('snacks').picker.resume()
end, { desc = 'find resume' })
vim.keymap.set('n', '<leader>ff', function()
	Snacks.picker.files()
end, { desc = 'find files' })
vim.keymap.set('n', '<leader>fp', function()
	Snacks.picker.projects()
end, { desc = 'find projects' })
vim.keymap.set('n', '<leader>fo', function()
	Snacks.picker.recent()
end, { desc = 'find old files' })
vim.keymap.set('n', '<leader>fg', function()
	Snacks.picker.grep()
end, { desc = 'find by grep' })
vim.keymap.set('n', '<leader>fd', function()
	Snacks.picker.diagnostics()
end, { desc = 'find diagnostics' })
vim.keymap.set('n', '<leader>fh', function()
	Snacks.picker.help()
end, { desc = 'find help' })
vim.keymap.set('n', '<leader>fi', function()
	Snacks.picker.icons()
end, { desc = 'find icons' })
vim.keymap.set('n', '<leader>fk', function()
	Snacks.picker.keymaps()
end, { desc = 'find keymaps' })
vim.keymap.set('n', '<leader>fq', function()
	Snacks.picker.qflist()
end, { desc = 'find quickfix' })
vim.keymap.set('n', '<leader>fu', function()
	Snacks.picker.undo()
end, { desc = 'find undo tree' })

-- buffer
vim.keymap.set('n', '<leader>f/', function()
	Snacks.picker.lines()
end, { desc = 'find in buffer /' })

-- lsP
vim.keymap.set('n', 'gd', function()
	Snacks.picker.lsp_definitions()
end, { desc = 'goto definition' })
vim.keymap.set('n', 'gD', function()
	Snacks.picker.lsp_declarations()
end, { desc = 'goto declaration' })
vim.keymap.set('n', 'gr', function()
	Snacks.picker.lsp_references()
end, { desc = 'goto references', nowait = true })
vim.keymap.set('n', 'gI', function()
	Snacks.picker.lsp_implementations()
end, { desc = 'goto Implementation' })
vim.keymap.set('n', 'gy', function()
	Snacks.picker.lsp_type_definitions()
end, { desc = 'goto type definition' })

--  notifier
vim.keymap.set('n', '<leader>nh', function()
	Snacks.notifier.hide()
end, { desc = 'notifier hide' })
vim.keymap.set('n', '<leader>nl', function()
	Snacks.notifier.show_history()
end, { desc = 'notifier list' })
vim.keymap.set('n', '<leader>nf', function()
	Snacks.picker.notifications()
end, { desc = 'find notifications' })

--  lazygit
vim.keymap.set('n', '<leader>gl', function()
	Snacks.lazygit()
end, { desc = 'lazy git' })

--  gitHub
vim.keymap.set('n', '<leader>gi', function()
	Snacks.picker.gh_issue()
end, { desc = 'github issues' })
vim.keymap.set('n', '<leader>gI', function()
	Snacks.picker.gh_issue { state = 'all' }
end, { desc = 'github issues (all)' })

--  image
vim.keymap.set('n', '<leader>oi', function()
	Snacks.image.hover()
end, { desc = 'open image' })

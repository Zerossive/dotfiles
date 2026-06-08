vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup {
	notifier = { enabled = true },
	image = {
		enable = true,
		-- fix image rendering for obsidian paths
		-- resolve = function(path, src)
		-- 	local api = require 'obsidian.api'
		-- 	if api.path_is_note(path) then
		-- 		return api.resolve_attachment_path(src)
		-- 	end
		-- end,
	},
	picker = { enable = true },
	scroll = { enable = true, animate_repeat = { delay = 1000 } },
	gh = { enable = true },
	input = { enable = true },
}

local snacks = require 'snacks'

-- find
vim.keymap.set('n', '<leader>fs', function()
	snacks.picker.smart()
end, { desc = 'find files (smart)' })
vim.keymap.set('n', '<leader>ft', function()
	snacks.picker()
end, { desc = 'find picker types' })
vim.keymap.set('n', '<leader>fr', function()
	snacks.picker.resume()
end, { desc = 'find resume' })
vim.keymap.set('n', '<leader>ff', function()
	snacks.picker.files()
end, { desc = 'find files' })
vim.keymap.set('n', '<leader>fp', function()
	snacks.picker.projects()
end, { desc = 'find projects' })
vim.keymap.set('n', '<leader>fo', function()
	snacks.picker.recent()
end, { desc = 'find old files' })
vim.keymap.set('n', '<leader>fg', function()
	snacks.picker.grep()
end, { desc = 'find by grep' })
vim.keymap.set('n', '<leader>fd', function()
	snacks.picker.diagnostics()
end, { desc = 'find diagnostics' })
vim.keymap.set('n', '<leader>fh', function()
	snacks.picker.help()
end, { desc = 'find help' })
vim.keymap.set('n', '<leader>fi', function()
	snacks.picker.icons()
end, { desc = 'find icons' })
vim.keymap.set('n', '<leader>fk', function()
	snacks.picker.keymaps()
end, { desc = 'find keymaps' })
vim.keymap.set('n', '<leader>fq', function()
	snacks.picker.qflist()
end, { desc = 'find qflist' })
vim.keymap.set('n', '<leader>fu', function()
	snacks.picker.undo()
end, { desc = 'find undo tree' })
vim.keymap.set('n', '<leader>fb', function()
	snacks.picker.buffers()
end, { desc = 'find buffers' })
vim.keymap.set('n', '<leader>fT', function()
	---@diagnostic disable-next-line: undefined-field
	snacks.picker.todo_comments()
end, { desc = 'find todo comments' })
vim.keymap.set('n', '<leader>fc', function()
	snacks.picker.commands()
end, { desc = 'find commands' })

-- buffer
vim.keymap.set('n', '<leader>f/', function()
	snacks.picker.lines()
end, { desc = 'find in buffer' })
vim.keymap.set('n', '<leader>fD', function()
	snacks.picker.diagnostics_buffer()
end, { desc = 'find buffer diagnostics' })

-- lsP
vim.keymap.set('n', 'gd', function()
	snacks.picker.lsp_definitions()
end, { desc = 'goto definition' })
vim.keymap.set('n', 'gD', function()
	snacks.picker.lsp_declarations()
end, { desc = 'goto declaration' })
vim.keymap.set('n', 'gr', function()
	snacks.picker.lsp_references()
end, { desc = 'goto references', nowait = true })
vim.keymap.set('n', 'gI', function()
	snacks.picker.lsp_implementations()
end, { desc = 'goto Implementation' })
vim.keymap.set('n', 'gy', function()
	snacks.picker.lsp_type_definitions()
end, { desc = 'goto type definition' })

--  notifier
vim.keymap.set('n', '<leader>nh', function()
	snacks.notifier.hide()
end, { desc = 'notifier hide' })
vim.keymap.set('n', '<leader>nl', function()
	snacks.notifier.show_history()
end, { desc = 'notifier list' })
vim.keymap.set('n', '<leader>nf', function()
	snacks.picker.notifications()
end, { desc = 'find notifications' })

--  lazygit
vim.keymap.set('n', '<leader>gl', function()
	snacks.lazygit()
end, { desc = 'lazy git' })

--  github
vim.keymap.set('n', '<leader>gi', function()
	snacks.picker.gh_issue()
end, { desc = 'github issues' })
vim.keymap.set('n', '<leader>gI', function()
	snacks.picker.gh_issue { state = 'all' }
end, { desc = 'github issues (all)' })
vim.keymap.set('n', '<leader>gf', function()
	snacks.picker.git_diff()
end, { desc = 'find git changes' })

--  image
-- vim.keymap.set('n', '<leader>oi', function()
-- 	snacks.image.hover()
-- end, { desc = 'open image' })

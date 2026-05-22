vim.pack.add { 'https://github.com/folke/sidekick.nvim' }

require('sidekick').setup {
	nes = { enabled = false },
	-- add any options here
	cli = {
		mux = {
			backend = 'tmux',
			enabled = true,
		},
		win = { keys = { prompt = { '<a-p>', 'prompt', mode = 't', desc = 'insert prompt or context' } } },
		-- prompts = {
		-- 	test = 'explain the line of code at {position}',
		-- },
	},
}

vim.keymap.set({ 'n', 't', 'i', 'x' }, '<c-.>', function()
	require('sidekick.cli').focus()
end, { desc = 'Sidekick Focus' })

vim.keymap.set('n', '<leader>aa', function()
	require('sidekick.cli').toggle()
end, { desc = 'Sidekick Toggle CLI' })

vim.keymap.set(
	'n',
	'<leader>as',
	function()
		require('sidekick.cli').select()
	end,
	-- Or to select only installed tools:
	-- require("sidekick.cli").select({ filter = { installed = true } })
	{ desc = 'Select CLI' }
)

vim.keymap.set('n', '<leader>ad', function()
	require('sidekick.cli').close()
end, { desc = 'Detach a CLI Session' })

vim.keymap.set({ 'x', 'n' }, '<leader>at', function()
	require('sidekick.cli').send { msg = '{this}' }
end, { desc = 'Send This' })

vim.keymap.set('n', '<leader>af', function()
	require('sidekick.cli').send { msg = '{file}' }
end, { desc = 'Send File' })

vim.keymap.set('x', '<leader>av', function()
	require('sidekick.cli').send { msg = '{selection}' }
end, { desc = 'Send Visual Selection' })

vim.keymap.set({ 'n', 'x' }, '<leader>ap', function()
	require('sidekick.cli').prompt()
end, { desc = 'Sidekick Select Prompt' })

-- Example of a keybinding to open one directly
-- vim.keymap.set('n', '<leader>ag', function()
-- 	require('sidekick.cli').toggle { name = 'gemini', focus = true }
-- end, { desc = 'Sidekick Toggle Gemini' })

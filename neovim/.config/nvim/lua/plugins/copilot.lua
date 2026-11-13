vim.pack.add { 'https://github.com/github/copilot.vim' }

-- disable by default
vim.g.copilot_enabled = false

-- vim.g.copilot_filetypes = {
-- 	-- ['*'] = false,
-- 	['markdown'] = false,
-- }

vim.keymap.set('i', '<C-a>', 'copilot#Accept()', {
	expr = true,
	replace_keycodes = false,
	desc = 'accept copilot suggestion',
})
vim.g.copilot_no_tab_map = true

vim.keymap.set('n', '<leader>ai', function()
	if vim.g.copilot_enabled then
		vim.cmd 'Copilot disable'
	else
		vim.cmd 'Copilot enable'
	end
end, { desc = 'toggle inline ai' })

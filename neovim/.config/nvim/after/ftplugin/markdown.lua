-- [[ Markdown ]]

-- [[ Options ]]

vim.o.wrap = true
-- vim.o.spell = true
vim.diagnostic.enable(false)

-- [[ Keymaps]]
-- obsidian
vim.keymap.set('n', '<leader><leader>o', '<CMD>Obsidian toc<CR>', { desc = 'outline' })
vim.keymap.set('n', '<leader><leader>n', '<CMD>Obsidian new<CR>', { desc = 'new note' })
vim.keymap.set('n', '<leader><leader>d', '<CMD>Obsidian today<CR>', { desc = 'daily note' })
vim.keymap.set('n', '<leader><leader>r', '<CMD>Obsidian rename<CR>', { desc = 'rename note' })
vim.keymap.set('n', '<leader><leader>s', '<CMD>Obsidian quick_switch<CR>', { desc = 'quick switch' })
vim.keymap.set('n', '<leader><leader>t', '<CMD>Obsidian tags<CR>', { desc = 'tags' })
vim.keymap.set('n', '<leader><leader>l', '<CMD>Obsidian links<CR>', { desc = 'links' })
vim.keymap.set('n', '<leader><leader>L', '<CMD>Obsidian backlinks<CR>', { desc = 'backlinks' })
vim.keymap.set('n', '<leader><leader>T', '<CMD>Obsidian template<CR>', { desc = 'insert template' })
vim.keymap.set('n', '<leader><leader>P', '<CMD>Obsidian paste_img<CR>', { desc = 'paste image' })
-- other
vim.keymap.set('n', '<leader><leader>m', '<CMD>RenderMarkdown toggle<CR>', { desc = 'toggle markview' })
vim.keymap.set('n', '<leader><leader>i', '<CMD>normal ysiW*<CR>', { desc = 'italic' })
vim.keymap.set('n', '<leader><leader>b', '<CMD>normal ysiW*.<CR>', { desc = 'bold' })
vim.keymap.set('n', '<leader><leader>p', function()
	local cur_pos = vim.api.nvim_win_get_cursor(0) -- Get cursor position
	vim.cmd 'normal ysiW]f]a()P'
	cur_pos[2] = cur_pos[2] + 1 -- Adjust for adding 1 character
	vim.api.nvim_win_set_cursor(0, cur_pos) -- Restore cursor
end, { desc = 'paste link into word' })
vim.keymap.set('n', '<leader><leader>h', function()
	local cur_pos = vim.api.nvim_win_get_cursor(0) -- Get cursor position
	local line = vim.fn.getline '.'
	if line:match '^#+[%s ]' then
		vim.cmd 'normal! I#' -- Add # at the beginning, even if no space after existing #s
		cur_pos[2] = cur_pos[2] + 1 -- Adjust for adding 1 character
	else
		vim.cmd 'normal! I# ' -- Add '# ' at the beginning of a non-heading line
		cur_pos[2] = cur_pos[2] + 2 -- Adjust for adding 2 characters
	end
	vim.api.nvim_win_set_cursor(0, cur_pos) -- Restore cursor
end, { desc = 'add heading' })
vim.keymap.set('n', '<leader><leader>H', function()
	local cur_pos = vim.api.nvim_win_get_cursor(0) -- Get cursor position
	local line = vim.fn.getline '.'
	if line:match '^#+[%s ]' then
		if line:match '^#%s' then -- Single # with space
			vim.cmd 'normal! 02x' -- Delete '# '
			cur_pos[2] = cur_pos[2] - 2 -- Adjust for deleting 2 characters
		else
			vim.cmd 'normal! 0f#x' -- Delete the first '#'
			cur_pos[2] = cur_pos[2] - 1 -- Adjust for deleting 1 character
		end
	end
	if cur_pos[2] < 0 then
		cur_pos[2] = 0 -- Account for negative cursor position
	end
	vim.api.nvim_win_set_cursor(0, cur_pos) -- Restore cursor
end, { desc = 'remove Heading' })

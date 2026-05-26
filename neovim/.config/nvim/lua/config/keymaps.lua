-- clear highlights on search when pressing <esc> in normal mode
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- diagnostic keymaps
vim.keymap.set('n', '<leader>lb', vim.diagnostic.setloclist, { desc = 'buffer diagnostics to location' })
vim.keymap.set('n', '<leader>la', vim.diagnostic.setqflist, { desc = 'all diagnostics to quickfix' })

-- navigation
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'move up 1/2 page and center' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'move down 1/2 page and center' })
for i = 1, 9 do
	vim.keymap.set({ 'n', 'i', 'v' }, '<m-' .. i .. '>', '<cmd>tabnext ' .. i .. '<cr>', {
		desc = 'go to tab ' .. i,
	})
end
vim.keymap.set({ 'n', 'i', 'v' }, '<m-0>', '<cmd>tablast<cr>', {
	desc = 'go to last tab',
})
vim.keymap.set({ 'n', 'i', 'v' }, '<m-.>', '<cmd>tabnext<cr>', {
	desc = 'go to next tab',
})
vim.keymap.set({ 'n', 'i', 'v' }, '<m-,>', '<cmd>tabprevious<cr>', {
	desc = 'go to pevious tab',
})
vim.keymap.set({ 'n', 'i', 'v' }, '<m->>', '<cmd>tabmove +1<cr>', {
	desc = 'move tab right',
})
vim.keymap.set({ 'n', 'i', 'v' }, '<m-<>', '<cmd>tabmove -1<cr>', {
	desc = 'move tab left',
})

-- sessions
vim.keymap.set('n', '<leader>oq', ':e ~/Elysium/Obsidian\\ Vault/Quick\\ Note.md<CR>', { desc = 'open quick note' })
vim.keymap.set('n', '<leader>ol', ':!dolphin ~/.local/share/nvim/sessions &<CR>', { desc = 'open local session storage' })

-- file operations
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'write file' })
vim.keymap.set('n', '<leader>W', ':wall<CR>', { desc = 'write all files' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'quit file' })
vim.keymap.set('n', '<leader>Q', ':qall<CR>', { desc = 'quit all files' })

-- directory operations
vim.keymap.set('n', '<leader>o.', ':cd %:p:h<CR>', { desc = 'open . as root directory' })
vim.keymap.set('n', '<leader>od', ':!dolphin . &<CR>', { desc = 'open directory' })

-- text manipulation
vim.keymap.set('n', '<C-8>', 'viW*N', { desc = 'set current word as search pattern', remap = true })
vim.keymap.set('v', '<C-8>', '*N', { desc = 'set current word as search pattern', remap = true })
vim.keymap.set('i', '<C-e>', '<ESC>A', { desc = 'go to end of line' })
vim.keymap.set('i', 'jj', '<Escape>', { desc = 'normal mode' })
vim.keymap.set('n', '<leader>by', function()
	local cursor_position = vim.api.nvim_win_get_cursor(0)
	vim.cmd 'normal ggVGy'
	vim.api.nvim_win_set_cursor(0, cursor_position)
end, { desc = 'buffer yank' })
vim.keymap.set('n', '<leader>bc', function()
	local cursor_position = vim.api.nvim_win_get_cursor(0)
	vim.cmd 'normal ggVGgc'
	vim.api.nvim_win_set_cursor(0, cursor_position)
end, { desc = 'buffer comment' })

-- plugins
vim.keymap.set('n', '<leader>pr', '<cmd>restart<cr>', { desc = 'restart' })
vim.keymap.set('n', '<leader>pu', function()
	vim.pack.update()
end, { desc = 'update plugins' })
vim.keymap.set('n', '<leader>pi', function()
	vim.pack.update(nil, { offline = true })
end, { desc = 'explore installed plugins' })
vim.keymap.set('n', '<leader>pd', function()
	local inactivePlugins = vim.iter(vim.pack.get())
		:filter(function(x)
			return not x.active
		end)
		:map(function(x)
			return x.spec.name
		end)
		:totable()
	vim.pack.del(inactivePlugins)
end, { desc = 'delete unused plugins' })

-- other
vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>', { desc = 'close other buffers' })
vim.keymap.set('v', '<C-r>', ':RC ', { desc = 'run command on selected text' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'exit terminal mode' })
vim.keymap.set('n', '<leader>nm', '<cmd>messages<cr>', { desc = 'messages' })

-- add class attribute in relevant filetypes
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'html', 'svelte', 'javascriptreact', 'typescriptreact' },
	callback = function()
		vim.keymap.set('n', '<leader><leader>c', function()
			vim.cmd.normal "vatoEa class=''"
			vim.cmd 'startinsert'
		end, {
			buffer = 0,
			desc = 'add class attribute',
		})
	end,
})

--[[ REMINDERS / TIPS / GUIDE
g<			open previous message
gq			break selected text into shorter lines
gS			break apart or combine arguments on separate lines
*			search for word under cursor
<c-8>		set current word as search pattern
cgn			find and replace next search match
<c-f>		cmdline: switch to command history
q:			open command history
q/			open search history
ZR			restart
--]]

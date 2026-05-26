vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
	columns = { 'icon', 'size', 'mtime' },
	delete_to_trash = true,
	watch_for_changes = true,
}

vim.keymap.set('n', '-', '<cmd>Oil --preview<cr>', { desc = 'open oil' })

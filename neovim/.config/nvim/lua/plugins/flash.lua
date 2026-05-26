-- TODO: lazy load
vim.pack.add { 'https://github.com/folke/flash.nvim' }

require('flash').setup {}

vim.keymap.set({ 'n', 'x', 'o' }, 's', require('flash').jump, { desc = 'flash search' })

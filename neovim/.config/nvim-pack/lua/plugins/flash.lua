vim.pack.add { 'https://github.com/folke/flash.nvim' }

-- TODO: lazy load
require('flash').setup {}

vim.keymap.set({ 'n', 'x', 'o' }, 's', require('flash').jump, { desc = 'flash search' })

vim.pack.add { 'https://github.com/kevinhwang91/nvim-ufo' }

-- dependencies

vim.pack.add { 'https://github.com/kevinhwang91/promise-async' }

-- options

vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- keymaps

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'K', function()
	local winid = require('ufo').peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end)

-- Option 3: treesitter as a main provider instead

require('ufo').setup {
	---@diagnostic disable-next-line: unused-local
	provider_selector = function(bufnr, filetype, buftype)
		return { 'treesitter', 'indent' }
	end,
}

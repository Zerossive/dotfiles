vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'typst' },
	once = true,
	callback = function()
		vim.pack.add { { src = 'https://github.com/chomosuke/typst-preview.nvim', version = vim.version.range '1.*' } }

		require('typst-preview').setup {}
	end,
})

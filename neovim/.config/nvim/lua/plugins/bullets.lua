vim.pack.add { 'https://github.com/bullets-vim/bullets.nvim' }

require('bullets').setup {
	checkbox_markers = '                   x',
	outline_levels = { 'ROM', 'ABC', 'num', 'abc', 'rom', 'std-' },
}

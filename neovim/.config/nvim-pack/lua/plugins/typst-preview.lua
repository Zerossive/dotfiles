-- TODO: lazy load in typst files
vim.pack.add { { src = 'https://github.com/chomosuke/typst-preview.nvim', version = vim.version.range '1.*' } }

require('typst-preview').setup {}

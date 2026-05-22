vim.pack.add { { src = 'https://github.com/chomosuke/typst-preview.nvim', version = vim.version.range '1.*' } }

-- TODO: lazy load in typst files
require('typst-preview').setup {}

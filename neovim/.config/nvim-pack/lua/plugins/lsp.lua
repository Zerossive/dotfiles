-- Useful status updates for LSP.
vim.pack.add { { src = 'https://github.com/j-hui/fidget.nvim', version = vim.version.range '*' } }
require('fidget').setup { notification = { window = { winblend = 0 } } }

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
	callback = function(event)
		-- In this case, we create a function that lets us more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.
		local map = function(keys, func, desc, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

		-- This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method('textDocument/documentHighlight', event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
				end,
			})
		end

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		if client and client:supports_method('textDocument/inlayHint', event.buf) then
			map('<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, '[T]oggle Inlay [H]ints')
		end
	end,
})

vim.pack.add {
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
	'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}

local ensure_installed = {
	-- 'lua_ls',
	'tailwindcss',
	'stylua',
	'prettierd',
	'prettier',
	'css-lsp',
	'bash-language-server',
	'shfmt',
	'shellcheck',
	'yaml-language-server',
	'rust-analyzer',
	'marksman', -- markdown
	'docker-compose-language-service',
	'svelte-language-server',
	'tinymist', -- typst
}

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

vim.pack.add { 'https://github.com/folke/lazydev.nvim' }
require('lazydev').setup {
	library = {
		-- Load luvit types when the `vim.uv` word is found
		{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
	},
}
-- {
-- 	'folke/lazydev.nvim',
-- 	ft = 'lua',
-- 	opts = {
-- 		library = {
-- 			-- Load luvit types when the `vim.uv` word is found
-- 			{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
-- 		},
-- 	},
-- },

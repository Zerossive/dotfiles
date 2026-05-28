-- Useful status updates for LSP.
vim.pack.add { { src = 'https://github.com/j-hui/fidget.nvim', version = vim.version.range '*' } }
require('fidget').setup { notification = { window = { winblend = 0 } } }

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(event)
		-- In this case, we create a function that lets us more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.
		local map = function(keys, func, desc, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		map('grn', vim.lsp.buf.rename, 'rename')

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map('gra', vim.lsp.buf.code_action, 'goto code action', { 'n', 'x' })

		-- This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		map('grd', vim.lsp.buf.declaration, 'goto declaration')

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method('textDocument/documentHighlight', event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
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
				group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
				end,
			})
		end

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		if client and client:supports_method('textDocument/inlayHint', event.buf) then
			map('<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, 'toggle inlay hints')
		end
	end,
})

vim.pack.add {
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
	'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}

-- add lsp servers here (use short names)
local servers = {
	'bashls',
	'cssls',
	'docker_compose_language_service',
	'lua_ls', -- handled by lazydev
	-- 'ts_ls', -- handled by typescript-tools
	'marksman',
	'rust_analyzer',
	'stylua',
	'svelte',
	'tailwindcss',
	'tinymist',
	'yamlls',
}

local ensure_installed = vim.deepcopy(servers)

-- add non-lsp server packages to install here
vim.list_extend(ensure_installed, {
	'prettierd',
	'prettier',
	'shfmt',
	'shellcheck',
})

require('mason').setup()
require('mason-lspconfig').setup() -- or alternatives below
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

-- -- alternative 1
-- vim.lsp.config('*', {})
-- vim.lsp.enable(servers)

-- -- alternative 2
-- for _, name in ipairs(servers) do
-- 	vim.lsp.config(name, {})
-- 	vim.lsp.enable(name)
-- end

vim.keymap.set('n', '<leader>pm', '<cmd>Mason<cr>', { desc = 'mason' })

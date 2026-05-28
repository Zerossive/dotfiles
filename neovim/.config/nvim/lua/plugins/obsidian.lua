---@diagnostic disable: missing-fields
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'markdown' },
	once = true,
	callback = function()
		vim.pack.add {
			{ src = 'https://github.com/obsidian-nvim/obsidian.nvim', version = vim.version.range '*' },
			-- dependencies
			'https://github.com/nvim-lua/plenary.nvim',
		}

		require('obsidian').setup {
			legacy_commands = false, -- this will be removed in 4.0.0
			picker = {
				---@diagnostic disable-next-line: assign-type-mismatch
				name = 'snacks.picker',
			},
			workspaces = {
				{
					name = 'Elysium',
					path = '~/Elysium/Obsidian Vault/',
				},
			},
			notes_subdir = 'Notes',
			new_notes_location = 'notes_subdir',
			note = {
				template = 'Template Note.md',
			},
			daily_notes = {
				folder = 'Notes/Daily',
				template = 'Template Daily.md',
			},
			note_id_func = require('obsidian.builtin').title_id,
			frontmatter = {
				enabled = false,
			},
			templates = {
				folder = 'Templates',
				substitutions = {
					yesterday = function()
						---@diagnostic disable-next-line: return-type-mismatch
						return os.date('%Y-%m-%d', os.time() - 86400)
					end,
					tomorrow = function()
						---@diagnostic disable-next-line: return-type-mismatch
						return os.date('%Y-%m-%d', os.time() + 86400)
					end,
				},
			},
			attachments = {
				folder = 'Files',
			},
			ui = {
				enable = false,
			},
			checkbox = {
				order = { ' ', 'x' },
			},
		}
	end,
})

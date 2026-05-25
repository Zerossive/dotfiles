---@diagnostic disable: missing-fields
-- [[ Forked Obsidian Config ]]

-- TODO: lazy load in markdown files
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

-- [[ Old Obsidian Config ]]

-- vim.pack.add {
-- 	{ src = 'https://github.com/epwalsh/obsidian.nvim', version = vim.version.range '*' },
-- 	-- dependencies
-- 	'https://github.com/nvim-lua/plenary.nvim',
-- }
--
-- -- TODO: lazy load in markdown files
-- require('obsidian').setup {
-- 	workspaces = {
-- 		{
-- 			name = 'Elysium',
-- 			path = '~/Elysium/Obsidian Vault/',
-- 		},
-- 	},
-- 	notes_subdir = 'Notes',
-- 	daily_notes = {
-- 		folder = 'Notes/Daily',
-- 		template = 'Templates/Template Daily.md',
-- 	},
-- 	new_notes_location = 'notes_subdir',
-- 	note_path_func = function(spec)
-- 		local path = spec.dir / tostring(spec.title)
-- 		return path:with_suffix '.md'
-- 	end,
-- 	disable_frontmatter = true,
-- 	templates = {
-- 		subdir = 'Templates',
-- 	},
-- 	---@diagnostic disable-next-line: missing-fields
-- 	attachments = {
-- 		img_folder = 'Files',
-- 	},
-- 	ui = {
-- 		enable = false,
-- 		checkboxes = {
-- 			---@diagnostic disable-next-line: missing-fields
-- 			[' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
-- 			---@diagnostic disable-next-line: missing-fields
-- 			['x'] = { char = '', hl_group = 'ObsidianDone' },
-- 		},
-- 	},
-- 	---@param url string
-- 	follow_url_func = function(url)
-- 		-- Open the URL in the default web browser.
-- 		vim.fn.jobstart { 'xdg-open', url } -- linux
-- 	end,
-- }

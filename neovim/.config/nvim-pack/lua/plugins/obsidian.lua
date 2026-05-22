vim.pack.add {
	{ src = 'https://github.com/epwalsh/obsidian.nvim', version = vim.version.range '*' },
	-- dependencies
	'https://github.com/nvim-lua/plenary.nvim',
}

-- TODO: lazy load in markdown files
require('obsidian').setup {
	workspaces = {
		{
			name = 'Elysium',
			path = '~/Elysium/Obsidian Vault/',
		},
	},
	notes_subdir = 'Notes',
	daily_notes = {
		folder = 'Notes/Daily',
		template = 'Templates/Template Daily.md',
	},
	new_notes_location = 'notes_subdir',
	note_path_func = function(spec)
		local path = spec.dir / tostring(spec.title)
		return path:with_suffix '.md'
	end,
	disable_frontmatter = true,
	templates = {
		subdir = 'Templates',
	},
	attachments = {
		img_folder = 'Files',
	},
	ui = {
		enable = false,
	},
	---@param url string
	follow_url_func = function(url)
		-- Open the URL in the default web browser.
		vim.fn.jobstart { 'xdg-open', url } -- linux
	end,
}

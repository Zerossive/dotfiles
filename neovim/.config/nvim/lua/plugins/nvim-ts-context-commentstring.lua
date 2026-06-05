vim.schedule(function()
	vim.pack.add { 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring' }

	require('ts_context_commentstring').setup {
		enabled_autocmd = false,
	}

	-- integrate with Comment.nvim
	---@diagnostic disable-next-line: missing-fields
	require('Comment').setup {
		pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
	}
end)

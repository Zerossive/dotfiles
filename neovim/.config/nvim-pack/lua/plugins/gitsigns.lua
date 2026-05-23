vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }
require('gitsigns').setup {
	on_attach = function()
		local gitsigns = require 'gitsigns'

		-- navigation
		vim.keymap.set('n', ']c', function()
			if vim.wo.diff then
				vim.cmd.normal { ']c', bang = true }
			else
				gitsigns.nav_hunk 'next'
			end
		end, { desc = 'jump to next git change' })
		vim.keymap.set('n', '[c', function()
			if vim.wo.diff then
				vim.cmd.normal { '[c', bang = true }
			else
				gitsigns.nav_hunk 'prev'
			end
		end, { desc = 'jump to previous git change' })

		-- actions
		vim.keymap.set('n', '<leader>gB', gitsigns.blame_line, { desc = 'git blame line' })
		vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = 'git diff against staging' })
		vim.keymap.set('n', '<leader>gD', function()
			gitsigns.diffthis '@'
		end, { desc = 'git diff against last commit' })

		-- hunk actions
		vim.keymap.set('n', '<leader>ghs', gitsigns.stage_hunk, { desc = 'git stage hunk' })
		vim.keymap.set('v', '<leader>ghs', function()
			gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
		end, { desc = 'stage git hunk' })
		vim.keymap.set('n', '<leader>ghu', gitsigns.stage_hunk, { desc = 'git undo stage hunk' })
		vim.keymap.set('n', '<leader>ghr', gitsigns.reset_hunk, { desc = 'git reset hunk' })
		vim.keymap.set('v', '<leader>ghr', function()
			gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
		end, { desc = 'reset git hunk' })
		vim.keymap.set('n', '<leader>ghp', gitsigns.preview_hunk, { desc = 'git preview hunk' })
		vim.keymap.set('n', '<leader>ghP', gitsigns.preview_hunk_inline, { desc = 'git preview hunk (inline)' })

		-- buffer actions
		vim.keymap.set('n', '<leader>gbs', gitsigns.stage_buffer, { desc = 'git stage buffer' })
		vim.keymap.set('n', '<leader>gbr', gitsigns.reset_buffer, { desc = 'git reset buffer' })

		-- toggles
		vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'toggle git show blame line' })
		vim.keymap.set('n', '<leader>tW', gitsigns.toggle_word_diff, { desc = 'toggle git show word diff' })

		-- text object
		vim.keymap.set({ 'o', 'x' }, 'ih', '<Cmd>Gitsigns select_hunk<CR>', { desc = 'hunk' })
	end,
}

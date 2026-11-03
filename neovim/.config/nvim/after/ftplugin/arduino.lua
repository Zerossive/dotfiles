-- [[ Arduino ]]

-- [[ Keymaps ]]

vim.keymap.set('n', '<leader><leader>c', function()
	vim.system({ 'arduino-cli', 'compile', '--no-color', '.' }, {}, function(result)
		vim.schedule(function()
			vim.notify(result.stdout .. result.stderr, result.code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR, { title = 'Arduino Compile' })
		end)
	end)
end, { desc = 'compile current directory' })

vim.keymap.set('n', '<leader><leader>u', function()
	vim.system({ 'arduino-cli', 'upload', '--no-color', '.' }, {}, function(result)
		vim.schedule(function()
			vim.notify(result.stdout .. result.stderr, result.code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR, { title = 'Arduino Upload' })
		end)
	end)
end, { desc = 'upload to arduino' })

vim.keymap.set('n', '<leader><leader>m', function()
	vim.cmd 'vsplit | vertical resize 60 | terminal arduino-cli monitor .'
end, { desc = 'monitor serial output' })

--[[
add plugins to lua/plugins/ directory to autoload them

prefix plugin files with a '_' to disable them

-- github url helper function
local gh = function(x)
	return 'https://github.com/' .. x
end

-- example of adding a plugin with various options
vim.pack.add {
	{
		src = 'github url',
		name = 'override name',
		-- Git branch, tag, or commit hash
		version = 'stable',
		-- Version constraint, see |vim.version.range()|
		version = vim.version.range '1.x',
		-- pass extra info
		data = { foo = 'bar' },
	},
}

-- lazy load after startup
vim.schedule(function()
	vim.pack.add { 'url' }
end)

-- lazy load on some event
vim.api.nvim_create_autocmd('CmdlineEnter', {
	once = true,
	callback = function()
		vim.pack.add { 'url' }
	end,
})

-- simpler use of vim.pack.add
vim.pack.add { 'github url 1', 'github url 2' }

-- update plugins
vim.pack.update()

-- show installed plugins
vim.pack.update(nil, { offline = true })
--]]

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir) do
	if type == 'file' and file_name:match '%.lua$' and file_name ~= 'init.lua' and not file_name:match '^_' then
		local module = file_name:gsub('%.lua$', '')
		require('plugins.' .. module)
	end
end

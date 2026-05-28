---@diagnostic disable: undefined-global
-- Lua Snippets
--
-- to start a snippet:
--  1. add s(info, code) to returned list
--  2. define trigger, name, and description
--  3. define code

return {
	-- vim.pack.add {}
	s({ trig = 'pack-add', name = 'vim.pack.add {}', dscr = 'Add a plugin using vim pack' }, {
		t { "vim.pack.add { 'https://github.com/" },
		i(1),
		t "' }",
	}),
	-- vim.pack.add { { src = {} } }
	s({ trig = 'pack-add-extra', name = 'vim.pack.add { { src = {} } }', dscr = 'Add a plugin using vim pack' }, {
		t { "vim.pack.add { { src = 'https://github.com/" },
		i(1),
		t "' }, }",
	}),
	-- require('package').setup {}
	s({ trig = 'setup', name = "require('package').setup {}", dscr = 'Setup a plugin' }, {
		t { "require('" },
		i(1),
		t "').setup {",
		i(2),
		t '}',
	}),
}

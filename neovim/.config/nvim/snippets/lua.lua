---@diagnostic disable: undefined-global
-- fmt() uses {}
-- fmta() uses <>
-- f() takes a function
-- c() takes an index and table of nodes

return {
	s(
		'pack-add',
		fmta(
			[[
			vim.pack.add { 'https://github.com/<>' }
			]],
			i(1)
		)
	),

	-- vim.pack.add { { src = {} } }
	s(
		'pack-add-extra',
		fmta(
			[[
			vim.pack.add { { src = 'https://github.com/<>' }, }
			]],
			i(1)
		)
	),

	-- require('package').setup {}
	s(
		'setup',
		fmta(
			[[
			require('<>').setup {<>}
			]],
			{
				i(1),
				i(2),
			}
		)
	),
}

---@diagnostic disable: undefined-global
-- fmt() uses {}
-- fmta() uses <>
-- f() takes a function
-- c() takes an index and table of nodes

return {
	-- twmerge and clsx wrapper
	s(
		'cn-util',
		fmta(
			[[
			import { clsx, type ClassValue } from 'clsx'
			import { twMerge } from 'tailwind-merge'

			export function cn(...inputs: ClassValue[]) {
				return twMerge(clsx(inputs))
			}
			]],
			{}
		)
	),
}

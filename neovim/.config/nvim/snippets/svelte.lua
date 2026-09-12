---@diagnostic disable: undefined-global
-- fmt() uses {}
-- fmta() uses <>
-- f() takes a function
-- c() takes an index and table of nodes

return {
	s(
		'script-ts',
		fmt(
			[[
			<script lang="ts">
				{}
			</script>
			]],
			i(1)
		)
	),
}

require("session"):setup({
	sync_yanked = true,
})

require("restore"):setup({
	-- Set the position for confirm and overwrite dialogs.
	-- don't forget to set height: `h = xx`
	-- https://yazi-rs.github.io/docs/plugins/utils/#ya.input
	position = { "center", w = 70, h = 40 },

	-- Show confirm dialog before restore.
	-- NOTE: even if set this to false, overwrite dialog still pop up
	show_confirm = true,

	-- colors for confirm and overwrite dialogs
	theme = {
		title = "blue",
		header = "green",
		-- header color for overwrite dialog
		header_warning = "yellow",
		list_item = { odd = "blue", even = "blue" },
	},
})

-- require("git"):setup() -- re-enable when this plugin gets fixed

-- -- re-enable when this plugin gets fixed
-- require("yatline"):setup({
-- 	section_separator = { open = "", close = "" },
-- 	part_separator = { open = "", close = "" },
-- 	inverse_separator = { open = "", close = "" },
--
-- 	tab_use_inverse = true,
--
-- 	show_background = false,
--
-- 	display_header_line = true,
-- 	display_status_line = true,
--
-- 	header_line = {
-- 		left = {
-- 			section_a = {
-- 				{ type = "line", custom = false, name = "tabs", params = { "left" } },
-- 			},
-- 			section_b = {},
-- 			section_c = {},
-- 		},
-- 		right = {
-- 			section_a = {
-- 				{ type = "string", custom = false, name = "tab_path" },
-- 			},
-- 			section_b = {},
-- 			section_c = {},
-- 		},
-- 	},
--
-- 	status_line = {
-- 		left = {
-- 			section_a = {
-- 				{ type = "string", custom = false, name = "tab_mode" },
-- 			},
-- 			section_b = {
-- 				{ type = "coloreds", custom = false, name = "permissions" },
-- 			},
-- 			section_c = {
-- 				{ type = "coloreds", custom = false, name = "count" },
-- 			},
-- 		},
-- 		right = {
-- 			section_a = {
-- 				{ type = "string", custom = false, name = "cursor_position" },
-- 			},
-- 			section_b = {
-- 				{ type = "string", custom = false, name = "hovered_size" },
-- 			},
-- 			section_c = {
-- 				{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
-- 				-- { type = "string", custom = false, name = "hovered_mime" },
-- 			},
-- 		},
-- 	},
--
-- 	style_a = {
-- 		fg = "#1e1e2e",
-- 		bg_mode = {
-- 			normal = "#88B3F9",
-- 			select = "#A6E3A1",
-- 			un_set = "#CBA6F7",
-- 		},
-- 	},
-- 	style_b = { bg = "#6C7086", fg = "#CDD6F4" },
-- 	style_c = { bg = "#313244", fg = "#CDD6F4" },
-- })

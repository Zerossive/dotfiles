---@diagnostic disable: undefined-global
-- fmt() uses {}
-- fmta() uses <>
-- f() takes a function
-- c() takes an index and table of nodes

return {
	-- current time
	s(
		'time',
		f(function()
			return os.date '%-I:%M %p'
		end)
	),

	-- current datetime
	s(
		'datetime',
		f(function()
			return os.date '%Y-%m-%d %-I:%M %p'
		end)
	),

	-- Lorem Ipsum Sentence
	s(
		'loremSentence',
		t {
			'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem.',
		}
	),

	-- Lorem Ipsum Paragraph
	s(
		'loremParagraph',
		t {
			'Ullus investigandi veri, nisi inveneris, et quaerendi defatigatio turpis est, cum esset accusata et vituperata ab Hortensio. Qui liber cum et mortem contemnit, qua qui est imbutus quietus esse numquam potest. Praeterea bona praeterita grata recordatione renovata delectant. Est autem situm in nobis ut et voluptates.',
		}
	),

	-- Lorem Ipsum Article
	s(
		'loremArticle',
		fmt(
			[[
			'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus, fieri tamen permagna accessio potest.',
			'',
			'Ullus investigandi veri, nisi inveneris, et quaerendi defatigatio turpis est, cum esset accusata et vituperata ab Hortensio. Qui liber cum et mortem contemnit, qua qui est imbutus quietus esse numquam potest. Praeterea bona praeterita grata recordatione renovata delectant.',
			'',
			'Quod idem licet transferre in voluptatem, ut postea variari voluptas distinguique possit, augeri amplificarique non possit. Est autem situm in nobis ut et.',
			]],
			{}
		)
	),

	-- Catppuccin Colors
	s(
		'catppuccin',
		fmt(
			[[
			Rosewater:	#F5E0DC
			Flamingo:	#F2CDCD
			Pink:		#F5C2E7
			Mauve:		#CBA6F7
			Red:		#F38BA8
			Maroon:		#EBA0AC
			Peach:		#FAB387
			Yellow:		#F9E2AF
			Green:		#A6E3A1
			Teal:		#94E2D5
			Sky:		#89DCEB
			Sapphire:	#74C7EC
			Blue:		#89B4FA
			Lavender:	#B4BEFE
			Text:		#CDD6F4
			Subtext1:	#BAC2DE
			Subtext0:	#A6ADC8
			Overlay2:	#9399B2
			Overlay1:	#7F849C
			Overlay0:	#6C7086
			Surface2:	#585B70
			Surface1:	#45475A
			Surface0:	#313244
			Base:		#1E1E2E
			Mantle:		#181825
			Crust:		#11111B
			]],
			{}
		)
	),

	-- Individual Catppuccin Colors
	s('rosewater', t '#F5E0DC'),
	s('flamingo', t '#F2CDCD'),
	s('pink', t '#F5C2E7'),
	s('mauve', t '#CBA6F7'),
	s('red', t '#F38BA8'),
	s('maroon', t '#EBA0AC'),
	s('peach', t '#FAB387'),
	s('yellow', t '#F9E2AF'),
	s('green', t '#A6E3A1'),
	s('teal', t '#94E2D5'),
	s('sky', t '#89DCEB'),
	s('sapphire', t '#74C7EC'),
	s('blue', t '#89B4FA'),
	s('lavender', t '#B4BEFE'),
	s('text', t '#CDD6F4'),
	s('subtext1', t '#BAC2DE'),
	s('subtext0', t '#A6ADC8'),
	s('overlay2', t '#9399B2'),
	s('overlay1', t '#7F849C'),
	s('overlay0', t '#6C7086'),
	s('surface2', t '#585B70'),
	s('surface1', t '#45475A'),
	s('surface0', t '#313244'),
	s('base', t '#1E1E2E'),
	s('mantle', t '#181825'),
	s('crust', t '#11111B'),
}

return function(c, s)
	return {
		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { fg = c.mgt3 },
		["@variable.parameter"] = { fg = c.fg, italic = s.italic },
		["@variable.parameter.builtin"] = { fg = c.mgt3 },
		["@variable.member"] = { fg = c.fg },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = c.mgt3 },
		["@constant.macro"] = { fg = c.mgt },

		["@module"] = { fg = c.mgt },
		["@module.builtin"] = { fg = c.mgt3 },
		["@label"] = { link = "Label" },

		["@string"] = { link = "String" },
		["@string.documentation"] = { link = "String" },
		["@string.regexp"] = { link = "@constant" },
		["@string.escape"] = { link = "@constant" },
		["@string.special"] = { link = "@constant" },
		["@string.special.symbol"] = { link = "@constant" },
		["@string.special.path"] = { link = "@constant" },
		["@string.special.url"] = { fg = c.fg, underline = true },
		["@string.special.url.comment"] = { fg = c.muted, underline = true },

		["@character"] = { link = "Character" },
		["@character.special"] = { fg = c.ylw },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Float" },
		["@float"] = { link = "Float" },

		["@type"] = { link = "Type" },
		["@type.builtin"] = { link = "Type" },
		["@type.definition"] = { link = "Type" },

		["@attribute"] = { fg = c.mgt2 },
		["@attribute.builtin"] = { fg = c.mgt3 },
		["@property"] = { fg = c.fg },

		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		["@function.call"] = { link = "Function" },
		["@function.macro"] = { fg = c.mgt },

		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "Function" },

		["@constructor"] = { fg = c.vio },
		["@operator"] = { link = "Operator" },

		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@keyword.coroutine"] = { link = "Keyword" },
		["@keyword.operator"] = { link = "Operator" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.type"] = { link = "Keyword" },
		["@keyword.modifier"] = { link = "Keyword" },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.return"] = { link = "Keyword" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.exception"] = { link = "Exception" },

		["@keyword.conditional"] = { link = "Conditional" },
		["@keyword.conditional.ternary"] = { link = "Conditional" },

		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.directive.define"] = { link = "Define" },

		--- Punctuation
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.bracket"] = { link = "Delimiter" },
		["@punctuation.special"] = { link = "Delimiter" },

		--- Comments
		["@comment"] = { link = "Comment" },
		["@comment.documentation"] = { link = "Comment" },

		["@comment.error"] = { fg = c.red2 },
		["@comment.warning"] = { fg = c.ylw },
		["@comment.todo"] = { fg = c.grn2, bg = c.grn, blend = 15 },
		["@comment.note"] = { fg = c.blu2, bg = c.blu, blend = 15 },

		--- Markup
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },

		["@markup.quote"] = { fg = c.fg },
		["@markup.math"] = { fg = c.blu2 },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "@type" },

		["@markup.link"] = { fg = c.fg, underline = true },
		["@markup.link.markdown_inline"] = { fg = c.fg, underline = false },
		["@markup.link.label"] = { fg = c.grn2 },
		["@markup.link.url"] = { fg = c.blu2, underline = true },

		["@markup.raw"] = { fg = c.ylw },
		["@markup.raw.block"] = { fg = c.fg },

		["@markup.list"] = { fg = c.subtle },
		["@markup.list.checked"] = { fg = c.grn, bg = c.d_grn, blend = 10 },
		["@markup.list.unchecked"] = { fg = c.subtle },

		-- Markdown headings

		["@markup.heading"] = { fg = c.fg },
		["@markup.heading.1"] = { fg = c.ylw, bold = true },
		["@markup.heading.2"] = { fg = c.blu2, bold = true },
		["@markup.heading.3"] = { fg = c.blu, bold = true },
		["@markup.heading.4"] = { fg = c.vio2, bold = true },
		["@markup.heading.5"] = { fg = c.mgt2, bold = true },
		["@markup.heading.6"] = { fg = c.grn2, bold = true },

		["@diff.plus"] = { fg = c.grn, bg = c.grn, blend = 20 },
		["@diff.minus"] = { fg = c.red, bg = c.red, blend = 20 },
		["@diff.delta"] = { fg = c.ylw, bg = c.ylw, blend = 20 },

		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = c.subtle },
		["@tag.delimiter"] = { fg = c.fg },

		--- Non-highlighting captures
		-- ["@none"] = {},
		["@conceal"] = { link = "Conceal" },
		["@conceal.markdown"] = { fg = c.subtle },

		-- ["@spell"] = {},
		-- ["@nospell"] = {},
	}
end

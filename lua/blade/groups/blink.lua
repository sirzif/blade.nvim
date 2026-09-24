local M = {}

function M.get(c, _)
	return {
		BlinkCmpDoc = { fg = c.fg, bg = c.surface },
		BlinkCmpDocBorder = { fg = c.mgt, bg = c.surface },
		BlinkCmpDocSeparator = { fg = c.mgt, bg = c.surface },
		BlinkCmpGhostText = { fg = c.muted },

		BlinkCmpLabel = { fg = c.subtle, bg = "NONE" },
		BlinkCmpLabelDeprecated = { fg = c.muted, bg = "NONE", strikethrough = true },
		BlinkCmpLabelMatch = { fg = c.ylw2, bg = "NONE" },

		BlinkCmpMenu = { fg = c.fg, bg = c.surface },
		BlinkCmpMenuBorder = { fg = c.mgt, bg = c.surface },
		BlinkCmpSignatureHelp = { fg = c.fg, bg = c.surface },
		BlinkCmpSignatureHelpBorder = { fg = c.mgt, bg = c.surface },

		BlinkCmpKindDefault = { fg = c.subtle, bg = "NONE" },

		BlinkCmpKindClass = { link = "Type" },
		BlinkCmpKindColor = { link = "Special" },
		BlinkCmpKindConstant = { link = "Constant" },
		BlinkCmpKindConstructor = { link = "@constructor" },
		BlinkCmpKindEnum = { link = "@lsp.type.enum" },
		BlinkCmpKindEnumMember = { link = "@lsp.type.enumMember" },
		BlinkCmpKindEvent = { link = "Special" },
		BlinkCmpKindField = { link = "@variable.member" },
		-- BlinkCmpKindField = { fg = c.vio2 },
		BlinkCmpKindFile = { link = "Normal" },
		BlinkCmpKindFolder = { link = "Directory" },
		BlinkCmpKindFunction = { link = "Function" },
		BlinkCmpKindInterface = { link = "@lsp.type.interface" },
		BlinkCmpKindKeyword = { link = "Keyword" },
		BlinkCmpKindMethod = { link = "Function" },
		BlinkCmpKindModule = { link = "@module" },
		BlinkCmpKindOperator = { link = "Operator" },
		BlinkCmpKindProperty = { link = "@property" },
		-- BlinkCmpKindProperty = { fg = c.vio2 },
		BlinkCmpKindReference = { link = "@markup.link" },
		BlinkCmpKindSnippet = { link = "Conceal" },
		BlinkCmpKindStruct = { link = "@lsp.type.struct" },
		BlinkCmpKindText = { fg = c.fg },
		BlinkCmpKindTypeParameter = { link = "@lsp.type.typeParameter" },
		BlinkCmpKindUnit = { link = "@lsp.type.struct" },
		BlinkCmpKindValue = { link = "String" },
		BlinkCmpKindVariable = { link = "@variable" },
		-- BlinkCmpKindVariable = { fg = c.vio2 },
		-- idk
		-- BlinkCmpKindCodeium = { fg = palette.b_cyn },
		-- BlinkCmpKindCopilot = { fg = palette.b_cyn },
		-- BlinkCmpKindSupermaven = { fg = palette.b_cyn },
		-- BlinkCmpKindTabNine = { fg = palette.b_cyn },
	}
end

return M

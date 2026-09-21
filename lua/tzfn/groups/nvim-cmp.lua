return function(c, s)
	return {
		CmpItemAbbr = { fg = c.subtle },
		CmpItemAbbrDeprecated = { fg = c.subtle, strikethrough = true },
		CmpItemAbbrMatch = { fg = c.ylw, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = c.fg, bold = s.bold },
		CmpItemKind = { fg = c.subtle },
		CmpItemKindClass = { link = "StorageClass" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindInterface = { link = "Type" },
		CmpItemKindMethod = { link = "Function" },
		CmpItemKindSnippet = { link = "Conceal" },
		CmpItemKindVariable = { fg = c.vio2 },
	}
end

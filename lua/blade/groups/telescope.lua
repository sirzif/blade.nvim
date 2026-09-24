local M = {}

function M.get(c, _)
	return {
		TelescopeNormal = { fg = c.fg, bg = c.surface },
		TelescopeBorder = { fg = c.mgt, bg = c.surface },
		TelescopePromptTitle = { fg = c.ylw2, bg = c.surface },
		TelescopePromptBorder = { fg = c.ylw2, bg = c.surface },
		TelescopeResultsComment = { fg = c.muted },
		TelescopeMatching = { fg = c.ylw2 },
	}
end

return M

local M = {}

function M.get(c, _)
	return {
		TreesitterContext = { bg = c.overlay },
		TreesitterContextLineNumber = { fg = c.cyn2, bg = c.overlay },
	}
end

return M

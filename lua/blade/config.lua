local config = {}

---@class Options
config.options = {
	---Extend background behind borders. Appearance differs based on which
	---border characters you are using.
	extend_background_behind_borders = true,

	enable = {
		terminal = true,
	},

	styles = {
		bold = false,
		italic = true,
		transparency = false,

		---Differentiate between active and inactive windows and panels.
		dim_inactive = false,
	},

	---@type table<string, table<string, string>>
	palette = {},

	---@type table<string, Highlight>
	highlight_groups = {},

	---Called before each highlight group, before setting the highlight.
	---@param group string
	---@param highlight Highlight
	---@param palette Palette
	---@diagnostic disable-next-line: unused-local
	before_highlight = function(group, highlight, palette) end,
}

---@param options Options | nil
function config.extend_options(options)
	config.options = vim.tbl_deep_extend("force", config.options, options or {})
end

return config

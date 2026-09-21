---@alias Palette { bg: string, surface: string, overlay: string, muted: string, subtle: string, fg: string, red: string, grn: string, ylw: string, blu: string, mgt: string, cyn: string,  b_red: string, b_grn: string, b_ylw: string, b_blu: string, b_mgt: string, b_cyn: string, d_red: string, d_grn: string, d_ylw: string, d_blu: string,  hl1: string, hl2: string, hl3: string}
---@alias PaletteColor "bg" | "surface" | "overlay" | "muted" | "subtle" | "fg" | "red" | "grn" | "ylw" | "blu" | "mgt" | "cyn" |  "b_red" | "b_grn" | "b_ylw" | "b_blu" | "b_mgt" | "b_cyn" | "d_red" | "d_grn" | "d_ylw" | "d_blu" | "hl1" | "hl2" | "hl3" | "_nc" | "none"
---@alias Highlight { link: string, inherit: boolean } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, inherit: boolean }

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

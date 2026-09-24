local config = require("blade.config")

local M = {}

local function set_highlights()
	local util = require("blade.util")
	local colors = require("blade.colors")
	local styles = config.options.styles

	local highlights = {}
	local sources = {
		require("blade.groups.base"),
		require("blade.groups.blink"),
		require("blade.groups.nvim-cmp"),
		require("blade.groups.semantic-tokens"),
		require("blade.groups.telescope"),
		require("blade.groups.treesitter"),
		require("blade.groups.treesitter-context"),
	}

	for _, s in ipairs(sources) do
		for k, v in pairs(s.get(colors, styles)) do
			highlights[k] = v
		end
	end

	local transparency_highlights = {
		Normal = { fg = colors.fg, bg = "NONE" },
		NormalNC = { fg = colors.fg, bg = styles.dim_inactive and colors._nc or "NONE" },
		NormalFloat = { bg = "NONE" },
		FloatTitle = { fg = colors.ylw2, bg = "NONE", bold = styles.bold },
		FloatBorder = { fg = colors.mgt, bg = "NONE" },
		Pmenu = { fg = colors.fg, bg = "NONE" },

		TelescopeNormal = { fg = colors.fg, bg = "NONE" },
		TelescopeBorder = { fg = colors.mgt, bg = "NONE" },
		TelescopePromptTitle = { fg = colors.ylw2, bg = "NONE" },
		TelescopePromptBorder = { fg = colors.ylw2, bg = "NONE" },

		BlinkCmpMenu = { fg = colors.fg, bg = "NONE" },
		BlinkCmpMenuBorder = { fg = colors.mgt, bg = "NONE" },
		BlinkCmpSignatureHelp = { fg = colors.fg, bg = "NONE" },
		BlinkCmpSignatureHelpBorder = { fg = colors.mgt, bg = "NONE" },
		BlinkCmpDoc = { fg = colors.fg, bg = "NONE" },
		BlinkCmpDocBorder = { fg = colors.mgt, bg = "NONE" },
		BlinkCmpDocSeparator = { fg = colors.mgt, bg = "NONE" },
	}

	if styles.transparency then
		for group, highlight in pairs(transparency_highlights) do
			highlights[group] = highlight
		end
	end

	-- Reconcile highlights with config
	if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
		for group, highlight in pairs(config.options.highlight_groups) do
			local existing = highlights[group] or {}
			-- Traverse link due to
			-- "If link is used in combination with other attributes; only the link will take effect"
			-- see: https://neovim.io/doc/user/api.html#nvim_set_hl()
			while existing.link ~= nil do
				existing = highlights[existing.link] or {}
			end
			local parsed = vim.tbl_extend("force", {}, highlight)

			if highlight.fg ~= nil then
				parsed.fg = util.parse_color(highlight.fg) or highlight.fg
			end
			if highlight.bg ~= nil then
				parsed.bg = util.parse_color(highlight.bg) or highlight.bg
			end
			if highlight.sp ~= nil then
				parsed.sp = util.parse_color(highlight.sp) or highlight.sp
			end

			if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
				parsed.inherit = nil
				highlights[group] = vim.tbl_extend("force", existing, parsed)
			else
				parsed.inherit = nil
				highlights[group] = parsed
			end
		end
	end

	for group, highlight in pairs(highlights) do
		if config.options.before_highlight ~= nil then
			config.options.before_highlight(group, highlight, colors)
		end

		if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
			highlight.bg = util.blend(highlight.bg, highlight.blend_on or colors.bg, highlight.blend / 100)
		end

		highlight.blend = nil
		highlight.blend_on = nil

		if highlight._nvim_blend ~= nil then
			highlight.blend = highlight._nvim_blend
		end

		vim.api.nvim_set_hl(0, group, highlight)
	end

	--- Terminal
	if config.options.enable.terminal then
		vim.g.terminal_color_0 = colors.bg -- black
		vim.g.terminal_color_8 = colors.muted -- bright black
		vim.g.terminal_color_1 = colors.red -- red
		vim.g.terminal_color_9 = colors.red2 -- bright red
		vim.g.terminal_color_2 = colors.grn -- green
		vim.g.terminal_color_10 = colors.grn2 -- bright green
		vim.g.terminal_color_3 = colors.ylw -- yellow
		vim.g.terminal_color_11 = colors.ylw2 -- bright yellow
		vim.g.terminal_color_4 = colors.blu -- blue
		vim.g.terminal_color_12 = colors.blu2 -- bright blue
		vim.g.terminal_color_5 = colors.mgt -- magenta
		vim.g.terminal_color_13 = colors.mgt2 -- bright magenta
		vim.g.terminal_color_6 = colors.cyn -- cyan
		vim.g.terminal_color_14 = colors.cyn2 -- bright cyan
		vim.g.terminal_color_7 = colors.fg -- white
		vim.g.terminal_color_15 = "#ffffff" -- bright white
	end
end

function M.colorscheme()
	vim.opt.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "blade"

	vim.o.background = "dark"
	set_highlights()
end

---@param options Options
function M.setup(options)
	config.extend_options(options or {})
end

return M

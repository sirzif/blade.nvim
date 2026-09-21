local M = {}
local config = require("tzfn.config")

local function set_highlights()
	local util = require("tzfn.util")
	local palette = require("tzfn.palette")
	local styles = config.options.styles

	local highlights = {}
	local sources = {
		require("tzfn.groups.base")(palette, styles),
		require("tzfn.groups.treesitter")(palette, styles),
		require("tzfn.groups.semantic-tokens")(palette, styles),
		require("tzfn.groups.telescope")(palette, styles),
		require("tzfn.groups.nvim-cmp")(palette, styles),
		require("tzfn.groups.trouble")(palette, styles),
		require("tzfn.groups.treesitter-context")(palette, styles),
		require("tzfn.groups.blink")(palette, styles),
	}
	-- for _, s in ipairs(sources) do
	-- 	highlights = vim.tbl_deep_extend("force", highlights, s)
	-- end

	for _, s in ipairs(sources) do
		for k, v in pairs(s) do
			highlights[k] = v
		end
	end

	local transparency_highlights = {
		Normal = { fg = palette.fg, bg = "NONE" },
		NormalNC = { fg = palette.fg, bg = styles.dim_inactive and palette._nc or "NONE" },
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
			config.options.before_highlight(group, highlight, palette)
		end

		if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
			highlight.bg = util.blend(highlight.bg, highlight.blend_on or palette.bg, highlight.blend / 100)
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
		vim.g.terminal_color_0 = palette.bg -- black
		vim.g.terminal_color_8 = palette.bg_bright -- bright black
		vim.g.terminal_color_1 = palette.red -- red
		vim.g.terminal_color_9 = palette.red2 -- bright red
		vim.g.terminal_color_2 = palette.grn -- green
		vim.g.terminal_color_10 = palette.grn2 -- bright green
		vim.g.terminal_color_3 = palette.ylw -- yellow
		vim.g.terminal_color_11 = palette.ylw2 -- bright yellow
		vim.g.terminal_color_4 = palette.blu -- blue
		vim.g.terminal_color_12 = palette.blu2 -- bright blue
		vim.g.terminal_color_5 = palette.ylw2 -- magenta
		vim.g.terminal_color_13 = palette.ylw2 -- bright magenta
		vim.g.terminal_color_6 = palette.mgt -- cyan
		vim.g.terminal_color_14 = palette.mgt2 -- bright cyan
		vim.g.terminal_color_7 = palette.fg -- white
		vim.g.terminal_color_15 = "#ffffff" -- bright white

		-- Support StatusLineTerm & StatusLineTermNC from vim
		vim.cmd([[
		augroup tzfn
			autocmd!
			autocmd TermOpen * if &buftype=='terminal'
				\|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
				\|else|setlocal winhighlight=|endif
			autocmd ColorSchemePre * autocmd! tzfn
		augroup END
		]])
	end
end

function M.colorscheme()
	vim.opt.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "tzfn"

	vim.o.background = "dark"
	set_highlights()
end

---@param options Options
function M.setup(options)
	config.extend_options(options or {})
end

return M

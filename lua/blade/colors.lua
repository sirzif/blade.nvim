local options = require("blade.config").options
local colors = {
	_nc = "#02050a",
	bg = "#111a21",
	surface = "#1a232b",
	overlay = "#2e373f",

	fg = "#d2d8de",
	subtle = "#84919c",
	muted = "#59656f",

	-- ~AA
	red = "#C66462",
	grn = "#5D8D6A",
	ylw = "#b67209",
	blu = "#7682A1",
	mgt = "#C45D9F",
	cyn = "#208EA0",
	vio = "#8D75C2",

	-- ~AAA
	red2 = "#D79492",
	grn2 = "#89AC93",
	ylw2 = "#dd962b",
	blu2 = "#9DA5BC",
	mgt2 = "#D68DBC",
	cyn2 = "#62B0BC",

	vio2 = "#AD9CD3",

	-- original. not really useful idk
	red3 = "#a30502",
	grn3 = "#3e774e",
	ylw3 = "#e79f38",
	cyn3 = "#027f93",
	mgt3 = "#b53487",
	blu3 = "#406074",
	vio3 = "#5531a4",

	hl1 = "#1f2830",
	hl2 = "#333d44",
	hl3 = "#4d5760",
}

if options.palette and next(options.palette) then
	colors = vim.tbl_extend("force", colors, options.palette)
end

return colors

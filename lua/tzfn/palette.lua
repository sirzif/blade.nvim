local options = require("tzfn.config").options
local palette = {
	_nc = "#000a11",
	bg = "#001018",
	bg_bright = "#516771",
	surface = "#0c2129",
	overlay = "#1c313a",

	fg = "#d7e0e3",
	subtle = "#959da0",
	muted = "#555c5f",

	-- ~AA
	red = "#c25a58",
	grn = "#538661",
	ylw = "#e0731d",
	blu = "#118799",
	mgt = "#866dbe",
	cyn = "#647e8e",

	-- ~AAA
	red2 = "#d48a88",
	grn2 = "#80a58a",
	ylw2 = "#f78b04",
	blu2 = "#53a8b6",
	mgt2 = "#a592cf",
	cyn2 = "#8ca0ac",

	-- original
	red3 = "#a30502",
	grn3 = "#3e774e",
	grn3_1 = "#88b783",
	-- ylw3 = "#f78b04",
	blu3 = "#027f93",
	mgt3 = "#5531a4",
	cyn3 = "#406074",

	hl1 = "#071c25",
	hl2 = "#1b3039",
	hl3 = "#394f59",

	none = "NONE",
}

if options.palette and next(options.palette) then
	palette = vim.tbl_extend("force", palette, options.palette)
end

return palette

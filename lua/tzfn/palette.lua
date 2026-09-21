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

	-- ~aa
	red = "#c35d5b",
	grn = "#558763",
	ylw = "#f78b04",
	blu = "#14889b",
	mgt = "#cf489e",
	cyn = "#658191",
	vio = "#886fbf",

	-- ~aaa
	red2 = "#d48a89",
	grn2 = "#97c8a5",
	ylw2 = "#fcaa45",
	blu2 = "#58abb8",
	mgt2 = "#dd7fbb",
	cyn2 = "#8ca1ad",
	vio2 = "#a794d0",

	-- original
	red3 = "#a30502",
	grn3 = "#3e774e",
	grn3_1 = "#88b783",
	-- ylw3 = "#f78b04",
	blu3 = "#027f93",
	mgt3 = "#c5238a",
	cyn3 = "#406074",
	vio3 = "#5531a4",

	hl1 = "#071c25",
	hl2 = "#1b3039",
	hl3 = "#394f59",

	none = "NONE",
}

if options.palette and next(options.palette) then
	palette = vim.tbl_extend("force", palette, options.palette)
end

return palette

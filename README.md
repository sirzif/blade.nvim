<p align="center">
    <img src="https://media.tenor.com/Vlr5ep-dRXMAAAAM/ryan-gosling-blade-runner2049.gif"/>
    <h2 align="center">Blade</h2>
</p>

<p align="center">Blade Runner 2049 inspired theme for Neovim</p>

<p align="center">
    <img src="https://github.com/sirzif/blade.nvim/blob/main/assets/screenshot.png?raw=true"/>
</p>

## Install

### [lazy.vim](https://github.com/folke/lazy.nvim)

```lua
{
    "sirzif/blade.nvim",
    config = function()
        require("blade").setup({
            enable = {
                terminal = true,
            },
            styles = {
                transparency = true,
            },
        })
    end,
}
```

## Options

```lua
config.options = {
	enable = {
		terminal = true,
	},

	styles = {
		bold = false,
		italic = true,
		transparency = false,
		dim_inactive = false,
	},

	--- Change default palette colors
	palette = {
		red = "#dc143c"
	},

	highlight_groups = {},

	before_highlight = function(group, highlight, palette) end,
}
	
```

## Special Thanks

[rose-pine](https://github.com/rose-pine/neovim/) - for showing da wae

[tokyonight](https://github.com/folke/tokyonight.nvim/) - for showing anotha wae

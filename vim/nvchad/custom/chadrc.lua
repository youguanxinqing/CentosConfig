---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "gruvbox",
	theme_toggle = { "gruvbox", "one_light" },

	hl_override = highlights.override,
	hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

-- customize config
vim.wo.wrap = false
vim.cmd([[hi ColorColumn ctermbg=0 guibg=#242a32]])

return M

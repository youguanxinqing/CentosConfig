---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-c>"] = { "<Esc>", "exit insert mode", opts = { nowait = true } },
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  i = {
    ["<C-c>"] = { "<Esc>", "exit insert mode", opts = { nowait = true } },
  }
}

-- more keybinds!

return M

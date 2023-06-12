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

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
    ["<Leader>qa"] = {
      ":qa<CR>",
      "quit all"
    }
  },

  v = {
    ["gc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<C-f>"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
  },
}

-- more keybinds!

return M

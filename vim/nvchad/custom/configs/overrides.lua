local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"c",
		"markdown",
		"markdown_inline",
		"go",
		"python",
		"rust",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"prettier",

		-- c/cpp stuff
		--
		--  custom
		"pyright",
		"gopls",
		"rust-analyzer",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},

	actions = {
		open_file = {
			resize_window = false,
		},
	},

  filters = {
    custom = { ".git" },
  },
}

M.telescope = {
  defaults = {
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.45,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.93,
      height = 0.95,
      preview_cutoff = 120,
    },
  }
}

return M

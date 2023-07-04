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

return M

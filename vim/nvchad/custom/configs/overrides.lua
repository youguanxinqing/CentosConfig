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
		initial_mode = "insert",
		selection_strategy = "reset",
		layout_strategy = "bottom_pane",
		layout_config = {
			flex = {
				width = 0.9,
			},
			bottom_pane = {
				prompt_position = "top",
			},
			horizontal = {
				prompt_position = "bottom",
				preview_width = 0.5,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			height = 0.70,
			preview_cutoff = 120,
		},
		borderchars = {
			prompt = { "─", " ", "─", " ", "╭", "╮", "╯", "╰" },
			results = { "─", "│", "─", "│", " ", "╮", "╯", "╰" },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
	},
}

M.whichkey = {
	window = {
		border = "double",
	},
}

return M

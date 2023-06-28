local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }

	-- search words
	{
		"ggandor/flit.nvim",
		lazy = false,
		dependencies = {
			{
				"ggandor/leap.nvim",
			},
		},
		config = function()
			require("custom.configs.flit")
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- 'Shatur/neovim-session-manager',
		},
		opts = function()
			local handlers = require("custom.configs.alpha-nvim")

			local dashboard = require("alpha.themes.dashboard")
			return handlers.dashboard_handler(dashboard)
		end,
		config = function(_, dashboard)
			require("alpha").setup(dashboard.opts)
		end,
	},
	{
		"rmagatti/auto-session",
		dependencies = {
			"zwhitchcox/auto-session-nvim-tree",
		},
		lazy = false,
		config = function()
			require("custom.configs.auto-session")
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		config = function()
			require("custom.configs.symbols-outline")
		end,
	},
	{
		"youguanxinqing/bookmark.nvim",
		branch = "youguan",
		lazy = false,
		cmd = { "BookmarkToggle", "BookmarkList", "FilemarkToggle", "FilemarkList" },
		dependencies = {
			"kkharji/sqlite.lua",
		},
		init = function()
			require("core.utils").load_mappings("bookmark")
		end,
		config = function()
			local icons = require("custom.configs.icons")
			require("bookmark").setup({
				sign = icons.ui.BookMark,
				highlight = "Function",
				file_sign = "󱡅",
				file_highlight = "Function",
			})
			require("telescope").load_extension("bookmark")
		end,
	},
	{
		"Mr-LLLLL/interestingwords.nvim",
		keys = { "<leader>k" },
		config = function()
			require("interestingwords").setup({
				colors = { "#aeee00", "#ff0000", "#C4B0FF", "#FFABAB", "#FFEF82", "#62CDFF" },
				search_count = true,
				navigation = true,
				-- search_key = "<leader>m",
				-- cancel_search_key = "<leader>M",
				color_key = "<leader>k",
				cancel_color_key = "<leader>K",
			})
		end,
	},
}

return plugins

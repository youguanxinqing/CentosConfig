local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- fix: attempt to index field 'semanticTokensProvider' (a nil value)
-- refs: https://github.com/neovim/nvim-lspconfig/issues/2542#issuecomment-1547019213
local on_init = function(client, initialization_result)
	local _ = initialization_result
	if client.server_capabilities then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.semanticTokensProvider = false -- turn off semantic tokens
	end
end

lspconfig.lua_ls.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

lspconfig.rust_analyzer.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "rust" },
	root = lspconfig.util.root_pattern("Cargo.toml"),
})

lspconfig.gopls.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root = lspconfig.util.root_pattern("go.mod"),
	-- cmd_env = { GOFLAGS = "-tags=tag1,tag2" },
})

lspconfig.pyright.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
	settings = {
		python = {
			analysis = {
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "basic",
				diagnosticSeverityOverrides = {
					reportGeneralTypeIssues = "none",
				},
			},
		},
	},
})

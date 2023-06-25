local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "rust_analyzer", "gopls", "pyright" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- local custom_on_attach = function (client, bufnr)
--   if client.server_capabilities.documentSymbolProvider then
--     local navic = require "nvim-navic"
--     navic.attach(client, bufnr)
--   end
--   on_attach(client, bufnr)
-- end

--
-- lspconfig.pyright.setup { blabla}
--
--

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "rust" },
	root = lspconfig.util.root_pattern("Cargo.toml"),
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root = lspconfig.util.root_pattern("go.mod"),
	-- cmd_env = { GOFLAGS = "-tags=tag1,tag2" },
})

lspconfig.pyright.setup({
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

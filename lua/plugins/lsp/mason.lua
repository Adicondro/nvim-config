return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",
		-- Plugin tambahan untuk menangani formatters/linters (non-LSP)
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup()

		-- 1. DAFTAR LSP (Hanya yang memiliki protokol Language Server)
		mason_lspconfig.setup({
			ensure_installed = {
				-- Web & JS
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"graphql",
				"emmet_ls",
				"prismals",
				"eslint",
				-- Backend & Systems
				"pyright",
				"ruff",
				"gopls",
				"jdtls",
				"kotlin_language_server",
				"clangd",
				"lua_ls",
			},
		})

		-- 2. DAFTAR TOOLS (Formatters & Linters yang menyebabkan error tadi)
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"goimports",
				"golangci-lint",
				"google-java-format",
				"ktlint",
				"clang-format",
				"sqlfluff",
			},
		})
	end,
}

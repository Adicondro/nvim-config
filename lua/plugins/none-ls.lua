return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		null_ls.setup({
			diagnostics_format = "[#{c}] #{m} (#{s})",
			sources = {
				-- Lua (Konfigurasi Neovim)
				formatting.stylua,

				-- Web Development (JS, TS, React, Next, JSON, CSS, HTML)
				formatting.prettier,

				-- Aktifkan eslint_d untuk diagnosa dan perbaikan cepat (Code Actions)
				require("none-ls.diagnostics.eslint_d"),
				require("none-ls.code_actions.eslint_d"),

				-- Python
				-- RUFF SUDAH DI REMOVE ATAU BELUM ADA
				-- formatting.ruff,
				-- require("none-ls.diagnostics.ruff"),
				--code_actions.ruff,

				-- Solution: Black dan isort
				formatting.black,
				formatting.isort,

				-- Go (Golang)
				formatting.goimports, -- Mengatur import sekaligus formatting
				diagnostics.golangci_lint,

				-- Java
				formatting.google_java_format,

				-- Kotlin
				formatting.ktlint,
				diagnostics.ktlint,

				-- C / C++
				formatting.clang_format,

				-- SQL
				formatting.sqlfluff.with({
					extra_args = { "--dialect", "ansi" },
				}),
			},
		})

		-- Keymap tetap sama, menggunakan filter name = "null-ls" adalah langkah cerdas
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ name = "null-ls" })
		end, { desc = "Format buffer (Multi-tool support)" })
	end,
}

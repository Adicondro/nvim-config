return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    "neovim/nvim-lspconfig", -- Ensure this is here so vim.lsp.config works
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- 1. Configure global capabilities
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- 2. Explicitly enable the servers you want to run
    -- Without these, the binaries installed by Mason will not start.
    local servers = {
      -- Web Development (JS/TS, Frameworks, & Styling)
      "eslint", "ts_ls", "html", "cssls", "tailwindcss",

      -- Python Ecosystem
      "pyright", "ruff",

      -- Systems & Backend (Go & C/C++)
      "gopls", "clangd", "kotlin_language_server",

      -- Configuration & Meta
      "lua_ls",
    }
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}

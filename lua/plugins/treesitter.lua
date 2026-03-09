return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "Bufreadpost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc", "query", -- Dasar Neovim
      "javascript", "typescript", "tsx", -- Web Stack
      "html", "css", "json", "yaml",
      "python", "go", "java", "c", "cpp", "rust", -- Backend & Systems
      "kotlin", -- Mobile
    },
    auto_install = true,
    highlight = { enable = true},
    indent = { enable = true },
  },
}

return {
  "L3MON4D3/LuaSnip",
  -- Versi 2026: Tambahkan build step untuk jsregexp
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

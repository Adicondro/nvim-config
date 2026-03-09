return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    -- FIX 1: Mengatur sessionoptions sesuai rekomendasi checkhealth.
    -- Tanpa 'localoptions', filetype dan highlighting seringkali rusak setelah restore.
    vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    auto_session.setup({
      -- FIX 2: Menggunakan nama key baru sesuai saran checkhealth.
      -- 'auto_restore_enabled' menjadi 'auto_restore'
      -- 'auto_session_suppress_dirs' menjadi 'suppressed_dirs'
      auto_restore = false,
      suppressed_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
      
      -- Opsional: Integrasi dengan Telescope jika Anda menggunakannya
      session_lens = {
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })

    local keymap = vim.keymap
    -- Keymap tetap sama namun ditambahkan deskripsi yang lebih eksplisit
    keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })
    keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for cwd" })
  end,
}

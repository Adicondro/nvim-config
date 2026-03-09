return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header with a color highlight (typically green or blue)
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }
    dashboard.section.header.hl = "String" -- Applies a consistent color to the ASCII art

    -- Helper function for styled buttons
    local function button(sc, txt, keybind)
      -- Formats the text to ensure alignment
      local b = dashboard.button(sc, txt, keybind)
      b.opts.hl = "Function"      -- Color for the icon/text
      b.opts.hl_shortcut = "Type" -- Color for the shortcut key
      return b
    end

    -- Set menu with improved icons and consistent padding
    dashboard.section.buttons.val = {
      button("e",      "*  New File",                "<cmd>ene<CR>"),
      button("SPC ee", "*  Toggle File Explorer",    "<cmd>Neotree filesystem toggle<CR>"),
      button("SPC ff", "*  Find File",              "<cmd>Telescope find_files<CR>"),
      button("SPC fs", "*  Find Word",              "<cmd>Telescope live_grep<CR>"),
      button("SPC wr", "*  Restore Session",       "<cmd>AutoSession restore<CR>"),
      button("q",      "*  Quit Neovim",            "<cmd>qa<CR>"),
    }

    -- Add a footer with a dynamic plugin count or simple quote
    dashboard.section.footer.val = "m0riarty is dead"
    dashboard.section.footer.hl = "Comment"

    -- Adjust layout s]pacing
    dashboard.config.opts.margin = 5
    
    alpha.setup(dashboard.opts)

    -- Disable folding and hide statusline for a cleaner look
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt_local.foldenable = false
        vim.opt_local.laststatus = 0
        vim.opt_local.showtabline = 0
        vim.opt_local.winhighlight = "Normal:None,FloatBorder:None"
      end,
    })
    
    -- Restore statusline when leaving alpha
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      callback = function()
        vim.opt.laststatus = 3
        vim.opt.showtabline = 2
      end,
    })
  end,
}

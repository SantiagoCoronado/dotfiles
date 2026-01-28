return {
  "sainnhe/everforest",
  name = "everforest",
  priority = 1000,
  config = function()
    vim.g.everforest_background = "hard"
    vim.g.everforest_transparent_background = 2
    vim.g.everforest_enable_italic = true
    vim.g.everforest_better_performance = 1
    vim.g.everforest_diagnostic_text_highlight = 1
    vim.g.everforest_diagnostic_virtual_text = "colored"

    vim.cmd.colorscheme("everforest")

    -- Set transparency/opacity to 0.8
    vim.opt.pumblend = 20  -- Popup menu transparency (0-100, 20 = 80% opaque)
    vim.opt.winblend = 20  -- Floating window transparency
  end,
}

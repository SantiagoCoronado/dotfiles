return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    background = { light = "latte", dark = "mocha" },
    transparent_background = true,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = true,
      mini = { enabled = true, indentscope_color = "" },
      telescope = { enabled = true, style = "nvchad" },
      indent_blankline = { enabled = true, scope_color = "lavender", colored_indent_levels = false },
      native_lsp = {
        enabled = true,
        virtual_text = { errors = { "italic" }, hints = { "italic" }, warnings = { "italic" }, information = { "italic" } },
        underlines = { errors = { "underline" }, hints = { "underline" }, warnings = { "underline" }, information = { "underline" } },
        inlay_hints = { background = true },
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
    
    -- Set transparency/opacity to 0.8
    vim.opt.pumblend = 20  -- Popup menu transparency (0-100, 20 = 80% opaque)
    vim.opt.winblend = 20  -- Floating window transparency
  end,
}


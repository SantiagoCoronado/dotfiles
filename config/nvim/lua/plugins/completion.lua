return {
  "echasnovski/mini.completion",
  event = "InsertEnter",
  opts = {
    -- Delay for completion menu to appear (ms)
    delay = { completion = 100, info = 100, signature = 50 },

    -- Show completion window on key press
    window = {
      info = { height = 25, width = 80, border = "rounded" },
      signature = { height = 25, width = 80, border = "rounded" },
    },

    -- LSP completion settings
    lsp_completion = {
      source_func = "completefunc",
      auto_setup = true,
    },

    -- Fallback action when no LSP completion
    fallback_action = "<C-x><C-n>",

    -- Key mappings are set up automatically:
    -- <Tab> / <S-Tab> - cycle through completion items
    -- <CR> - confirm completion
    -- <C-Space> - force show completion
  },
  config = function(_, opts)
    require("mini.completion").setup(opts)

    -- Improve completion experience
    vim.opt.completeopt = "menuone,noinsert,noselect"
    vim.opt.shortmess:append("c") -- Don't show completion messages
  end,
}

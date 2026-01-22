return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = { mappings = false },
    plugins = {
      spelling = true,
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    filter = function(mapping)
      if mapping.desc == "Inside textobject" or mapping.desc == "Around textobject" then
        return false
      end
      if mapping.desc and mapping.desc:find("^Dashboard%-action") then
        return false
      end
      return true
    end,
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>a", group = "+ai" },
        { "<leader><tab>", group = "+tabs" },
        { "<leader>b", group = "+buffer" },
        { "<leader>c", group = "+code" },
        { "<leader>d", group = "+debug" },
        { "<leader>f", group = "+file/find" },
        { "<leader>g", group = "+git" },
        { "<leader>gh", group = "+hunks" },
        { "<leader>l", group = "+lsp" },
        { "<leader>r", group = "+run/repl" },
        { "<leader>q", group = "+quit/session" },
        { "<leader>s", group = "+search" },
        { "<leader>t", group = "+test/terminal" },
        { "<leader>u", group = "+ui" },
        { "<leader>w", group = "+windows" },
        { "<leader>x", group = "+diagnostics/quickfix" },
      },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    local spec = opts.spec
    opts.spec = nil
    wk.setup(opts)
    if spec then
      wk.add(spec)
    end
  end,
}

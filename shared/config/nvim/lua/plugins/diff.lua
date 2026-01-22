return {
  "echasnovski/mini.diff",
  event = "BufReadPre",
  keys = {
    {
      "<leader>go",
      function()
        require("mini.diff").toggle_overlay(0)
      end,
      desc = "Toggle diff overlay",
    },
  },
  opts = {
    view = {
      style = "sign",
      signs = {
        add = "▎",
        change = "▎",
        delete = "",
      },
    },
    mappings = {
      -- Apply hunks inside a visual/operator region
      apply = "gh",
      -- Reset hunks inside a visual/operator region
      reset = "gH",
      -- Hunk range textobject to be used inside operator
      textobject = "gh",
      -- Go to hunk range in corresponding direction
      goto_first = "[H",
      goto_prev = "[h",
      goto_next = "]h",
      goto_last = "]H",
    },
  },
}

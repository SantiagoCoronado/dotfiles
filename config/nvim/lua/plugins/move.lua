return {
  "echasnovski/mini.move",
  keys = {
    { "<M-h>", mode = { "n", "v" }, desc = "Move left" },
    { "<M-j>", mode = { "n", "v" }, desc = "Move down" },
    { "<M-k>", mode = { "n", "v" }, desc = "Move up" },
    { "<M-l>", mode = { "n", "v" }, desc = "Move right" },
  },
  opts = {
    mappings = {
      -- Move visual selection in Visual mode
      left = "<M-h>",
      right = "<M-l>",
      down = "<M-j>",
      up = "<M-k>",
      -- Move current line in Normal mode
      line_left = "<M-h>",
      line_right = "<M-l>",
      line_down = "<M-j>",
      line_up = "<M-k>",
    },
  },
}

return {
  "echasnovski/mini.surround",
  keys = {
    { "gza", desc = "Add surrounding", mode = { "n", "v" } },
    { "gzd", desc = "Delete surrounding" },
    { "gzf", desc = "Find surrounding (right)" },
    { "gzF", desc = "Find surrounding (left)" },
    { "gzh", desc = "Highlight surrounding" },
    { "gzr", desc = "Replace surrounding" },
    { "gzn", desc = "Update n_lines" },
  },
  opts = {
    mappings = {
      add = "gza",
      delete = "gzd",
      find = "gzf",
      find_left = "gzF",
      highlight = "gzh",
      replace = "gzr",
      update_n_lines = "gzn",
    },
  },
}

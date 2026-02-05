return {
  "echasnovski/mini.surround",
  keys = {
    { "sa", desc = "Add surrounding", mode = { "n", "v" } },
    { "sd", desc = "Delete surrounding" },
    { "sf", desc = "Find surrounding (right)" },
    { "sF", desc = "Find surrounding (left)" },
    { "sh", desc = "Highlight surrounding" },
    { "sr", desc = "Replace surrounding" },
    { "sn", desc = "Update n_lines" },
  },
  opts = {
    mappings = {
      add = "sa",
      delete = "sd",
      find = "sf",
      find_left = "sF",
      highlight = "sh",
      replace = "sr",
      update_n_lines = "sn",
    },
  },
}

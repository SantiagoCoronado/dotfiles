return {
  "echasnovski/mini.bracketed",
  event = "VeryLazy",
  opts = {
    -- First-level elements are tables describing behavior of a target:
    -- - <suffix> - single character suffix. Used after `[` / `]` in mappings.
    --              For example, with `b` creates `[B`, `[b`, `]b`, `]B` mappings.
    -- - <options> - table overriding target options.
    buffer = { suffix = "b", options = {} },
    comment = { suffix = "c", options = {} },
    conflict = { suffix = "x", options = {} },
    diagnostic = { suffix = "d", options = {} },
    file = { suffix = "f", options = {} },
    indent = { suffix = "i", options = {} },
    jump = { suffix = "j", options = {} },
    location = { suffix = "l", options = {} },
    oldfile = { suffix = "o", options = {} },
    quickfix = { suffix = "q", options = {} },
    treesitter = { suffix = "t", options = {} },
    undo = { suffix = "u", options = {} },
    window = { suffix = "w", options = {} },
    yank = { suffix = "y", options = {} },
  },
}

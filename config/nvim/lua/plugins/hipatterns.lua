return {
  "echasnovski/mini.hipatterns",
  event = "BufReadPre",
  opts = function()
    local hi = require("mini.hipatterns")
    return {
      highlighters = {
        -- Highlight TODO, FIXME, HACK, NOTE, etc.
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hi.gen_highlighter.hex_color(),
      },
    }
  end,
}

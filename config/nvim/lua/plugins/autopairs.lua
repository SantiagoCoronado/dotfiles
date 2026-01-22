return {
  "echasnovski/mini.pairs",
  event = "InsertEnter",
  opts = {
    modes = { insert = true, command = true, terminal = false },
    -- Skip autopair when next character is one of these
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    -- Skip autopair when the cursor is inside these treesitter nodes
    skip_ts = { "string" },
    -- Skip autopair when next character is closing pair
    -- and there are more closing pairs than opening pairs
    skip_unbalanced = true,
    -- Better deal with markdown code blocks
    markdown = true,
  },
}

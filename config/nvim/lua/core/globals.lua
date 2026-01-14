-- ╭──────────────────────────────────────────────────────────╮
-- │                    Global Variables                       │
-- ╰──────────────────────────────────────────────────────────╯

local g = vim.g

-- Leader keys
g.mapleader = " "
g.maplocalleader = "\\"

-- Providers
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0

-- Netrw (built-in file browser)
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1

-- UI Configuration
g.have_nerd_font = true
g.markdown_recommended_style = 0

-- 42 School
g.user42 = "rmourey-"
g.mail42 = "rmourey-@student.42.fr"

-- Custom globals for feature toggles
g.autoformat_enabled = true
g.diagnostics_enabled = true
g.inlay_hints_enabled = false
g.codelens_enabled = true

-- Icons configuration
g.icons = {
  diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
  git = {
    added = " ",
    modified = " ",
    removed = " ",
  },
  kinds = {
    Array = " ",
    Boolean = "󰨙 ",
    Class = " ",
    Color = " ",
    Constant = "󰏿 ",
    Constructor = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = "󰊕 ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = "󰎠 ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
  },
}


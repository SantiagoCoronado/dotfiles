-- ╭──────────────────────────────────────────────────────────╮
-- │                      Vim Options                          │
-- ╰──────────────────────────────────────────────────────────╯

local opt = vim.opt

-- UI Configuration
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.pumheight = 10
opt.laststatus = 3
opt.cmdheight = 1
opt.conceallevel = 0
opt.showtabline = 0

-- Editor Behavior
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.wrap = false
opt.linebreak = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- Search Configuration
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Performance
opt.updatetime = 200
-- Give more time for multi-key mappings (e.g. <leader> g h s)
-- Short values can cause 3+ key combos to time out
opt.timeout = true
opt.timeoutlen = 750
opt.redrawtime = 1500
-- Allow a bit more time for terminal keycodes to resolve
opt.ttimeoutlen = 50

-- File Management
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.autoread = true

-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.wildmode = "longest:full,full"
opt.wildignore = {
  "*.pyc", "*_build/*", "**/coverage/*", "**/node_modules/*",
  "**/android/*", "**/ios/*", "**/.git/*", "**/dist/*"
}

-- Fold Settings
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldenable = false

-- Neovim specific
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" }
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Fillchars
opt.fillchars = {
  foldopen = "▾",
  foldclose = "▸",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Shortmess
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Smooth scrolling
if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

-- Suppress deprecation warnings from plugins until they update
vim.deprecate = function() end

-- Disable default comment mappings (using Comment.nvim plugin instead)
vim.g.skip_default_comments = true

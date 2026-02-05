-- ╭──────────────────────────────────────────────────────────╮
-- │                      Autocommands                         │
-- ╰──────────────────────────────────────────────────────────╯

local function augroup(name)
  return vim.api.nvim_create_augroup("config_" .. name, { clear = true })
end

-- Check for file changes when focusing vim or entering a buffer
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then
      return
    end
    vim.b[buf].last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "dbout",
    "gitsigns.blame",
    "neo-tree",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Ensure neo-tree buffers are wiped on close to avoid E95 re-open errors
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("neotree_buf_wipe"),
  pattern = "neo-tree",
  callback = function(event)
    vim.bo[event.buf].bufhidden = "wipe"
  end,
})

-- Auto create dir when saving a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Auto toggle relative numbers
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  group = augroup("auto_relative_numbers_on"),
  pattern = "*",
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  group = augroup("auto_relative_numbers_off"),
  pattern = "*",
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      vim.cmd("redraw")
    end
  end,
})

-- Terminal buffer settings (prevent E948 job running errors)
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup("terminal_settings"),
  callback = function(event)
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.bo[event.buf].buflisted = false
    -- Allow closing terminal without confirmation
    vim.api.nvim_create_autocmd("BufHidden", {
      buffer = event.buf,
      callback = function()
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(event.buf) then
            pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
          end
        end)
      end,
    })
  end,
})

-- Prevent modifiable errors in special buffers
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("ensure_modifiable"),
  pattern = "*",
  callback = function(event)
    local buftype = vim.bo[event.buf].buftype
    local filetype = vim.bo[event.buf].filetype
    
    -- Skip special buffers that should remain non-modifiable
    local special_buftypes = { "nofile", "terminal", "prompt", "quickfix", "help" }
    local special_filetypes = { 
      "neo-tree", "Trouble", "qf", "help", "man", "lspinfo", "TelescopePrompt",
      "notify", "noice", "dashboard", "lazy", "mason", "spectre_panel"
    }
    
    if vim.tbl_contains(special_buftypes, buftype) or vim.tbl_contains(special_filetypes, filetype) then
      return
    end
    
    -- For normal files, ensure they're modifiable
    if buftype == "" and not vim.bo[event.buf].readonly then
      vim.bo[event.buf].modifiable = true
    end
  end,
})


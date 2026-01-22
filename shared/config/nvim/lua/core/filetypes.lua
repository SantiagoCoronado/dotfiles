local M = {}

-- Force .h files to be detected as C (not cpp)
vim.filetype.add({
  extension = {
    h = "c",
  },
})

local filetype_specs = {
  {
    pattern = "c",
    callback = function()
      local opt = vim.opt_local
      opt.shiftwidth = 4
      opt.tabstop = 4
      opt.softtabstop = 4
      opt.expandtab = false -- 42 norm uses tabs
      opt.textwidth = 80
      opt.colorcolumn = "81"
    end,
  },
  {
    pattern = "lua",
    callback = function()
      local opt = vim.opt_local
      opt.shiftwidth = 2
      opt.tabstop = 2
      opt.softtabstop = 2
      opt.expandtab = true
    end,
  },
  {
    pattern = "python",
    callback = function()
      local opt = vim.opt_local
      opt.shiftwidth = 4
      opt.tabstop = 4
      opt.softtabstop = 4
      opt.expandtab = true
      opt.textwidth = 88
      opt.colorcolumn = "89"
    end,
  },
  {
    pattern = "rust",
    callback = function()
      local opt = vim.opt_local
      opt.shiftwidth = 4
      opt.tabstop = 4
      opt.expandtab = true
    end,
  },
  {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function()
      local opt = vim.opt_local
      opt.shiftwidth = 2
      opt.tabstop = 2
      opt.softtabstop = 2
      opt.expandtab = true
    end,
  },
  {
    pattern = "go",
    callback = function()
      local opt = vim.opt_local
      opt.shiftwidth = 4
      opt.tabstop = 4
      opt.softtabstop = 4
      opt.expandtab = false
    end,
  },
}

function M.setup()
  for _, spec in ipairs(filetype_specs) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = spec.pattern,
      callback = spec.callback,
    })
  end
end

return M


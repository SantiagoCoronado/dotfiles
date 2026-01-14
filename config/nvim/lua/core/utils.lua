-- ╭──────────────────────────────────────────────────────────╮
-- │                      Utility Functions                    │
-- ╰──────────────────────────────────────────────────────────╯

local M = {}

-- Check if a plugin is installed
function M.has(plugin)
  return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

-- Get plugin opts
function M.opts(name)
  local plugin = require("lazy.core.config").plugins[name]
  if not plugin then
    return {}
  end
  local Plugin = require("lazy.core.plugin")
  return Plugin.values(plugin, "opts", false)
end

-- Execute a function when a plugin loads
function M.on_load(name, fn)
  local Config = require("lazy.core.config")
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

-- Get the root directory based on LSP or git
function M.get_root()
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= "" and vim.loop.fs_realpath(path) or nil
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace and vim.tbl_map(function(ws)
        return vim.uri_to_fname(ws.uri)
      end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
      for _, p in ipairs(paths) do
        local r = vim.loop.fs_realpath(p)
        if path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end
  table.sort(roots, function(a, b)
    return #a > #b
  end)
  local root = roots[1]
  if not root then
    path = path and vim.fs.dirname(path) or vim.loop.cwd()
    root = vim.fs.find({ ".git", "lua" }, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
  end
  return root
end

-- Create a floating terminal
function M.float_term(cmd, opts)
  opts = vim.tbl_deep_extend("force", {
    size = { width = 0.9, height = 0.9 },
  }, opts or {})
  require("lazy.util").float_term(cmd, opts)
end

-- Check if we're in a git repo
function M.is_git_repo()
  local result = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
  return vim.v.shell_error == 0
end

-- Get the current git branch
function M.get_git_branch()
  if M.is_git_repo() then
    local branch = vim.fn.system("git branch --show-current 2>/dev/null")
    return vim.trim(branch)
  end
  return nil
end

-- Merge tables
function M.merge(...)
  return vim.tbl_deep_extend("force", ...)
end

-- Check if a buffer is valid
function M.is_valid_buf(buf)
  return buf and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
end

-- Get listed buffers
function M.get_bufs()
  return vim.tbl_filter(M.is_valid_buf, vim.api.nvim_list_bufs())
end

return M


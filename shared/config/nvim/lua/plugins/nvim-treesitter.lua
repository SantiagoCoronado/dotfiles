return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  lazy = false,
  priority = 900,
  config = function()
    -- Install parsers
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash", "c", "cpp", "diff", "html", "javascript", "jsdoc", "json", "jsonc", "lua", "luadoc", "luap",
        "markdown", "markdown_inline", "python", "query", "regex", "toml", "tsx", "typescript", "vim",
        "vimdoc", "xml", "yaml", "rust", "go", "gomod", "gowork", "gosum",
      },
    })

    -- Enable Neovim's built-in treesitter highlighting
    local function enable_ts_highlight()
      if vim.bo.buftype == "" then
        vim.cmd("filetype detect")
        pcall(vim.treesitter.start)
      end
    end

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufEnter" }, {
      callback = enable_ts_highlight,
    })

    -- Enable for current buffer immediately
    enable_ts_highlight()
  end,
}


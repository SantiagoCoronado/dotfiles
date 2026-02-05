return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format", "ruff_organize_imports" },
      rust = { "rustfmt" },
      go = { "goimports", "gofmt" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
      c = { "c_formatter_42" },
      cpp = { "clang-format" },
      javascript = { "biome", "prettier", stop_after_first = true },
      typescript = { "biome", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettier", stop_after_first = true },
      json = { "biome", "prettier", stop_after_first = true },
      jsonc = { "biome", "prettier", stop_after_first = true },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier", "markdownlint-cli2" },
    },
    format_on_save = function()
      if not vim.g.autoformat_enabled then
        return nil
      end
      return { timeout_ms = 3000, lsp_fallback = true }
    end,
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      c_formatter_42 = {
        command = "c_formatter_42",
        stdin = true,
      },
      biome = {
        prepend_args = { "--no-ignore" },
      },
      prettier = {
        prepend_args = { "--ignore-path", "/dev/null" },
      },
    },
  },
}

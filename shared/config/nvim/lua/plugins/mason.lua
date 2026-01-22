return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "rust-analyzer",
        "gopls",
        "marksman",
        -- Formatters
        "stylua",
        "shfmt",
        "ruff",
        "biome",
        "prettier",
        "rustfmt",
        "goimports",
        "clang-format",
        "markdownlint-cli2",
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}

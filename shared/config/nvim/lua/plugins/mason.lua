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
        -- "pyright",              -- requires npm
        -- "typescript-language-server", -- requires npm
        -- "rust-analyzer",        -- use rustup version
        -- "gopls",                -- requires go
        "marksman",
        -- Formatters
        "stylua",
        "shfmt",
        "ruff",
        -- "biome",                -- requires npm
        "prettier",
        -- "rustfmt",              -- use rustup version
        -- "goimports",            -- requires go
        "clang-format",
        "markdownlint-cli2",
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}

-- LSP configuration using Neovim 0.11+ native API
return {
  dir = vim.fn.stdpath("config"),
  name = "lsp-config",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "mason.nvim", "saghen/blink.cmp" },
  config = function()
    -- Diagnostic configuration
    vim.diagnostic.config({
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = vim.g.icons and vim.g.icons.diagnostics.Error or "",
          [vim.diagnostic.severity.WARN] = vim.g.icons and vim.g.icons.diagnostics.Warn or "",
          [vim.diagnostic.severity.HINT] = vim.g.icons and vim.g.icons.diagnostics.Hint or "",
          [vim.diagnostic.severity.INFO] = vim.g.icons and vim.g.icons.diagnostics.Info or "",
        },
      },
    })

    -- Build capabilities with blink.cmp
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("blink.cmp").get_lsp_capabilities(),
      {
        workspace = {
          fileOperations = { didRename = true, willRename = true },
        },
      }
    )

    -- on_attach for keymaps
    local on_attach = function(client, bufnr)
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end
      map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
      map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
      map("n", "K", vim.lsp.buf.hover, "Hover")
      map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
      map("i", "<c-k>", vim.lsp.buf.signature_help, "Signature Help")
      if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        map("n", "<leader>uh", function()
          local enabled = vim.lsp.inlay_hint.is_enabled()
          vim.lsp.inlay_hint.enable(not enabled)
        end, "Toggle Inlay Hints")
      end
    end

    -- Server configurations using native vim.lsp.config()
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          codeLens = { enable = true },
          completion = { callSnippet = "Replace" },
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.config("pyright", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            typeCheckingMode = "standard",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    })

    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = { command = "clippy" },
          cargo = { allFeatures = true },
        },
      },
    })

    vim.lsp.config("gopls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          gofumpt = true,
          usePlaceholders = true,
          analyses = { unusedparams = true },
        },
      },
    })

    vim.lsp.config("marksman", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Enable all configured servers
    vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "rust_analyzer", "gopls", "marksman" })
  end,
}

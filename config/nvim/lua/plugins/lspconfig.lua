return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    diagnostics = {
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
          [vim.diagnostic.severity.ERROR] = vim.g.icons and vim.g.icons.diagnostics.Error or "",
          [vim.diagnostic.severity.WARN] = vim.g.icons and vim.g.icons.diagnostics.Warn or "",
          [vim.diagnostic.severity.HINT] = vim.g.icons and vim.g.icons.diagnostics.Hint or "",
          [vim.diagnostic.severity.INFO] = vim.g.icons and vim.g.icons.diagnostics.Info or "",
        },
      },
    },
    capabilities = {
      workspace = {
        fileOperations = { didRename = true, willRename = true },
      },
    },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            codeLens = { enable = true },
            completion = { callSnippet = "Replace" },
            diagnostics = { globals = { "vim" } },
          },
        },
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = "standard",
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
      ts_ls = {
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
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = { checkOnSave = { command = "clippy" }, cargo = { allFeatures = true } },
        },
      },
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            usePlaceholders = true,
            analyses = { unusedparams = true },
          },
        },
      },
      marksman = {},
    },
  },
  config = function(_, opts)
    local function setup_diagnostics(dopts)
      if not dopts.diagnostics then return end
      vim.diagnostic.config(vim.deepcopy(dopts.diagnostics))
      if dopts.diagnostics.signs and dopts.diagnostics.signs.text then
        for severity, icon in pairs(dopts.diagnostics.signs.text) do
          local hl = "DiagnosticSign" .. vim.diagnostic.severity[severity]
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
      end
    end

    local function create_on_attach()
      return function(client, bufnr)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
        map("n", "gy", vim.lsp.buf.type_definition, "Goto Type Definition")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
        map("i", "<c-k>", vim.lsp.buf.signature_help, "Signature Help")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format")
        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map("n", "<leader>uh", function()
            local enabled = vim.lsp.inlay_hint.is_enabled()
            vim.lsp.inlay_hint.enable(not enabled)
          end, "Toggle Inlay Hints")
        end
      end
    end

    setup_diagnostics(opts)

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities(),
      opts.capabilities or {}
    )

    local on_attach = create_on_attach()
    local servers = opts.servers or {}
    local function setup_server(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
        on_attach = on_attach,
      }, servers[server] or {})
      require("lspconfig")[server].setup(server_opts)
    end

    local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if ok then
      mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers), handlers = { setup_server } })
    else
      for server, _ in pairs(servers) do setup_server(server) end
    end
  end,
}

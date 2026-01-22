# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository hosts a modular Neovim configuration built around Lazy.nvim. Core behaviour lives under `lua/core/`, plugin declarations in `lua/plugins/`, and filetype-specific defaults in `after/ftplugin/`. Plugin setup is self-contained within each spec. The layout is intentionally slim: modules return tables, avoid global state, and keep heavy setup isolated from unrelated code.

## Commands

### Formatting
- **Format current buffer**: `<leader>cf` (via LSP)
- **Mason UI**: `<leader>cm` or `:Mason`

### LSP Management
- **Install servers**: Mason auto-installs configured entries; open `:Mason` for status
- **Check status**: `:LspInfo`
- **Adjust servers/diagnostics**: `lua/plugins/lspconfig.lua`

### LSP Keybindings
- **Navigation** (via Snacks picker):
  - `gd` - Goto Definition
  - `gD` - Goto Declaration
  - `gr` - References
  - `gI` - Goto Implementation
  - `gy` - Goto Type Definition
  - `gai/gao` - Incoming/Outgoing Calls
- **Code Actions** (Neovim defaults):
  - `gra` - Code Action (use this for "fix available" messages)
  - `grn` - Rename
- **Information**:
  - `K` - Hover documentation
  - `gK` - Signature help
  - `<C-k>` - Signature help (insert mode)
- **Diagnostics**:
  - `<leader>cd` - Line diagnostics float
  - `]d/[d` - Next/prev diagnostic
  - `]e/[e` - Next/prev error
  - `]w/[w` - Next/prev warning
- **Other**:
  - `<leader>cf` - Format buffer
  - `<leader>uh` - Toggle inlay hints

### File Navigation (Snacks)
- `<leader><space>` - Smart file finder
- `<leader>e` - File explorer
- `<leader>/` - Live grep
- `<leader>,` - Buffers
- `<leader>ff/fc/fg/fr` - Files/config/git/recent
- `<leader>sr` - Search and replace (grug-far)

### Git (Snacks)
- `<leader>gb/gl/gs/gd` - Branches/log/status/diff
- `<leader>gi/gp` - GitHub issues/PRs

### Terminal
- `<C-/>` - Toggle terminal
- `<Esc><Esc>` - Exit terminal mode

### Toggle Options (`<leader>u*`)
- `f` - Autoformat
- `s` - Spelling
- `w` - Word wrap
- `l/L` - Line numbers/relative
- `d` - Diagnostics
- `h` - Inlay hints
- `c` - Conceal level
- `m` - Modifiable (fix E21 errors)

### Plugin Management
- **Sync plugins**: `:Lazy sync` or `<leader>ll`
- **Inspect plugin state**: `:Lazy`
- **Add new plugin**: Create a single file under `lua/plugins/` with self-contained configuration

## Architecture

### Modular Structure
```
lua/
├── core/                     # Core options, globals, autocmds, keymaps
└── plugins/                  # Plugin specs (one file per plugin)
after/
└── ftplugin/                 # Filetype-specific buffer-local settings
```

### Key Features
- **Declarative Specs**: Plugin declarations stay lean; each spec carries its own setup
- **Language Hooks**: `after/ftplugin/` adds buffer-local defaults per language
- **Integrated Tooling**: Mason, LSP, and blink.cmp share single points of configuration
- **Health First**: LuaRocks is disabled by default to keep `:checkhealth` passing

### Feature Toggles
Global flags in `lua/core/globals.lua`:
- `vim.g.autoformat_enabled` - Auto-format on save
- `vim.g.diagnostics_enabled` - Show diagnostics
- `vim.g.inlay_hints_enabled` - Show inlay hints (default: false)
- `vim.g.codelens_enabled` - Show code lens

### Supported Languages
LSP servers configured in `lua/plugins/lspconfig.lua`: lua_ls, pyright, ts_ls, rust_analyzer, gopls, marksman. Mason auto-installs formatters: stylua, shfmt, ruff, biome, prettier, rustfmt, goimports, clang-format, markdownlint-cli2.

### Adding New Features
- **New LSP server**: Extend `servers` in `lua/plugins/lspconfig.lua`
- **New formatter**: Add to `ensure_installed` in `lua/plugins/mason.lua`
- **New plugin**: Create a single file under `lua/plugins/`
- **New language tweaks**: Add or edit `after/ftplugin/<filetype>.lua` files

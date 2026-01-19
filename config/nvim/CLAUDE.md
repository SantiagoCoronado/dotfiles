# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository hosts a modular Neovim configuration built around Lazy.nvim. Core behaviour lives under `lua/core/`, plugin declarations in `lua/plugins/`, and filetype-specific defaults in `after/ftplugin/`. Plugin setup is self-contained within each spec. The layout is intentionally slim: modules return tables, avoid global state, and keep heavy setup isolated from unrelated code.

## Commands

### Formatting
- **Format current buffer**: `<leader>cf` (conform.nvim)
- **Inspect formatter map**: `lua/plugins/conform.lua`

### LSP Management
- **Install servers**: Mason auto-installs configured entries; open `:Mason` for status
- **Check status**: `:LspInfo`
- **Adjust servers/diagnostics**: `lua/plugins/lspconfig.lua`

### LSP Keybindings
- **Navigation**:
  - `gd` - Goto Definition
  - `gD` - Goto Declaration
  - `grr` - References (Neovim default)
  - `gri` - Goto Implementation (Neovim default)
  - `grt` - Goto Type Definition (Neovim default)
- **Code Actions**:
  - `gra` - Code Action (use this for "fix available" messages)
  - `grn` - Rename (Neovim default)
- **Information**:
  - `K` - Hover documentation
  - `gK` - Signature help
  - `<C-k>` - Signature help (insert mode)
- **Other**:
  - `<leader>cf` - Format buffer
  - `<leader>uh` - Toggle inlay hints

### Plugin Management
- **Sync plugins**: `:Lazy sync`
- **Inspect plugin state**: `:Lazy`
- **Add new plugin**: Create a single file under `lua/plugins/` with self-contained configuration

## Architecture

### Modular Structure
```
lua/
├── core/                     # Core options, globals, autocmds, keymaps
└── plugins/                  # Plugin specs (one file per plugin + core.lua)
after/
└── ftplugin/                 # Filetype-specific buffer-local settings
```

### Key Features
- **Declarative Specs**: Plugin declarations stay lean; each spec carries its own setup
- **Language Hooks**: `after/ftplugin/` adds buffer-local defaults per language without shelling out
- **Integrated Tooling**: Mason, conform, and LSP configs share single points of configuration
- **Health First**: LuaRocks is disabled by default to keep `:checkhealth` passing

### Supported Languages
Filetype helpers currently target Python, Rust, JavaScript/TypeScript, and Go. LSP coverage (via `lua/plugins/lspconfig.lua`) also includes Lua, HTML/CSS, JSON, SQL, C/C++, and more through Mason.

### Adding New Features
- **New LSP server**: Extend `servers` in `lua/plugins/lspconfig.lua`
- **New formatter**: Update `formatters_by_ft` in `lua/plugins/conform.lua`
- **New plugin**: Create a single file under `lua/plugins/`
- **New language tweaks**: Add or edit `after/ftplugin/<filetype>.lua` files

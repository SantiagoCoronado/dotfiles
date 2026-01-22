# Neovim Configuration

A modern, modular Neovim configuration with excellent organization and extensibility.

For contribution standards and workflows, see [Repository Guidelines](AGENTS.md).

## Structure

```
nvim/
├── init.lua                  # Entry point
├── after/
│   └── ftplugin/            # Per-filetype buffer defaults
│       ├── python.lua, rust.lua, go.lua
│       └── javascript.lua, typescript.lua, *react.lua
├── lua/
│   ├── core/                # Base configuration
│   │   ├── options.lua      # Vim options
│   │   ├── globals.lua      # Global variables
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── autocmds.lua     # Auto commands
│   │   └── lazy.lua         # Lazy.nvim setup (imports plugins/*.lua)
│   └── plugins/             # Plugin specs (one file per plugin)
│       ├── core.lua
│       ├── neo-tree.lua, telescope.lua, gitsigns.lua, ...
│       └── (many single-plugin files)
```

## Features

### Core
- **Lazy.nvim** - Modern plugin manager with lazy loading
- **Modular design** - Clean separation of concerns
- **Performance optimized** - Fast startup time

### UI
- **Catppuccin/Tokyo Night** - Beautiful color schemes
- **Lualine** - Informative statusline
- **Bufferline** - Enhanced buffer management
- **Dashboard** - Custom startup screen
- **Noice** - Enhanced UI for messages, cmdline, and popupmenu

### Editor
- **Neo-tree** - File explorer
- **Telescope** - Fuzzy finder for files, buffers, and more
- **Flash** - Quick navigation
- **Gitsigns** - Git integration
- **Which-key** - Keybinding hints
- **Todo-comments** - Highlight and search TODO comments

### Coding
- **Treesitter** - Advanced syntax highlighting
- **LSP** - Language server protocol support
- **nvim-cmp** - Auto-completion
- **LuaSnip** - Snippet engine
- **Comment.nvim** - Smart commenting
- **nvim-autopairs** - Auto-pairs
- **Trouble** - Pretty diagnostics

### Languages
Specialized support for:
- **Python** - Virtual environment selection, Black, isort
- **Rust** - Rustacean tools, crates.nvim
- **Go** - go.nvim with testing support
- **TypeScript/JavaScript** - typescript-tools, auto-tag
- **Markdown** - Live preview
- **YAML** - Schema validation
- **Docker** - Syntax and tools

## Key Mappings

### General
- `<Space>` - Leader key
- `<C-s>` - Save file
- `<leader>qq` - Quit all

### Navigation
- `<leader><space>` - Find files
- `<leader>bb` - Buffers (Telescope)
- `<leader>/` or `<leader>ss` - Live grep
- `<leader>e` - File explorer

### Code
- `gd` - Go to definition
- `gr` - References
- `K` - Hover documentation
- `<leader>ca` - Code action
- `<leader>cr` - Rename
- `<leader>cf` - Format

### Git
- `]h` / `[h` - Next/prev hunk
- `<leader>ghs` - Stage hunk
- `<leader>ghr` - Reset hunk
- `<leader>ghb` - Blame line
 - `<leader>gc` - Telescope git commits
 - `<leader>gC` - Telescope buffer commits
 - `<leader>gs` - Telescope git status
 - `<leader>gb` - Telescope git branches

### UI
- `<leader>ll` - Lazy plugin manager
- `<leader>cm` - Mason package manager
- `<leader>ui` - Inspect position
- `<leader>uf` - Toggle autoformat

### Sessions
- `<leader>ws` - Save session (cwd)
- `<leader>wr` - Restore session (cwd)
- `<leader>wx` - Delete session (cwd)
- `<leader>wp` - Purge orphaned sessions

## Installation

1. Backup existing configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Clone this configuration:
   ```bash
   git clone <your-repo> ~/.config/nvim
   ```

3. Start Neovim - plugins will auto-install

## Requirements

- Neovim >= 0.10.0
- Git
- Node.js (for some language servers)
- Ripgrep (`rg`) for searching
- A [Nerd Font](https://www.nerdfonts.com/) for icons

## Customization

- Add custom options: Edit `lua/core/options.lua`
- Add keymaps: Edit `lua/core/keymaps.lua`
- Add plugins: Create files in `lua/plugins/`
- Configure LSP: Edit `lua/plugins/lspconfig.lua`
- Filetype defaults: Use `after/ftplugin/<filetype>.lua`
- Add language support plugins: Add files under `lua/plugins/` (e.g., `typescript-tools.lua`, `rustaceanvim.lua`)

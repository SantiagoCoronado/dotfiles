# dotfiles

Multi-platform dotfiles for macOS and Arch Linux. Symlink-based installation — one command to set up everything.

## Quick start

```bash
git clone git@github.com:Mourey/dotfiles.git ~/dotfiles
cd ~/dotfiles

# macOS
./install.sh --macos

# Linux
./install.sh --linux

# Full Arch Linux VPS from scratch
./bootstrap-vps.sh <ssh-host>
```

## What's included

| Category | Tools |
|----------|-------|
| Shell | zsh, oh-my-zsh, starship prompt, atuin history, zoxide, fzf, thefuck, direnv |
| Editor | neovim (lazy.nvim, LSP, treesitter, 25+ plugins) |
| Terminal | ghostty, wezterm, tmux (brutalist monochrome theme) |
| Git | lazygit, delta, gh CLI |
| System | btop, bat, eza, ripgrep, fd, ncdu, dust, duf |
| macOS | sketchybar, karabiner, mise |
| AI | Claude Code (settings, hooks, agents, skills, commands, rules) |

## Structure

```
macos/          macOS-specific configs (zsh, ghostty, git, tmux, sketchybar, karabiner)
linux/          Linux-specific configs (same layout)
shared/         Cross-platform configs (nvim, atuin, starship, btop, gh, lazygit, thefuck, wezterm)
claude/         Claude Code config (symlinked to ~/.claude/)
  settings.json   Permissions, hooks, LSP, plugins
  hooks/          Python hook scripts (logging, TTS, safety guards)
  agents/         Custom subagent personas
  skills/         Auto-invoked workflows
  commands/       Custom slash commands (/user:commit, /user:review, /user:sync, /user:scaffold)
  rules/          Modular instruction files
  scripts/        Per-session logging
  CHEATSHEET.md   Shareable Claude Code setup guide with templates
```

## Prerequisites

**macOS** — install these before running `install.sh`:

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core tools
brew install neovim tmux fzf zoxide bat eza ripgrep fd git-delta lazygit btop ncdu thefuck direnv gh starship

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Shell history + version manager
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
curl https://mise.run | sh

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Claude Code
curl -fsSL https://claude.ai/install.sh | bash
```

**Linux (Arch)** — `bootstrap-vps.sh` handles everything automatically.

## Post-install

```bash
source ~/.zshrc

# Install neovim plugins
nvim --headless "+Lazy! sync" +qa

# Install tmux plugins (prefix + I inside tmux)
~/.tmux/plugins/tpm/bin/install_plugins
```

## Personal overrides

These files are gitignored — use them for machine-specific config:

- `~/.zshrc.local` — extra aliases, paths, env vars
- `CLAUDE.local.md` — personal Claude Code instructions
- `.claude/settings.local.json` — personal permission overrides
- `~/.claude/.env` — API keys (ElevenLabs, OpenAI, etc.)

## Claude Code commands

| Command | Description |
|---------|-------------|
| `/user:commit` | Review changes and create a commit |
| `/user:review` | Audit uncommitted changes for issues |
| `/user:sync --macos` | Run install.sh and verify all symlinks |
| `/user:scaffold` | Scaffold a .claude folder in any project |

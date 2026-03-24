# dotfiles

Personal development environment for macOS and Arch Linux. One command creates symlinks from this repo to your home directory — your configs stay in git, your system stays in sync.

## Install

### macOS (existing machine)

**1. Install prerequisites:**

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core tools
brew install neovim tmux fzf zoxide bat eza ripgrep fd git-delta \
             lazygit btop ncdu thefuck direnv gh starship

# Oh My Zsh + plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Atuin (shell history) + Mise (version manager) + TPM (tmux plugins)
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
curl https://mise.run | sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Claude Code (optional)
curl -fsSL https://claude.ai/install.sh | bash
```

**2. Clone and install:**

```bash
git clone git@github.com:Mourey/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh --macos
source ~/.zshrc
```

**3. Finish setup:**

```bash
# Neovim plugins
nvim --headless "+Lazy! sync" +qa

# Tmux plugins (or press prefix + I inside tmux)
~/.tmux/plugins/tpm/bin/install_plugins
```

### Arch Linux VPS (from scratch)

One command bootstraps everything — packages, shell, plugins, configs:

```bash
./bootstrap-vps.sh <ssh-host>
```

This SSHs into the host, installs all packages via pacman, sets up oh-my-zsh/starship/atuin/mise/tpm, clones this repo, runs `install.sh --linux`, and installs neovim + tmux plugins.

## What `install.sh` does

It creates symbolic links from your `~/.config/` and `~/` to files in this repo. Nothing is copied — editing a config file edits the repo directly.

```
~/.zshrc           →  ~/dotfiles/macos/zshrc          (or linux/)
~/.config/nvim/    →  ~/dotfiles/shared/config/nvim/
~/.config/tmux/    →  ~/dotfiles/macos/config/tmux/    (or linux/)
~/.claude/settings.json  →  ~/dotfiles/claude/settings.json
...etc
```

Run `install.sh` again after pulling updates. It's idempotent.

## What's included

| Category | Tools |
|----------|-------|
| **Shell** | zsh, oh-my-zsh, starship prompt, atuin history, zoxide, fzf, thefuck, direnv |
| **Editor** | neovim (lazy.nvim, LSP, treesitter, 25+ plugins) |
| **Terminal** | ghostty, wezterm, tmux (brutalist monochrome theme) |
| **Git** | lazygit, delta, gh CLI |
| **System** | btop, bat, eza, ripgrep, fd, ncdu |
| **macOS only** | sketchybar (status bar), karabiner (keyboard remapping) |
| **Claude Code** | hooks, agents, skills, commands, rules, per-session logging |

## Repo structure

```
dotfiles/
├── install.sh              # Symlink installer (--macos or --linux)
├── bootstrap-vps.sh        # Full Arch Linux VPS setup
├── CLAUDE.md               # Claude Code project instructions
│
├── macos/                  # macOS-specific
│   ├── zshrc
│   ├── zprofile
│   └── config/             # ghostty, git, npm, tmux, sketchybar, karabiner
│
├── linux/                  # Linux-specific (same layout as macos/)
│   ├── zshrc
│   ├── zprofile
│   └── config/
│
├── shared/                 # Cross-platform
│   ├── zshenv
│   └── config/             # nvim, atuin, starship, btop, gh, lazygit, thefuck, wezterm
│
└── claude/                 # Claude Code (symlinked to ~/.claude/)
    ├── settings.json       # Permissions, hooks, LSP, plugins
    ├── hooks/              # Python hook scripts (safety guards, logging, TTS)
    ├── agents/             # Custom subagent personas (6)
    ├── skills/             # Auto-invoked workflows (3)
    ├── commands/           # Slash commands: /user:commit, /user:review, /user:sync, /user:scaffold
    ├── rules/              # Modular instructions (security, conventions)
    ├── scripts/            # Per-session structured logging
    └── CHEATSHEET.md       # Shareable Claude Code setup guide with templates
```

## Personal overrides

These files are **gitignored** — use them for anything machine-specific:

| File | Purpose |
|------|---------|
| `~/.zshrc.local` | Extra aliases, paths, env vars that only apply to this machine |
| `CLAUDE.local.md` | Personal Claude Code instructions (coding style, preferences) |
| `.claude/settings.local.json` | Permission overrides you don't want committed |
| `~/.claude/.env` | API keys for TTS hooks (ElevenLabs, OpenAI) |

## Updating

```bash
cd ~/dotfiles
git pull
./install.sh --macos  # re-link any new configs
source ~/.zshrc
```

## Claude Code commands

These are available globally in any project:

| Command | What it does |
|---------|-------------|
| `/user:commit` | Reviews changes, stages files, creates a commit with a clear message |
| `/user:review` | Audits uncommitted changes for secrets, wrong directories, missing updates |
| `/user:sync --macos` | Runs install.sh and verifies every symlink is correct |
| `/user:scaffold` | Scaffolds a complete `.claude/` folder in any new project |

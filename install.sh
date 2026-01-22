#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"

# Determine platform
if [[ "$1" == "--macos" ]]; then
    PLATFORM="macos"
elif [[ "$1" == "--linux" ]]; then
    PLATFORM="linux"
else
    echo "Usage: ./install.sh [--macos | --linux]"
    exit 1
fi

PLATFORM_DIR="$DOTFILES_DIR/$PLATFORM"
SHARED_DIR="$DOTFILES_DIR/shared"

echo "Installing dotfiles for $PLATFORM from $DOTFILES_DIR"

mkdir -p "$CONFIG_DIR"/git "$CONFIG_DIR"/npm

# Shell files (platform-specific + shared)
ln -sf "$PLATFORM_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$PLATFORM_DIR/zprofile" "$HOME/.zprofile"
ln -sf "$SHARED_DIR/zshenv" "$HOME/.zshenv"

# Platform-specific configs
ln -sf "$PLATFORM_DIR/config/git/config" "$CONFIG_DIR/git/config"
ln -sf "$PLATFORM_DIR/config/npm/npmrc" "$CONFIG_DIR/npm/npmrc"

# Platform-specific directories
for dir in tmux ghostty; do
    rm -rf "$CONFIG_DIR/$dir"
    ln -sf "$PLATFORM_DIR/config/$dir" "$CONFIG_DIR/$dir"
done

# Shared configs
ln -sf "$SHARED_DIR/config/starship.toml" "$CONFIG_DIR/starship.toml"
rm -rf "$CONFIG_DIR/nvim"
ln -sf "$SHARED_DIR/config/nvim" "$CONFIG_DIR/nvim"
rm -rf "$CONFIG_DIR/atuin"
ln -sf "$SHARED_DIR/config/atuin" "$CONFIG_DIR/atuin"

echo "Dotfiles installed successfully for $PLATFORM!"
echo "Run: source ~/.zshrc"

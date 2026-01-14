#!/bin/bash
# Dotfiles installation script
# Usage: ./install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create config directories
mkdir -p "$CONFIG_DIR"/{git,npm}

# Symlink shell files
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES_DIR/zprofile" "$HOME/.zprofile"

# Symlink individual config files
ln -sf "$DOTFILES_DIR/config/git/config" "$CONFIG_DIR/git/config"
ln -sf "$DOTFILES_DIR/config/npm/npmrc" "$CONFIG_DIR/npm/npmrc"
ln -sf "$DOTFILES_DIR/config/starship.toml" "$CONFIG_DIR/starship.toml"

# Symlink config directories
for dir in nvim tmux ghostty aerospace atuin; do
    if [ -d "$DOTFILES_DIR/config/$dir" ]; then
        rm -rf "$CONFIG_DIR/$dir"
        ln -sf "$DOTFILES_DIR/config/$dir" "$CONFIG_DIR/$dir"
    fi
done

echo "Dotfiles installed successfully!"
echo "Run: source ~/.zshrc"

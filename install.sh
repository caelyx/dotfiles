#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink dotfiles
for x in muttrc muttrc.color pythonrc screenrc vimrc gvimrc zshrc gitconfig; do
    target="$HOME/.$x"
    if [[ -L "$target" ]]; then
        echo "Skipping $x (symlink exists)"
    elif [[ -e "$target" ]]; then
        echo "Warning: $target exists and is not a symlink - skipping"
    else
        ln -s "$DOTFILES_DIR/$x" "$target"
        echo "Linked $x"
    fi
done

# macOS-specific setup
if [[ "$OSTYPE" == darwin* ]]; then
    # Put Containerfile.base for agent sandbox in the right place for Apple Containers
    mkdir -p "$HOME/.config/containers"
    ln -s "$DOTFILES_DIR/Containerfile.base" "$HOME/.config/containers/
fi

# Vim plugins (native packages)
PACK_DIR="$HOME/.vim/pack/plugins/start"
mkdir -p "$PACK_DIR"

plugins=(
    "https://github.com/scrooloose/nerdtree"
    "https://github.com/tpope/vim-vividchalk"
    "https://github.com/vimwiki/vimwiki"
    "https://github.com/jamessan/vim-gnupg"
    "https://github.com/vim-airline/vim-airline"
    "https://github.com/parkr/vim-jekyll"
    "https://github.com/preservim/vim-pencil"
    "https://github.com/tpope/vim-commentary"
)

for url in "${plugins[@]}"; do
    dirname=$(basename "$url")
    target="$PACK_DIR/$dirname"
    if [[ -d "$target" ]]; then
        echo "Updating $dirname..."
        git -C "$target" pull --quiet
    else
        echo "Cloning $dirname..."
        git clone --quiet "$url" "$target"
    fi
done

#!/bin/bash

set -e

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

brew install \
  antidote \
  bun \
  cloud-sql-proxy \
  composer \
  direnv \
  gh \
  go \
  kubectl \
  oci-cli \
  php \
  rust \
  starship \
  hashicorp/tap/terraform \
  vite-plus \
  wget

brew install --cask \
  codex \
  dropbox \
  firefox \
  homebrew/cask-fonts/font-jetbrains-mono-nerd-font \
  google-chrome \
  google-cloud-sdk \
  orbstack \
  paw \
  sizzy \
  spotify \
  telegram \
  zed

mkdir -p ~/.config

cp .zshrc ~/.zshrc
cp .zsh_plugins.txt ~/.zsh_plugins.txt
cp starship.toml ~/.config/starship.toml
terraform -install-autocomplete

echo "Done."

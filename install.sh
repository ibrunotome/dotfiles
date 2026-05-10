#!/bin/bash

set -e

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

brew tap homebrew/cask-fonts

brew install \
  cloud-sql-proxy \
  composer \
  direnv \
  go \
  kubectl \
  node \
  orbstack \
  php \
  rust \
  starship \
  wget \
  zsh-autosuggestions \
  zsh-syntax-highlighting

brew install --cask \
  dropbox \
  firefox \
  font-jetbrains-mono-nerd-font \
  google-chrome \
  google-cloud-sdk \
  jetbrains-toolbox \
  lens \
  paw \
  sizzy \
  spotify \
  telegram \
  zed

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

mkdir -p ~/.config

cp .zshrc ~/.zshrc
cp starship.toml ~/.config/starship.toml

echo "Done."

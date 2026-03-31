#!/bin/bash

set -e

if ! xcode-select -p &>/dev/null; then
  echo "Installing Command Line Tools..."
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

  PROD=$(softwareupdate -l | grep -B 1 "Command Line Tools" | awk -F"*" '/\*/ {print $2}' | sed 's/^ *//')

  if [ -z "$PROD" ]; then
    echo "Failed to find Command Line Tools package. Install manually and re-run."
    exit 1
  fi

  softwareupdate -i "$PROD" --verbose || {
    echo "Automatic install failed. Install manually and re-run."
    exit 1
  }

  rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

  sudo xcode-select -switch /Library/Developer/CommandLineTools || true
  sudo xcodebuild -license accept || true
fi

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

brew tap homebrew/cask-fonts

brew install \
  direnv \
  orbstack \
  go \
  rust \
  kubectl \
  node \
  php \
  composer \
  starship \
  cloud-sql-proxy \
  wget \
  zsh-autosuggestions \
  zsh-syntax-highlighting

brew install --cask \
  dropbox \
  firefox \
  google-chrome \
  google-cloud-sdk \
  jetbrains-toolbox \
  lens \
  paw \
  sizzy \
  spotify \
  telegram \
  visual-studio-code \
  font-jetbrains-mono-nerd-font

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

mkdir -p ~/.config

cp .zshrc ~/.zshrc
cp starship.toml ~/.config/starship.toml

echo "Done."

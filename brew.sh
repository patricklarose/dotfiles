#!/usr/bin/env bash

# Install Homebrew | https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update and upgrade Homebrew
brew update && brew upgrade

# Install applications
brew install cask \
  firefox \
  visual-studio-code \
  audacity \
  vlc \
  virtualbox \
  wireshark \
  anki \
  vim \
  docker \
  gnupg \
  wget \
  tree \
  htop \
  neofetch \
  exiftool \
  nmap \
  openvpn \
  speedtest-cli \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  font-source-code-pro

# Delete old and unused formulas/casks
brew cleanup

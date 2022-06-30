#!/usr/bin/env bash

# Install Homebrew | https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update and upgrade Homebrew
brew update && brew upgrade

# Install GUI applications | Cask
brew install cask
brew install --cask firefox
brew install --cask visual-studio-code
brew install --cask audacity
brew install --cask vlc
brew install --cask virtualbox
brew install --cask wireshark
brew install --cask anki

# Install CLI applications | Formula
brew install vim
brew install docker
brew install gnupg
brew install wget
brew install tree
brew install htop
brew install neofetch
brew install exiftool
brew install nmap
brew install openvpn
brew install speedtest-cli

# Install zsh plugins
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# Install Source Code Pro font
brew tap homebrew/cask-fonts
brew install svn
brew install font-source-code-pro

# Delete old and unused formulas/casks
brew cleanup

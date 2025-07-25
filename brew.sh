#!/usr/bin/env bash

# Check if Homebrew is installed | https://brew.sh
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew analytics off

brew update && brew upgrade

# Install applications
brew install cask \
  firefox \
  visual-studio-code \
  audacity \
  vlc \
  ffmpeg \
  virtualbox \
  wireshark \
  anki \
  obsidian \
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
  zotero \
  hugo \
  git \
  calibre \
  cura \
  node \
  httpd \
  php \
  mysql \
  phpmyadmin \
  coreutils \
  proxychains-ng \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  font-source-code-pro \
  font-fira-code \
  font-ibm-plex-mono \
  font-terminus \
  font-departure-mono \
  font-jetbrains-mono \
  font-cascadia-code \  
  font-ubuntu-mono

# Delete old and unused formulas/casks
brew cleanup

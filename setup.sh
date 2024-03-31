#!/bin/bash

# Warn user that script will overwrite files
echo "WARNING! This script will overwrite existing files."
read -p "Are you sure you want to continue? [y/n]: " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled. No changes were made."
    exit 1
fi

# Define the source directory of dotfiles
dotfiles_dir=$PWD

# Define the list of dotfiles to manage
dotfiles=(".zshrc" ".vimrc" ".gitconfig" ".hushlogin" ".macos")

# Loop through the list of dotfiles
for dotfile in "${dotfiles[@]}"; do
  # Create a symbolic link in the home directory to the corresponding file in the dotfiles directory
  ln -sf $dotfiles_dir/$dotfile $HOME/$dotfile
done

# Output success message
echo "Dotfiles have been linked."

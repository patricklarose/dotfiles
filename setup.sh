#!/bin/bash

# Define color variables
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
NC='\e[0m' # No Color

# Warn user that script will overwrite files
echo -e "${RED}WARNING!${YELLOW} This script will overwrite existing files.${NC}"
read -p "Are you sure you want to continue? [y/n]: " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Operation cancelled. No changes were made.${NC}"
    exit 1
fi

# Define the source directory of dotfiles
dotfiles_dir=$PWD

# Define the backup directory and create it if it doesn't exist
backup_dir="$HOME/dotfiles_backup"
mkdir -p "$backup_dir"

# Define the list of dotfiles to manage
dotfiles=(".zshrc" ".vimrc" ".gitconfig" ".hushlogin" ".macos")

# Loop through the list of dotfiles
for dotfile in "${dotfiles[@]}"; do
    # Check if the target file already exists and back it up with .bak extension
    if [ -f "$HOME/$dotfile" ]; then
        echo "Backing up existing $dotfile to $backup_dir."
        mv "$HOME/$dotfile" "$backup_dir/${dotfile}.bak"
    fi
    # Create a symbolic link in the home directory to the corresponding file in the dotfiles directory
    echo "Linking $dotfile to home directory."
    ln -sf $dotfiles_dir/$dotfile $HOME/$dotfile
done

# Output success message
echo -e "${GREEN}Dotfiles have been successfully linked!${NC}"

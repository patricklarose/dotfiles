#!/bin/bash

if ! command -v code &> /dev/null; then
    echo "Error: Visual Studio Code is not installed or 'code' is not in PATH"
    exit 1
fi

extensions=(
    "ms-python.python"
    "ms-toolsai.jupyter"
    "ms-vscode.cpptools"
    "platformio.platformio-ide"
    "ms-vscode-remote.remote-ssh"
    "ms-vscode.live-server"
    "github.remotehub"
    "github.vscode-pull-request-github"
    "dracula-theme.theme-dracula"
)

for extension in "${extensions[@]}"; do
    echo "Installing extension: $extension"
    code --install-extension "$extension" --force
done

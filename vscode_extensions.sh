#!/bin/bash

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

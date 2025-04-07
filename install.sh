#!/bin/bash

# List of URLs to open
urls=(
"https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal"
"https://github.com/rxhanson/Rectangle/releases/download/v0.87/Rectangle0.87.dmg"
"https://iterm2.com/downloads/stable/latest"
"https://github.com/powerline/fonts"
"https://windsurf.com/editor/download-confirmation?code=ma"
"https://www.jetbrains.com/idea/download/download-thanks.html?platform=mac&code=IIC"
"https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh"
"https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh"
"https://iterm2colorschemes.com/"
)


# Loop through the list of URLs and open them in the default web browser
for url in "${urls[@]}"; do
    open "$url"  # On macOS, use `open`. On Linux, use `xdg-open`.
done


curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
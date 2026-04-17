#!/usr/bin/zsh

# Automaticly updated by update-packages.sh
packages='amd-ucode arc-gtk-theme awww base base-devel bear bluez bluez-utils breeze clangd-bin cmake dolphin efibootmgr fd ghostty git grub gst-plugin-pipewire keyd libpulse linux linux-firmware lua-language-server man-db man-pages neovim networkmanager pipewire pipewire-alsa pipewire-jack pipewire-pulse premake qt6ct rofi sudo sway tree-sitter-cli-git ttf-jetbrains-mono-nerd wireplumber wpa_supplicant yay yay-debug zen-browser-bin zsh'

# Check if yay is installed
if command -v yay &> /dev/null; then
	yay -Syu --needed ${=packages}
else
	echo -e "yay not installed"
fi

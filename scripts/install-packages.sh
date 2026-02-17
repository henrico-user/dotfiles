#!/usr/bin/zsh

# Automaticly updated by update-packages.sh
packages='amd-ucode base base-devel discord efibootmgr ghostty git grub hyprland linux linux-firmware man-db man-pages neovim networkmanager openssh rofi stow sudo swww ttf-jetbrains-mono-nerd waybar wpa_supplicant yay zen-browser-bin zsh'

# Check if yay is installed
if command -v yay &> /dev/null; then
	yay -Syu --needed ${=packages}
else
	echo -e "\e[31myay not installed\e[0m"
fi

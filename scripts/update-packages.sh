#!/usr/bin/zsh

packages=$( \
# List all manual installed packages
pacman -Qe | \
# Print every line to the first space of the line and a \n after every parsed line
awk '{print $1}' | \
# Replace every \n which a <space>
tr '\n' ' ' | \
# Replace last <space> whicth a \n
sed 's/ $/\n/')

sed -i "s/^packages=.*/packages='${packages}'/" $HOME/dotfiles/scripts/install-packages.sh

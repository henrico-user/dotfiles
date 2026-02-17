#! /usr/bin/zsh

function stowing() {
	if [[ $PWD == $HOME/dotfiles ]]; then
		stow --no-folding --ignore=scripts .
	else
		echo 'Wrong cwd (run script in $HOME/dotfiles)'
	fi
}

if [[ -d "$HOME/dotfiles" ]]; then
	stowing
else
	echo -e '$HOME/dotfiles does not exist'
fi


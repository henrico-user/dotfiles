#! /usr/bin/zsh

if [[ $PWD == $HOME ]]; then
	echo jap
else
	echo -e '\e[31mWrong cwd (run script in $HOME)\e[0m'
fi

#! /bin/bash
# Moving the config files in their location
# #########################################
# Usage:
# Make sure this file has execute permission, otherwise:
# chmod +x install.sh
# Moving the dotfiles:
# ./install.sh
# Deleting the dotfiles:
# ./install.sh -r
# #########################################

# Delete dotfiles utility
if [ "$1" = "-r" ] ; then
	read -p "Are you sure you want to delete the dotfiles? y/n: " response
	if [ "$response" = "y" ] ; then 
		rm ~/.bash_aliases
		rm ~/.tmux.conf
		rm -r ~/.config/nvim
		echo "Dotfiles deleted successfully!"
	elif [ "$response" = "n" ] ; then
		echo "Exiting the program."
	else
		echo "Invalid option!"
	fi
	exit 0
fi

# Tmux configuration
cp tmux/.tmux.conf ~/.tmux.conf

# Neovim configuration
if [ ! -d "~/.config/nvim" ] ; then 
	echo -e "\033[0;33mW: You may need to install vim-plug see: https://github.com/junegunn/vim-plug#neovim\033[0m"
	echo "Configuration directory for Neovim doesn't exist... Creating one..."
	mkdir ~/.config/nvim
fi
cp nvim/init.vim ~/.config/nvim/init.vim

# Bash aliases
cp bash/.bash_aliases ~/.bash_aliases

echo "Dotfiles copied succesfully!"

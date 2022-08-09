#! /bin/bash
# Moving the config files in their location
# #########################################
# Usage:
# Make sure this file has execute permission, otherwise:
# chmod +x install.sh
# Installing the dotfiles:
# ./install.sh
# Deleting the dotfiles:
# ./install.sh -r
# Help menu:
# ./install.sh -h
# ./install.sh --help
# #########################################

# Delete dotfiles utility
if [ "$1" = "-r" ] ; then
	read -p "Are you sure you want to delete the dotfiles? y/n: " response
	if [ "$response" = "y" ] ; then 
		rm "/home/$USER/.bash_aliases"
		rm "/home/$USER/.tmux.conf"
		rm -r "/home/$USER/.config/nvim"
		echo "Dotfiles deleted successfully!"
	elif [ "$response" = "n" ] ; then
		echo "Exiting the program."
	else
		echo "Invalid option!"
	fi
	exit 0
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo -e "Usage: 
    Make sure this file has execute permission, otherwise:
        chmod +x install.sh

    Installing the dotfiles:
        ./install.sh

    Deleting the dotfiles:
        ./install.sh -r

    Help menu (Displays this text):
        ./install.sh -h
        ./install.sh --help
"
    exit 0
fi

# Tmux configuration
cp tmux/.tmux.conf "/home/$USER/.tmux.conf"

# Neovim configuration
if [ ! -d "/home/$USER/.config/nvim" ] ; then 
	echo -e "\033[0;33mW: You may need to install vim-plug see: \
https://github.com/junegunn/vim-plug#neovim\033[0m"
	echo "Configuration directory for Neovim doesn't exist... Creating one..."
	mkdir "/home/$USER/.config/nvim"
fi
cp -r nvim "/home/$USER/.config"

echo "Dotfiles installed succesfully!"

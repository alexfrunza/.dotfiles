#!/bin/bash

# You must update the array manually for new configurations

# Other defaults for mac
DEFAULT_DIRS=("tmux" "nvim" "jetbrains")
# DEFAULT_DIRS=("tmux" "clang-format" "bin" "nvim" "fonts" "neofetch" "jetbrains")

# Available configurations for launchers
launchers=("rofi" "none")

# Available configurations for window manager
wms=("sway" "i3" "none")

# Available configurations for status bars
bars=("waybar" "i3status" "none")

# Available configurations for distro
distros=("debian" "fedora" "tuxedo" "mac")

# Available configurations for terminal emulator
terminals=("kitty" "foot" "none")

display_servers=("wayland" "xorg" "none")

# Checks array to not allow wayland and xorg configurations at the same time
x_elements=("i3status" "i3")
wayland_elements=("sway" "waybar" "none")

# Things available only in xorg or only in wayland, one array must be used
x_specific=("picom")
wayland_specific=()

# End available configurations - the part from up there must be manually updated

WINDOW_MANAGER=		# a value from wms array from up there
BAR=			# a value from bars array from up there
DISPLAY_SERVER=         # a value from display servers array from up there
DISTRO=			# a value from distros array from up there
TERMINAL=		# a value from terminals array from up there
LAUNCHER=               # a value from launchers array from up there

printf "\n\
Hello, welcome to setting variables script!\n\
Respond to this short questions to know how to configure the environment.\n\
\n"

while true; do
	echo "What distro do you want to use? Options:"
	for i in ${!distros[@]}; do
		echo "$((i + 1)). ${distros[$i]}"
	done

	read -p "Enter the name of your option: " DISTRO
	echo ""

	if [[ ! " ${distros[*]} " =~ " ${DISTRO} " ]]; then
		echo "Your choice is not on the list! Try again."
		continue
	fi
	
	break
done

while true; do
	echo "What display server do you want to use? Options:"
	for i in ${!display_servers[@]}; do
		echo "$((i + 1)). ${display_servers[$i]}"
	done

	read -p "Enter the name of your option: " DISPLAY_SERVER
	echo ""

	if [[ ! " ${display_servers[*]} " =~ " ${DISPLAY_SERVER} " ]]; then
		echo "Your choice is not on the list! Try again."
		continue
	fi
	
	break
done

# Get available choices for wayland or xorg
wms_choice=()
bars_choice=()

if [[ $DISPLAY_SERVER == "xorg" ]]; then
	for element in ${x_elements[*]}; do
		if [[ " ${wms[*]} " =~ " ${element} " ]]; then
			wms_choice+=($element)
		fi

		if [[ " ${bars[*]} " =~ " ${element} " ]]; then
			bars_choice+=($element)
		fi

	done
fi

if [[ $DISPLAY_SERVER == "wayland" ]]; then
	for element in ${wayland_elements[*]}; do
		if [[ " ${wms[*]} " =~ " ${element} " ]]; then
			wms_choice+=($element)
		fi

		if [[ " ${bars[*]} " =~ " ${element} " ]]; then
			bars_choice+=($element)
		fi
	done
fi


while true; do
	echo "What window manager do you want to use? Options:"
	for i in ${!wms_choice[@]}; do
		echo "$((i + 1)). ${wms_choice[$i]}"
	done

	read -p "Enter the name of your option: " WINDOW_MANAGER
	echo ""

	if [[ ! " ${wms_choice[*]} " =~ " ${WINDOW_MANAGER} " ]]; then
		echo "Your choice is not on the list! Try again."
		continue
	fi
	
	break
done

while true; do
	echo "What bar do you want to use? Options:"
	for i in ${!bars_choice[@]}; do
		echo "$((i + 1)). ${bars_choice[$i]}"
	done

	read -p "Enter the name of your option: " BAR
	echo ""

	if [[ ! " ${bars_choice[*]} " =~ " ${BAR} " ]]; then
		echo "Your choice is not on the list! Try again."
		continue
	fi
	
	break
done

while true; do
	echo "What terminal do you want to use? Options:"
	for i in ${!terminals[@]}; do
		echo "$((i + 1)). ${terminals[$i]}"
	done

	read -p "Enter the name of your option: " TERMINAL
	echo ""

	if [[ ! " ${terminals[*]} " =~ " ${TERMINAL} " ]]; then
		echo "Your choice is not on the list! Try again."
		continue
	fi
	
	break
done

while true; do
	echo "What launcher do you want to use? Options:"
	for i in ${!launchers[@]}; do
		echo "$((i + 1)). ${launchers[$i]}"
	done

	read -p "Enter the name of your option: " LAUNCHER
	echo ""

	if [[ ! " ${launchers[*]} " =~ " ${LAUNCHER} " ]]; then
		echo "Your choice is not on the list! Try again."
		continue
	fi
	
	break
done


# Create stowdirs file
# Template:
# #!/bin/bash
# This file must not be edited, instead use the following script: setvariables.sh
# export STOW_DIRS=("tmux" "clang-format" "bin" "nvim" "fonts" "fedora")

PATH_DOTFILES="$HOME/.dotfiles/"
OUTPUT_FILE=$PATH_DOTFILES/stowdirs

STOW_DIRS_ELEMENTS=""

for element in ${DEFAULT_DIRS[@]}; do
	STOW_DIRS_ELEMENTS+="\"${element}\" "
done

if [[ "$WINDOW_MANAGER" != "none" ]]; then
	STOW_DIRS_ELEMENTS+="\"$WINDOW_MANAGER\" "
fi

if [[ "$BAR" != "none" ]]; then
	STOW_DIRS_ELEMENTS+="\"$BAR\" "
fi

STOW_DIRS_ELEMENTS+="\"$DISTRO\" "

if [[ "$TERMINAL" != "none" ]]; then
	STOW_DIRS_ELEMENTS+="\"$TERMINAL\" "
fi

if [[ "$LAUNCHER" != "none" ]]; then
	STOW_DIRS_ELEMENTS+="\"$LAUNCHER\" "
fi

if [[ "$DISPLAY_SERVER" == "xorg" ]]; then
	for element in ${x_specific[@]}; do
		STOW_DIRS_ELEMENTS+="\"${element}\" "
	done
fi

if [[ "$DISPLAY_SERVER" == "wayland" ]]; then
	for element in ${wayland_specific[@]}; do
		STOW_DIRS_ELEMENTS+="\"${element}\" "
	done
fi

echo "#!/bin/bash" > $OUTPUT_FILE
echo "# This file must not be edited, instead use the following script: setvariables.sh" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "export STOW_DIRS=(${STOW_DIRS_ELEMENTS:0:$((${#STOW_DIRS_ELEMENTS} - 1))})" >> $OUTPUT_FILE

echo "stowdirs file generated successfully, now you can install the configs!"

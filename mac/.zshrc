
export EDITOR=nvim

# Colors for programs like `ls`
export CLICOLOR=1

# User specific aliases and functions
if [ -d ~/.zshrc.d ]; then
	for rc in ~/.zshrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# For Rust
. "$HOME/.cargo/env"

# Enable autocomplete in zsh
autoload -Uz compinit
compinit

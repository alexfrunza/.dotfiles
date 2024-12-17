# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    export PATH="$PATH:$HOME/.local/bin:$HOME/bin"
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

TERM=xterm-256color

unset rc

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/afrunza/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/afrunza/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/afrunza/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/afrunza/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/afrunza/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/afrunza/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/afrunza/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

export HSA_OVERRIDE_GFX_VERSION=11.0.0

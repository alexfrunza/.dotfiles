# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Customizer for spotify
export PATH=$PATH:/home/alexf/.spicetify

# Added by Toolbox App
export PATH="$PATH:/home/alexf/.local/share/JetBrains/Toolbox/scripts"

# For Alk programming language (language used at faculty at Algorithm Design)
# https://github.com/alk-language/java-semantics
# if [ -d "$HOME/src/java-semantics/bin" ]; then
# 	export PATH="$HOME/src/java-semantics/bin:$PATH"
# fi

if [ -d "$HOME/src/Postman" ]; then
	export PATH="$HOME/src/Postman:$PATH"
fi

if [ -d "$HOME/src/lua-language-server/bin" ]; then
	export PATH="$HOME/src/lua-language-server/bin:$PATH"
fi

# Accessibility settings for 1 hand
# turn on stickykeys. don't let two keys pressed at the same time disable it.
# don't turn on "latch lock", ie pressing a modifier key twice "locks" it on.
# xkbset accessx sticky -twokey -latchlock

# don't expire these settings. (run xkbset q exp for details.)
# xkbset exp 1 =accessx =sticky =twokey =latchlock

# .dotfiles

- There are my dotfiles for linux configuration

## Enable dark theme for gtk applications

- Create or edit the following file: `~/.config/gtk-3.0/settings.ini`
- Add the following settings:
    ```ini
    [Settings]
    gtk-application-prefer-dark-theme=1
    ```

## Guides applications

### nnn - filemanager

- [nnn](https://github.com/jarun/nnn/tree/master)
- [plugins](https://github.com/jarun/nnn/tree/master/plugins)
- In order to have icons you must compile with the [O_NERD=1 flag](https://github.com/jarun/nnn/wiki/Advanced-use-cases#to-enable-nerdfont-icons)

#### Change default app for a filetype

The guide is from [reddit](https://www.reddit.com/r/linux4noobs/comments/jc7vcx/nnn_how_to_open_file_directly/).

```
nnn uses xdg-open by default. You need to configure your default applications for different file types.
Use xdg-mime query filetype <PATH_TO_FILE> to get the file type.
Then use xdg-mime default <APPLICATION> <FILE_TYPE> to set the default application.
For example if you wanted to open your jpeg image in feh, you can do xdg-mime default feh.desktop image/jpeg
```


#### Fedora

- Install `readline-devel`
- Install nerd fonts if you don't have them already installed
- Add `#include <strings.h>` in `src/icons-hash.c`
- Compile with `make O_NERD=1`
- Add to path `sudo make strip install`

### Rofi

#### Emoji selector

```
sudo dnf install rofimoji
```

#### Calculator

- [rofi-calc](https://github.com/svenstaro/rofi-calc)

### Neovim




#### LSP setup

##### Mason

- Use Mason plugin to maintain language servers/linters/formatters etc.
- Language servers/linters/formatters used:
    - clangd
    - eslint-lsp
    - lua-language-server
    - prettierd
    - pyright
    - ruff
    - rust-analyzer
    - typescript-language-server
    - yaml-language-server

- Install language servers/linters/formatters with the command:
    - `:MasonInstall <name>`

##### Python

- Download and install `pip`

##### JavaScript

##### C

- Install clangd

    - On fedora:

    ```sh
    sudo dnf install clang
    sudo dnf install clang-tools-extra
    ```

### JetBrains IDEs

#### Setup

- Font size: 16
- Font family: DroidSansMono
- Line height: 1.2
- Theme: Catppuccin Macchiato
- Plugins: IdeaVim, Catppuccin Theme


### Others useful applications

- [bat](https://github.com/sharkdp/bat) - better alternative for cat


## Drivers

- Get Tuxedo drivers in Fedora:
```sh
sudo dnf update
sudo vi /etc/yum.repos.d/tuxedo.repo
# After modify the yum repo run this commands:
# Driver for wired network card
sudo dnf install tuxedo-yt6801
# Other drivers
sudo dnf install tuxedo-drivers
# (Optional)
sudo dnf install tuxedo-control-center
```

> Update the Fedora version if needed below

- Paste this in `/etc/yum.repos.d/tuxedo.repo`
```toml
[tuxedo]
name=TUXEDO
baseurl=https://rpm.tuxedocomputers.com/fedora/41/x86_64/base
enabled=1
gpgcheck=1
gpgkey=https://rpm.tuxedocomputers.com/fedora/41/0x54840598.pub.asc
skip_if_unavailable=False
```

### macOS

```zsh
# Faster Dock Hiding (first option is for the time for macOS to decide to display the dock, and the second one is for how long to display/hide the dock)
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
# Default Values
defaults write com.apple.dock autohide-delay -float 0.5; defaults write com.apple.dock autohide-time-modifier -int 0.5 ;killall Dock
```

#### Useful apps on macOS

- BetterDisplay in order to scale resolution on not HiDPI screens

### GNOME DE 

Things to after a fresh install:

- Switch mouse wheel scroll to natural scroll

- Add keybinds to move between virtual desktops, configure 5 virtual desktops
```
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-1" "['<Alt>1']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-1" "['<Alt><Shift>1']"

gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-2" "['<Alt>2']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-2" "['<Alt><Shift>2']"

gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-3" "['<Alt>3']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-3" "['<Alt><Shift>3']"

gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-4" "['<Alt>4']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-4" "['<Alt><Shift>4']"

gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-5" "['<Alt>5']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-5" "['<Alt><Shift>5']"
```

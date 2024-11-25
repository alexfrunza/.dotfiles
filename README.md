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

##### Python

- Download and install `pip`
- Download and install [ruff](https://github.com/astral-sh/ruff) and [ruff-lsp](https://github.com/astral-sh/ruff-lsp)
- Instruction for configuring ruff-lsp can be found [there](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp)

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



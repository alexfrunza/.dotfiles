# Create a new desktop entry in linux

In order for a binary application to be showed in an application launcher (e.g. Rofi, dmenu), you will want to create a desktop entry for that app on your linux machine.

For creating a desktop entry for Obsidian on Fedora Linux you can do the following steps (this can be replicated for other apps too):

1. Put the binary application in a dedicated directory (I used `~/bin`)
2. Put the icon (svg or png format) in `~/.local/share/icons`, with the name `obsidian.svg` (for Obsidian you can generate an icon from [here](https://obsidian.md/blog/new-obsidian-icon/))
3. Create the desktop entry on `/.local/share/applications/Obsidian.desktop`
   - `StartupWMClass` - used by system to show the icon in GNOME dock
   - `Icon` - the icon without an absolute path will be fetched from `~/.local/share/icons`, the extension is ignored
   - `Exec` - it does not support relative path or shell variables, because of this I use `sh` program
```toml
[Desktop Entry]
Name=Obsidian
Exec=sh -c '$HOME/bin/Obsidian.AppImage'
Icon=obsidian
Type=Application
Categories=Utility
StartupWMClass=obsidian
```
4. To use the new settings, run the command: `update-desktop-database ~/.local/share/applications`

To check what value to put in `StartupWMClass`, you can use the command: `xprop | grep WM_CLASS`, and then click the app you want to create the desktop entry for. After that see the output of the command.

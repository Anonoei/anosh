# ANOSH
 Installable/syncable *sh configurations

 <img width="1680" alt="image" src="https://github.com/Anonoei/anosh/assets/73118441/17b5bd0f-ab8d-425d-8bda-a97cf9f6e1b5">


Features:
 - Install [starship](https://starship.rs/) for modern prompt
 - Install [zoxide](https://github.com/ajeetdsouza/zoxide) for modern cd
 - Use Nix to install packages:
   - [tree]() for showing directory structures
   - [multitail](https://vanheusden.com/multitail) for better tail
   - [fzf](https://github.com/junegunn/fzf) for fuzzy finding
   - [trash]() for cached rm
   - [tldr]() for more concise man pages
   - [btop]() for prettier top/htop
   - [fastfetch](https://github.com/fastfetch-cli/fastfetch) for showing off your system
   - [eza](https://github.com/eza-community/eza) for pretty ls
   - [bat](https://github.com/sharkdp/bat) for cat with wings

# Install
 1. Pick between `bash`, `zsh`, or `ps`
 2. Ensure you have installed curl, git your shell of choice
    - Bash
      1. `bash <(curl -s https://raw.githubusercontent.com/Anonoei/anosh/main/anobash/install)`
    - Zsh
      1. `zsh <(curl -s https://raw.githubusercontent.com/Anonoei/anosh/main/anozsh/install)`
    - PS **(not implemented)**
      1. `ps <(curl -s https://raw.githubusercontent.com/Anonoei/anosh/main/anops/install)`

# Update
 1. Run `ash_update`

# Reinstall
 1. Run `ash_reinstall`

## OS Packages
 - General
   - [neovim](https://neovim.io/) General text editor
   - [vscode](https://code.visualstudio.com/) IDE
   - [thorium](https://thorium.rocks/) Chromium based browser
   - [floorp](https://floorp.app/en/) Firefox based browser
   - [keepassxc](https://keepassxc.org/) Password manager
   - [pyenv](https://github.com/pyenv/pyenv) Python versioning manager
 - *nix
   - Linux
     - [Gear Lever](https://github.com/mijorus/gearlever) Manage AppImages
   - MacOS
     - [amethyst](https://ianyh.com/amethyst/) Tiling Window Manager
   - [kitty](https://sw.kovidgoyal.net/kitty/) Terminal Emulator
   - [tmux](https://github.com/tmux/tmux) Terminal Multiplexing
   - [btop](https://github.com/aristocratos/btop) Prettier top/htop
   - [tldr](https://github.com/tldr-pages/tldr) More concise man pages
   - [nix] Fast, reproducible package manager
 - Windows

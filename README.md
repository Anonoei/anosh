# ANOSH
 Installable/syncable *sh configurations

 <img width="1680" alt="image" src="https://github.com/Anonoei/anosh/assets/73118441/17b5bd0f-ab8d-425d-8bda-a97cf9f6e1b5">


Features:
 - Use [starship](https://starship.rs/) for prompt
 - Use [zoxide](https://github.com/ajeetdsouza/zoxide) for cd
 - Install [fzf](https://github.com/junegunn/fzf)
 - Compile/use [bat](https://github.com/sharkdp/bat) (*requires cargo*) for cat with wings
 - Install tree to show directory structures
 - Install [eza](https://github.com/eza-community/eza) (*requires cargo*) for ls icons
 - Install [multitail](https://vanheusden.com/multitail/) for better tail
 - Compile/use [fastfetch](https://github.com/fastfetch-cli/fastfetch) (*requires cmake*) to show off your system

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

## Optional dependencies
 - Rust
   - Run `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
 - cmake
   - Run `<your package manager> install cmake`

## OS Packages
 - General
   - [neovim](https://neovim.io/) General text editor
   - [vscode](https://code.visualstudio.com/) IDE
   - [thorium](https://thorium.rocks/) Chromium based browser
   - [floorp](https://floorp.app/en/) Firefox based browser
   - [keepassxc](https://keepassxc.org/) Password manager
   - [pyenv] Python versioning managaer
 - *nix
   - Linux
     - [gear level]() Manage AppImages
   - MacOS
     - [amethyst](https://ianyh.com/amethyst/) Tiling Window Manager
   - [kitty](https://sw.kovidgoyal.net/kitty/) Terminal Emulator
   - [tmux] Terminal Multiplexing
   - [btop] Prettier top/htop
   - [tldr] More concise man pages
 - Windows

# ANOSH
 Installable/syncable *sh configurations

![image](https://github.com/user-attachments/assets/920c323f-70cd-4048-8178-be1e9bc315a0)

# Install
 - *nix (Linux, MacOS)
   1. Pick a shell from `bash`, `zsh` or `pwsh`
   2. Ensure you have `curl`, `git`, and your shell installed
   3. Run `$SHELL <(curl -sS "https://raw.githubusercontent.com/Anonoei/anosh/main/nix/install") <SHELL>`
      - bash: `$SHELL <(curl -sS "https://raw.githubusercontent.com/Anonoei/anosh/main/nix/install") bash`
      - zsh:  `$SHELL <(curl -sS "https://raw.githubusercontent.com/Anonoei/anosh/main/nix/install") zsh`
      - pwsh: `$SHELL <(curl -sS "https://raw.githubusercontent.com/Anonoei/anosh/main/nix/install") pwsh`
        - **NOT IMPLEMENTED**
 - Windows
   - **NOT IMPLEMENTED**


## Helper CLI
Run `ash help` to see commands

 - Update AnoSH: `ash update`
 - Reinstall: `ash reinstall`
 - Uninstall: `ash uninstall`


## AnoSH plugins
 - [starship](https://starship.rs/) graphical prompt
 - [zoxide](https://github.com/ajeetdsouza/zoxide) modern cd
 - [atuin](https://github.com/atuinsh/atuin) zoxide for command history
 - [cod](https://github.com/dim-an/cod) --help autocompletion
 - [navi](https://github.com/denisidoro/navi) command cheatsheets
 - [xplr](https://github.com/sayanarijit/xplr) tui file explorer

## AnoSH packages
 - tree
 - [tmux](https://github.com/tmux/tmux)
 - [fzf](https://github.com/junegunn/fzf) fuzzy find
 - [trash](https://github.com/andreafrancia/trash-cli) cached rm
 - [tldr](https://github.com/tldr-pages/tldr) More concise man pages
 - [btop](https://github.com/aristocratos/btop) Prettier top/htop
 - [fastfetch](https://github.com/fastfetch-cli/fastfetch) new neofetch
 - [eza](https://github.com/eza-community/eza) modern ls
 - [bat](https://github.com/sharkdp/bat) cat with wings


## Other packages
 - [neovim](https://neovim.io/) General text editor
 - [vscode](https://code.visualstudio.com/) IDE
 - [hyperfine](https://github.com/sharkdp/hyperfine) cli benchmakring
 - [pyenv](https://github.com/pyenv/pyenv) Python versioning manager
 - [keepassxc](https://keepassxc.org/) Password manager
 - [Gear Lever](https://github.com/mijorus/gearlever) Manage AppImages
 - [powertop](https://github.com/fenrus75/powertop) show/optimize process power usage
 - [ripgrep](https://github.com/BurntSushi/ripgrep) recursive grep
 - [delta](https://github.com/dandavison/delta) syntax-highlighting pager
 - [multitail](https://vanheusden.com/multitail) for better tail
 - [up](https://github.com/akavel/up) interactive pipe creation
 - Terminal emulators:
   - [alacritty](https://github.com/alacritty/alacritty)
   - [kitty](https://sw.kovidgoyal.net/kitty/)
 - Browsers
   - [thorium](https://thorium.rocks/) Chromium based browser
   - [floorp](https://floorp.app/en/) Firefox based browser
 - TUIs
   - [sshs](https://github.com/quantumsheep/sshs) ssh tui
   - [lazygit](https://github.com/jesseduffield/lazygit) git tui
   - [lazydocker](https://github.com/jesseduffield/lazydocker) docker tui
   - [bottom](https://github.com/ClementTsang/bottom) top tui
   - [bandwhich](https://github.com/imsnif/bandwhich) bandwidth usage tui
   - [dust](https://github.com/bootandy/dust) df -h and windirstat successor
   - [gping](https://github.com/orf/gping) ping with graph

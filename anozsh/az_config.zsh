if [[ ! -d "${PATH_ZSH}" ]]; then
    mkdir -p "${PATH_ZSH}"
fi
### ---- History ---- ###
HISTFILE="${PATH_ZSH}/.zsh_history"
SAVEHIST=$HISTLINES # lines of history to save
setopt EXTENDED_HISTORY # add timestamp and duration to command
setopt INC_APPEND_HISTORY # append to histfile instead of rewriting

### ---- Options ---- ###
autoload -U select-word-style
select-word-style bash
setopt AUTO_CD
setopt AUTO_LIST
setopt LIST_PACKED # use columns for listing completions
setopt AUTO_MENU # use menu for ambiguous completions
setopt HASH_LIST_ALL
setopt CORRECT
setopt CORRECT_ALL
setopt IGNORE_EOF
#setopt PRINT_EXIT_VALUE
setopt CHECK_JOBS

# git info
autoload -Uz vcs_info # enable vcs_info
zstyle ':vcs_info:*' check-for-changes true
# %s version control system
# %r root directory of repository
# %S relative path to root directory
# %b branch name
# %m info about stashes
# %u unstagd changes
# %c stages changes
zstyle ':vcs_info:git*' formats " ${blue}[${green}%s${blue}/${default}%r${blue}: ${cyan}%b ${yellow}%m%u%c${blue}]${RESET}"
precmd () { vcs_info }
# help info
autoload -Uz run-help
autoload -Uz run-help-git run-help-ip run-help-openssl run-help-p4 run-help-sudo run-help-svk run-help-svn

### ---- Confirm commands ---- ###
confirm() {
    local response="y"
    echo -ne "Do you want to run '$*' (y/N)? "
    read -q response
    echo
    case "$response" in
        [yY][eE][sS]|[yY]) command "${@}";;
        *) return false;;
    esac
}
confirm_wrap() {
    if [ "$1" = '--root' ]; then
        local as_root='1'
        shift
    fi
    local prefix=''
    if [ "${as_root}" = '1' ] && [ "${USER}" != 'root' ]; then
        prefix="sudo"
    fi

    confirm ${prefix} "$@"
}

poweroff() { confirm_wrap --root $0 "$@"; }
reboot() { confirm_wrap --root $0 "$@"; }
hibernate() { confirm_wrap --root $0 "$@"; }
# Package managers
pacman() { confirm_wrap --root $0 "$@"; }
apt() { confirm_wrap --root $0 "$@"; }
nala() { confirm_wrap --root $0 "$@"; }
port() { confirm_wrap --root $0 "$@"; }
### ---- History ---- ###
HISTFILE="${HOME}/.zsh_history"
HISTLINES=10000
SAVEHIST=$HISTLINES # lines of history to save
HISTCONTROL=erasedups:ignoredups:ignorespace
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

if [[ ! -d "${PATH_PLUGINS}" ]]; then
    mkdir -p "${PATH_PLUGINS}"
fi

#PATH_PLUGINS_ZINIT="${PATH_PLUGINS}/zinit.sh"

### ---- Install QoL features ---- ###
ZINIT_HOME="${PATH_ZINIT}/zinit.git"
if [[ ! -d "${PATH_ZINIT}" ]]; then
    echo "\033[1;33mInstalling Zinit...\033[0m"
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    source "${ZINIT_HOME}/zinit.zsh"
    exec zsh
fi
if [[ ! -d "$PATH_ZSH/zsh-autosuggestions" ]]; then
    echo "\033[1;33mInstalling zsh-autosuggestions...\033[0m"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$PATH_ZSH/zsh-autosuggestions"
fi
if [[ ! -d "$PATH_ZSH/zsh-syntax-highlighting" ]]; then
    echo "\033[1;33mInstalling zsh-syntax-highlighting...\033[0m"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$PATH_ZSH/zsh-syntax-highlighting"
fi
if hash fzf 2> /dev/null; then
    zinit snippet "https://github.com/junegunn/fzf/tree/master/shell/key-bindings.zsh"
fi

source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zsh-syntax-highlighting
if [[ -f $PATH_ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    . $PATH_ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_HIGHLIGHT_MAXLENGTH=512
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
fi
## zsh-autosuggestions
if [[ -f $PATH_ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    . $PATH_ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=magenta,bold,underline"					# highlight style
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    #ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=
    ZSH_AUTOSUGGEST_BIFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_USE_ASYNC=1
    ZSH_AUTOSUGGEST_HISTORY_IGNORE=""
    ZSH_AUTOSUGGEST_COMPLETION_IGNORE="pacman -S *"
    ZSH_AUTOSUGGEST_COMPLETION_IGNORE="apt install *"
    ZSH_AUTOSUGGEST_COMPLETION_IGNORE="nala install *"
    ZSH_AUTOSUGGEST_COMPLETION_IGNORE="port install *"
    ZSH_AUTOSUGGEST_COMPLETION_IGNORE="brew install *"
fi
### ---- Completion ---- ###
setopt COMPLETE_ALIASES # uses aliases for completion
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
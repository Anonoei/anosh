if hash exa 2> /dev/null; then
    alias ls="exa --icons"
    alias ll="ls -lh"
    alias la="ls -a"
    alias lla="ls -lha"
else
    alias ls="ls --color -F"
    alias ll="ls --color -lh"
    alias la="ls -A"
    alias lla="ls -lA"
fi

alias q="exit"
alias cls="clear"
alias mv="nocorrect mv"
alias cp="nocorrect cp"
alias mkdir="nocorrect mkdir"
alias history="history -d"
alias h="history"
alias hc="history -p"
alias help="run-help"
alias azrc="edit $PATH_ANOZSH/az_settings.zsh"

alias q="exit"
alias cls="clear"
alias h="history | grep "
alias hc="history -p"
alias help="run-help"
alias rmd='${which rm} --recursive --force --verbose '

# Aliases for build-ins
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias less='less -R'
alias history="history -d"

# Aliases for changing directories
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias cd='z'

# Aliases for multiple directory listing commands
if [ -x "$(command -v exa)" ]; then
    alias ls='exa --icons -aFh'                # add colors and file type extensions
    alias ll='exa --icons -Fl'                 # long listing format
    alias l.='exa --icons -Alh'                # show hidden files
    alias lw='exa --icons -xAh'                # wide listing format
    alias lr='exa --icons -lRh'                # recursive ls
    alias lf="exa --icons -l | egrep -v '^d'"  # files only
    alias ldir="exa --icons -l | egrep '^d'"   # directories only
    alias lm='exa --icons -alh | more'         # pipe through 'more'

    alias lsx='exa --icons -lXBh'              # sort by extension
    alias lsk='exa --icons -lSrh'              # sort by size
    alias lsc='exa --icons -lcrh'              # sort by change time
    alias lsu='exa --icons -lurh'              # sort by access time
    alias lst='exa --icons -ltrh'              # sort by date
    alias labc='exa --icons -lap'              # sort alphabetically

else
    alias ls='ls --color -aFh'                # add colors and file type extensions
    alias ll='ls --color -Fl'                 # long listing format
    alias l.='ls --color -Alh'                # show hidden files
    alias lw='ls --color -xAh'                # wide listing format
    alias lr='ls --color -lRh'                # recursive ls
    alias lf="ls --color -l | egrep -v '^d'"  # files only
    alias ldir="ls --color -l | egrep '^d'"   # directories only
    alias lm='ls --color -alh | more'         # pipe through 'more'

    alias lsx='ls --color -lXBh'              # sort by extension
    alias lsk='ls --color -lSrh'              # sort by size
    alias lsc='ls --color -lcrh'              # sort by change time
    alias lsu='ls --color -lurh'              # sort by access time
    alias lst='ls --color -ltrh'              # sort by date
    alias labc='ls --color -lap'              # sort alphabetically
fi

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if  [ ! -x "$(command -v bat)" ]; then
    alias cat='bat'
fi
if  [ ! -x "$(command -v multitail)" ]; then
    alias multitail='multitail --no-repeat -c'
fi

# Quick aliases
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

# Aliases for changing directories
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

# Aliases for multiple directory listing commands
ls_cmd=""
if [[ ${ASH_PLUGS[@]} =~ "eza" ]]; then
    ls_cmd="eza --icons=auto --color=auto --classify=auto"
else
    ls_cmd="ls --color=always"
fi
alias ls="${ls_cmd}"
alias ll="${ls_cmd} -l"                     # long listing format
alias l.="${ls_cmd} -alh"                   # show hidden files
alias lw="${ls_cmd} -xah"                   # wide listing format
alias lr="${ls_cmd} -lRh"                   # recursive ls
alias lf="${ls_cmd} -l | egrep -v '^d'"     # files only
alias l.f="${ls_cmd} -lah | egrep -v '^d'"  # files only
alias ldir="${ls_cmd} -l | egrep '^d'"      # directories only
alias l.dir="${ls_cmd} -l | egrep '^d'"     # directories only
alias lm="${ls_cmd} -alh | more"            # pipe through 'more'
alias lg="${ls_cmd} -alh | grep"            # pipe through 'grep'

alias lsx="${ls_cmd} -lXBh"              # sort by extension
alias lsk="${ls_cmd} -lSrh"              # sort by size
alias lsc="${ls_cmd} -lcrh"              # sort by change time
alias lsu="${ls_cmd} -lurh"              # sort by access time
alias lst="${ls_cmd} -ltrh"              # sort by date
alias labc="${ls_cmd} -lap"              # sort alphabetically
unset ls_cmd

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
alias openports='netstat -nape --tcp --udp'
alias listening='netstat -npel --tcp --udp'

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

# Configure bat
if [[ ${ASH_PLUGS[@]} =~ "bat" ]]; then
    if [ -x "$(command -v bat)" ]; then
        alias cat='bat'
    elif [ -x "$(command -v batcat)" ]; then
        bat_path="$(which batcat)"
        bat_path="$(dirname $bat_path)"
        sudo ln -s $bat_path/batcat $bat_path/bat
        alias cat='bat'
    fi
fi

# Configure multitail
if [[ ${ASH_PLUGS[@]} =~ "multitail" ]]; then
    alias multitail='multitail --no-repeat -c'
fi

# Configure logout
ash_logout() {
    while IFS=' ' read -r sess_id _ user seat tty; do
        echo "Terminating session ID: ${sess_id}"
        loginctl terminate-session $sess_id
        # Do whatever you want with the session id here
    done < <(loginctl list-sessions)
}
alias lo='ash_logout'

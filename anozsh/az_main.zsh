### ---- Paths ---- ###
PATH_LOCAL="${HOME}/.local"
PATH_ANOZSH="${PATH_LOCAL}/anozsh"

PATH_PLUGINS="${PATH_ANOZSH}/plugins"

PATH_ZSH="${PATH_PLUGINS}/zsh"
PATH_ZINIT="${PATH_PLUGINS}/zinit"
PATH_STARSHIP="${PATH_PLUGINS}/starship"
PATH_ZOXIDE="${PATH_PLUGINS}/zoxide"

if [[ ! -d "${PATH_ZSH}" ]]; then
    mkdir -p "${PATH_ZSH}"
fi

### ---- Sources ---- ###
az_import() {
    # $1: local file name
    localpath="$PATH_LOCAL/$1"
    if [ -f "$localpath" ]; then
        source "$localpath"
    else
        echo "az.main.import: $1 not found. Downloading..."
        az_install "$1" "$localpath"
        source "$localpath"
    fi
}

if [ ! -f "$PATH_ANOZSH/az_settings.zsh" ]; then
    local settings_defalt='
### ---- Settings ---- ###
export HISTLINES=10000
export HISTCONTROL=erasedups:ignoredups:ignorespace
alias edit=vi'
    echo $settings_default > "$PATH_ANOZSH/az_settings.zsh"
fi

source "$PATH_ANOZSH/az_settings.zsh"

az_import "anozsh/az_colors.zsh"
az_import "anozsh/az_command.zsh"
az_import "anozsh/az_alias.zsh"

az_import "anozsh/az_config.zsh"
az_import "anozsh/az_define.zsh"
az_import "anozsh/az_plugins.zsh"
az_import "anozsh/az_prompt.zsh"

export STARSHIP_CONFIG="$PATH_ANOZSH/starship.toml"
export STARSHIP_CACHE="$PATH_STARSHIP/cache"

if [ ! -f "$STARSHIP_CONFIG" ]; then
    local starship_default='
### ---- Starship ---- ###
format = """
$python\
$username\
$directory\
$git_branch\
$docker_context\

"""
right_format = """
$git_metrics\
$git_status\
$git_status\
$time\
"""
command_timeout = 5000
add_newline = false

[username]
show_always = true
style_user = "bg:#3B4252"
style_root = "bg:#3B4252"
format = "[$user ]($style)"

[directory]
style = "bg:#434C5E"
format = "[ $path ]($style) "
truncation_length = 3
truncation_symbol = "…/"

[git_branch]
symbol = "🌱 "
truncation_length = 4
truncation_symbol = ""

[git_metrics]
added_style = "bold green"
deleted_style = "bold red"
format = "[+$added]($added_style)/[-$deleted]($deleted_style) "

[git_status]
conflicted = "🏳"
ahead = "⇡${count}"
behind = "⇣${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
up_to_date = "✓"
#staged = "[++\($count\)](green)"

[git_state]
#format = "[\($state( $progress_current of $progress_total)\)]($style) "

[time]
disabled = false
time_format = "%j %U %F %T%z"
format = "[ $time ]($style)"
'
    echo $starship_default > "$STARSHIP_CONFIG"
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

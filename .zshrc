# Path to your oh-my-zsh installation.
export ZSH=/home/andrea/.oh-my-zsh

# Font mode for powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete"

# Set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k"

# OS segment
POWERLEVEL9K_DIR_FOREGROUND='red'
POWERLEVEL9K_DIR_BACKGROUND='blue'
POWERLEVEL9K_LINUX_ICON="%F{cyan}\uf300 %F{white}arch%F{cyan}linux"
POWERLEVEL9K_OS_ICON_BACKGROUND='black'

# Command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Plugins to load
plugins=(git)

source $ZSH/oh-my-zsh.sh
export LANG=es_MX.UTF-8

# Context
DEFAULT_USER="andrea"
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_FOREGROUND='white'
POWERLEVEL9K_CONTEXT_BACKGROUND='magenta'
POWERLEVEL9K_CONTEXT_TEMPLATE="%K{black}%F{green}%n"

# Dirs
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0ce'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0cf'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0c5'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\ue0b7'

# VCS Config
# Icons
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d3'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113'
POWERLEVEL9K_VCS_STAGED_ICON=$'\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '
POWERLEVEL9K_VCS_UNSTAGED_ICON=$''
POWERLEVEL9K_VCS_UNTRACKED_ICON=$''
# Colors
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='white'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'

# Thumbs icons
POWERLEVEL9K_OK_ICON=$'\uf164'
POWERLEVEL9K_FAIL_ICON=$'\uf165'
POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\uf165'

# Time
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M} \uf252"

# Wifi
wifi_signal(){
    local signal=$(nmcli device wifi | grep "*" | tail -1 | awk '{print $7}')
    local color='%F{yellow}'
    [[ $signal -gt 75 ]] && color='%F{black}'
    [[ $signal -lt 50 ]] && color='%F{white}'
    echo -n "%{$color%}\uf1eb  $signal%{%f%}"
    }

POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND='blue'

# Prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%K{black}"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{blue}%F{yellow} \Uf155 %f%k%F{blue}\ue0ce%f "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs custom_wifi_signal battery)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='emacs'
 else
   export EDITOR='emacs'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export LC_CTYPE=es_MX.UTF-8
export TERMINAL=gnome-terminal
export PAGER=less
export EDITOR=emacs
export VISUAL=emacs

autoload -Uz compinit
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias screenfetch="screenfetch -w -c 31,3"
alias yaourt="yaourt --pager --color"
~/.pacman.sh

man() {
    env \
	LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

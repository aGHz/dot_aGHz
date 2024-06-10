PROMPT_LABEL="exocore"
PROMPT_USERNAME="\u"
PROMPT_HOSTNAME="\h"

CLEAR="\[\e[0m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
GREEN_BOLD="\[\e[32;1m\]"
YELLOW="\[\e[33m\]"
YELLOW_BOLD="\[\e[33;1m\]"
BLUE="\[\e[34m\]"
BLUE_BOLD="\[\e[34;1m\]"
MAGENTA="\[\e[35m\]"
MAGENTA_BOLD="\[\e[35;1m\]"

# Colors for prompt
# Always surround with readline ignore guards
# RL_PROMPT_START_IGNORE RL_PROMPT_END_IGNORE
# \[ \] in bash variables
# \x01 \x02 in echo -e "..."
COLOR_RED=$(tput sgr0 && tput setaf 1)
COLOR_GREEN=$(tput sgr0 && tput setaf 2)
COLOR_YELLOW=$(tput sgr0 && tput setaf 3)
COLOR_BLUE=$(tput sgr0 && tput setaf 4)
COLOR_MAGENTA=$(tput sgr0 && tput setaf 5)
COLOR_CYAN=$(tput sgr0 && tput setaf 6)
COLOR_GRAY=$(tput sgr0 && tput setaf 7)
COLOR_WHITE=$(tput sgr0 && tput setaf 7 && tput bold)
COLOR_LIGHTRED=$(tput sgr0 && tput setaf 1 && tput bold)
COLOR_LIGHTGREEN=$(tput sgr0 && tput setaf 2 && tput bold)
COLOR_LIGHTYELLOW=$(tput sgr0 && tput setaf 3 && tput bold)
COLOR_LIGHTBLUE=$(tput sgr0 && tput setaf 4 && tput bold)
COLOR_LIGHTMAGENTA=$(tput sgr0 && tput setaf 5 && tput bold)
COLOR_LIGHTCYAN=$(tput sgr0 && tput setaf 6 && tput bold)
COLOR_RESET=$(tput sgr0)


PS1=""

## hostname
#if [ $PROMPT_LABEL ]; then
#    if [[ `whoami` == "root" ]]; then
#        PS1="$YELLOW[$RED$PROMPT_USERNAME$YELLOW@$MAGENTA$PROMPT_LABEL$YELLOW]"
#    else
#        PS1="$YELLOW[$MAGENTA$PROMPT_LABEL$YELLOW]"
#    fi
#else
#    if [[ `whoami` == "root" ]]; then
#        PS1="$YELLOW[$RED$PROMPT_USERNAME$YELLOW@$BLUE$PROMPT_HOSTNAME$YELLOW]"
#    else
#        PS1="$YELLOW[$BLUE$PROMPT_USERNAME$GREEN@$BLUE$PROMPT_HOSTNAME$YELLOW]"
#    fi
#fi

# path & git branch
function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo -ne " \x01${COLOR_LIGHTCYAN}\x02${ref#refs/heads/}\x01${COLOR_RESET}\x02"
}
PS1="$PS1$YELLOW[$GREEN\w\$(parse_git_branch)$YELLOW]"

# add Python Virtualenv info
function parse_virtualenv {
    [[ -z "$VIRTUAL_ENV" ]] && return
    echo -e "\x01${COLOR_LIGHTRED}\x02$(basename "$VIRTUAL_ENV")\x01${COLOR_RESET}\x02"
    #echo "${COLOR_YELLOW}(${COLOR_RED}$(basename "$VIRTUAL_ENV")${COLOR_YELLOW})${COLOR_RESET}"
}
PS1="${PS1}\$(parse_virtualenv)"

# add Debian chroot info
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
    PS1="$YELLOW{$CLEAR$debian_chroot$YELLOW}$CLEAR$PS1"
fi

# red prompt
PS1="$PS1$RED>$CLEAR "

export PS1

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

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    #printf -v PRE %b "\e[33m<\e[31m"
    #printf -v POST %b "\e[33m>\e[0m"
    PRE="<"
    POST=">"
    echo "$PRE${ref#refs/heads/}$POST"
}


# hostname
if [ $PROMPT_LABEL ]; then
    if [[ `whoami` == "root" ]]; then
        PS1="$YELLOW[$RED$PROMPT_USERNAME$YELLOW@$MAGENTA$PROMPT_LABEL$YELLOW]"
    else
        PS1="$YELLOW[$MAGENTA$PROMPT_LABEL$YELLOW]"
    fi
else
    if [[ `whoami` == "root" ]]; then
        PS1="$YELLOW[$RED$PROMPT_USERNAME$YELLOW@$BLUE$PROMPT_HOSTNAME$YELLOW]"
    else
        PS1="$YELLOW[$BLUE$PROMPT_USERNAME$GREEN@$BLUE$PROMPT_HOSTNAME$YELLOW]"
    fi
fi

# git branch
PS1="$PS1\$(parse_git_branch)"

# path
PS1="$PS1$YELLOW[$GREEN\w$YELLOW]"

# red prompt
PS1="$PS1$RED>$CLEAR "

# add Python Virtualenv info
# edit your bin/activate file to call this script instead of handling $PS1
#    don't forget to also call it in the deactivate() function
if [ $VIRTUAL_ENV ]; then
    PS1="$YELLOW($RED`basename \"$VIRTUAL_ENV\"`$YELLOW)$CLEAR$PS1"
fi

# add Debian chroot info
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
    PS1="$YELLOW{$CLEAR$debian_chroot$YELLOW}$CLEAR$PS1"
fi

export PS1


# interesting trick, I think this sets the xterm window title by manipulating $PS1
# (from the Ubuntu default .bashrc)
## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

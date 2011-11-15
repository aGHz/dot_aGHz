CLEAR="\[\e[0m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
GREEN_BOLD="\[\e[32;1m\]"
YELLOW="\[\e[33m\]"
YELLOW_BOLD="\[\e[33;1m\]"
BLUE="\[\e[34m\]"
BLUE_BOLD="\[\e[34;1m\]"

USERNAME="\u"
HOSTNAME="\h"

PS1="$YELLOW[$BLUE$USERNAME$GREEN@$BLUE$HOSTNAME$YELLOW][$GREEN\w$YELLOW]$RED>$CLEAR "

# add Debian chroot info
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
    PS1="$YELLOW{$CLEAR$debian_chroot$YELLOW}$CLEAR$PS1"
fi

# add Python Virtualenv info
# edit your bin/activate file to call this script instead of handling $PS1
if [ $VIRTUAL_ENV ]; then
    PS1="$YELLOW($RED`basename \"$VIRTUAL_ENV\"`$YELLOW)$CLEAR$PS1"
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

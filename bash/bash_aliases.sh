if [[ `uname` -eq "Darwin" ]]; then
    LS_OPTIONS="-G -F -b"
else
    LS_OPTIONS="--color=tty -F -b -T 0"
fi
export LS_OPTIONS
alias ll="ls $LS_OPTIONS -l"
alias lall="ls $LS_OPTIONS -l -a"

alias grep="grep --color=always -n"
alias G="grep -r --exclude=*\.svn* "
alias F="find . -name "

# Git aliases
alias glog="git log --format=format:'%w(200,0,4)%Cblue%aN%Creset: %s'"
alias glogful="git log --format=format:'%Cblue%aN%Creset: %Cgreen%H%Creset%n%B'"
alias gst="git status"
alias gd="git diff HEAD"

# Mercurial aliases
alias hglog='hg log --template '\''\033[32m{rev}\033[0m | \033[34m{author|user}\033[0m\t | {desc} \033[32m{date|age} on {date|rfc822date}\033[0m\n'\'''

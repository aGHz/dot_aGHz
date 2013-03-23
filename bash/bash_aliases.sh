if [[ `uname` -eq "Darwin" ]]; then
    LS_OPTIONS="-G -F -b"
else
    LS_OPTIONS="--color=tty -F -b -T 0"
fi
export LS_OPTIONS
alias ll="ls $LS_OPTIONS -l"
alias lall="ls $LS_OPTIONS -l -a"

alias grep="grep --color=always"
alias G="grep -r --exclude=*\.svn* "
alias F="find . -name "

# Git aliases
#alias glog="git log --format=format:'%w(200,0,4)%Cblue%aN%Creset: %s'"
alias glog="git log --graph --date=short --format=format:'%w(200,0,4)%C(yellow)%ad %Cblue%aN%Creset: %Cgreen%h%Creset  %s'"
alias glogd="git log --date=iso --format=format:'%w(200,0,4)%C(yellow)%ad %Cblue%aN%Creset: %s'"
alias glogful='git log --date=iso --format=format:'\''%Cblue%aN%Creset: %Cgreen%H%Creset %C(yellow)%ad%Creset%n%B'\'''
alias gst="git status"
alias gdvim="git diff HEAD"
alias gd="git diff HEAD --no-ext-diff"

# Mercurial aliases
alias hglog='hg log --template '\''\033[32m{rev}\033[0m | \033[34m{author|user}\033[0m\t | {desc} \033[32m{date|age} on {date|rfc822date}\033[0m\n'\'''

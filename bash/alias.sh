# For Darwin, use coreutils or use the commented line:
# LS_OPTIONS="-G -F -b"
LS_OPTIONS="--color=tty -F -b -T 0"
export LS_OPTIONS
alias ll="ls $LS_OPTIONS -l"
alias lall="ls $LS_OPTIONS -l -a"

alias cp="cp --preserve=all"

alias grep="grep --color=always"
alias G='grep -Inri --exclude-dir=node_modules --exclude-dir=.git'
alias F="find . -name "
if [ -x "$(which nvim)" ]; then
  alias v="nvim"
else
  alias v="vim"
fi

alias D="dig +noall +answer"

alias jupy='jupyter notebook --no-browser --ip=0.0.0.0 --NotebookApp.token=""'

PRET() { prettier "$1" | vimdiff "$1" <(cat -) && stty sane; }

alias g?="cat ~/bin/git_aliases"
alias gst="git status"
alias g.?="git status"
alias g.="git status -suno"   # no untracked files
alias g,="git status -s"      # untracked files and top dirs
alias g,,="git status -suall" # untracked files and recurse dirs

alias g+="git add -u && g."
alias g-="git reset HEAD \$(git rev-parse --show-toplevel) > /dev/null && g."
gitrestore() { git restore --staged "$1" && g.; }
alias g--="gitrestore"
alias g%="git stash"
alias g%%="git stash pop --quiet && g."

alias g.c="git commit"

alias g..r="git reset --soft HEAD^ && g."
alias g..c="git commit --reuse-message=HEAD@{1}"

alias gfo="git fetch origin"
alias gmo="git merge --ff-only origin/\$(git symbolic-ref --short HEAD)"
alias gfa="git fetch --all"
alias gp="git push --set-upstream origin \$(git symbolic-ref --short HEAD)"
alias gp!="git push -f origin \$(git symbolic-ref --short HEAD)"

alias gcm="git checkout master"
alias gcma="git checkout main"
alias gcd="git checkout develop"
alias gnb="git checkout -t -b"

if [ -x "$(which rg)" ]; then
  alias highlight-github-issues="rg --color always --colors match:fg:magenta --passthru '#\d+'"
  alias highlight-version="rg --color always --colors match:fg:cyan --passthru 'v?\d+\.\d+\.\d+[^\s]*'"
  alias highlight-glog-graph="highlight-github-issues | highlight-version"
else
  alias highlight-github-issues='GREP_COLORS="mt=1;36" grep --color=yes -e "" -e "(\?#[0-9]\+)\?\s*$"'
  alias highlight-glog-graph="highlight-github-issues"
fi
alias glog-graph="git log --graph --date=short --format=tformat:'%w(300,0,11)%C(yellow)%ad %Cblue%aN%Creset: %Cgreen%h%Creset %Cgreen% D%Creset %s'"
glog-num() {
    if [ -z "${1##[0-9]*}" ]; then
        glog-graph -${1:-10} --color=always "${@:2}" | highlight-glog-graph
    else
        glog-graph -10 --color=always "$@" | highlight-glog-graph
    fi
}
glog-num-nobot() { glog-num --author='^[^<]+<(?!.*[bB][oO][tT].*@(users.noreply.github.com|unito.io|martynus.net)|.+@fake-domain.com).*>$' --perl-regexp "$@"; }
alias gg="glog-num-nobot"
alias ggbot="glog-num"

alias gdno="git diff --no-ext-diff"
alias gd="gdno HEAD"
function git-diff-hash() { gdno $1~1..$1 ${2:-.}; }
alias gd~="git-diff-hash"
alias gl="git show --name-only"

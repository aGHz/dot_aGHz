PATH=./node_modules/.bin:$HOME/bin:/usr/local/bin:/usr/bin:$PATH
NODE_PATH=$NODE_PATH:/usr/local/lib/node

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# === ssh-agent
eval "$(ssh-agent)"


# === History

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=erasedups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=5000


# === Locale
LC_COLLATE=C
export LC_COLLATE


# === Colors

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


# === Alias definitions

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# === Prompt

# A complicated prompt definition lives better in its own file
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi


# === Programmable completion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
if has_brew="$(type -p brew)" && [ -n $has_brew ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
    echo "has_brew"
  . $(brew --prefix)/etc/bash_completion
fi


# === Pager

export PAGER=less
export LESS="-iMSx4 -FX"


# === Pyenv

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# === Misc

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

SVN_EDITOR=vim
export SVN_EDITOR

export NVM_DIR="/home/tek/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -n "$PROFILE_DEBUG" ] && echo "--- .bashrc"
[ -n "$PROFILE_DEBUG" ] && perl -MTime::HiRes=time -e 'printf "~~~ .bashrc 00: %.9f\n", time'

# ===
[ -z "$PS1" ] && return
# ===

export BASH_CONFIG_HOME="$XDG_CONFIG_HOME/bash"

# History
# man 1 bash; search for variable names
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=erasedups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# check the window size after each command and update LINES and COLUMNS
shopt -s checkwinsize

# enable color support of ls
[ -x "/usr/bin/dircolors" ] && ( [ -r "~/.dircolors" ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)" )
[ -n "$PROFILE_DEBUG" ] && perl -MTime::HiRes=time -e 'printf "~~~ .bashrc 10: %.9f dircolors\n", time'

# aliases and prompt
[ -f "$BASH_CONFIG_HOME/alias.sh" ] && . "$BASH_CONFIG_HOME/alias.sh"
[ -f "$BASH_CONFIG_HOME/prompt.sh" ] && . "$BASH_CONFIG_HOME/prompt.sh"
[ -n "$PROFILE_DEBUG" ] && perl -MTime::HiRes=time -e 'printf "~~~ .bashrc 20: %.9f alias prompt\n", time'

# pager
export PAGER=less
export LESS="-r -iMSx4 -FX"

# asdf
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
[ -n "$(type -p brew)" ] && [ -f "$(brew --prefix asdf)/libexec/asdf.sh" ] && . "$(brew --prefix asdf)/libexec/asdf.sh"
# TODO load asdf.sh on Linux

[ -n "$PROFILE_DEBUG" ] && perl -MTime::HiRes=time -e 'printf "~~~ .bashrc 99: %.9f\n", time'
[ -n "$PROFILE_DEBUG" ] && echo "=== .bashrc"

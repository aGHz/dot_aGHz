[ -n "$PS1" ] && export PROFILE_DEBUG="" #"true"
[ -n "$PROFILE_DEBUG" ] && echo "--- .profile"
[ -n "$PROFILE_DEBUG" ] && perl -MTime::HiRes=time -e 'printf "~~~ .profile 00: %.9f\n", time'

[ -z "$XDG_BIN_HOME" ] && export XDG_BIN_HOME="$HOME/.local/bin"
[ -z "$XDG_CACHE_HOME" ] && export XDG_CACHE_HOME="$HOME/Library/Caches"
[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "$XDG_DATA_HOME" ] && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "$XDG_RUNTIME_DIR" ] && export XDG_RUNTIME_DIR="$TMPDIR/runtime-$UID"
[ -z "$XDG_STATE_HOME" ] && export XDG_STATE_HOME="$HOME/.local/state"

# Define paths for common programs not using XDG
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node/repl_history";
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"


# Initialize $PATH from scratch
if [ -x /usr/libexec/path_helper ]; then
  export PATH=""
  eval `/usr/libexec/path_helper -s`
else
  export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
fi

[ -f "${XDG_CONFIG_HOME}/homebrew/homebrew.sh" ] && . "${XDG_CONFIG_HOME}/homebrew/homebrew.sh"

[ -d "${XDG_BIN_HOME}" ] && export PATH="${XDG_BIN_HOME}:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

# programmable completion
[ -f /etc/bash_completion ] && ! shopt -oq posix && . /etc/bash_completion

# Ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/rg/ripgreprc"

# ssh-agent
eval "$(ssh-agent)"

# Bash
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

[ -n "$PROFILE_DEBUG" ] && perl -MTime::HiRes=time -e 'printf "~~~ .profile 99: %.9f\n", time'
[ -n "$PROFILE_DEBUG" ] && echo "=== .profile"

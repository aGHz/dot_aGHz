[ -n "$PS1" ] && export PROFILE_DEBUG="" #"true"
[ -n "$PROFILE_DEBUG" ] && echo "--- .profile"
[ -n "$PROFILE_DEBUG" ] && perl -MTime::HiRes=time -e 'printf "~~~ .profile 00: %.9f\n", time'

[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"

# Initialize $PATH from scratch
if [ -x /usr/libexec/path_helper ]; then
  export PATH=""
  eval `/usr/libexec/path_helper -s`
else
  export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
fi

[ -f "${XDG_CONFIG_HOME}/homebrew/homebrew.sh" ] && . "${XDG_CONFIG_HOME}/homebrew/homebrew.sh"

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

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

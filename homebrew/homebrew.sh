# Homebrew installs in /opt/homebrew on Apple Sillicon and in /usr/local for MacOS Intel
[ -d "/opt/homebrew/bin" ] && export PATH="/opt/homebrew/bin:$PATH"
if [ -n "$(type -p brew)" ]; then
  eval "$(brew shellenv)"

  # postgresql@15 is keg-only, which means it was not symlinked into /opt/homebrew, because this is an alternate version of another formula.
  [ -d "${HOMEBREW_PREFIX}/opt/postgresql@15/bin" ] && export PATH="${HOMEBREW_PREFIX}/opt/postgresql@15/bin:$PATH"

  # Homebrew coreutils are installed with a `g` prefix so as to not conflict with system utils
  [ -d "${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin" ] && export PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
  [ -d "${HOMEBREW_PREFIX}/opt/gnu-tar/libexec/gnubin" ] && export PATH="${HOMEBREW_PREFIX}/opt/gnu-tar/libexec/gnubin:$PATH"
  [ -d "${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin" ] && export PATH="${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin:$PATH"

  [ -f "${HOMEBREW_PREFIX}/etc/bash_completion" ] && . "${HOMEBREW_PREFIX}/etc/bash_completion" # brew install bash-completion
fi

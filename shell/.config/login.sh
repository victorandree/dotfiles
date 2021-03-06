# Configures both environment and useful aliases on login.
# See README.md for background.
#
# `export` is used to make environment available to programs started from
# the shell. Without it, only the shell sees the variables.

# Explicitly sets $XDG variables to defaults
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export INPUTRC="$XDG_CONFIG_HOME/inputrc"

export LESSHISTFILE="$XDG_DATA_HOME/lesshst"

export EDITOR="vi"
if command -v nvim >/dev/null; then
  export EDITOR="nvim"
  alias vi='nvim'
  alias vim='nvim'
fi

export GREP_OPTIONS="--color=auto"

# Overrides less output to make it more pretty, in particular for manpages
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;38;5;74m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_us=$'\e[04;38;5;146m'
export LESS_TERMCAP_ue=$'\e[0m'

# Asks for confirmation before overwriting
alias cp="cp -i"
alias mv="mv -i"

# Uses long ls format by default
alias ls="ls -l"

# Creates intermediate directories
alias mkdir="mkdir -p"

uuid () {
  python3 -c 'import uuid; print(uuid.uuid4(), end="")'
}

if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
  eval "$(pyenv init -)"
fi

source "$XDG_CONFIG_HOME/login_macos.sh"

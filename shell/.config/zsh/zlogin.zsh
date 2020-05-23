# Source this file in `~/.zlogin` and add local overrides after:
#
#     source $HOME/.config/zsh/zlogin.zsh
#
# See README.md for more information

source "$HOME/.config/login.sh"

setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt CORRECT

# Set up autocompletion
autoload -Uz compinit
compinit -d "$XDG_DATA_HOME/zcompdump"

# Treat only alphanums as word characters (useful for paths)
autoload -Uz select-word-style
select-word-style bash

# Edit command line in an editor if you press Ctrl-x Ctrl-e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
bindkey '^XE' edit-command-line

# Setup prompt if pure is available (as a subtree)
# See README.md on how to pull subtree
if [ -d "$XDG_DATA_HOME/zsh/pure" ]; then
  fpath+="$XDG_DATA_HOME/zsh/pure"
  autoload -Uz promptinit
  promptinit
  prompt pure
fi

# Save big history immediately, without duplicates
HISTSIZE="100000"
SAVEHIST="$HISTSIZE"
HISTFILE="$XDG_DATA_HOME/zsh_history"
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Search history using Ctrl-r
bindkey "^R" history-incremental-search-backward

# Enable syntax highlighting
# This must happen after all custom widgets are created
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
[ -f "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] &&
  source "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

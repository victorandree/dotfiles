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

# Save big history immediately, without duplicates
HISTSIZE="100000"
SAVEHIST="$HISTSIZE"
HISTFILE="$XDG_DATA_HOME/zsh_history"
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

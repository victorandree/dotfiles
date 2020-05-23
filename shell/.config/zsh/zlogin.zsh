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

# Setup prompt if pure is available (as a subtree)
# See README.md on how to pull subtree
if [ -d "$XDG_DATA_HOME/zsh/pure" ]; then
  fpath+="$XDG_DATA_HOME/zsh/pure"
  autoload -Uz promptinit
  promptinit
  prompt pure
fi

# Use vim key bindings with some good ones from `bindkey -e`
# To display key bindings, type `bindkey`
bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^B" backward-char
bindkey "^[^?" backward-kill-word
bindkey "^[b" backward-word
bindkey "^[f" forward-word

# Edit command line in an editor if you press Ctrl-x Ctrl-e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Set KEYTIMEOUT to a low value to make switching modes fast
KEYTIMEOUT=1

# Defaults to bar cursor and insert mode
echo -ne '\e[5 q'

# Change cursor when switching modes
zle-keymap-select () {
  if [ "$TERM" = "xterm-256color" ] || [ "$TERM" = "xterm-kitty" ] || [ "$TERM" = "screen-256color" ]; then
    if [ $KEYMAP = vicmd ]; then
      # Switch to block cursor
      echo -ne '\e[1 q'
    else
      # Switch to bar (|) cursor for insert mode
      echo -ne '\e[5 q'
    fi
  fi

  # Call pure prompt to have it update the prompt
  if typeset -f prompt_pure_update_vim_prompt_widget >/dev/null; then
    prompt_pure_update_vim_prompt_widget
  fi
}
zle -N zle-keymap-select

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
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
[ -f "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] &&
  source "$XDG_DATA_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

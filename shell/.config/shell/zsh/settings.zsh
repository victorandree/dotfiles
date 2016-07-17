# zsh settings

# Additional stuff (just pure prompt right now)
fpath=("$HOME/.config/shell/zsh/functions" $fpath)
fpath=("$HOME/.config/shell/zsh/plugins/zsh-completions/src" $fpath)

# Initialize completion
autoload -Uz compinit && compinit

# Editing the command line
autoload -U edit-command-line && zle -N edit-command-line

setopt autocd               # dirname without 'cd'
setopt interactivecomments  # use `#` on command line
setopt correctall           # help me spell

# Configure zle (http://zsh.sourceforge.net/Guide/zshguide04.html)
# emacs style editing -- vim is nice and for zsh we could use triggers to change
# the cursor in iTerm2, however, it's better to be consistent across programs
# than have the shell behave in one way (see comment in .inputrc).
bindkey -e

# This will consider only alphanum as word characters, which is useful when
# dealing with paths.
autoload -U select-word-style
select-word-style bash

bindkey '^V' edit-command-line                      # Edit command line
bindkey '^?' backward-delete-char                   # Backspace
bindkey '^H' backward-delete-char                   # Backspace
bindkey '^[[3~' delete-char                         # Delete
bindkey "^R" history-incremental-search-backward    # Incremental history search

# Configure history
HISTSIZE=100000                   # Large history
SAVEHIST=$HISTSIZE
HISTFILE=~/.local/zsh_history     # Out of sight, out of mind
if [ ! -f $HISTFILE ]; then
  mkdir -p $(dirname $HISTFILE)
  touch $HISTFILE
fi

setopt INC_APPEND_HISTORY         # Append to history straightaway
setopt EXTENDED_HISTORY           # Save date and execution time in history
setopt HIST_IGNORE_DUPS           # Don't add duplicates to history
setopt HIST_REDUCE_BLANKS         # Clean up whitespace

# fzf support if we have it. Note the non-standard directory that this is placed
# in. You still have to run fzf's installer and move the .fzf.zsh file to this
# location yourself (as it is theoretically dependent on where fzf comes from)
[ -f ~/.config/shell/zsh/fzf.zsh ] && source ~/.config/shell/zsh/fzf.zsh

# Configure and use pure prompt
autoload -U promptinit && promptinit
prompt pure

# Configure highlighting (actually sourced at the end of zshrc)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

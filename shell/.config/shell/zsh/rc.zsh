# zsh settings
source $HOME/.config/shell/rc.sh

# Additional stuff (just pure prompt right now)
fpath=("$HOME/.config/shell/zsh/functions" $fpath)
fpath=("$HOME/.config/shell/zsh/plugins/zsh-completions/src" $fpath)

# Initialize completion
autoload -Uz compinit && compinit

# Editing the command line
autoload -U edit-command-line && zle -N edit-command-line

setopt autocd               # dirname without 'cd'
setopt interactivecomments  # use `#` on command line
setopt correct              # help me spell

# Configure zle (http://zsh.sourceforge.net/Guide/zshguide04.html)
# Use emacs style editing. Vim mode is too slow!
bindkey -e

# This will consider only alphanum as word characters, which is useful when
# dealing with paths.
autoload -U select-word-style
select-word-style bash

bindkey '^V' edit-command-line                      # Edit in editor
bindkey '^?' backward-delete-char                   # Backspace
bindkey '^H' backward-delete-char                   # Backspace
bindkey '^[[3~' delete-char                         # Delete
bindkey "^R" history-incremental-search-backward    # Incremental history search

# Large history that gets saved in ~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history

# INC_APPEND_HISTORY means that instead of doing this when the shell exits,
# each line is added to the history in this way as it is executed; this means,
# for example, that if you start up a zsh inside the main shell its history
# will look like that of the main shell, which is quite useful. It also means
# the ordering of commands from different shells running at the same time is
# much more logical --- basically just the order they were executed --- 
# so for 3.1.6 and higher this option is recommended.
setopt INC_APPEND_HISTORY

# Append from other shells in this shell's history. Does not affect ! history
setopt SHARE_HISTORY

# Save data and time in history. history -d prints time, -f prints date.
setopt EXTENDED_HISTORY

# Don't add repeated duplicates to history. Still saves duplicates that
# happen not in sequence.
setopt HIST_IGNORE_DUPS

# Cleans up whitespace
setopt HIST_REDUCE_BLANKS

# Don't save commands starting with space in history (privacy!)
setopt histignorespace

# fzf support if we have it. Note the non-standard directory that this is placed
# in. You still have to run fzf's installer and move the .fzf.zsh file to this
# location yourself (as it is theoretically dependent on where fzf comes from)
[ -f ~/.config/shell/zsh/fzf.zsh ] && source ~/.config/shell/zsh/fzf.zsh

# Configure and use pure prompt
autoload -U promptinit && promptinit
prompt pure

# Configure highlighting (actually sourced at the end of zshrc)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

source ~/.config/shell/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
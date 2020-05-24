# TODO This shouldn't rely on brew but should figure this out, somehow
FZFROOT=$(brew --prefix)/opt/fzf

[ -d "$FZFROOT" ] || return 1

if [[ ! "$PATH" == *$FZFROOT/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$FZFROOT/bin"
fi

[[ $- == *i* ]] && source "$FZFROOT/shell/completion.zsh" 2>/dev/null

source "$FZFROOT/shell/key-bindings.zsh"

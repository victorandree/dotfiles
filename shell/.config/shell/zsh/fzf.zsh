DIR="/usr/share/fzf"
[[ "$OSTYPE" =~ ^darwin ]] && DIR="/usr/local/opt/fzf/shell"

[[ $- == *i* ]] && source "$DIR/completion.zsh" 2> /dev/null
FILE="$DIR/key-bindings.zsh" ; [ -f $FILE ] && source $FILE


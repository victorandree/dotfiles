# Allow local customizations before
if [ -f ~/.config/shell/zsh/local_before ]; then
    source ~/.config/shell/zsh/local_before
fi

# Common interactive shell configuration
source ~/.config/shell/rc.sh

# zsh interactive shell settings
source ~/.config/shell/zsh/settings.zsh

# Allow local customizations after
if [ -f ~/.config/shell/zsh/local_after ]; then
    source ~/.config/shell/zsh/local_after
fi

# Activate syntax highlighting (must come last)
source ~/.config/shell/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

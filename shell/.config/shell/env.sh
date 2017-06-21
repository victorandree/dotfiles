# Environment configuration for shells
# This should be sourced by all shell files

# Ansible should not use cows
export ANSIBLE_NOCOWS=1

# Use vim!
export EDITOR='vim'

if [ -f "$HOME/.config/shell/env_mac.sh" ]; then
  source "$HOME/.config/shell/env_mac.sh"
fi

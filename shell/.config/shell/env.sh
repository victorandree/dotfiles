# Environment configuration for shells
# This should be sourced by all shell files

# See: https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html
# We talke American English with Canadian formats
export LANG=en_US.UTF-8
export LC_MESSAGES=en_CA.UTF-8

# Ansible should not use cows
export ANSIBLE_NOCOWS=1

# Use vim!
export EDITOR='vim'

if [ -f "$HOME/.config/shell/env_mac.sh" ]; then
  source "$HOME/.config/shell/env_mac.sh"
fi

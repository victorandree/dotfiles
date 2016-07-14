# Common login shell configurations

# Environment variables

# Configure the locale
# More info here: https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html
# TODO This may break on some systems
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ANSIBLE_NOCOWS=1   # Be professional, Ansible
export EDITOR='vim'       # The power of vim

export MYSQL_HISTFILE="${HOME}/.local/mysql_history"

if [ -f ~/.config/shell/macosprofile.sh ]; then
    source ~/.config/shell/macosprofile.sh
fi

# Allow local overrides to the profile
if [ -f ~/.config/shell/localprofile.sh ]; then
    source ~/.config/shell/localprofile.sh
fi

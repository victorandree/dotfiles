# Common interactive shell configurations

# Aliases
alias grep='grep --color'                       # Use color with grep
alias ls='ls -l --color --hide="__pycache__"'   # Use color in ls

# Use GNU core utilities over macOS built-ins, if available
# This is the only macOS specific rc line -- if more stuff appears, I imagine
# its broken out to a separate macosrc.sh file
command -v gls >/dev/null 2>&1 && {
  alias ls='gls -l --color --hide="__pycache__"'
  alias dircolors='gdircolors'
}

alias uuid="python3 -c 'import sys,uuid; sys.stdout.write(str(uuid.uuid4()))'"

alias less='less --ignore-case'

alias cp='cp -i'        # Ask for confirmation before overwriting
alias mv='mv -i'        # Ask for confirmation before overwriting
alias mkdir='mkdir -p'  # Always create subdirectories

alias ..='cd ..'
alias ...='cd ../../'

# If neovim is available, use it instead of vim
command -v nvim >/dev/null 2>&1 && {
  alias vim='nvim'
}

# Use Andre Simon's highlight with less if available
command -v highlight >/dev/null 2>&1 && {
  export LESSOPEN="| $(command -v highlight) %s --out-format ansi --line-numbers --quiet --force"

  # Display ANSI escape sequences raw (colors)
  export LESS=" -R"
}

# Color for man pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
# export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
# export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline
export LESS_TERMCAP_ue=$'\e[0m'           # end underline

# Don’t clear the screen after quitting a manual page
# export MANPAGER="less -X"

# Configure $LS_COLORS with dircolors if needed (note dircolors might not be
# available on all systems).
if [[ -z $LS_COLORS ]]; then
    eval "$(dircolors ~/.config/dircolors)"
fi

# True color support for Neovim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Color scheme for Terminal
# BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-paraiso.sh"
# if [ -f $BASE16_SHELL ]; then
#     source $BASE16_SHELL
# fi

# Configure virtualenvwrapper for Python
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

alias v='workon'
alias v.deactivate='deactivate'
alias v.mk='mkvirtualenv --no-site-packages'
alias v.mk_withsitepackages='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

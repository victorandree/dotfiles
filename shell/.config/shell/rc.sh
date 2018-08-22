# Interactive shell configuration (for any shell)

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

# Play music from YouTube with mpv
function mm() {
  command -v mpv >/dev/null 2>&1 && {
    mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch:"$@"
  }
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
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline
export LESS_TERMCAP_ue=$'\e[0m'           # end underline

# Configure $LS_COLORS with dircolors if needed (note dircolors might not be
# available on all systems).
if [[ -z $LS_COLORS ]]; then
    eval "$(dircolors ~/.config/dircolors)"
fi

# Activate generic colorizer if available
# if [ -f $(brew --prefix)/etc/grc.bashrc ]; then
#     . $(brew --prefix)/etc/grc.bashrc
# fi

# True color support for Neovim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Use Base16 shell colors
# BASE16_SHELL=$HOME/.config/shell/base16-shell
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# This takes just a little bit too much time!! Use modern techniques
# instead.
# Configure virtualenvwrapper for Python
# if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#     source /usr/local/bin/virtualenvwrapper.sh
# fi
# alias v='workon'
# alias v.deactivate='deactivate'
# alias v.mk='mkvirtualenv --no-site-packages'
# alias v.mk_withsitepackages='mkvirtualenv'
# alias v.rm='rmvirtualenv'
# alias v.add2virtualenv='add2virtualenv'
# alias v.cdsitepackages='cdsitepackages'
# alias v.cd='cdvirtualenv'
# alias v.lssitepackages='lssitepackages'


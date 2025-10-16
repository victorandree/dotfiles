tap "homebrew/bundle"

brew "aspell"
brew "fzf"
brew "git"
brew "highlight"
brew "jq"

# Doesn't work properly.
# brew "neovim"

brew "pyenv"
brew "stow"
brew "tmux"
brew "xmlstarlet"

brew "coreutils" if OS.mac?
brew "findutils" if OS.mac?

# This installs `pam_reattach` which is required to make TouchID work for sudo inside tmux. Update `/etc/pam.d/sudo_local` with the following to enable:
#
# auth       optional       /opt/homebrew/lib/pam/pam_reattach.so
# auth       sufficient     pam_tid.so
#
# Note that if the module is missing, sudo will break, and it will be hard to fix because sudo is kind of required to edit the file. Be careful.
brew "pam_reattach" if OS.mac?

# Quicklook plugins for various files
cask "qlcolorcode" if OS.mac?
cask "quicklook-csv" if OS.mac?
cask "quicklook-json" if OS.mac?
cask "qlmarkdown" if OS.mac?

# Quicklook plaintext if no extension
cask "qlstephen" if OS.mac?

cask "visual-studio-code" if OS.mac?
cask "iterm2" if OS.mac?
cask "rectangle" if OS.mac?
cask "1password" if OS.mac?
cask "hammerspoon" if OS.mac?

cask 'font-fira-code'
cask 'font-fira-sans'
cask 'font-fira-mono'
cask 'font-source-code-pro'
cask 'font-iosevka'
cask 'font-fontawesome'
cask 'font-input'

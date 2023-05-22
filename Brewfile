tap "homebrew/bundle"
tap "homebrew/core"

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

tap "homebrew/cask"

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

tap "homebrew/cask-fonts"
cask 'font-fira-code'
cask 'font-fira-sans'
cask 'font-fira-mono'
cask 'font-source-code-pro'
cask 'font-iosevka'
cask 'font-fontawesome'
cask 'font-input'

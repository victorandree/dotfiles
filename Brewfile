tap "homebrew/bundle"
tap "homebrew/core"

brew "aspell"
brew "git"
brew "gnupg"
brew "jq"
brew "neovim"
brew "pass"
brew "pyenv"
brew "stow"
brew "tmux"
brew "tree"
brew "wget"

brew "pinentry-mac" if OS.mac?
brew "coreutils" if OS.mac?
brew "findutils" if OS.mac?

# Requires post-setup step:
# PREFIX="$XDG_DATA_HOME/brew/opt/browserpass" make hosts-firefox-user -f "$XDG_DATA_HOME/brew/opt/browserpass/lib/browserpass/Makefile"
tap "amar1729/formulae" if OS.mac?
brew "browserpass" if OS.mac?

tap "homebrew/cask"

# Quicklook plugins for various files
cask "qlcolorcode"
cask "quicklook-csv"
cask "quicklook-json"
cask "qlmarkdown"

# Quicklook plaintext if no extension
cask "qlstephen"

tap "homebrew/cask-fonts"
cask 'font-fira-code'
cask 'font-fira-sans'
cask 'font-fira-mono'
cask 'font-source-code-pro'
cask 'font-iosevka'
cask 'font-fontawesome'
cask 'font-input'

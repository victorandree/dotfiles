# Core Brewfile — the baseline installed on every machine with `brew bundle`.
#
# A-la-carte tools (Postgres, Redis, cloud CLIs, media libraries, VMs, extra
# terminals, etc.) are deliberately NOT listed here. Install them per-machine
# as needed, e.g.  `brew install postgresql@17 redis pgcli`.
# Run `brew bundle cleanup` to see what's installed but undeclared.

# --- Shell & CLI essentials ---
brew "git"
brew "gh"
brew "wget"
brew "ripgrep"
brew "fzf"
brew "jq"
brew "yq"
brew "httpie"
brew "tree"
brew "highlight"
brew "xmlstarlet"
brew "aspell"
brew "stow"
brew "tmux"
brew "neovim"        # your $EDITOR; the old "doesn't work properly" note is stale
brew "powershell"    # pwsh CLI (also installed as a cask — dedupe with `brew uninstall --cask powershell`)

# --- Version / environment management ---
brew "fnm"           # Node: reads package.json engines, switches on cd (see .zshrc)
brew "uv"            # Python: versions + venvs + CLI tools (replaces pyenv & pipx)

# --- Diagrams & document rendering ---
brew "graphviz"
brew "d2"
brew "weasyprint"

# --- Networking / local dev certs ---
brew "mkcert"

# --- macOS-only ---
brew "coreutils" if OS.mac?
brew "findutils" if OS.mac?

# Mac App Store CLI, so `brew bundle` can also install MAS apps, e.g.:
#   mas "Thing", id: 1234567890
brew "mas" if OS.mac?

# pam-reattach makes TouchID work for sudo inside tmux. After install, add to
# /etc/pam.d/sudo_local:
#   auth       optional       /opt/homebrew/lib/pam/pam_reattach.so
#   auth       sufficient     pam_tid.so
# Warning: a wrong module path breaks sudo and is hard to fix. Be careful.
brew "pam-reattach" if OS.mac?

# --- GUI applications ---
cask "ghostty" if OS.mac?
cask "iterm2" if OS.mac?
cask "visual-studio-code" if OS.mac?
cask "rectangle" if OS.mac?
cask "hammerspoon" if OS.mac?
cask "firefox" if OS.mac?
cask "google-chrome" if OS.mac?
cask "1password" if OS.mac?
cask "1password-cli" if OS.mac?
cask "vlc" if OS.mac?

# Quicklook plugins for previewing various file types
cask "syntax-highlight" if OS.mac?   # source + JSON preview (replaces quicklook-json/qlcolorcode)
cask "quicklook-csv" if OS.mac?
cask "qlmarkdown" if OS.mac?
cask "qlstephen" if OS.mac?          # plaintext preview for extensionless files

# --- Fonts ---
cask "font-iosevka-term-nerd-font" if OS.mac?   # used by Ghostty (ghostty/config)
cask "font-iosevka" if OS.mac?                  # base Iosevka + Iosevka Fixed/Term
cask "font-iosevka-aile" if OS.mac?             # quasi-proportional sans companion
cask "font-iosevka-etoile" if OS.mac?           # proportional slab-serif companion
cask "font-fira-code" if OS.mac?
cask "font-fira-sans" if OS.mac?
cask "font-fira-mono" if OS.mac?
cask "font-source-code-pro" if OS.mac?
cask "font-fontawesome" if OS.mac?
cask "font-input" if OS.mac?
cask "font-roboto" if OS.mac?
cask "font-josefin-sans" if OS.mac?
cask "font-ia-writer-mono" if OS.mac?
cask "font-ia-writer-quattro" if OS.mac?

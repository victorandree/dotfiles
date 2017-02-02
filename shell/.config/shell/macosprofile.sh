# macOS specific login shell configuration (environment setup)
[[ "$OSTYPE" =~ ^darwin ]] || return 1

export EDITOR='nvim'        # Atom as main editor on macOS
export GIT_EDITOR='nvim'    # but nvim is really good for Git commit messages

# Parallels just works really well -- most of the time
export VAGRANT_DEFAULT_PROVIDER=parallels

# Enable cursor switching in iTerm
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# BYOBU is a tmux/screen drop-in replacement
export BYOBU_PREFIX=$(brew --prefix)

# Activate generic colorizer if available
if [ -f $(brew --prefix)/etc/grc.bashrc ]; then
    . $(brew --prefix)/etc/grc.bashrc
fi

# This is for quick Clojure start-up primarily -- strictly not macOS specific
# but don't want to clutter others with it.
export BOOT_JVM_OPTIONS="-client
-XX:+TieredCompilation
-XX:TieredStopAtLevel=1
-Xmx2g
-XX:+UseConcMarkSweepGC
-XX:+CMSClassUnloadingEnabled
-Xverify:none"

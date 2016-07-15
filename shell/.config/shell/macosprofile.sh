# macOS specific login shell configuration (environment setup)
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Atom is main editor on macOS (see also $GIT_EDITOR)
export EDITOR='atom -nw'

# Parallels just works really well -- most of the time
export VAGRANT_DEFAULT_PROVIDER=parallels

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

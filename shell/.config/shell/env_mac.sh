# macOS specific login shell configuration (environment setup)
[[ "$OSTYPE" =~ ^darwin ]] || return 1

export EDITOR='nvim'        # Atom as main editor on macOS
export GIT_EDITOR='nvim'    # but nvim is really good for Git commit messages

# Parallels just works really well -- most of the time
export VAGRANT_DEFAULT_PROVIDER=parallels

# Enable cursor switching in iTerm
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Always here on macOSjj
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export PATH="${HOME}/Library/Android/sdk/tools:${PATH}"

# This is not supported on servers, so only do OSX
# See: https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html
# Use American English with superior Canadian formats
export LANG=en_US.UTF-8
export LC_MESSAGES=en_CA.UTF-8

# This is for quick Clojure start-up primarily -- strictly not macOS specific
# but don't want to clutter others with it.
export BOOT_JVM_OPTIONS="-client
  -XX:+TieredCompilation
  -XX:TieredStopAtLevel=1
  -Xmx2g
  -XX:+UseConcMarkSweepGC
  -XX:+CMSClassUnloadingEnabled
  -Xverify:none"

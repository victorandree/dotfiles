# macOS specific environment configuration
[ "${OSTYPE#darwin}" = "$OSTYPE" ] && return 1

# Adds user specific Homebrew paths
export PATH="$XDG_DATA_HOME/brew/bin:$PATH"

# This only works reliably on macOS but is required to get encodings right.
# American formats are stupid, but so are most "national" formats.
# For example, `LANG=sv_SE date +%x` results in `23.05.2020`
export LANG="en_US.UTF-8"

# Enable cursor switching in nvim
export NVIM_TUI_ENABLE_CURSOR_SHAPE="1"

# This is for quick Clojure start-up
export BOOT_JVM_OPTIONS="-client
  -XX:+TieredCompilation
  -XX:TieredStopAtLevel=1
  -Xmx2g
  -XX:+UseConcMarkSweepGC
  -XX:+CMSClassUnloadingEnabled
  -Xverify:none"

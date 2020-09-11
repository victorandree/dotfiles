# macOS specific environment configuration
[ "${OSTYPE#darwin}" = "$OSTYPE" ] && return 1

# This only works reliably on macOS but is required to get encodings right.
# American formats are stupid, but so are most "national" formats.
# For example, `LANG=sv_SE date +%x` results in `23.05.2020`
export LANG="en_US.UTF-8"

# Enable cursor switching in nvim
export NVIM_TUI_ENABLE_CURSOR_SHAPE="1"

# If GNU ls is available, use it and use colorized output
if command -v gls >/dev/null; then
  alias ls="gls -l --color"
fi

if command -v gdircolors >/dev/null && test -r "$XDG_CONFIG_HOME/dircolors"; then
  eval $(gdircolors "$XDG_CONFIG_HOME/dircolors")
fi

# This is for quick Clojure start-up
export BOOT_JVM_OPTIONS="-client
  -XX:+TieredCompilation
  -XX:TieredStopAtLevel=1
  -Xmx2g
  -XX:+UseConcMarkSweepGC
  -XX:+CMSClassUnloadingEnabled
  -Xverify:none"

# fzf shell integration: completion + key bindings (Ctrl-T, Ctrl-R, Alt-C).
# `fzf --zsh` (fzf >= 0.48) replaces the old brew-path sourcing. The binary is
# already on PATH via `brew shellenv`, so there's nothing else to wire up.
command -v fzf >/dev/null || return 1

source <(fzf --zsh)

# @victorandree/dotfiles

> Multiuser and multiplatform dotfiles using [GNU Stow]

## Bootstrap

A new system is bootstrapped by cloning, stowing and activating the dotfiles. Activating involves installing utilities and configuring the shell.

This repository is **public**, so the first clone needs no authentication — clone over HTTPS. Push access (SSH via the 1Password agent) is set up afterwards, once `brew bundle` has installed 1Password. If you ever fork this private, install `gh` first (`brew install gh && gh auth login`, a browser flow) and clone before the rest.

1. Install [Homebrew] (also installs the Xcode Command Line Tools, i.e. `git`).
2. Clone the repository over HTTPS.
3. Install utilities using [Homebrew].
4. Run stow to link directories.
5. Wire up the "local" entrypoint files.
6. Enable push access and finish machine setup.

```shell
# 1. Install Homebrew (pulls in the Xcode CLT / git)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone over HTTPS — no key required for a public repo
git clone https://github.com/victorandree/dotfiles.git ~/.dotfiles

# 3. Install utilities (1Password, Ghostty, Hammerspoon, fonts, CLIs, …)
cd ~/.dotfiles && brew bundle

# 4. Link directories (--no-folding is a stow flag; */ expands to the packages)
stow --no-folding */

# 5. Wire up "local" entrypoints
# We prefer having "local" files include configuration, because utilities like to add stuff to these locations
echo 'source "$HOME/.config/zsh/zlogin.zsh"' >~/.zlogin
printf '[include]\n  path = ~/.config/git/default\n' >~/.config/git/config
echo 'source $XDG_CONFIG_HOME/tmux.conf' >~/.tmux.conf
```

Then finish machine setup:

```shell
# 6a. Sign into 1Password, then enable Settings > Developer > "Use the SSH agent".
#     ~/.ssh/config is stowed and already points IdentityAgent at that agent.
#     Machine-specific ssh overrides go in ~/.ssh/config.local (not tracked).

# 6b. Switch this clone to SSH so you can push
git -C ~/.dotfiles remote set-url origin git@github.com:victorandree/dotfiles.git

# 6c. Apply macOS defaults
zsh ~/.dotfiles/macos/preferences.zsh

# 6d. Enable Touch ID for sudo (incl. inside tmux via pam_reattach).
#     Requires the pam-reattach formula (installed by brew bundle).
#     Keep a second terminal with a valid sudo session open while testing:
#     a wrong pam_reattach path breaks sudo and is annoying to recover from.
sudo tee /etc/pam.d/sudo_local >/dev/null <<'PAM'
auth       optional       /opt/homebrew/lib/pam/pam_reattach.so
auth       sufficient     pam_tid.so
PAM
```

Finally, grant the apps that need it their permissions in System Settings > Privacy & Security (Hammerspoon and Rectangle need Accessibility). Hammerspoon's `hs` CLI is installed via its own menu (Install Command Line Tool) or comes with the cask.

### Configuration

There are a couple of considerations made about configuring shells:

1. **You probably don't want to "reset" environment in every shell.** This means that we don't use `.zshenv` to configure e.g. `PATH`, or other environment variables.
2. **macOS runs `path_helper` in `/etc/zprofile`.** `path_helper` will put anything already on `PATH` at the end. Therefore, you can't override system utilities in `.zshenv`
3. **Install scripts like to mess with `~/.zshrc`.** The post-install script of many utilities is to add stuff to your `PATH`. This either happens automatically or as instructions to do so.
4. **Non-interactive login shells are very rare.** You'll almost never run a login shell that's non-interactive. This means that `~/.zshrc` isn't very useful.

TL;DR: Create `~/.zlogin` to override global stuff for login shells. This does mean that when running SSH commands, the environment may not have been setup "as expected", but otherwise results in a simple experience.

### zsh plugins

We add some plugins to zsh using [git subtree]. These are added with prefix `shell/.local/share/zsh`. To update:

```sh
git subtree pull --squash --prefix shell/.local/share/zsh/pure https://github.com/sindresorhus/pure.git master
git subtree pull --squash --prefix shell/.local/share/zsh/zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git master
```

### nvim packages

[vim-packager] is used for vim packages. It doesn't seem possible to manage the package manager separately from packages. Therefore, install using the instructions:

```sh
git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager
```

[vim-packager]: https://github.com/kristijanhusak/vim-packager
[GNU Stow]: https://www.gnu.org/software/stow/
[Homebrew]: https://brew.sh/
[git subtree]: https://www.atlassian.com/git/tutorials/git-subtree

# @victorandree/dotfiles

> Multiuser and multiplatform dotfiles using [GNU Stow]

## Bootstrap

A new system is bootstrapped by cloning, stowing and activating the dotfiles. Activating involves installing utilities and configuring the shell. To clone, use git and an SSH key for push access.

1. Clone repository (requires git).
2. Install [Homebrew].
3. Install utilities using [Homebrew].
4. Run stow to setup directories.
5. Bootstrap other utilities.

```shell
# Clone repository
git clone git@github.com:victorandree/dotfiles.git ~/.dotfiles

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install utilities using Homebrew
cd ~/.dotfiles && brew bundle

# Run stow to setup directories
ls -d */ | xargs --no-folding stow

# Bootstrap other utilities
# We prefer having "local" files include configuration, because utilities like to add stuff to these locations
echo 'source "$HOME/.config/zsh/zlogin.zsh"' >~/.zlogin
echo '[include]\n  path = ~/.config/git/default' >~/.config/git/config
echo 'source $XDG_CONFIG_HOME/tmux.conf' >~/.tmux.conf
```

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

# dotfiles

> Multi user and multi platform dotfiles using [GNU Stow]

## Bootstrap

A new system is bootstrapped by cloning, stowing and activating the dotfiles.
Activating involves installing utilities and configuring the shell.
To clone, use git and an SSH key for push access.

### macOS: Installing Homebrew and stow

On macOS, use a user specific [Homebrew] install to manage utilities.
Use [alternative installation instructions](https://docs.brew.sh/Installation).
Once installed, install [gnu stow] before the next steps.

```sh
# Install Homebrew into ~/.local/share/brew
mkdir -p $HOME/.local/share/brew && \
  curl -L https://github.com/Homebrew/brew/tarball/master | \
  tar xz --strip 1 -C $HOME/.local/share/brew

export PATH=$HOME/.local/share/brew/bin:$PATH

# Bootstrap GNU stow
brew install stow
```

### Clone and stow

```sh
# Enter these commands manually
# Add key at https://github.com/settings/keys
ssh-keygen

# Clone the repository and stow subdirectories
git clone git@github.com:victorandree/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
ls -d */ | xargs --no-folding stow

# Bootstrap zsh
echo 'source "$HOME/.config/zsh/zlogin.zsh"' >~/.zlogin

# Bootstrap git
echo '[include]\n  path = ~/.config/git/default' >~/.config/git/config

# Bootstrap tmux
echo 'source $XDG_CONFIG_HOME/tmux.conf' >~/.tmux.conf
```

### Shell bootstrap

There are a couple of considerations made about configuring shells:

1. **You probably don't want to "reset" environment in every shell.**
   This means that we don't use `.zshenv` to configure e.g. `PATH`,
   or other environment variables.
2. **macOS runs `path_helper` in `/etc/zprofile`.**
   `path_helper` will put anything already on `PATH` at the end.
   Therefore, you can't override system utilities in `.zshenv`
3. **Install scripts like to mess with `~/.zshrc`.**
   The post-install script of many utilities is to add stuff to your `PATH`.
   This either happens automatically or as instructions to do so.
4. **Non-interactive login shells are very rare.**
   You'll almost never run a login shell that's non-interactive.
   This means that `~/.zshrc` isn't very useful.

TL;DR: Create `~/.zlogin` to override global stuff for login shells.
This does mean that when running SSH commands,
the environment may not have been setup "as expected",
but otherwise results in a simple experience.

#### Plugins

We add some plugins to zsh using [git subtree].
These are added with prefix `shell/.local/share/zsh`.
To update,

```sh
git subtree pull \
   --squash \
   --prefix shell/.local/share/zsh/pure \
   https://github.com/sindresorhus/pure.git master

git subtree pull \
   --squash \
   --prefix shell/.local/share/zsh/zsh-syntax-highlighting \
   https://github.com/zsh-users/zsh-syntax-highlighting.git master
```

### GnuPG bootstrap

The login shell sets `GNUPGHOME="$XDG_DATA_HOME/gnupg"`.
GnuPG mixes data with configuration, so it's best to configure on your own.
On macOS, you'll want to install `pinentry-mac` and use it.

```sh
cat <<EOF >$GNUPGHOME/gpg-agent.conf
pinentry-program $(command -v pinentry-mac)
EOF
```

### nvim packages

[vim-packager] is used for vim packages.
It doesn't seem possible to manage the package manager separately from packages.
Therefore, start by installing `minpac` using the instructions:

```sh
git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager
```

[vim-packager]: https://github.com/kristijanhusak/vim-packager
[gnu stow]: https://www.gnu.org/software/stow/
[homebrew]: https://brew.sh/
[git subtree]: https://www.atlassian.com/git/tutorials/git-subtree


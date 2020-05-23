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

### GnuPG bootstrap

The login shell sets `GNUPGHOME="$XDG_DATA_HOME/gnupg"`.
GnuPG mixes data with configuration, so it's best to configure on your own.
On macOS, you'll want to install `pinentry-mac` and use it.

```sh
cat <<EOF >$GNUPGHOME/gpg-agent.conf
pinentry-program $(command -v pinentry-mac)
EOF
```

[gnu stow]: https://www.gnu.org/software/stow/
[homebrew]: https://brew.sh/

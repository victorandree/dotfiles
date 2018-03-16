Dotfiles
========

Simplified management using [GNU Stow][gnu-stow]. No weird installation tricks,
just simple symlinks on a per-package basis. Goals:

1.  It should be safe to run essentially `ls -d */ | xargs stow` from the
    `dotfiles` directory (this would symlink all packages to `$HOME`).

    Stow `.stow-local-ignore` files can be used to exclude files from packages.
    The `homebrew` directory is a good example of this as it only includes
    a Brewfile for use with `brew bundle`.

2.  Avoid cluttering `$HOME` if possible, and prefer `.config/` however don't
    rely on shell variables for configuration directories (e.g. `$INPUTRC`).

3.  Provide platform and shell independent configuration for common parts.

Since most dotfiles begin with dots and stow just symlinks without any renaming,
browsing this directory without displaying hidden files will be rather empty.

Bootstrap
---------

### Homebrew
The `homebrew` configuration comes with a `Brewfile` that can be used to
install necessary apps. Then, from the `dotfiles/homebrew` directory, just run:

    brew bundle

And all kinds of interesting Homebrew packages will be installed.

### GNU Stow
You will need [GNU Stow][gnu-stow] installed to stow files properly. On macOS,
this is most easily achieved through [Homebrew][homebrew] and a simple

    brew install stow

Then, with the `dotfiles` directory checked out somewhere, run `stow` for each
configuration you want. The above `ls -d */ | xargs stow` command will install
all configurations.

    ls -d */ | xargs stow

This will activate all relevant dotfiles.

### GPG
On macOS, use pinentry-mac to enter passphrases for PGP keys:

    echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf

For all OS, it makes sense to configure UTF-8 support because you have weird
characters in your name:

    echo "charset utf-8" >> ~/.gnupg/gpg.conf

This isn't part of dotfiles, because .gnupg needs to contain other stuff (well,
it can probably be configured otherwise).

### Shells
I use [zsh][zsh] as my main shell. Install it with Homebrew and then configure
`/etc/shells` to allow you to use it by adding this line:

    /usr/local/bin/zsh

Then, change your shell by running:

    chsh -s /usr/local/bin/zsh


[gnu-stow]: https://www.gnu.org/software/stow/
[homebrew]: http://brew.sh/
[homebrew-bundle]: https://github.com/Homebrew/homebrew-bundle
[zsh]: http://www.zsh.org/

# git

The configuration for git contains a bunch of useful aliases, and sets up your user. For work, you may want to set some local configuration. Do this in a local configuration in `~/.config/git/local`:

```ini
[user]
  email = victor@work.se
  signingkey = 642D2344FAC18923

[commit]
  gpgsign = true
```

# What goes where

For zsh:

| File     | Action      | Comment                            |
| -------- | ----------- | ---------------------------------- |
| zshenv   | All         | `$PATH; $EDITOR; $PAGER`           |
| zshrc    | Interactive | `setopt`, zle, history, completion |
| zlogin   | Login       | Login only                         |
| zprofile | Login       | Login before zshrc                 |
| zlogout  | Logout      |                                    |

## Configuration

Set up `.zshenv`:

    source $HOME/.config/shell/zsh/env.zsh

Set up `.zshrc`:

    source $HOME/.config/shell/zsh/rc.zsh

Add local customizations after these lines.

# noob-terminal

The terminal configs I use every day on macOS.

| Tool | Status |
| :--- | :--- |
| tmux | `tmux.conf` |
| Ghostty | planned |
| Neovim | planned |

## Install

```bash
ln -sf "$PWD/tmux.conf" ~/.tmux.conf
tmux source-file ~/.tmux.conf   # if a server is already running
```

## Keyboard usage

### tmux

The prefix is `Ctrl+B`. Press it, release it, then press the next key.

**Sessions** are the reason to use tmux. A session stays alive when you close
the terminal, lose an SSH connection, or put the laptop to sleep.

| Command | What it does |
| :--- | :--- |
| `tmux new -s work` | start a session named `work` |
| `tmux ls` | list the sessions |
| `tmux a -t work` | attach to `work` |
| `Ctrl+B` `d` | detach. Every program keeps running |

**Windows** (like tabs)

| Key | What it does |
| :--- | :--- |
| `Ctrl+B` `c` | new window, in the current directory |
| `Ctrl+B` `1`…`9` | go to a window by number |
| `Ctrl+B` `n` / `p` | go to the next or previous window |
| `Ctrl+B` `,` | rename the window |
| `Ctrl+B` `&` | close the window |

**Panes** (splits)

| Key | What it does |
| :--- | :--- |
| `Ctrl+B` `\|` | split left and right |
| `Ctrl+B` `-` | split top and bottom |
| `Ctrl+B` arrow | go to another pane |
| `Ctrl+B` `z` | zoom the pane. Press again to restore it |
| `Ctrl+B` `x` | close the pane |

The default split keys are `%` and `"`. This config adds `|` and `-` because
each key looks like the split it makes.

**Copy text**

The mouse is on. Drag a selection to copy it to the macOS clipboard. To copy
without the mouse:

| Key | What it does |
| :--- | :--- |
| `Ctrl+B` `[` | enter copy mode. Scroll with the arrows or PageUp |
| `v` | start the selection |
| `y` | copy to the clipboard and exit |
| `q` | exit without a copy |

**Other**

| Key | What it does |
| :--- | :--- |
| `Ctrl+B` `r` | reload `~/.tmux.conf` |
| `Ctrl+B` `?` | show every binding |

### Ghostty

Ghostty has these keys built in. No config is necessary. tmux makes the
splits, so one Ghostty window is usually enough.

| Key | What it does |
| :--- | :--- |
| `Cmd+D` | split right |
| `Cmd+Shift+D` | split down |
| `Cmd+Opt` + arrow | go to another split |
| `Cmd+Shift+Enter` | zoom the split |
| `Cmd+T` | new tab |
| `Cmd+1`…`9` | go to a tab by number |
| `Cmd+W` | close the split or the tab |

## Notes

`tmux.conf` sets three options that Claude Code needs inside tmux:
`allow-passthrough`, `extended-keys`, and the `extkeys` terminal feature.
Without them, tmux blocks Shift+Enter and desktop notifications do not reach
Ghostty.

# noob-terminal

Hey. This is the setup I use in my terminal every day, on macOS.

I work in infrastructure, so most of my day happens in terminal sessions.
Everything here is picked to survive that. Closing the laptop should not kill
my work.

One directory per tool.

## The stack

<img src="assets/tmux.svg" height="20" align="top" alt=""> **[tmux](https://tmux.app/)**
is the session manager, and the reason I stopped opening ten terminal tabs. A
session keeps running when I close the terminal, lose an SSH connection, or
shut the laptop. Config lives in `tmux/`.

<img src="assets/lazy-nvim.svg" height="20" align="top" alt=""> **Neovim**
is my editor, set up with [LazyVim](https://github.com/LazyVim/LazyVim) so I
get a language server, completion, and a file tree without maintaining any of
it myself. Config lives in `neovim/`.

<img src="assets/ghostty.png" height="20" align="top" alt=""> **[Ghostty](https://ghostty.org/)**
is the terminal itself. Fast, native on macOS, and its defaults are good
enough that my config stays at three lines. Config lives in `ghostty/`.

## Install

```bash
ln -sf  "$PWD/tmux/tmux.conf" ~/.tmux.conf
ln -sfn "$PWD/neovim"         ~/.config/nvim
ln -sf  "$PWD/ghostty/config" ~/.config/ghostty/config
tmux source-file ~/.tmux.conf   # if a server is already running
```

Neovim installs its plugins on the first start.

## Keyboard usage

### <img src="assets/tmux.svg" height="20" align="top" alt=""> tmux

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

### <img src="assets/ghostty.png" height="20" align="top" alt=""> Ghostty

Ghostty has these keys built in. tmux makes the splits, so one Ghostty
window is usually enough.

`ghostty/config` sets the shell, the font, and one keybind. Run
`ghostty +show-config --default` to list all 634 options.

| Key | What it does |
| :--- | :--- |
| `Cmd+D` | split right |
| `Cmd+Shift+D` | split down |
| `Cmd+Opt` + arrow | go to another split |
| `Cmd+Shift+Enter` | zoom the split |
| `Cmd+T` | new tab |
| `Cmd+1`…`9` | go to a tab by number |
| `Cmd+W` | close the split or the tab |

### <img src="assets/lazy-nvim.svg" height="20" align="top" alt=""> Neovim

This config is the LazyVim starter with two changes. Everything else is a
LazyVim default.

The leader key is Space. Press it and wait. A menu lists every key that can
follow, so you can find a command without a cheat sheet.

| Key | What it does |
| :--- | :--- |
| `<leader>` | show the menu of every leader key |
| `<leader>e` | open the file explorer |
| `<leader><space>` | find a file in the project |
| `<leader>/` | search the text of the whole project |
| `<leader>lg` | open LazyGit |
| `:Lazy` | manage the plugins |
| `:LazyExtras` | add language support, such as Go or Terraform |

The two changes in `neovim/lua/plugins/`: `lazygit.nvim` on `<leader>lg`, and a
file explorer that shows dotfiles and ignored files.

### Neovim stack

Built on the [LazyVim starter](https://github.com/LazyVim/starter), so most
of it arrives preconfigured. The parts I lean on:

| What it gives me | Plugin |
| :--- | :--- |
| Language servers | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), installed by [mason.nvim](https://github.com/mason-org/mason.nvim) |
| Completion | [blink.cmp](https://github.com/saghen/blink.cmp) |
| Syntax and text objects | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| Format and lint on save | [conform.nvim](https://github.com/stevearc/conform.nvim), [nvim-lint](https://github.com/mfussenegger/nvim-lint) |
| Changed lines in the gutter | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) |
| Git in a window | [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim), wrapping [lazygit](https://github.com/jesseduffield/lazygit) |
| File tree and pickers | [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim), [snacks.nvim](https://github.com/folke/snacks.nvim) |
| Everything else | [LazyVim](https://github.com/LazyVim/LazyVim) on [lazy.nvim](https://github.com/folke/lazy.nvim) |

`neovim/lazy-lock.json` holds the full list of 34 plugins and pins each one
to a commit.

## Notes

`tmux/tmux.conf` sets three options that Claude Code needs inside tmux:
`allow-passthrough`, `extended-keys`, and the `extkeys` terminal feature.
Without them, tmux blocks Shift+Enter and desktop notifications do not reach
Ghostty.

---

<sub>The logos in `assets/` belong to their projects. The tmux mark comes
from <a href="https://tmux.app/">tmux.app</a>, the lazy.nvim mark from
<a href="https://lazy.folke.io/">lazy.folke.io</a>, and the Ghostty mark from
<a href="https://ghostty.org/">ghostty.org</a>. Every plugin and tool listed
above belongs to its own authors.</sub>

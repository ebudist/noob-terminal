# noob-terminal

This repo is just a bunch of my personal terminal setup that I use daily on
my MacBook. I put it here so I won't forget it when I want to reuse it. If
someone else wants to use it too, you're welcome.

The stack: Ghostty, tmux, starship, Neovim, fzf.

The configs are mostly default, with small changes to fit my needs. Here's
what I changed.

## Ghostty

- fish as the shell, MesloLGS Nerd Font at size 15
- Shift+Enter keybind for Claude Code

## tmux

- `|` and `-` to split, new panes and windows open in the current directory
- vi copy mode that copies to the macOS clipboard
- Mouse on, windows start at 1
- Status bar in tokyonight-moon, with the Kubernetes context and git state
- Passthrough and extended keys for Claude Code

## starship

- Two-line prompt: user, directory, Kubernetes context, language versions, git
- Kubernetes context always visible
- AWS and gcloud modules off

## Neovim

- LazyVim starter
- lazygit on `<leader>lg`
- neo-tree shows dotfiles and ignored files

## fzf

- Opens in a tmux popup at 80% of the window
- `full` style preset, with a colored border on each section
- The list label shows the match count

fzf reads `fzfrc` only when `FZF_DEFAULT_OPTS_FILE` points to it. For fish,
add this line to `config.fish`:

```fish
set -gx FZF_DEFAULT_OPTS_FILE ~/.config/fzf/fzfrc
```

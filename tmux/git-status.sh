#!/bin/sh
# Prints the git state of $1 for the tmux status bar, or nothing outside a
# repo. One `git status` call supplies every count.
#
#   main        on main, nothing to do
#   main +2     2 staged
#   main !3     3 tracked files changed but not staged
#   main ?1     1 untracked file
#   main ⇡2     2 commits not pushed
#   main ⇣1     1 commit not pulled
#
# The symbols match the ones starship prints in the prompt.

cd "$1" 2>/dev/null || exit 0

git status --porcelain=v2 --branch 2>/dev/null | awk '
/^# branch\.head / { b = $3 }
/^# branch\.ab /   { a = $3 + 0; d = $4 + 0 }
/^[12] /           { if (substr($2,1,1) != ".") s++; if (substr($2,2,1) != ".") m++ }
/^u /              { c++ }
/^\? /             { u++ }
END {
  if (b == "") exit
  green  = "#[fg=#c3e88d]"
  yellow = "#[fg=#ffc777]"
  cyan   = "#[fg=#86e1fc]"
  red    = "#[fg=#ff757f]"

  out = green " " b
  if (c)   out = out red    " ~" c
  if (s)   out = out yellow " +" s
  if (m)   out = out yellow " !" m
  if (u)   out = out yellow " ?" u
  if (a>0) out = out cyan   " ⇡" a
  if (d<0) out = out cyan   " ⇣" -d
  print out
}'

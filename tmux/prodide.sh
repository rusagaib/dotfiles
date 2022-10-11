#!/bin/bash

function makeitrun ()
{
  opt="$1"
  case "${opt}" in
    i|init) 
      echo -e "Starting tmux session.."
      tmux new -s prod -n docs 
    ;;
    s|start) 
      tmux new-window -t prod
      tmux rename-window -t prod:2 'ide'
      tmux new-window -t prod
      tmux rename-window -t prod:3 'term' 
      tmux new-window -t prod
      tmux rename-window -t prod:4 'lazygit'
      tmux new-window -t prod
      tmux rename-window -t prod:5 'htop'
      tmux send-keys -t prod:htop "htop" C-m     
    ;;
    *) 
      echo "no opts.." 
    ;;
  esac
}

# calling makeitrun
makeitrun $1


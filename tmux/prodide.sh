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
      tmux rename-window -t prod:4 'mocp'
      tmux new-window -t prod
      tmux rename-window -t prod:5 'htop'
      tmux send-keys -t prod:htop "htop" C-m     
    ;;
    a|attach)
      tmux a -t prod 
    ;;
    q|quit)
      echo -e "Killing all tmux session..."
      sleep 2 
      tmux kill-session -t prod 
    ;;
    qa|quit)
      echo -e "Killing all tmux session..."
      sleep 2 
      tmux kill-server  
    ;;
    -h|--help)
      echo -e "i|s|a|l|q| - init|start|attach|list|quit/kill-session"
    ;;
    l|ls|list)
      echo -e "current session: "
      tmux ls
    ;;
    *) 
      echo "no opts.. (or read -h)" 
    ;;
  esac
}

# calling makeitrun
makeitrun $1


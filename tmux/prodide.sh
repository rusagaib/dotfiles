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
      # auto create session if none 
      if ! tmux has-session -t "${session}" 2>/dev/null; then
        echo "Session '${session}' not found. Creating..."
        tmux new-session -d -s "${session}" -n hq
      fi

      case "${template}" in
        dev)
          echo "Applying DEV template to session '${session}'..."
          tmux new-window -t "${session}" -n code
          tmux new-window -t "${session}" -n server
          tmux send-keys -t "${session}:server" "cd ~/project && php artisan serve" C-m
          tmux new-window -t "${session}" -n logs
          tmux send-keys -t "${session}:logs" "tail -f storage/logs/laravel.log" C-m
        ;;
        rad)
          echo "Applying RAD template to session '${session}'..."
          clear
          tmux new-window -t "${session}" -n sshtAPI
          tmux send-keys -t "${session}:sshtAPI" "${cdtoapi}" C-m
          tmux new-window -t "${session}" -n pacs-lite
          tmux send-keys -t "${session}:pacs-lite" "${cdtoplite}" C-m
          tmux new-window -t "${session}" -n drouter
          tmux send-keys -t "${session}:drouter" "${cdtodrouter}" C-m
          tmux new-window -t "${session}" -n mysql
          tmux send-keys -t "${session}:mysql" "${cdtomysql}" C-m
          tmux new-window -t "${session}" -n authken
          tmux send-keys -t "${session}:authken" "${cdtoauthken}" C-m
          tmux new-window -t "${session}" -n nginx-acme
          tmux send-keys -t "${session}:nginx-acme" "${cdtonginxacme}" C-m
        ;;
        *)
          echo "Applying DEFAULT template to session '${session}'..."
          tmux new-window -t "${session}" -n ide
          tmux new-window -t "${session}" -n term
          tmux new-window -t "${session}" -n htop
          tmux send-keys -t "${session}:htop" "htop" C-m
        ;;
      esac
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


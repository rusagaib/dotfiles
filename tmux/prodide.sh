#!/bin/bash

source $HOME/.config/tmux/.env

function makeitrun ()
{
  opt="$1"
  name="$2"
  template="$3"

  # default session name kalau ga ada nama
  session="${name:-prod}"

  case "${opt}" in
    i|init)
      echo -e "Creating tmux session '${session}'..."
      tmux new-session -d -s "${session}" -n main
      echo -e "Session '${session}' created."
      # auto-attach
      tmux attach -t "${session}"
    ;;
    s|start)
      # kalau belum ada session, otomatis buat
      if ! tmux has-session -t "${session}" 2>/dev/null; then
        echo "Session '${session}' not found. Creating..."
        tmux new-session -d -s "${session}" -n main
      fi

      case "${template}" in
        dev)
          echo "Applying DEV template to session '${session}'..."
          tmux new-window -t "${session}" -n code
          tmux new-window -t "${session}" -n server
          tmux new-window -t "${session}" -n logs
        ;;
        rad)
          echo "Applying RAD template to session '${session}'..."
          tmux new-window -t "${session}" -n sshtAPI
          tmux send-keys -t "${session}:sshtAPI" "cd ${API} && clear" C-m
          tmux new-window -t "${session}" -n pacs-lite
          tmux send-keys -t "${session}:pacs-lite" "cd ${PLITE} && clear" C-m
          tmux new-window -t "${session}" -n drouter
          tmux send-keys -t "${session}:drouter" "cd ${DROUTER} && clear" C-m
          tmux new-window -t "${session}" -n mysql
          tmux send-keys -t "${session}:mysql" "cd ${MYSQL} && clear" C-m
          tmux new-window -t "${session}" -n authken
          tmux send-keys -t "${session}:authken" "cd ${AUTHKEN} && clear" C-m
          tmux new-window -t "${session}" -n nginx-acme
          tmux send-keys -t "${session}:nginx-acme" "cd ${NGINXACME} && clear" C-m
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
      if tmux has-session -t "${session}" 2>/dev/null; then
        echo "Attaching to session '${session}'..."
        tmux attach -t "${session}"
      else
        echo "Session '${session}' not found."
      fi
    ;;
    d|detach)
      echo "Detaching current tmux client..."
      tmux detach-client
    ;;
    q|quit)
      if tmux has-session -t "${session}" 2>/dev/null; then
        echo "Killing session '${session}'..."
        tmux kill-session -t "${session}"
      else
        echo "Session '${session}' not found."
      fi
    ;;
    qa)
      echo "Killing all tmux sessions..."
      tmux kill-server
    ;;
    l|ls|list)
      echo "Current tmux sessions:"
      tmux ls || echo "No active sessions."
    ;;
    -h|--help)
      echo -e "Usage:"
      echo -e "  rhq i [name]             - init new session (default: prod, auto-attach)"
      echo -e "  rhq s [name] [template]  - start template (default|dev|rad)"
      echo -e "  rhq a [name]             - attach to session"
      echo -e "  rhq d                    - detach current client"
      echo -e "  rhq q [name]             - quit specific session"
      echo -e "  rhq qa                   - quit all sessions"
      echo -e "  rhq l                    - list sessions"
    ;;
    *)
      echo "No valid option. Use -h for help."
    ;;
  esac
}

makeitrun "$1" "$2" "$3"


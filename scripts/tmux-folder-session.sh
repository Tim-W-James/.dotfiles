#!/bin/bash

if [ ! -x "$(command -v tmux)" ]; then
  echo "tmux not found"
fi

if [ -z $1 ]; then
  folder="$(pwd)"

  # Construct the path for the folder icon
  FOLDER_ICON_PATH="$folder/.icon"

  if [ -f $FOLDER_ICON_PATH ]; then
    folder_icon="$(cat $FOLDER_ICON_PATH)"
  else
    # default icon
    folder_icon=""
  fi

  # Strip the path and invalid chars
  folder_name="$(basename $folder | sed "s/[^[:alnum:]_-]//g")"

  # Construct the session name
  SESSION="$folder_icon $folder_name"
else
  # Use input name
  SESSION="$1"
fi

# Attach to Tmux
if [ -z "$TMUX" ]; then
  # We're not inside Tmux.
  echo "attaching to session $SESSION"
  tmux attach-session -d -t "$SESSION" || (echo "creating a new session $SESSION" && tmux new-session -s "$SESSION")
else
  # We're inside Tmux
  if [ -z "$(tmux ls | grep $SESSION)" ]; then
    # Create a new dettached session
    tmux new -s "$SESSION" -d
  fi
  # Switch to the session
  tmux switch-client -t "$SESSION"
fi

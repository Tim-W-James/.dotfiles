#!/bin/bash
ssh-keygen -t ed25519 -C "$1"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
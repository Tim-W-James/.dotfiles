#!/bin/bash
if [ -x "$(command -v apt)" ]; then
  apt update
  apt install apt-transport-https ca-certificates curl software-properties-common libnss3-tools -y
  # git
  apt install git -y
  # java
  apt install default-jre -y
  apt install default-jdk -y
  # python
  apt-get install python3.6 -y
  apt-get install python3-pip -y
  # gem
  apt install ruby-full -y
  # tmux
  apt install tmux -y
  # utilities
  apt install tree -y
  apt-get install zip unzip -y
  apt-get install jq -y
  apt install xclip -y
  curl -sfL https://direnv.net/install.sh | bash
else
  echo "apt not found"
fi
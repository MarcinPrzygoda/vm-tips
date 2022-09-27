#!/bin/bash
# Copies .bash_aliases to /home/${USER}

#############
# Functions #
#############

main() {
  echo -n "Copying .bash_aliases to /home/${USER} ... "
  cp ".bash_aliases" "/home/${USER}"
  echo -e "$(lightGreen 'done')"
}

lightGreen() {
  echo "\033[0;32m${1}\033[0m"
}

###########
# Process #
###########

main
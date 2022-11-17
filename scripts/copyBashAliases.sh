#!/bin/bash
# Copies .bash_aliases to ${HOME}

#############
# Functions #
#############

lightGreen() {
  echo "\033[0;32m${1}\033[0m"
}

main() {
  echo -n "Copying .bash_aliases to ${HOME} ... "
  cp ".bash_aliases" "${HOME}"
  echo -e "$(lightGreen 'done')"
}

###########
# Process #
###########

main
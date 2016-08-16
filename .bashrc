## Environment variables ##

# Basic colors
_c_err=$'\033[1;31m'
_c_reset=$'\033[m'

# Prompt
_p_punct=$'\\[\033[1;30m\\]'
_p_e_code=$'\\[\033[1;30;101m\033[1;38;5;232;48;5;196m\\]'
_p_host=$'\\[\033[0;33m\\]'
_p_dir=$'\\[\033[1;36m\\]'
_p_end=$'\\[\033[1;32m\\]'
_p_reset="\\[$_c_reset\\]"

PS1="\$(exit_code=\$?; [[ \$exit_code -eq 0 ]] || printf \"${_p_e_code} %s ${_p_reset}\" \$exit_code)${_p_punct}[${_p_reset}dc-builder${_p_punct}:${_p_host}\h${_p_punct}] ${_p_dir}\w${_p_end} \$ ${_p_reset}"


## Useful commands and aliases ##

# Run a command, and color anything it writes to stderr red.
# Usage: color COMMAND [ARG ...]
color()(set -o pipefail;"$@" 2>&1>&3|sed 's/.*/'$_c_err'&'$_c_reset'/'>&2)3>&1
export -f color # Make sure `color` is accessible by subprocesses, so the `make` alias continues to work.

# Color output!
alias make='color make'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

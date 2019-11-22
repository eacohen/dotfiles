#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Create terraform alias tf + default flags
autoload bashcompinit && bashcompinit
if [ $commands[terraform] ]; then
  alias tf='terraform'
  export TF_CLI_ARGS_fmt='-list -write -recursive'
  complete -o nospace -C $commands[terraform] terraform
fi

export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# Allow better colors and visual features in applications 
export TERM=xterm-256color

# Make timeouts quicker
KEYTIMEOUT=1

# Use custom vi bindings
bindkey -M vicmd 'L' vi-end-of-line
bindkey -M vicmd 'H' vi-first-non-blank

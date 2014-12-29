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
source ~/dotfiles/.aliases
source ~/dotfiles/.functions
source ~/.extra

export PATH="/Users/glenn/.rvm/gems/ruby-2.1.2/bin:/Users/glenn/.rvm/gems/ruby-2.1.2@global/bin:/Users/glenn/.rvm/rubies/ruby-2.1.2/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/Users/glenn/.rvm/bin"

# Load modules
zstyle ':prezto:load' pmodule 'prompt' 'environment' 'terminal' 'git' 'syntax highlighting' 'history' 'history substring search' 'utility' 'ssh' 'spectrum' 'node.js' 'fasd'
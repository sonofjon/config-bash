# ~/.bashrc: executed by bash(1) for non-login shells.
#
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples.

## If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## Write new lines to the history file immediately
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

## Don't put duplicate lines in the history
##   ... or force ignoredups and ignorespace.
HISTCONTROL=ignoredups:ignorespace

## History ignore patterns
##   HISTIGNORE=ll:ltr:fg:exit:"cd ..":cd:top:em:"tail -f /var/log/syslog":df:ml:cd
##   Tip: * Use 'cat .bash_history | sort | uniq -c | sort -nr | head -n 20'
##          to find the 20 most common commands.
##        * Use 'cat .bash_history | egrep -v '^(ll|ltr|fg|exit|cd|top|em|df|ml|cd)$' > .bash_history_new'
##          to clean out various lines (exact match), but note that removing
##          2-3 character command only reduces file size by a few percent,
##          while the number of lines decreases by about 25%. Not worthwhile!

## Append to the history file
##   (don't overwrite it).
shopt -s histappend

## Set history size
# HISTSIZE=1000

## Set history file size
# HISTFILESIZE=2000

## Unset history size
##   ...so that every Bash session keeps all the commands entered
##   (instead of the last $HISTSIZE only).
unset HISTSIZE
export HISTSIZE

## Unset history file size
##   ...so that, at the end of each session, Bash unconditionally
##   appends (only if histappend is enabled?) all the commands it has
##   in memory to the history file (instead of truncating the file to
##   be at most $HISTFILESIZE lines).
unset HISTFILESIZE
export HISTFILESIZE

## Check the window size after each command
##   ...and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

## Use "**" pattern match
##   If set, the pattern "**" used in a pathname expansion context
##   will match all files and zero or more directories and
##   subdirectories.
# shopt -s globstar

## Pass history substitutions to the readline editing buffer
##   ...instead of immediately passing them to the shell parser.
shopt -s histverify

## Do not attempt to search PATH for possible completions
##   ...when completion is attempted on an empty line.
shopt -s no_empty_cmd_completion

## Enable isearch-forward
##   (disables XON/XOFF flow control)
[[ $- == *i* ]] && stty -ixon

## Make 'less' more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## Enable programmable completion features
##   (you don't need to enable this, if it's already enabled in
##   /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## These are set in ~/.profile
#  
# # Set PATH to include user's private bin if it exists
# if [ -d ~/bin ] ; then
#     PATH=~/bin:"${PATH}"
#     export PATH
# fi
#
# ## Set PATH to include user's local bin if it exists
# if [ -d ~/local/bin ] ; then
#     PATH=~/local/bin:"${PATH}"
#     export PATH
# fi
#
# ## Do the same with MANPATH
# if [ -d ~/local/man ]; then
#     MANPATH=~/local/man:"${MANPATH}"
#     export MANPATH
# fi

## Load prompt settings
if [ -f "$HOME/.bash_prompt" ]; then
    . "$HOME/.bash_prompt"
fi

## Load system (OS) specific settings
if [ -f "$HOME/.bashrc_system" ]; then
    . "$HOME/.bashrc_system"
fi

## Load distribution specific settings
if [ -f "$HOME/.bashrc_distro" ]; then
    . "$HOME/.bashrc_distro"
fi

## Load local settings
if [ -f "$HOME/.bashrc_local" ]; then
    . "$HOME/.bashrc_local"
fi

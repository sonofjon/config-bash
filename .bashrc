# ~/.bashrc: executed by bash(1) for non-login shells.
#
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# History ignore patterns
#HISTIGNORE=ll:ltr:fg:exit:"cd ..":cd:top:em:"tail -f /var/log/syslog":df:ml:cd
# Tip: * Use 'cat .bash_history | sort | uniq -c | sort -nr | head -n 20'
#        to find the 20 most common commands.
#      * Use 'cat .bash_history | egrep -v '^(ll|ltr|fg|exit|cd|top|em|df|ml|cd)$' > .bash_history_new'
#        to clean out various lines (exact match), but note that removing
#        2-3 character command only reduces file size by a few percent,
#        while the number of lines decreases by about 25%. Not worthwhile!

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

# Unset HISTSIZE so that every Bash session keeps all the commands
# entered (instead of the last $HISTSIZE only)
unset HISTSIZE
export HISTSIZE
# Unset HISTFILESIZE so that, at the end of each session, Bash
# unconditionally appends (only if histappend is enabled?) all the
# commands it has in memory to the history file (instead of truncating
# the file to be at most $HISTFILESIZE lines)
unset HISTFILESIZE
export HISTFILESIZE

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Pass HISTORY substitutions to the readline editing buffer instead of
# immediately passing them to the shell parser
shopt -s histverify

# Do not attempt to search the PATH for possible completions when
# completion is attempted on an empty line;
shopt -s no_empty_cmd_completion

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# These are set in ~/.profile
#  
# # Set PATH to include user's private bin if it exists
# if [ -d ~/bin ] ; then
#     PATH=~/bin:"${PATH}"
#     export PATH
# fi
#
# # Set PATH to include user's local bin if it exists
# if [ -d ~/local/bin ] ; then
#     PATH=~/local/bin:"${PATH}"
#     export PATH
# fi
#
# # Do the same with MANPATH
# if [ -d ~/local/man ]; then
#     MANPATH=~/local/man:"${MANPATH}"
#     export MANPATH
# fi

# Load settings specific to local machine
if [ -f $HOME/.bashrc_local ]; then
    . $HOME/.bashrc_local
fi

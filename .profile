# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
#
# See /usr/share/doc/bash/examples/startup-files for examples.
# The files are located in the bash-doc package.

# Set umask
#   The default umask is set in /etc/profile; for setting the umask
#   for ssh logins, install and configure the libpam-umask package.
# umask 022

## If running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

## Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:${PATH}"
fi

## Set PATH so it includes user's local bin if it exists
if [ -d "$HOME/local/bin" ] ; then
    PATH="$HOME/local/bin:${PATH}"
fi

## Set PATH so it includes user's local sbin if it exists
if [ -d "$HOME/local/sbin" ] ; then
    PATH="$HOME/local/sbin:${PATH}"
fi

## Set PATH to include user's .local bin if it exists (for python)
if [ -d ~/.local/bin ] ; then
    PATH=~/.local/bin:"${PATH}"
fi

## Set MANPATH so it includes user's local man if it exists
if [ -d "$HOME/local/man" ]; then
    MANPATH="$HOME/local/man:${MANPATH}"
fi

# export LANG="en_US.utf8"

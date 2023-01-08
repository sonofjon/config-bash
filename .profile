# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
#
# Note that after editing this file, environment variables set here do not
# become available system-wide until a new session is started, i.e. after
# signing out and in again, or after a reboot.
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

## Set PATH to include user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

## Set PATH to include user's local bin if it exists
if [ -d ~/local/bin ] ; then
    PATH=~/local/bin:"${PATH}"
fi

## Set PATH so it includes user's local sbin if it exists
if [ -d ~/local/sbin ] ; then
    PATH=~/local/sbin:"${PATH}"
fi

## Set PATH to include user's .local bin if it exists (for Python)
if [ -d ~/.local/bin ] ; then
    PATH=~/.local/bin:"${PATH}"
fi

## Set PATH to include user's .cargo bin if it exists (for Rust)
if [ -d ~/.cargo/bin ] ; then
    PATH=~/.cargo/bin:"${PATH}"
fi

## Set MANPATH to include user's local man if it exists
if [ -d ~/local/man ]; then
    MANPATH=~/local/man:"${MANPATH}"
fi

# export LANG="en_US.utf8"

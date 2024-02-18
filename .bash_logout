# ~/.bash_logout: executed by bash(1) when login shell exits.

# Clear the screen when leaving the console (to increase privacy)
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# Kill running ssh-agents
# killall ssh-agent

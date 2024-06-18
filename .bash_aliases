### Files

alias rm='rm -i'         # interactive remove
# alias binrm='/bin/rm -i'

alias cp='cp -i'         # interactive copy
alias mv='mv -i'         # interactive move
alias ln='ln -v'         # verbose linking

# if type -P "gls" &>/dev/null; then
# if [ -x "$(command -v "gls")" ]; then   # macOS (with coreutils)
if [ -x "/opt/homebrew/bin/gls" ]; then   # macOS (with coreutils)
    # Add color, and group folders and hidden files
    LS="gls --color=always --group-directories-first -v"
else                                      # Linux
    # Add color, group folders and hidden files
    LS="ls --color=always --group-directories-first -v"
fi

# shellcheck disable=SC2139
{
alias ll="$LS -oF"
alias la="$LS -AoF"
alias lt="$LS -oFt"       # sort by modification
alias ltr="$LS -oFtr"     #   ...reverse
alias ltu="$LS -oFtu"     # sort by access
alias ltur="$LS -oFtur"   #   ...reverse
alias lS="$LS -oS -r"     # sort by size (reverse order)
alias lX="$LS -oX"        # sort by extension
}

alias cgrep='grep --color=always'   # always use color

### Processes

## Check active processes
alias pm='/bin/ps uc'       # my processes
alias pa='/bin/ps auxc'     # all processes
alias pt='/bin/ps uxfc'     # my processes (tree)
alias pst='/bin/ps auxfc'   # all processes (tree)


### Disk

## Exlude snap items from df
alias df='df -x"squashfs"'


### Text

## dos2unix
##   Remove end of line character "\r".
##   Syntax: perl -pi -e 's/\r$\//' filename
alias d2u='perl -pi -e '"'"'s/\r$//'"' $1 "

# Use Vim as pager
#   Provides syntax highlighting and color in various other contexts
alias vless='/usr/share/vim/vim82/macros/less.sh'


### Misc


### Programs

## General
# alias xo='xdg-open'
function xo() { xdg-open "$@" &>/dev/null & }
# alias go='gnome-open'
function no() { gnome-open "$@" &>/dev/null & }

## Emacs
# alias es='emacs-snapshot -nw'
alias em='emacs -nw'

## Latex
##   Convert from latex to postscript and run ghostview.
# alias tex2gv='tex2ps.2 $1 #; ghostview `echo $1 | sed s/'.tex'/.ps/` &'

# Latex clean
alias texclean='/bin/rm -vf *.aux *.log *.cb'

## ps2eps
alias ps2eps_safe='ps2eps -c -n -N'   # safe conversion

## svn
alias svndiff='svn diff --diff-cmd=colordiff'
alias svn2claj='svn2cl --group-by-day --separate-daylogs --include-rev'

## todo.txt
# alias t='todo.sh'


### Network

alias ip='ip -c'
alias ip4='ip -4 -c'

## Acanac SSH tunnel
alias sshtuna='ssh -v -f -N -n -D 8080 fbhqytjd@tunnel.acanac.net'


### Functions

# function ff() { find . -name '*'$1'*' ; }   # find a file
function ff()   # find a file
{ 
    if [ "$#" -ne 1 ]; then
        echo "function ff: find a file"
        echo "Usage: ff \"pattern\" "
        echo "e.g. ff \"*o3*.*\" "
    return;
    fi
    #find . -name '*'$1'*' ;
    find . -name "$1" ;
}

# function fe() { find . -name '*'$1'*' -exec $2 {} \; ; }   # ... and run $2 on it
function fe()   # ... and run $2 on it
{ 
    if [ "$#" -gt 2 ] || [ "$#" -eq 0 ]; then
        echo "function fe: find a file and run program on it"
        echo "Usage: fe \"pattern\" program"
        echo "e.g. fe \"*o3*.*\" \"ls -l\" "
    return;
    fi
    #find . -name '*'$1'*' -exec "$2" {} \; ;
    find . -name "$1" -exec "$2" {} \; ;
}

function fstr()   # find a string in a set of files
{
    # if [ "$#" -gt 2 ]; then
    if [ "$#" -gt 2 ] || [ "$#" -eq 0 ]; then
        echo "function fstr: find a string in a set of files"
        # echo "Usage: fstr \"pattern\" [files] "
        echo "Usage: fstr \"pattern\" [\"filepattern\"] "
        echo "e.g. fstr \"o3\" \"*.tex\""
    return;
    fi
    SMSO=$(tput smso)
    RMSO=$(tput rmso)
    # find . -type f -name "${2:-*}" -print0 | xargs -0 grep -sin "$1" | sed "s/$1/$SMSO$1$RMSO/gI"
    # Case sensitive:
    # find . -type f -name "${2:-*}" -print0 | xargs -0 grep -sin "$1" | sed "s/\($1\)/$SMSO\1$RMSO/gI"
    # Case insensitive:
    find . -type f -name "${2:-*}" -print0 | xargs -0 grep -sn "$1" | sed "s/\($1\)/$SMSO\1$RMSO/gI"
}

function swap()   # swap 2 filenames around
{
    local TMPFILE=tmp.$$
    mv "$1" "$TMPFILE"
    mv "$2" "$1"
    mv "$TMPFILE" "$2"
}


# Local Variables:
# mode: sh
# End:

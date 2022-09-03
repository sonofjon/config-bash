### Files

alias rm='rm -i'         # interactive remove
# alias binrm='/bin/rm -i'

alias cp='cp -i'         # interactive copy
alias mv='mv -i'         # interactive move
alias ln='ln -v'         # verbose linking

alias ll='ls -oF'
alias la='ls -AoF'
alias lt='ls -oFt'       # sort by modification
alias ltr='ls -oFtr'     #   ...reverse
alias ltu='ls -oFtu'     # sort by access
alias ltur='ls -oFtur'   #   ...reverse
alias lS='ls -oS -r'     # sort by size (reverse order)
alias lX='ls -oX'        # sort by extension

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


### Misc


### Programs

## General
# alias xo='xdg-open'
function xo() { xdg-open "$@" &>/dev/null & }
# alias go='gnome-open'
function go() { gnome-open "$@" &>/dev/null & }

## Emacs
# alias es='emacs-snapshot -nw'
alias em='emacs -nw'

## Latex
##   Convert from latex to postscript and run ghostview.
# alias tex2gv='tex2ps.2 $1 #; ghostview `echo $1 | sed s/'.tex'/.ps/` &'

# Latex clean
alias texclean='/bin/rm -vf *.aux *.log *.cb'

## Matlab
# alias matlab='matlab -nodesktop'
# alias ml='cd $HOME/matlab; matlab'
# alias ml65='/usr/local/share/matlab6p5/etc/lmstart; matlab.old -nodesktop -nosplash'
# alias ml='/usr/local/share/matlab7p4/etc/lmstart; matlab -nodesktop -nosplash'
alias ml74='export MATLAB_JAVA=/usr/lib/jvm/java-6-sun/jre; matlab74 -nodesktop -nosplash'
# alias ml74='export MATLAB_JAVA=/usr/lib/jvm/java-1.5.0-sun/jre; matlab74 -nodesktop -nosplash'
alias ml='matlab -nodesktop -nosplash'
# alias ml='export MATLAB_JAVA=/usr/lib/jvm/java-6-sun/jre; matlab -nodesktop -nosplash'

## ps2eps
alias ps2eps_safe='ps2eps -c -n -N'   # safe conversion

## rdesktop
# alias rdmisu='rdesktop -u andjo -k en-us -g 92% ts-misu1.ts.su.se'

## svn
alias svndiff='svn diff --diff-cmd=colordiff'
alias svn2claj='svn2cl --group-by-day --separate-daylogs --include-rev'

## todo.txt
# alias t='todo.sh'

## xterm
# alias xt='xterm -sb -sl 500 -ls -fn fixed -T \!\!:1 -n \!\!:1 &'
# alias xt='xterm -sb -sl 500 -ls -fn 7x13 -T \!\!:1 -n \!\!:1 &'
# alias xt='xterm -sb -sl 500 -ls &'


### Network

alias ip='ip -c'
alias ip4='ip -4 -c'

## nimbus.yorku.ca
alias slogn='slogin -v -2 nimbus.yorku.ca'
alias slognx='slogin -v -X -2 nimbus.yorku.ca'
alias sftpn='sftp -v -s /usr/local/libexec/sftp-server andreas@nimbus.yorku.ca'
sputn () { scp -p -r "$@" andreas@nimbus.yorku.ca:~/tmp/ ; }
sgetn () { scp -p -r andreas@nimbus.yorku.ca:"$*" . ; }
# function scpn() 
# { 
#     if [ "$#" -ne 1 ]; then
#         echo "function scpn: Secure copy from nimbus.yorku.ca to current directory"
#         echo "Usage: scpn filename"
#       echo "e.g. scpn \"~/Temp/file.txt\""
#       echo "     scpn \"k[1-5]*.001\""
#     return;
#     fi
#     scp -v andreas@nimbus.yorku.ca:"$1" . ; 
# }

## pollux
alias slogp='ssh -t -l andreasj remote.cmc.ec.gc.ca pollux'
alias slogpx='ssh -t -X -l andreasj remote.cmc.ec.gc.ca pollux'

## erg
alias sloge='ssh -t -l jonssona remote.cmc.ec.gc.ca erg'
alias slogex='ssh -t -X -l jonssona remote.cmc.ec.gc.ca erg'

## shell.su.se
alias slogsu='ssh -v andjo@shell.su.se'
alias slogsux='ssh -v -X andjo@shell.su.se'
sputsu () { scp -p -r "$@" andjo@shell.su.se:~/tmp/ ; }
sgetsu () { scp -p -r andjo@shell.su.se:"$*" . ; }

## nx.acanac.net
##   (Acanac online computer)
alias sshtuna='ssh -v -f -N -n -D 8080 fbhqytjd@nx.acanac.net'
alias sloga='ssh -v fbhqytjd@nx.acanac.net'
alias slogax='ssh -v -X fbhqytjd@nx.acanac.net'
sputa () { scp -p -r "$@" fbhqytjd@nx.acanac.net:~/tmp/ ; }
sgeta () { scp -p -r fbhqytjd@nx.acanac.net:"$*" . ; }

## tunnel.acanac.net
##   Acanac SSH tunnel (only works from Acanac IP)
alias sshtunb='ssh -v -f -N -n -D 8080 fbhqytjd@tunnel.acanac.net'


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
    if [ "$#" -gt 2 -o "$#" -eq 0 ]; then
        echo "function fe: find a file and run program on it"
        echo "Usage: fe \"pattern\" program"
        echo "e.g. fe \"*o3*.*\" \"ls -l\" "
    return;
    fi
    #find . -name '*'$1'*' -exec $2 {} \; ;
    find . -name "$1" -exec $2 {} \; ;
}

function fstr()   # find a string in a set of files
{
    # if [ "$#" -gt 2 ]; then
    if [ "$#" -gt 2 -o "$#" -eq 0 ]; then
        echo "function fstr: find a string in a set of files"
        # echo "Usage: fstr \"pattern\" [files] "
        echo "Usage: fstr \"pattern\" [\"filepattern\"] "
        echo "e.g. fstr \"o3\" \"*.tex\""
    return;
    fi
    SMSO=$(tput smso)
    RMSO=$(tput rmso)
    # find . -type f -name "${2:-*}" -print | xargs grep -sin "$1" | sed "s/$1/$SMSO$1$RMSO/gI"
    # Case sensitive:
    # find . -type f -name "${2:-*}" -print | xargs grep -sin "$1" | sed "s/\($1\)/$SMSO\1$RMSO/gI"
    # Case insensitive:
    find . -type f -name "${2:-*}" -print | xargs grep -sn "$1" | sed "s/\($1\)/$SMSO\1$RMSO/gI"
}

function swap()   # swap 2 filenames around
{
    local TMPFILE=tmp.$$
    mv $1 $TMPFILE
    mv $2 $1
    mv $TMPFILE $2
}


# Local Variables:
# mode: sh
# End:

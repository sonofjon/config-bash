#-------
# Files
#-------

alias rm='rm -i'
alias binrm='/bin/rm -i'	

alias cp='cp -i'
alias mv='mv -i'

alias ll='ls -oF'
alias la='ls -AoF'
alias lt='ls -oFt'		# sort by modification
alias ltr='ls -oFtr'
alias ltu='ls -oFtu'		# sort by access
alias ltur='ls -oFtur'
alias lS='ls -oS -r'	        # sort by size (reverse order)
alias lX='ls -oX'		# sort by extension
function lm()
{ 
ls -oF "$@" | less
}

alias ln='ln -v'		# verbose linking

#function ff() { find . -name '*'$1'*' ; }                 # find a file
function ff() # find a file
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

#function fe() { find . -name '*'$1'*' -exec $2 {} \; ; }  # ... and run $2 on it 
function fe() # ... and run $2 on it
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

function fstr() # find a string in a set of files
{
#    if [ "$#" -gt 2 ]; then
    if [ "$#" -gt 2 -o "$#" -eq 0 ]; then
        echo "function fstr: find a string in a set of files"
#        echo "Usage: fstr \"pattern\" [files] "
        echo "Usage: fstr \"pattern\" [\"filepattern\"] "
	echo "e.g. fstr \"o3\" \"*.tex\""
    return;
    fi
    SMSO=$(tput smso)
    RMSO=$(tput rmso)
    #find . -type f -name "${2:-*}" -print | xargs grep -sin "$1" | sed "s/$1/$SMSO$1$RMSO/gI"
    # Case sensitive:
    #find . -type f -name "${2:-*}" -print | xargs grep -sin "$1" | sed "s/\($1\)/$SMSO\1$RMSO/gI"
    # Case insensitive:
    find . -type f -name "${2:-*}" -print | xargs grep -sn "$1" | sed "s/\($1\)/$SMSO\1$RMSO/gI"
}

function swap()         # swap 2 filenames around
{
    local TMPFILE=tmp.$$
    mv $1 $TMPFILE
    mv $2 $1
    mv $TMPFILE $2
}


#---------
# Network
#---------

# nimbus.yorku.ca
alias slogn='slogin -v -2 nimbus.yorku.ca'
alias slognx='slogin -v -X -2 nimbus.yorku.ca'
alias sftpn='sftp -v -s /usr/local/libexec/sftp-server andreas@nimbus.yorku.ca'
sputn () { scp -p -r "$@" andreas@nimbus.yorku.ca:~/tmp/ ; }
sgetn () { scp -p -r andreas@nimbus.yorku.ca:"$@" . ; }
# function scpn() 
# { 
#     if [ "$#" -ne 1 ]; then
#         echo "function scpn: Secure copy from nimbus.yorku.ca to current directory"
#         echo "Usage: scpn filename"
# 	echo "e.g. scpn \"~/Temp/file.txt\""
# 	echo "     scpn \"k[1-5]*.001\""
#     return;
#     fi
#     scp -v andreas@nimbus.yorku.ca:"$1" . ; 
# }

# solar.eas.yorku.ca 
alias slogr='slogin -v solar.eas.yorku.ca'
alias slogrx='slogin -v -X solar.eas.yorku.ca'
sputr () { scp -p -r "$@" andreas@solar.eas.yorku.ca:~/tmp/ ; }
sgetr () { scp -p -r andreas@solar.eas.yorku.ca:"$@" . ; }

# fractus.eas.yorku.ca 
alias slogf='slogin -v fractus.eas.yorku.ca'
alias slogfx='slogin -v -X fractus.eas.yorku.ca'
sputf () { scp -p -r "$@" andreas@fractus.eas.yorku.ca:~/tmp/ ; }
sgetf () { scp -p -r andreas@fractus.eas.yorku.ca:"$@" . ; }

# pollux
alias slogp='ssh -t -l andreasj remote.cmc.ec.gc.ca pollux'
alias slogpx='ssh -t -X -l andreasj remote.cmc.ec.gc.ca pollux'

# erg
alias sloge='ssh -t -l jonssona remote.cmc.ec.gc.ca erg'
alias slogex='ssh -t -X -l jonssona remote.cmc.ec.gc.ca erg'

# mam.atmosp.physics.utoronto.ca
alias slogm='ssh -v andreas@mam.atmosp.physics.utoronto.ca'
alias slogmx='ssh -v -X andreas@mam.atmosp.physics.utoronto.ca'
# these do not work, no time to fix just now...
sputm () { scp -p -r "$@" andreas@mam.atmosp.physics.utoronto.ca:~/tmp/ ; }
sgetm () { scp -p -r andreas@mam.atmosp.physics.utoronto.ca:"$@" . ; }

# mamccc.atmosp.physics.utoronto.ca
alias slogmc='ssh -v andreas@mamccc.atmosp.physics.utoronto.ca'
alias slogmcx='ssh -v -X andreas@mamccc.atmosp.physics.utoronto.ca'
sputmc () { scp -p -r "$@" andreas@mamccc.atmosp.physics.utoronto.ca:~/tmp/ ; }
sgetmc () { scp -p -r andreas@mamccc.atmosp.physics.utoronto.ca:"$@" . ; }

# mamccc2.atmosp.physics.utoronto.ca
alias slogmc2='ssh -v andreas@mamccc2.atmosp.physics.utoronto.ca'
alias slogmc2x='ssh -v -X andreas@mamccc2.atmosp.physics.utoronto.ca'
sputmc2 () { scp -p -r "$@" andreas@mamccc2.atmosp.physics.utoronto.ca:~/tmp/ ; }
sgetmc2 () { scp -p -r andreas@mamccc2.atmosp.physics.utoronto.ca:"$@" . ; }

# sparc01.atmosp.physics.utoronto.ca
alias slogs='ssh -v andreas@sparc01.atmosp.physics.utoronto.ca'
alias slogsx='ssh -v -X andreas@sparc01.atmosp.physics.utoronto.ca'
sputs () { scp -p -r "$@" andreas@sparc01.atmosp.physics.utoronto.ca:~/tmp/ ; }
sgets () { scp -p -r andreas@sparc01.atmosp.physics.utoronto.ca:"$@" . ; }

# andjo@shell.su.se
alias slogsu='ssh -v andjo@shell.su.se'
alias slogsux='ssh -v -X andjo@shell.su.se'
sputsu () { scp -p -r "$@" andjo@shell.su.se:~/tmp/ ; }
sgetsu () { scp -p -r andjo@shell.su.se:"$@" . ; }

# brain.atmosp.physics.utoronto.ca
alias slogb='ssh -v andreas@brain.atmosp.physics.utoronto.ca'
alias slogbx='ssh -v -X andreas@brain.atmosp.physics.utoronto.ca'
sputb () { scp -p -r "$@" andreas@brain.atmosp.physics.utoronto.ca:~/tmp/ ; }
sgetb () { scp -p -r andreas@brain.atmosp.physics.utoronto.ca:"$@" . ; }

# brain2.atmosp.physics.utoronto.ca
alias slogb2='ssh -v andreas@brain2.atmosp.physics.utoronto.ca'
alias slogb2x='ssh -v -X andreas@brain2.atmosp.physics.utoronto.ca'
sputb2 () { scp -p -r "$@" andreas@brain2.atmosp.physics.utoronto.ca:~/tmp/ ; }
sgetb2 () { scp -p -r andreas@brain2.atmosp.physics.utoronto.ca:"$@" . ; }

# Acanac online computer nx.acanac.net
alias sshtuna='ssh -v -f -N -n -D 8080 fbhqytjd@nx.acanac.net'
alias sloga='ssh -v fbhqytjd@nx.acanac.net'
alias slogax='ssh -v -X fbhqytjd@nx.acanac.net'
sputa () { scp -p -r "$@" fbhqytjd@nx.acanac.net:~/tmp/ ; }
sgeta () { scp -p -r fbhqytjd@nx.acanac.net:"$@" . ; }

# Acanac SSH tunnel tunnel.acanac.net (only works from Acanac IP)
alias sshtunb='ssh -v -f -N -n -D 8080 fbhqytjd@tunnel.acanac.net'


#-----------
# Programs
#-----------

# General
#alias xo='xdg-open'
function xo() { xdg-open "$@" &>/dev/null & }
#alias go='gnome-open'
function go() { gnome-open "$@" &>/dev/null & }

# Emacs (open in current window):
alias em='emacs -nw'

# latex to postscript and ghostview!:
# alias tex2gv='tex2ps.2 $1 #; ghostview `echo $1 | sed s/'.tex'/.ps/` &'
# latex clean:
alias texclean='/bin/rm -vf *.aux *.log *.cb'

# Matlab: keyboard changes & aliases:
#alias matlab='matlab -nodesktop'
#alias ml='cd $HOME/matlab; matlab'
#alias ml65='/usr/local/share/matlab6p5/etc/lmstart; matlab.old -nodesktop -nosplash'
#alias ml='/usr/local/share/matlab7p4/etc/lmstart; matlab -nodesktop -nosplash'
alias ml74='export MATLAB_JAVA=/usr/lib/jvm/java-6-sun/jre; matlab74 -nodesktop -nosplash'
#alias ml74='export MATLAB_JAVA=/usr/lib/jvm/java-1.5.0-sun/jre; matlab74 -nodesktop -nosplash'
alias ml='matlab -nodesktop -nosplash'
#alias ml='export MATLAB_JAVA=/usr/lib/jvm/java-6-sun/jre; matlab -nodesktop -nosplash'

# ps2eps: Safe conversion: 
alias ps2eps_safe='ps2eps -c -n -N'

# Rdesktop:
##alias rdmisu='rdesktop -u andjo -k en-us -g 96% ts-misu1.ts.su.se'
#alias rdmisu='rdesktop -u andjo -k en-us -g 92% ts-misu1.ts.su.se'

# SVN:
alias svndiff='svn diff --diff-cmd=colordiff'
alias svn2claj='svn2cl --group-by-day --separate-daylogs --include-rev'

# Todo.txt
alias t='todo.sh'

# Xterminal:
# alias xt='xterm -sb -sl 500 -ls -fn fixed -T \!\!:1 -n \!\!:1 &'
# alias xt='xterm -sb -sl 500 -ls -fn 7x13 -T \!\!:1 -n \!\!:1 &'
#alias xt='xterm -sb -sl 500 -ls &'


#-----------
# Processes
#-----------

alias psall='ps -ef |grep andreas'	# check active processes

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pnice() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,nice,command ; }
function paj() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }


#------
# Misc
#------

# Remove end of line character "\r" (dos2unix):
# Syntax: perl -pi -e 's/\r$\//' filename
alias d2u='perl -pi -e '"'"'s/\r$//'"' $1 "

# alias cd='set old=$PWD; cd $*'
# alias back='set back=$old; set old=$cwd; cd $back; unset back; dirs'
# alias back='cd $OLDPWD; dirs'

# Exlude snap items from df
alias df='df -x"squashfs"'
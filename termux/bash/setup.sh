#/bin/bash
# SETUP .bash_aliases add bash aliases to terminal on startup
# backup file first 
if [ -f ../usr/etc/bash.bashrc.backup ]; then
    echo 'EXISTING BACKUP - reset from backup: ../usr/etc/bash.bashrc.backup'
    cd ~/ && cp ../usr/etc/bash.bashrc.backup ../usr/etc/bash.bashrc
    else
        echo 'NEW BACKUP: ../usr/etc/bash.bashrc.backup'
        cd ~/ && cp ../usr/etc/bash.bashrc ../usr/etc/bash.bashrc.backup
fi

# write to bashrc file
echo 'if [ -f ~/resources/termux/bash/.bash_aliases ]; then . ~/resources/termux/bash/.bash_aliases fi' >> ../usr/etc/bash.bashrc
echo 'if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases fi' >> ../usr/etc/bash.bashrc





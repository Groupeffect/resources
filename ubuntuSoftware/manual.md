# Linux Accounts
as sudo user:
create new user `adduser <user name>`
add to groups `groupadd docker <user name>`

# SSH
create ssh for github and other services

# Github Repository
clone repositories with ssh or token

# Keypass
manage passwords

# Info
`lshw -C display` shows graphic hardware

## WMCTRL - interact with a EWMH/NetWM compatible X Window Manager. Resize windows with cli
- https://wiki.ubuntuusers.de/wmctrl/
`wmctrl -r :SELECT: -e 0,200,200,640,480`

## More Software
`npx --version`
`ip address`
`nmap -Pn 0 9999`
`man man`
`ss -plunt` # sockets

## Kill
show processes
`ps -ef | grep 'python'`
`kill -9 <pid>`

## CRON JOBS
crontab -l
crontab -e -u # will set table for user
# Termux Android App

Releases: `https://github.com/termux/termux-app/releases`

App: `termux-app_v0.118.0+github-debug_arm64-v8a.apk`

First Setup: `apt update && apt upgrade && pkg install python nodejs curl unzip`

<!-- Git: at `~/` download `git clone git@github.com:Groupeffect/resources.git` -->
Download Folder: 

`curl -L -O https://github.com/Groupeffect/resources/archive/refs/heads/main.zip && unzip main.zip -d src && cp -r src/resources-main resources && rm main.zip && rm -rdf src`


Setup : `bash ~/resources/termux/bash/setup.sh`
Manual aliases if setup fails: 
`cp resources/termux/bash/.bash_aliases ./bash_aliases`
Optiona A:
`echo 'if [ -f ~/resources/termux/bash/.bash_aliases ]; then . ~/resources/termux/bash/.bash_aliases fi' >> ../usr/etc/bash.bashrc`
Optiona B:
`echo 'if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases fi' >> ../usr/etc/bash.bashrc`


Restart Termux app for fresh Terminal with aliases
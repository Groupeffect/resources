#/bin/bash/
alias proto='source ~/proto/bin/activate'
alias janitor='apt update && apt upgrade && apt autoclean && apt autoremove'
alias work='proto && cd ~/projects && ls'
alias update= 'cd ~/ && curl -L -O https://github.com/Groupeffect/resources/archive/refs/heads/main.zip && unzip main.zip -d src && cp src/resources-main resources && rm main.zip && rm -drf src'


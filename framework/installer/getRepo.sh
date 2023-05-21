#!/bin/bash

# curl https://raw.githubusercontent.com/Groupeffect/resources/main/framework/installer/getRepo.sh -O
# bash ./getRepo.sh

GITHUB_REPOSITORY_URL="https://<token>@github.com/Groupeffect/webserver.git"

get_git_repository() {
    if [ $GITHUB_REPOSITORY_URL ]
        then 
            git clone $GITHUB_REPOSITORY_URL
        else
            echo "no variable GITHUB_REPOSITORY_URL"
    fi
}

get_git_repository

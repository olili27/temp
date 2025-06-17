#!/bin/bash

# SCRIPTPATH=$(dirname `realpath "$0"`)
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BRANCH="main"

function showInfo(){
    printf '\033[1;33mINFO:\033[0m %s\n' "$1"
}

function raiseError(){
    printf '\033[1;31mERROR:\033[0m %s\n' "$1"
}

function showSuccess(){
    printf '\033[1;32mSUCCESS:\033[0m %s\n' "$1"
}


function pull(){
    showInfo "pulling latest changes..."

    cd "$SCRIPTPATH"
    if [[ "$?" != "0" ]]; then
        raiseError "failed to cd"
        exit 1
    fi

    git pull origin $BRANCH
    if [[ "$?" != "0" ]]; then
        raiseError "failed to pull"
        exit 1
    fi
    showSuccess "PULLED ALL CHANGES"
}

function push(){
    showInfo "pushing changes..."
    
    git push origin $BRANCH
    
    if [[ "$?" != "0" ]]; then
        raiseError "failed to push to git"
        exit 1
    fi
    showSuccess "PUSHED ALL CHANGES"
}

function commit(){
    cd "$SCRIPTPATH"
    if [[ "$?" != "0" ]]; then
        raiseError "failed to cd"
        exit 1
    fi
    
    git add .
    git commit

    statusCode=$?
    # echo "$statusCode"
    nothingToCommit=1

    if [[ "$statusCode" != "0" && "$statusCode" != "$nothingToCommit" ]]; then
        raiseError "failed to commit changes"
        exit 1
    fi
    showSuccess "COMMITED ALL CHANGES"
}

function merge(){
    commit
    pull

    showSuccess "MERGED ALL CHANGES"

    push
}

merge
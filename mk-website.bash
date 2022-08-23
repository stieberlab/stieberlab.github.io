#!/bin/bash

function checkApp() {
    command -v $1 >/dev/null 2>&1 || { echo $1 " is required but not installed."; exit 1; }
}

function softwareCheck() {
    for APP_NAME in $@; do
        checkApp $APP_NAME
    done
}

function mkPage () {
    content="$1"
    html="$2"

    echo "Rendering $html"
    mkpage \
        "content=$content" \
        page.tmpl > $html
}

function mkSite() {
    FOLDER=$1

    echo "Generating HTML content for $FOLDER"
    find . -type f | grep -v .git | grep -E ".html$" | while read ITEM; do
        mkPage  "$ITEM" "docs/$ITEM"
        git add "docs/$ITEM"
    done
}

echo "Checking necessary software is installed"
softwareCheck mkpage
echo "Generating website"
mkSite "."

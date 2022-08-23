#!/bin/bash


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
    done
}

echo "Generating website"
mkSite "."

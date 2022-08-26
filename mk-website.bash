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
    ./mkpage \
        "content=$content" \
        page.tmpl > $html
}

function mkSite() {
    FOLDER=$1
	
    echo "Generating HTML content for $FOLDER"
    find . -type f | grep -v .git | grep -E ".txt$" | while read ITEM; do
        HTML_FNAME=$(basename $ITEM .txt).html
	echo $ITEM
        echo site/$HTML_FNAME
	mkPage  "$ITEM" "site/$HTML_FNAME"
    done
}

echo "Generating website"
mkSite "."

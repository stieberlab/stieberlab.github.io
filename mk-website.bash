#!/bin/bash

function mkPage () {
    content="$1"
    html="$2"

    echo "Rendering $html"
    cat page.tmpl $content footer.tmpl > $html
}

function mkSite() {
    FOLDER=$1
	
    echo "Generating HTML content for $FOLDER"
    find $FOLDER -type f -maxdepth 0 | grep -E ".html$" | while read ITEM; do
	mkPage  "$ITEM" "site/$ITEM"
    done
}

echo "Generating website"
mkSite "."

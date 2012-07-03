#!/bin/bash

if [ $# = 0 ]; then
    echo "Build CompilerDesign."
    echo ""
    echo "Usage:	$0 COMMAND [-v]"
    echo ""
    echo "Where COMMAND is one of the following:"
    echo "pdf         Builds CompilerDesign PDF."
    echo "epub        Builds CompilerDesign EPUB."
    echo "html        Builds CompilerDesign HTML."
    echo "clean       Removes the existing generated files."
#    echo "check       Generate spelling, diction, style report."
    echo "total       Generate leader board by total line contributions."
    echo "lastweek    Generate leader board by commits within last week."
    echo "mergestats  Generate leader board by merges within last week."
    echo ""
    echo "Example: $0 pdf"
else
    mkdir -p build
    if [ $1 = "clean" ]; then
        echo "Clearing build folder."
        rm build/* -r
        exit
    fi
    if [ $1 = "pdf" ] || [ $1 = "epub" ] || [ $1 = "html" ]; then
        echo "Building CompilerDesign"
        cp -R images build
    fi
    if [ $1 = "pdf" ]; then
        # Convert SVG to PDF for PDF output
        for image in `ls build/images/*.svg`; do
            inkscape -f $image -A ${image%.svg}.pdf
        done
        sed -E -e "s/images\/(.*)\.svg/build\/images\/\1.pdf/" textbook/* | pandoc -S -o build/CompilerDesign.pdf  --toc
    elif [ $1 = "epub" ]; then
        sed -E -e "s/images\//build\/images\//" title.txt textbook/* | pandoc -S --epub-metadata=metadata.xml -o build/CompilerDesign.epub  --toc 
    elif [ $1 = "html" ]; then
        pandoc -s -o build/CompilerDesign.html --toc textbook/*
    elif [ $1 = "total" ]; then
        # Adapted from: http://stackoverflow.com/questions/4589731/git-blame-statistics

        echo "Non-whitespace lines by author."
        echo ""
        git ls-tree -r HEAD|sed -E -e 's/^.{53}//'|while read filename; do git blame -w "$filename"; done|sed -E -e 's/.*\((.*)[0-9]{4}-[0-9]{2}-[0-9]{2} .*/\1/' -e 's/ +$//'|sort|uniq -c|sort -nr
    elif [ $1 = "lastweek" ]; then
        echo "Last week's commits."
        echo ""
        git shortlog --no-merges -s -n --since="(7days)"
    elif [ $1 = "mergestats" ]; then
        git shortlog --merges -s -n --since="(7days)"
    fi
fi
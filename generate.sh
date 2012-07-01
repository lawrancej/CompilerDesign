#!/bin/bash

if [ $# = 0 ]; then
    echo "Build CompilerDesign."
    echo ""
    echo "Usage:	$0 COMMAND [-v]"
    echo ""
    echo "Where COMMAND is one of the following:"
    echo "book        Builds CompilerDesign."
    echo "rebuild     Clean and rebuild CompilerDesign."
    echo "clean       Removes the existing generated files."
#    echo "check       Generate spelling, diction, style report."
    echo "total       Generate leader board by total line contributions."
    echo "lastweek    Generate leader board by commits within last week."
    echo "mergestats  Generate leader board by merges within last week."
    echo ""
    echo "Example: $0 book"
else
    mkdir -p build
    if [ $1 = "clean" ] || [ $1 = "rebuild" ]; then
        echo "Clearing build folder."
        rm build/* -r
    fi
    if [ $1 = "book" ] || [ $1 = "rebuild" ]; then
        echo "Building CompilerDesign"
        pandoc -S --epub-metadata=metadata.xml -o build/CompilerDesign.epub --toc textbook/*
        pandoc -S -o build/CompilerDesign.pdf  --toc textbook/*
        pandoc -s -o build/CompilerDesign.html --toc textbook/*
    fi
    if [ $1 = "total" ]; then
        # Adapted from: http://stackoverflow.com/questions/4589731/git-blame-statistics

        git ls-tree -r HEAD|sed -E -e 's/^.{53}//'|while read filename; do git blame -w "$filename"; done|sed -E -e 's/.*\((.*)[0-9]{4}-[0-9]{2}-[0-9]{2} .*/\1/' -e 's/ +$//'|sort|uniq -c|sort -nr
    fi
    if [ $1 = "lastweek" ]; then
        git shortlog --no-merges -s -n --since="(7days)"
    fi
    if [ $1 = "mergestats" ]; then
        git shortlog --merges -s -n --since="(7days)"
    fi
fi
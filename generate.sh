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
        cp -R images build
        # Convert SVG to PDF for PDF output
        for image in `ls build/images/*.svg`; do
            inkscape -f $image -A ${image%.svg}.pdf
        done

#        sed -E -e "s/images\//..\/images\//" textbook/* | pandoc -S --epub-metadata=metadata.xml -o build/CompilerDesign.epub  --toc
        sed -E -e "s/images\//build\/images\//" textbook/* | pandoc -S --epub-metadata=metadata.xml -o build/CompilerDesign.epub  --toc 
        sed -E -e "s/images\/(.*)\.svg/build\/images\/\1.pdf/" textbook/* | pandoc -S -o build/CompilerDesign.pdf  --toc
        pandoc -s -o build/CompilerDesign.html --toc textbook/*
    fi
    if [ $1 = "total" ]; then
        # Adapted from: http://stackoverflow.com/questions/4589731/git-blame-statistics

        echo "Non-whitespace lines by author."
        echo ""
        git ls-tree -r HEAD|sed -E -e 's/^.{53}//'|while read filename; do git blame -w "$filename"; done|sed -E -e 's/.*\((.*)[0-9]{4}-[0-9]{2}-[0-9]{2} .*/\1/' -e 's/ +$//'|sort|uniq -c|sort -nr
    fi
    if [ $1 = "lastweek" ]; then
        echo "Last week's commits."
        echo ""
        git shortlog --no-merges -s -n --since="(7days)"
    fi
    if [ $1 = "mergestats" ]; then
        git shortlog --merges -s -n --since="(7days)"
    fi
fi
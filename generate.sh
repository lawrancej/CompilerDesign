#!/bin/bash

if [ $# = 0 ]; then
    echo "Build CompilerDesign."
    echo ""
    echo "Usage:	$0 COMMAND [-v]"
    echo ""
    echo "Where COMMAND is one of the following:"
    echo "pdf           Builds CompilerDesign PDF."
    echo "epub          Builds CompilerDesign EPUB."
    echo "html          Builds CompilerDesign HTML."
    echo "clean         Removes the existing generated files."
    echo "check         Generate spelling, diction, style report."
    echo "total         Generate leader board by total line contributions."
    echo "totalcommits  Generate leader board by total commits."
    echo "lastweek      Generate leader board by commits within last week."
    echo "mergestats    Generate leader board by merges within last week."
    echo ""
    echo "Example: $0 pdf"
else
    mkdir -p build
    if [ $1 = "clean" ]; then
        echo "Clearing build folder."
        rm build/* -r
        exit
    elif [ $1 = "check" ]; then
        echo "Checking writing quality."
        ./check.sh all
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
        sed -E -e "s/images\/(.*)\.svg/build\/images\/\1.pdf/" title.txt textbook/* | pandoc -S -o build/CompilerDesign.pdf  --toc
    elif [ $1 = "epub" ]; then
        sed -E -e "s/images\//build\/images\//" title.txt textbook/* | pandoc -S --epub-metadata=metadata.xml -o build/CompilerDesign.epub  --toc 
    elif [ $1 = "html" ]; then
        pandoc -s -o build/CompilerDesign.html --email-obfuscation=none --section-divs --toc textbook/*
    elif [ $1 = "total" ]; then
        echo "Non-whitespace lines added and removed by author."
        echo ""
        SAVEIFS=$IFS
        IFS=$(echo -en "\n\b")
        authors=( $(git log --format="%aN" | sort -u ) )
        for author in "${authors[@]}"; do
            sum=0
            LINES=`git log --author="$author" --no-merges -C -C --numstat --pretty=format:""| cut -f1,2|tr '\t' '
'| tr -d '-' | sed '/^$/d'`
            for line in $LINES; do
                sum=$(($sum+$line))
            done
            echo -e "$sum\t$author"
        done | sort -nr
        IFS=$SAVEIFS
    elif [ $1 = "totalcommits" ]; then
        git shortlog --no-merges -s -n
    elif [ $1 = "lastweek" ]; then
        echo "Last week's commits."
        echo ""
        git shortlog --no-merges -s -n --since="(7days)"
    elif [ $1 = "mergestats" ]; then
        git shortlog --merges -s -n --since="(7days)"
    fi
fi
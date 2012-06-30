#!/bin/bash

if [ $# = 0 ]; then
	echo "Build CompilerDesign."
	echo ""
	echo "Usage:	$0 COMMAND [-v]"
	echo ""
	echo "Where COMMAND is one of the following:"
	echo "book      Builds CompilerDesign."
    echo "rebuild   Clean and rebuild CompilerDesign."
	echo "clean     Removes the existing generated files."
#    echo "check     Generate spelling, diction, style report."
    echo "board     Generate leader board."
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
    if [ $1 = "board" ]; then
        # http://stackoverflow.com/questions/4589731/git-blame-statistics

        git ls-tree -r HEAD|sed -E -e 's/^.{53}//'|while read filename; do file "$filename"; done|grep -E ': .*text'|sed -E -e 's/: .*//'|while read filename; do git blame "$filename"; done|sed -E -e 's/.*\((.*)[0-9]{4}-[0-9]{2}-[0-9]{2} .*/\1/' -e 's/ +$//'|sort|uniq -c|sort -nr

    fi

fi
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
        pandoc -S -o build/CompilerDesign.html --toc textbook/*
    fi
fi
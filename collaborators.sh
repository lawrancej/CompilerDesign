#!/bin/bash

collaborators=(  $(< "AUTHORS" ) )

if [ $# = 0 ]; then
	echo "Do git commands for all collaborators."
	echo ""
	echo "Usage:      $0 COMMAND"
	echo ""
	echo "Where COMMAND is one the following:"
	echo "setup       Do git remote add for all collaborators"
	echo "fetch       Do git fetch for all collaborators"
	echo "clean       Do git remote rm for all collaborators"
	echo "list        Show a list of collaborators"
	echo ""
	echo "Example: $0 setup"
elif [ $1 = "fetch" ]; then
	git fetch --all
else
	for collaborator in "${collaborators[@]}"
	do
		if [ $1 = "setup" ]; then
			git remote add $collaborator https://github.com/$collaborator/CompilerDesign.git
		elif [ $1 = "clean" ]; then
			git remote rm $collaborator
		elif [ $1 = "list" ]; then
			echo $collaborator
		fi
	done
    git remote add upstream https://github.com/lawrancej/CompilerDesign.git
fi

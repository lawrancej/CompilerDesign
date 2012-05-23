#!/bin/bash

collaborators=( "lawrancej" "UnZinkable" "mrpengin7" "CyDrive" "jcamps" "powersa2" "AllTheAction" "lapatink" "tannerd01" "kirip" "tomleo" "garciaa1" "KBVuong1" "RoboCafaz" "LynxStar" "theCompanyDream" "aghon" "SoxMax" "nhogan11" "finna" "CyaSteve" "sthdips09" "torosianj" "vafaeed" "cantrellk" "dalswaimil" )

if [ $# = 0 ]; then
	echo "Do git commands for all collaborators."
	echo ""
	echo "Usage:      $0 COMMAND"
	echo ""
	echo "Where COMMAND is one the following:"
	echo "setup       Do git remote add for all collaborators"
	echo "fetch       Do git fetch for all collaborators"
	echo "clean       Do git remote rm for all collaborators"
else
	for collaborator in "${collaborators[@]}"
	do
		if [ $1 = "setup" ]; then
			git remote add $collaborator https://github.com/$collaborator/CompilerDesign.git
		elif [ $1 = "clean" ]; then
			git remote rm $collaborator
		elif [ $1 = "fetch" ]; then
			git fetch $collaborator
		fi
	done
fi

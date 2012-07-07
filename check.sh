#!/bin/bash

# Enforce one sentence per line
for file in `ls textbook`; do
    sed -i.bak -E -e "s/([a-zA-Z])([.!?]) /\1\2\n/g" textbook/$file
    rm textbook/$file.bak
done

# Check for problems
# Passive voice check
# Poor phrase check
#phrases=( "in order to" "is that" "there is|are" )
#replacements=( "to" ":" )


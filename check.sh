#!/bin/bash

# Enforce one sentence per line
for file in `ls textbook`; do
    sed -i.bak -E -e "s/([a-zA-Z])([.!?]) /\1\2\n/g" textbook/$file
    rm textbook/$file.bak
done

# Check for problems

# Hyperlink check


# Passive voice check, adapted from:
# http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/

irregulars="awoken|\
been|born|beat|\
become|begun|bent|\
beset|bet|bid|\
bidden|bound|bitten|\
bled|blown|broken|\
bred|brought|broadcast|\
built|burnt|burst|\
bought|cast|caught|\
chosen|clung|come|\
cost|crept|cut|\
dealt|dug|dived|\
done|drawn|dreamt|\
driven|drunk|eaten|fallen|\
fed|felt|fought|found|\
fit|fled|flung|flown|\
forbidden|forgotten|\
foregone|forgiven|\
forsaken|frozen|\
gotten|given|gone|\
ground|grown|hung|\
heard|hidden|hit|\
held|hurt|kept|knelt|\
knit|known|laid|led|\
leapt|learnt|left|\
lent|let|lain|lighted|\
lost|made|meant|met|\
misspelt|mistaken|mown|\
overcome|overdone|overtaken|\
overthrown|paid|pled|proven|\
put|quit|read|rid|ridden|\
rung|risen|run|sawn|said|\
seen|sought|sold|sent|\
set|sewn|shaken|shaven|\
shorn|shed|shone|shod|\
shot|shown|shrunk|shut|\
sung|sunk|sat|slept|\
slain|slid|slung|slit|\
smitten|sown|spoken|sped|\
spent|spilt|spun|spit|\
split|spread|sprung|stood|\
stolen|stuck|stung|stunk|\
stridden|struck|strung|\
striven|sworn|swept|\
swollen|swum|swung|taken|\
taught|torn|told|thought|\
thrived|thrown|thrust|\
trodden|understood|upheld|\
upset|woken|worn|woven|\
wed|wept|wound|won|\
withheld|withstood|wrung|\
written"
 
grep -E -r -n -i "\\b(am|are|were|being|is|been|was|be)\
\\b[ ]*(\w+ed|($irregulars))\\b" textbook | while read line; do
    echo "Passive voice: $line"
done

# Weasel word check, adapted from the same source.
# These words make prose worse.
weasels="many|various|very|fairly|several|extremely\
|exceedingly|quite|remarkably|few|surprisingly\
|mostly|largely|huge|tiny|((are|is) a number)\
|excellent|interestingly|significantly\
|substantially|clearly|vast|relatively|completely"
  
egrep -E -r -n -i "\\b($weasels)\\b" textbook | while read line; do
    echo "Weasel word: $line"
done

# It'd be good to ensure this can work only on the most recent changes, as well as the whole book.

# Count sentence length. Sentences longer than 20 words are too long.

# Duplicate word check. Sentences should not repeat themselves.
for file in `ls textbook/*`; do
    cat -n  "$file" | tr -d "[:punct:]" | sed -E -e "s/\\b(a|as|an|and|the|is|in|it|was|were|to|from|of)\\b//gI" | while read line; do
        dupe=`echo "$line" | tr " " "\n" | sort -f | uniq -d`
        if [ "$dupe" ]; then
            echo "Duplicate words: $file: $line"
        fi
    done
done

# Warn about poor phrasing. Requires diction. http://www.gnu.org/software/diction/
diction -b -s textbook/*

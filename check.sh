#!/bin/bash

usage() {
    echo "$0 COMMAND"
    echo ""
    echo "Where COMMAND is one of:"
    echo ""
    echo "hyperlink  Show a list of unused hyperlinks."
    echo "passive    Show sentences with passive voice."
    echo "weasel     Show sentences with weasel words."
    echo "dupe       Show sentences with duplicate words."
    echo "diction    Show sentences with poor phrasing."
    echo "long       Show sentences that are too long."
    echo "all        Perform all checks."
}

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

weasels="many|various|very|fairly|several|extremely\
|exceedingly|quite|remarkably|few|surprisingly\
|mostly|largely|huge|tiny|((are|is) a number)\
|excellent|interestingly|significantly\
|substantially|clearly|vast|relatively|completely"

# Enforce one sentence per line
for file in `ls textbook`; do
    sed -i.bak -E -e "s/([a-zA-Z])([.!?]) /\1\2\n/g" textbook/$file
    rm textbook/$file.bak
done

# Check for problems
# Hyperlink check
if [ $# = 0 ]; then
    usage
    exit
elif [ $1 = "hyperlink" ]; then
    ./generate.sh html
    echo
    echo "Hyperlinks that appear only once."
    echo
    grep -E -e "href=|id=" build/CompilerDesign.html | grep -v "TOC" | sed -E -e "s/.*(id|href)=\"[#]?([^\"]+)\".*/\2/" | sort | uniq -u

# Passive voice check, adapted from:
# http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/
elif [ $1 = "passive" ]; then
    grep -E -r -n -i "\\b(am|are|were|being|is|been|was|be)\\b[ ]*(\w+ed|($irregulars))\\b" textbook | while read line; do
        echo "Passive voice: $line"
    done

# Weasel word check, adapted from the same source.
# These words make prose worse.
elif [ $1 = "weasel" ]; then
    egrep -E -r -n -i "\\b($weasels)\\b" textbook | while read line; do
        echo "Weasel word: $line"
    done

# It'd be good to ensure this can work only on the most recent changes, as well as the whole book.

# Count sentence length. Sentences longer than 20 words are too long.
elif [ $1 = "long" ]; then
    for file in `ls textbook/*`; do
        cat -n "$file" | tr -d "[:punct:]" | while read line; do
            length=`echo "$line" | wc -w`
            if [ $length -gt 20 ]; then
                echo "Long sentence ($length words): $file: $line"
            fi
        done
    done

# Duplicate word check. Sentences should not repeat themselves.
elif [ $1 = "dupe" ]; then
    for file in `ls textbook/*`; do
        cat -n  "$file" | tr -d "[:punct:]" | sed -E -e "s/\\b(a|as|an|and|the|is|in|it|was|were|to|from|of)\\b//gI" | while read line; do
            dupe=`echo "$line" | tr " " "\n" | sort -f | uniq -d`
            if [ "$dupe" ]; then
                dupes=`echo $dupe | tr '\n' ' '`
                lineno=`echo $line | sed -E -e "s/([0-9]+).*/\1/"`
                echo "Duplicate words ($dupes): $file: $lineno"
            fi
        done
    done

# Warn about poor phrasing. Requires diction. http://www.gnu.org/software/diction/
elif [ $1 = "diction" ]; then
    diction -b -s textbook/*
elif [ $1 = "all" ]; then
    $0 hyperlink
    $0 passive
    $0 weasel
    $0 dupe
    $0 diction
    $0 long
else
    usage
fi
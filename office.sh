#!/bin/bash

# doesn't seem to work. dd would be nice, but it's not portable to windows
# idea: pipe output of unzip into dd

usage() {
    echo "Helper to marshal Office file types to and from version control."  
    echo
    echo "$0 COMMAND [FILE]"
    echo
    echo "Where COMMAND is one of these:"
    echo
    echo "load   Create office document from components"
    echo "store  Store office document into components"
    echo "clean  Remove office document components"
    echo
    echo "FILE must be one of the following types:"
    echo "xlsx, docx, pptx, odt, ods, odp, odg"
    echo
    echo "Examples: $0 load something.xlsx"
}

# curl http://downloads.sourceforge.net/project/sevenzip/7-Zip/9.20/7za920.zip?r=http%3A%2F%2Fwww.7-zip.org%2Fdownload.html&ts=1341769177&use_mirror=voxel

if [ $# = 0 ]; then
    usage
elif [ $# = 1 ]; then
    for file in `ls | grep -E -e "(xlsx|docx|pptx|odt|ods|odp|odg)$"`; do
        $0 $1 file
    done
elif [ $1 = "load" ]; then
    cd ${2%.*}
    zip -r $2 *
    mv $2 ..
elif [ $1 = "store" ]; then
    mkdir -p ${2%.*}
    extra_bytes=`unzip -qq -u $2 -d ${2%.*} 2> >(sed -E -e "s/.*: +([0-9]+) extra bytes.*/\1/") | grep -E -e "[0-9]+"`
    if [ -z "$extra_bytes" ]; then
        exit
    elif [ $extra_bytes -gt 0 ]; then
        echo "Re-save using a proper format."
        rm -rf ${2%.*}
#        dd if=$2 of=${2%.*}/prefix count=$extra_bytes status=noxfer
    fi
elif [ $1 = "clean" ]; then
    rm -rf ${2%.*}
else
    usage
fi


#!/bin/bash

# Cross platform file open
file_open() {
    if [ $OSTYPE == "msys" ] || [ $OSTYPE == "cygwin" ]; then
        start "$1"
    elif [ $OSTYPE == "linux-gnu" ]; then
        gnome-open "$1"
    elif [[ $OSTYPE == darwin* ]]; then
        open "$1"
    else
        echo "Unable to open file $1. What OS is this, anyway? $OSTYPE?"
    fi
}

dep="dependencies"

# Package definitions
# TODO: move this out of CompilerDesign and into new repo.
# TODO: add this in as a submodule
# TODO: redo ./generate.sh to use submodule
# TODO: put these in their own separate files in a new folder, using this scheme
# TODO: passthrough for apt-get, yum, brew
# TITLE="Package Name"
# CHECK="$(which something)$(ls something 2> $dep/log)"
# URL="http://url/to/project/"
# DEPENDS=(package names of generic dependencies)
# WIN_URL="http://url/to/windows/package/download"
# WIN_FILE="localfilename.zip or localfilename.msi or localfilename.exe"
# WIN_DEP=(package names of windows-specific dependencies)
# MAC_URL="http://url/to/mac/package/download"
java_nfo=( "Java" "$(which java)" "http://java.com/en/download/manual.jsp" )
# MAC_FILE="localfilename.dmg or localfilename.pkg"
# MAC_DEP=(package names of mac-specific dependencies)

java_win=( "${java_nfo[@]}" "http://javadl.sun.com/webapps/download/AutoDL?BundleId=64152" "dependencies/jre-7u5-windows-i586.exe" )

pandoc_nfo=( "Pandoc" "$(which pandoc)" "http://johnmacfarlane.net/pandoc/installing.html" )
pandoc_win=( "${pandoc_nfo[@]}" "http://pandoc.googlecode.com/files/pandoc-1.9.4.2-setup.exe" "dependencies/pandoc-setup.exe" )
pandoc_mac=( "${pandoc_nfo[@]}" "http://pandoc.googlecode.com/files/pandoc-1.9.4.2.dmg" "dependencies/pandoc.dmg" )

latex_nfo=( "LaTeX" "$(which latex)" "http://www.latex-project.org/ftp.html" )
latex_win=( "${latex_nfo[@]}" "http://mirrors.ctan.org/systems/win32/miktex/setup/" "dependencies/basic-miktex.exe" )
latex_mac=( "${latex_nfo[@]}" "http://mirror.ctan.org/systems/mac/mactex/MacTeX.pkg" "dependencies/MacTeX.pkg" )

diction_nfo=( "Diction" "$(echo $(which diction)$(ls dependencies/diction/bin/diction.exe))" "http://www.gnu.org/software/diction/" )
diction_win=( "${diction_nfo[@]}" "http://gnuwin32.sourceforge.net/downlinks/diction-bin-zip.php" "dependencies/diction.zip" "unzip dependencies/diction.zip -d dependencies/diction" )
diction_mac=( "${diction_nfo[@]}" "" "" "brew install diction" )

diction_dep_nfo=( "Diction" "$(echo $(which diction)$(ls dependencies/diction/bin/libintl3.dll))" "http://www.gnu.org/software/diction/" )
diction_dep_win=( "${diction_nfo[@]}" "http://gnuwin32.sourceforge.net/downlinks/diction-dep-zip.php" "unzip dependencies/diction.zip -d dependencies/diction" )

libreoffice_nfo=( "LibreOffice" "$(ls C:\\Program\ Files\\LibreOffice\ 3.5)$(ls /Applications/LibreOffice)" "http://www.libreoffice.org/download/" )
libreoffice_win=( "${libreoffice_nfo[@]}" "http://download.documentfoundation.org/libreoffice/stable/3.5.5/win/x86/LibO_3.5.5_Win_x86_install_multi.msi" "dependencies/libreoffice.msi" )
libreoffice_mac=( "${libreoffice_nfo[@]}" "http://download.documentfoundation.org/libreoffice/stable/3.5.5/mac/x86/LibO_3.5.5_MacOS_x86_install_en-US.dmg" "dependencies/libreoffice.dmg" )

calibre_nfo=( "Calibre" "$(which calibre)" "http://calibre-ebook.com/download" )
calibre_win=( "${calibre_nfo[@]}" "http://status.calibre-ebook.com/dist/win32" "dependencies/calibre.msi" )
calibre_mac=( "${calibre_nfo[@]}" "http://status.calibre-ebook.com/dist/osx32" "dependencies/calibre.dmg" "open calibre.dmg && echo 'You have to install the command line tools for Calibre by going to Preferences->Advanced->Miscellaneous, once you open Calibre the first time.'" )

brew_mac=( "Brew" "$(which brew)" "http://mxcl.github.com/homebrew/" "" "" "/usr/bin/ruby -e \"$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)\"" )

install_package() {
    declare -a package=("${!1}")
    TITLE=0
    CHECK_EXISTS=1
    URL=2
    DOWNLOAD=3
    DEST=4
    COMMAND=5
    if [ -z "${package[$CHECK_EXISTS]}" ]; then
        echo "Getting and installing ${package[$TITLE]}..."
        echo "See: ${package[$URL]}"
        
        if [ -z "$(which curl)" ]; then
            echo "ERROR: You must download and install cURL first."
            echo "Look here: http://curl.haxx.se/download.html"
            exit
        fi
        if [[ -n "${package[$DOWNLOAD]}" && -n "${package[$DEST]}" ]]; then
            curl -L "${package[$DOWNLOAD]}" > "${package[$DEST]}"
        fi
        if [ ${#package[*]} > $COMMAND ]; then
            "${package[$COMMAND]}"
        else
            file_open "${package[$DEST]}"
        fi
    else
        echo "${package[$TITLE]} is already installed."
    fi
}

install_packages() {
    if [ $OSTYPE == "msys" ]; then
        platform="win"
    elif [[ $OSTYPE == darwin* ]]; then
        platform="mac"
    fi
    for package in $@; do
        install_package "${package}_$platform[@]"
    done
    read -p "Did you finish all the installers? (May I delete them?) (y/n): "
    [ "$REPLY" == "y" ] && rm -f dependencies/*.exe dependencies/*.msi dependencies/*.zip dependencies/*.dmg dependencies/*.pkg
    echo "Done!"
}

install_packages $@

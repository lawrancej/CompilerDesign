#!/bin/bash

if [ $# = 2 ]; then
    section=$2
else
    section=""
fi

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

# Package definitions
java_nfo=( "Java" "$(which java)" "http://java.com/en/download/manual.jsp" )
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
    elif [ $OSTYPE == darwin* ]; then
        platform="mac"
    fi
    for package in $@; do
        install_package "${package}_$platform[@]"
    done
    read -p "Did you finish all the installers? (May I delete them?) (y/n): "
    [ "$REPLY" == "y" ] && rm -f dependencies/*.exe dependencies/*.msi dependencies/*.zip dependencies/*.dmg dependencies/*.pkg
    echo "Done!"
}

# Cross platform dependency installer
install_dependencies() {
    # TODO: test on OSX
    # TODO: download batik here and remove it from the repository?
    # If it's Windows, ...
    if [ $OSTYPE == "msys" ]; then
        install_packages java pandoc latex diction diction_dep libreoffice
    # If it's Debian, Ubuntu, Mint ...
    elif [[ $OSTYPE == "linux-gnu" && -n "$(which apt-get)" ]]; then
        sudo apt-get install pandoc texlive-latex-recommended inkscape libreoffice-draw diction openjdk-7-jre
    # If it's Redhat, Fedora, CentOS, ...
    elif [[ $OSTYPE == "linux-gnu" && -n "$(which yum)" ]]; then
            sudo yum install pandoc texlive texlive-latex inkscape libreoffice diction java-1.7.0-openjdk
    # If it's Mac OS X, ...
    elif [[ $OSTYPE == darwin* ]]; then
        install_packages brew pandoc latex diction libreoffice
    # Hmm, you're on your own ...
    else
        echo "I don't know how to handle $OSTYPE."
        echo "1. Install LaTeX, pandoc, LibreOffice, Java and Calibre"
        echo "2. Pleas revise $0 to install LaTeX, pandoc, LibreOffice, Java and Calibre on $OSTYPE."
        exit
    fi
}

if [ $# = 0 ]; then
    echo "Build CompilerDesign."
    echo ""
    echo "Usage:	$0 COMMAND [-v] [section]"
    echo
    echo "Where COMMAND is one of the following:"
    echo "pdf           Builds CompilerDesign PDF."
    echo "epub          Builds CompilerDesign EPUB."
    echo "html          Builds CompilerDesign HTML."
    echo "guide         Builds PDF project documentation."
    echo "clean         Removes the existing generated files."
    echo "check         Generate topic coverage, hyperlink, diction, style report."
    echo
    echo "total         Generate leader board by total line contributions."
    echo "totalcommits  Generate leader board by total commits."
    echo "lastweek      Generate leader board by commits within last week."
    echo "mergestats    Generate leader board by merges within last week."
    echo 
    echo "install       Install all dependencies."
    echo
    echo "Example: $0 pdf"
else
    mkdir -p build
    if [ $1 = "clean" ]; then
        echo "Clearing build folder."
        rm build/* -r
        exit
    elif [ $1 = "check" ]; then
        echo "Checking for quality issues."
        ./check.sh all "$section"
        exit
    fi
    if [ $1 = "install" ]; then
        install_dependencies
    fi
    if [ $1 = "pdf" ] || [ $1 = "epub" ] || [ $1 = "html" ]; then
        echo "Building CompilerDesign"
        cp -R images build
    fi
    # Generate guide documentation
    if [ $1 = "guide" ]; then
        pandoc -S -o build/guide.pdf --toc README.md CONVENTIONS.md HACKING.md git.md
        file_open build/guide.pdf
    # Generate PDF of textbook
    elif [ $1 = "pdf" ]; then
        # Convert SVG to PDF for PDF output
        # If java is installed, use Batik
        installed=$(which java)
        if [ -n "$installed" ]; then
            java -jar dependencies/batik-1.7/batik-rasterizer.jar build/images/*.svg -m application/pdf
        else
            installed=$(which inkscape)
            if [ -n "$installed" ]; then
                for image in `ls build/images/*.svg`; do
                    inkscape -f $image -A ${image%.svg}.pdf
                done
            else
                echo "You must install Java (preferred) or Inkscape first to generate a PDF."
                exit
            fi
        fi
        sed -E -e "s/images\//build\/images\//; s/images\/(.*)\.svg/images\/\1.pdf/;" title.txt textbook/$section* | pandoc -S -o build/CompilerDesign.pdf  --toc
        file_open build/CompilerDesign.pdf
    # Generate EPUB of textbook
    elif [ $1 = "epub" ]; then
        sed -E -e "s/images\//build\/images\//" title.txt textbook/$section* | pandoc -S --epub-metadata=metadata.xml -o build/CompilerDesign.epub  --toc
        file_open build/CompilerDesign.epub
    # Generate HTML of textbook
    elif [ $1 = "html" ]; then
        pandoc -s -o build/CompilerDesign.html --email-obfuscation=none --section-divs --toc textbook/$section*
        file_open build/CompilerDesign.html
    elif [ $1 = "total" ]; then
        echo "Non-whitespace lines added and removed by author."
        echo ""
        SAVEIFS=$IFS
        IFS=$(echo -en "\n\b")
        authors=( $(git log --format="%aN" | sort -u ) )
        for author in "${authors[@]}"; do
            sum=0
            LINES=$(git log --author="$author" --no-merges -C -C --numstat --pretty=format:""| cut -f1,2|tr '\t' '
'| tr -d '-' | sed '/^$/d')
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
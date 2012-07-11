#!/bin/bash

if [ $# = 2 ]; then
    section=$2
else
    section=""
fi

install_dependencies() {
    # TODO: test on OSX
    # TODO: download batik here and remove it from the repository?
    # If it's Windows, ...
    if [ $OSTYPE == "msys" ] || [ $OSTYPE == "cygwin" ]; then
        echo "Installing project dependencies for Windows..."
        if [ -z "$(which curl)" ]; then
            echo "ERROR: You must download and install cURL first."
            echo "Look here: http://curl.haxx.se/download.html#Win32"
            exit
        fi
        if [ -z "$(which java)" ]; then
            echo "Getting and installing Java..."
            echo "See: http://java.com/en/download/manual.jsp"
            
            curl -L http://javadl.sun.com/webapps/download/AutoDL?BundleId=64152 > dependencies/jre-7u5-windows-i586.exe
            dependencies/jre-7u5-windows-i586.exe
            
        fi
        if [ -z "$(which pandoc)" ]; then
            echo "Getting and installing pandoc 1.9.4.2..."
            echo "See: http://code.google.com/p/pandoc/downloads/list"

            curl http://pandoc.googlecode.com/files/pandoc-1.9.4.2-setup.exe > dependencies/pandoc-setup.exe
            dependencies/pandoc-setup.exe

        fi
        if [ -z "$(which latex)" ]; then
            echo "Getting and installing LaTeX..."
            echo "See: http://miktex.org/2.9/setup"

            curl -L http://mirrors.ctan.org/systems/win32/miktex/setup/ > dependencies/basic-miktex.exe
            dependencies/basic-miktex.exe

        fi
        if [ -z "$(which diction)" ] || [ ! -e dependencies/diction/bin/diction.exe ]; then
            echo "Getting and installing diction..."
            echo "See: http://gnuwin32.sourceforge.net/packages/diction.htm"
            
            curl -L http://gnuwin32.sourceforge.net/downlinks/diction-bin-zip.php > dependencies/diction.zip
            curl -L http://gnuwin32.sourceforge.net/downlinks/diction-dep-zip.php > dependencies/diction-dep.zip

            unzip dependencies/diction.zip -d dependencies/diction
            unzip dependencies/diction-dep.zip -d dependencies/diction

            rm dependencies/diction.zip
            rm dependencies/diction-dep.zip
        fi
        if [ ! -e "C:\\Program Files\\LibreOffice 3.5" ]; then
            echo "Getting and installing LibreOffice..."
            echo "See: http://www.libreoffice.org/download/"
            
            curl -L http://download.documentfoundation.org/libreoffice/stable/3.5.5/win/x86/LibO_3.5.5_Win_x86_install_multi.msi > dependencies/libreoffice.msi

            start dependencies/libreoffice.msi
            
            echo "Once you finished installing, come back here and press Enter."
            read
            
        fi
        echo "Great. Let's remove all the downloaders and installers. "
        read
        rm -f dependencies/jre-7u5-windows-i586.exe
        rm -f dependencies/pandoc-setup.exe
        rm -f dependencies/basic-miktex.exe
        rm -f dependencies/libreoffice.msi
        echo "Done!"
    # If it's Linux, ...
    elif [ $OSTYPE == "linux-gnu" ]; then
        echo "Installing project dependencies for Linux..."
        # Debian, Ubuntu, Linux Mint
        if [ -n `which apt-get` ]; then
            sudo apt-get install pandoc texlive-latex-recommended inkscape libreoffice-draw diction
            sudo apt-get install openjdk-7-jre # on a separate line, in case the user wants to cancel Java
        # Redhat, CentOS
        elif [ -n `which yum` ]; then
            sudo yum install pandoc texlive texlive-latex inkscape libreoffice diction 
            sudo yum install java-1.7.0-openjdk
        else
            # What to do for Arch or Gentoo?
            echo "Egad! What Linux distro are you using?"
        fi
    # If it's Mac OS X, ...
    elif [[ $OSTYPE == darwin* ]]; then
        echo "Installing project dependencies for Mac OS X..."
        if [ -z "$(which curl)" ]; then
            echo "ERROR: You must download and install cURL first."
            echo "Look here: http://curl.haxx.se/download.html#MacOSX"
            exit
        fi
        if [ -z "$(which brew)" ]; then # Which brew, heh heh
            echo "Getting and installing homebrew..."
            echo "See: "
            /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
        fi
        if [ -z "$(which pandoc)" ]; then
            echo "Getting pandoc..."
            echo "See: http://code.google.com/p/pandoc/downloads/list"
            curl -L http://pandoc.googlecode.com/files/pandoc-1.9.4.2.dmg > dependencies/pandoc.dmg
            
            open dependencies/pandoc.dmg
            echo "Install pandoc by running the installer."
            echo "Once done, come back here and push Return."
            read
        fi
        if [ -z "$(which latex)" ]; then
            echo "Getting LaTeX..."
            echo "See: "
            curl -L http://mirror.ctan.org/systems/mac/mactex/MacTeX.pkg > dependencies/MacTeX.pkg
            
            open dependencies/MacTeX.pkg
            echo "Push Return to continue."
            read
        fi
        if [ -z "$(which diction)" ]; then
            brew install diction
        fi
        if [ -z "unimplemented" ]; then
            echo "Getting LibreOffice..."
            echo "See: http://www.libreoffice.org/download/"
            
            curl -L http://download.documentfoundation.org/libreoffice/stable/3.5.5/mac/x86/LibO_3.5.5_MacOS_x86_install_en-US.dmg > dependencies/libreoffice.dmg
            
            open dependencies/libreoffice.dmg

            echo "Install LibreOffice by running the installer."
            echo "Once done, come back here and push Return."
            read
        fi
        echo "Done!"
    # Hmm, you're on your own ...
    else
        echo "I don't know what OS you're using. BSD? Syllable?"
        echo "Install git, LaTeX, pandoc, LibreOffice and Java"
        echo "Make $0 better: revise it to handle your OS like it handles Windows, Mac or Linux."
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
    # Generate EPUB of textbook
    elif [ $1 = "epub" ]; then
        sed -E -e "s/images\//build\/images\//" title.txt textbook/$section* | pandoc -S --epub-metadata=metadata.xml -o build/CompilerDesign.epub  --toc
    # Generate HTML of textbook
    elif [ $1 = "html" ]; then
        pandoc -s -o build/CompilerDesign.html --email-obfuscation=none --section-divs --toc textbook/$section*
    elif [ $1 = "total" ]; then
        echo "Non-whitespace lines added and removed by author."
        echo ""
        SAVEIFS=$IFS
        IFS=$(echo -en "\n\b")
        authors=( $(git log --format="%aN" | sort -u ) )
        for author in "${authors[@]}"; do
            sum=0
            LINES=`git log --author="$author" --no-merges -C -C --numstat --pretty=format:""| cut -f1,2|tr '\t' '
'| tr -d '-' | sed '/^$/d'`
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
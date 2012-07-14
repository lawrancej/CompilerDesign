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
# TODO: add cross installer in as a submodule
# TODO: redo ./generate.sh to use said submodule

# Cross platform dependency installer
install_dependencies() {
    # TODO: test on OSX
    # TODO: download batik here and remove it from the repository?
    # If it's Windows, ...
    if [ $OSTYPE == "msys" ]; then
        ./install.sh java pandoc latex diction diction_dep libreoffice calibre
    # If it's Debian, Ubuntu, Mint ...
    elif [[ $OSTYPE == "linux-gnu" && -n "$(which apt-get)" ]]; then
        sudo apt-get install pandoc texlive-latex-recommended inkscape libreoffice-draw diction openjdk-7-jre calibre
    # If it's Redhat, Fedora, CentOS, ...
    elif [[ $OSTYPE == "linux-gnu" && -n "$(which yum)" ]]; then
        sudo yum install pandoc texlive texlive-latex inkscape libreoffice diction java-1.7.0-openjdk calibre
    # If it's Mac OS X, ...
    elif [[ $OSTYPE == darwin* ]]; then
        ./install.sh brew pandoc latex diction libreoffice calibre
    # Hmm, you're on your own ...
    else
        echo "I don't know how to handle $OSTYPE."
        echo "1. Install Java, LaTeX, pandoc, diction, LibreOffice, and Calibre"
        echo "2. Pleas revise $0 to install dependencies for $OSTYPE."
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
        ebook-viewer build/CompilerDesign.epub
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
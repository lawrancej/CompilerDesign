#!/bin/bash

if [ $# = 2 ]; then
    section=$2
else
    section=""
fi

install_dependencies() {
    # If it's Windows, ...
    if [ $OSTYPE == "msys" ] || [ $OSTYPE == "cygwin" ]; then
        echo "Installing project dependencies for Windows..."
        # Windows: making life difficult for programmers since 1985.
        
    # If it's Linux, ...
    elif [ $OSTYPE == "linux-gnu" ]; then
        echo "Installing project dependencies for Linux..."
        # Debian, Ubuntu, Linux Mint
        if [ -n `which apt-get` ]; then
            sudo apt-get install git pandoc texlive-latex-recommended inkscape dia libreoffice-draw diction
        # Redhat, CentOS
        elif [ -n `which yum` ]; then
            sudo yum install git pandoc texlive texlive-latex inkscape dia libreoffice diction
        # Does anybody use arch or Gentoo?
        else
            echo "Egad! What Linux distro are you using?"
        fi
    # If it's Mac OS X, ...
    elif [ $OSTYPE == "darwin" ]; then
        echo "Installing project dependencies for Mac OS X..."
        /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
        brew install git pandoc texlive-latex
    # Hmm, you're on your own ...
    else
        echo "I don't know what OS you're using. Is it BSD?"
        echo "Install git, LaTeX, pandoc, and a diagram editor that imports/exports SVG (e.g., Inkscape, Dia)"
    fi
}

if [ $# = 0 ]; then
    echo "Build CompilerDesign."
    echo ""
    echo "Usage:	$0 COMMAND [-v] [section]"
    echo ""
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
    echo "install       Install all dependencies."
    echo ""
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
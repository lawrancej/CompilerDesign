Hacking CompilerDesign
======================
## Getting started
1. Install the dependencies (Git, Pandoc, LaTeX, Inkscape) for your platform.
    - [Windows](#what-to-install-on-windows)
    - [Linux](#what-to-install-on-linux)
    - [Mac](#what-to-install-on-mac)

2. [Fork the project here.](https://github.com/lawrancej/CompilerDesign/fork)

         git clone https://github.com/YourNameGoesHereButDontTypeThisInLiterally/CompilerDesign.git
         cd CompilerDesign

3. Add me as upstream, and add in your collaborators, too.

         git remote add upstream https://github.com/lawrancej/CompilerDesign.git
         ./collaborators.sh setup

4. Build CompilerDesign.

        ./generate.sh

5. [Learn how to contribute.](#how-to-contribute) See the [git cheat sheet](git.md)

        git pull upstream master          # Get the latest and greatest.
        git checkout -b issueXYZ          # Work on an issue in a new topic branch, based off of the upstream master branch.
        ... Hack away ...                 # Your text is free from content, style, grammar and spelling errors, right?
        git commit -a -m "Fixed issueXYZ" # Great! Commit your changes.
        git push origin issueXYZ          # Push your changes to your repo. Send in a pull request.
        git checkout master               # Switch back to master. Rinse and repeat.

## What to install on Windows
You will need to download and install everything manually.
Therefore, verify everything is working first before generating the textbook.

 - [Git (version control).](http://git-scm.com/downloads)
 - [Pandoc.](http://johnmacfarlane.net/pandoc/installing.html)
 - [MiKTeX](http://miktex.org/2.9/setup)
 - [Inkscape](http://downloads.sourceforge.net/inkscape/Inkscape-0.48.2-1.exe)
 - Visio

Additionally, you must add `C:\Program Files\Inkscape\` to your system PATH.
The `generate.sh` build script uses inkscape to convert svg source into pdf.

## What to install on Linux
In the terminal, paste this in for your distribution. Generate SVG diagrams with Inkscape, Dia or LibreOffice draw

### Red Hat:

    sudo yum install git pandoc texlive texlive-latex inkscape dia libreoffice diction

### Debian, Ubuntu:

    sudo apt-get install git pandoc texlive-latex-recommended inkscape dia libreoffice-draw diction

## What to install on Mac
You will need to download and install everything manually.

 - [Git (version control)](http://git-scm.com/downloads)
 - [Pandoc](http://johnmacfarlane.net/pandoc/installing.html)
 - [MacTeX](http://mirror.ctan.org/systems/mac/mactex/MacTeX.mpkg.zip) (1GB download)
 - [Inkscape](http://downloads.sourceforge.net/inkscape/Inkscape-0.48.2-1-SNOWLEOPARD.dmg)
 - [LibreOffice Draw](http://www.libreoffice.org/download/)
 - [Diction](http://www.moria.de/~michael/diction/)

The `generate.sh` build script uses inkscape to convert svg source into pdf.
You must be able to type `inkscape` at the Terminal to launch inkscape.

## How to contribute.
The Saylor Foundation has compiled a [free compiler course](http://www.saylor.org/courses/cs304/), but a Creative Commons licensed textbook is not yet available.

### Find (or open) an issue to work on
Version control is not a substitute for communication, so we use github's issue tracker to manage our participation.

 - [Work on open issues in github's issue tracker](https://github.com/lawrancej/CompilerDesign/issues) (comment on issues to get dibs).
   * Pro tip: pair up and split the work on an issue with someone else. E.g., you write, they proofread.
   * [Follow the conventions.](CONVENTIONS.md)

 - [Open new issues.](https://github.com/lawrancej/CompilerDesign/issues/new)
   * [Examine the compiler course mapping outline for deficiencies](http://www.saylor.org/content/coursemapping/CourseMappingFormCS304.xls)

### Review contributions
[Review contributions for quality issues (comment on pull requests).](https://github.com/lawrancej/CompilerDesign/pulls)

 - [Does the contribution follow the conventions?](CONVENTIONS.md)

### Use topic branches for your work
Topic branches isolate chunks of work so that it's easier to merge in changes.

### Send in a pull request for feedback
Switch to your branch in github, and [send in a pull request](https://github.com/lawrancej/CompilerDesign/pull/new/master) that describes what you did.
Do so when you think your changes are ready to be merged in, but do not hesitate to push works in progress.

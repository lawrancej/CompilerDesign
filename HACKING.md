Hacking CompilerDesign
======================
## Getting started
1. [Install `git` for your platform](http://git-scm.com/). Click the Download button.
2. Once installed, in Git Bash (or the Terminal in Mac or Linux), configure git:

        git config --global user.name "FirstNameGoesHere LastNameGoesHere"
        git config --global user.email yourEmailaddressGoesHereButDontTypeThisInLiterally

3. [Fork the project here.](https://github.com/lawrancej/CompilerDesign/fork)
4. Clone the project locally. In Git Bash (or the Terminal in Mac or Linux), type:

        git clone https://github.com/YourGithubLoginNameGoesHereButDontTypeThisInLiterally/CompilerDesign.git
        cd CompilerDesign

5. Once in `CompilerDesign`, set up remote repositories and install required dependencies (Java, LaTeX, Pandoc, diction, LibreOffice).

        ./collaborators.sh setup
        ./generate.sh install

6. Build CompilerDesign, and check for issues.

        ./generate.sh pdf
        ./generate.sh check

7. [Learn how to contribute.](#how-to-contribute) See the [git cheat sheet](git.md)

        git pull upstream master          # Get the latest and greatest.
        git checkout -b issueXYZ          # Work on an issue in a new topic branch, based off of the upstream master branch.
        ... Hack away ...                 # Your text is free from content, style, grammar and spelling errors, right?
        ./check.sh all 03                 # Let's see if everything's good in section 03. (Replace the number as necessary.)
        git commit -a -m "Fixed issueXYZ" # Great! Commit your changes.
        git push origin issueXYZ          # Push your changes to your repo. Send in a pull request.
        git checkout master               # Switch back to master. Rinse and repeat.

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
Switch to your branch in github, and send in a pull request that describes what you did.
Do so when you think your changes are ready to be merged in, but do not hesitate to push works in progress.

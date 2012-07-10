Git Guide
=========

## What is git?
Git is a popular [distributed](#what-are-distributed-version-control-systems) [version control system](#what-are-version-control-systems).

### What are version control systems?
Version control systems store changes to a project over time.

#### Examples:

- [CVS](http://www.nongnu.org/cvs/)
- [Subversion](http://subversion.apache.org/)
- [git](http://git-scm.com/)
- [Mercurial](http://mercurial.selenic.com/) 

CVS and Subversion are [centralized version control systems](#what-are-centralized-version-control-systems).
Git and Mercurial are [distributed version control systems](#what-are-distributed-version-control-systems).

### What are centralized version control systems?
Centralized version control systems store the entire project history *on a central server*.
To make contributions, it is necessary to get access to the server.
If the central server fails, sorry, out of luck.

### What are distributed version control systems?
Distributed version control systems store the entire project history *locally*.
To make contributions, nothing more is required.
If there is a central server and it fails, your machine has a local backup of the entire project history.

### Why use git?
[Because it is better than anything else](http://git-scm.com/about).

## Git setup
To set up git, follow the walkthrough for your operating system.

- [Mac](http://help.github.com/mac-set-up-git/)
- [Linux](http://help.github.com/linux-set-up-git/)
- [Windows](http://help.github.com/win-set-up-git/)

Be sure to configure your user name and email:

    git config --global user.name "Firstname Lastname"
    git config --global user.email yourEmailAddressGoesHereButDontTypeThisInLiterally@wit.edu

## Using git
Once you've forked and cloned a repository, using git involves several commands that you will master through practice.

### Typical workflow
Typically your use of git will involve the following steps roughly in this sequence:

    git pull upstream master          # Get the latest and greatest. This fetches and merges upstream/master into your current branch.
    git checkout -b issueXYZ          # Work on an issue in a new topic branch named XYZ, based off of the upstream master branch.
    ... Hack away ...                 # Your text is free from content, style, grammar and spelling errors, right?
    gitk --all &                      # Show the git history
    git status                        # Summary of changes
    git diff                          # Show changes to tracked files
    git diff --cached                 # Show changes in staging area
    git commit -a -m "Fixed issueXYZ" # Great! Commit your changes.
    git push origin issueXYZ          # Push your changes to your repo. Send in a pull request.
    git checkout master               # Switch back to master. Rinse and repeat.

### How do I create a new branch?

    git checkout -b some_new_branch   # Create a branch named some_new_branch

Using topic branches means you'll need to know how to switch among branches and remove old branches as necessary.

    git checkout master               # Switch back to the master branch
    git branch                        # See a list of branches
    git branch -D branch_name         # Remove a local branch called branch_name
    git push origin :branch_name      # Remove a remote branch

You will also need to understand merging.

    ./collaborators.sh setup          # Add remote repositories for all collaborators
    git fetch --all                   # Fetch everyone's changes (doesn't merge anything)
    git remote -v                     # See a list of remote repositories
    git merge contributor/branch      # Merge in changes from contributor's branch into your current branch

To deal with merge conflicts, type: `git status`. Then, open up all unstaged files. Make changes as necessary, and do `git add file_name` for each file.
To merge in only the version from `somebranch`, type: `git checkout somebranch file_name` Or:

    git checkout --ours some_file     # Use our version of some_file
    git checkout --theirs some_file   # Use their version of some_file
    git checkout HEAD some_file       # Use HEAD version of some_file
    git checkout a8bfc052 some_file   # Use the version of some_file from commit a8bfc052

### I pushed my new branch to github. How do I remove that remote branch?
Suppose you did the following:

    git checkout -b some_new_branch
    git commit -a -m "Changes."
    git push origin some_new_branch

If you want to remove remotes/origin/some_new_branch, do the following:

    git push origin :some_new_branch

### How do I add a new file to git?

    git add new_file

### How do I add all changes I've made to the current commit?

    git commit -a -m "Message goes here"

### What did I do?

    git status    # Show the status of the index, staging area, and untracked files
    gitk --all &  # Show a graphical timeline of commits
    git diff      # Show uncommitted changes to tracked files

### It's working now!
Great, record your changes locally. Here's how:

    git commit -a -m "Changed some_file and added new_file. It works now."

### I recorded my changes, but github didn't change.
You need to push your commit to github if you want to share them.

    git push origin master

### I need to pull commits from github

    git pull origin master

### I want changes from a colleague

    ./collaborators.sh                         # Do this only one time
    git fetch --all                            # Fetch everyone's changes, or ...
    git fetch your_colleague_name              # ... fetch only their changes
    git merge your_colleauge_name/branch_name  # Merge their changes into your current branch

### I need more help!
Ask around. Use excellent resources available on git. Update this with what you discover.

- [Git Reference Card](http://refcardz.dzone.com/refcardz/getting-started-git)
- [Git Reference](http://gitref.org/index.html)
- [External Git links](http://git-scm.com/doc/ext)
- [Pro Git](http://git-scm.com/book/index.html)
- [Git cheat sheets](http://help.github.com/git-cheat-sheets/)

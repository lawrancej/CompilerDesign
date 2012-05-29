Git to the point
================
Git it? Let's see how to git r done.

- [What is git?](#what-is-git)
- [How do I set up git?](#git-setup)
- [How do I use git?](#using-git)

What is git?
------------
Git is a popular [distributed](#what-are-distributed-version-control-systems) [version control system](#what-are-version-control-systems).

### What are version control systems?
Version control systems store changes to a project over time.

Examples:

- [CVS](http://www.nongnu.org/cvs/)
- [Subversion](http://subversion.apache.org/)
- [git](http://git-scm.com/)
- [Mercurial](http://mercurial.selenic.com/) 

CVS and Subversion are [centralized version control systems](#what-are-centralized-version-control-systems).
Git and Mercurial are [distributed version control systems](#what-are-distributed-version-control-systems).

### What are centralized version control systems?
Centralized version control systems store the entire project history *on a central server*.

Therefore:
- To make contributions, it is necessary to get access to the server.
- If the central server fails, sorry, out of luck.

### What are distributed version control systems?
Distributed version control systems store the entire project history *locally*.

Therefore:
- To make contributions, nothing more is required.
- If there is a central server and it fails, you still have a local backup of project history.

### Why use git?
[Because it is better than anything else](http://git-scm.com/about).

Git setup
---------
To set up git, follow the walkthrough for your operating system.

- [Mac](http://help.github.com/mac-set-up-git/)
- [Linux](http://help.github.com/linux-set-up-git/)
- [Windows](http://help.github.com/win-set-up-git/)

Using git
---------
Typically your use of git will involve (assuming you're on your master branch):

### How do I know what I changed?

    git diff # This will show changes that you've made.

### How do I create a new branch?

    git checkout -b some_new_branch

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

### I want changes from a colleague, not my own local repository!
Think as you type this out (replace your_colleague and ProjectNameHere). Do not copy paste.

    git remote add your_colleague git@github.com:your_colleague/ProjectNameHere
    git fetch your_colleague
    git merge remotes/your_colleauge/master
	
### I need more help!
Ask around. Use excellent resources available on git. Update this with what you discover.

- [Git Reference](http://gitref.org/index.html)
- [External Git links](http://git-scm.com/doc/ext)
- [Pro Git](http://git-scm.com/book/index.html)
- [Git cheat sheets](http://help.github.com/git-cheat-sheets/)
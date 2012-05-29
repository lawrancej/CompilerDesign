Git to the point
================

Git it? Let's see how to git r done.

-  `What is git <#what-is-git>`_?
-  `How do I set up git <#git-setup>`_?
-  `How do I use git <#using-git>`_?

What is git?
------------

Git is a popular
`distributed <#what-are-distributed-version-control-systems>`_ `version
control system <#what-are-version-control-systems>`_.

### What are version control systems? Version control systems store
changes to a project over time.

Examples:

-  `CVS <[http://www.nongnu.org/cvs/](http://www.nongnu.org/cvs/)>`_
-  `Subversion <[http://subversion.apache.org/](http://subversion.apache.org/)>`_
-  `git <[http://git-scm.com/](http://git-scm.com/)>`_
-  `Mercurial <[http://mercurial.selenic.com/](http://mercurial.selenic.com/)>`_

CVS and Subversion are `centralized version control
systems <#what-are-centralized-version-control-systems>`_. Git and
Mercurial are `distributed version control
systems <#what-are-distributed-version-control-systems>`_.

### What are centralized version control systems? Centralized version
control systems store the entire project history *on a central server*.

Therefore: - To make contributions, it is necessary to get access to the
server. - If the central server fails, sorry, out of luck.

### What are distributed version control systems? Distributed version
control systems store the entire project history *locally*.

Therefore: - To make contributions, nothing more is required. - If there
is a central server and it fails, you still have a local backup of
project history.

### Why use git? `Because it is better than anything
else <[http://git-scm.com/about>`_](http://git-scm.com/about)).

Git setup
---------

To set up git, follow the walkthrough for your operating system.

-  `Mac <[http://help.github.com/mac-set-up-git/](http://help.github.com/mac-set-up-git/)>`_
-  `Linux <[http://help.github.com/linux-set-up-git/](http://help.github.com/linux-set-up-git/)>`_
-  `Windows <[http://help.github.com/win-set-up-git/](http://help.github.com/win-set-up-git/)>`_

Using git
---------

Typically your use of git will involve (assuming you're on your master
branch):

Make a change to \`some\_file\`

    git add some\_file

Make a change to \`another\_file\`

    git add another\_file

What did I do?

    git status # Show the status of the index, staging area, and
    untracked files gitk --all & # Show a graphical timeline of commits
    git diff # Show uncommitted changes to tracked files

It's working now!

    git commit -m "Changed some\_file and another\_file. It works now."

Post your commit to github

    git push origin master

Pull commits from github

    git pull origin master

There are many excellent resources available on git.

-  `External Git
   links <[http://git-scm.com/doc/ext](http://git-scm.com/doc/ext)>`_
-  `Pro
   Git <[http://git-scm.com/book/index.html](http://git-scm.com/book/index.html)>`_
-  `Git cheat
   sheets <[http://help.github.com/git-cheat-sheets/](http://help.github.com/git-cheat-sheets/)>`_


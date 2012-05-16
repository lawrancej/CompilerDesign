Compiler Design
===============
Joseph Lawrance <lawrancej@wit.edu>

Assessment
----------

<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dFhGcklySG5VQWh4cWlWNlNRclZfM3c6MQ" width="760" height="1400" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>

About the course
----------------
### What is this course about?
Although we have all used compilers, to make the most of them we should understand how they work.

In this course we will make [contributions that matter](#what-will-i-contribute).

- [Free compiler course materials](http://www.saylor.org/courses/cs304/).
- [Parsing with derivatives](http://matt.might.net/articles/parsing-with-derivatives/).

### Who is the professor?
I am Joey Lawrance.
I have been an assistant professor at Wentworth since Fall 2010.
I am [learning how to teach on the job](#what-is-the-professors-teaching-philosophy).

I have been in school all my life.
Previously, I was a postdoc at MIT.
At Oregon State University, I earned my Master's and Ph.D in Computer Science.
At Lawrence University in Appleton, Wisconsin, I earned a B.A. in Math and Computer Science.
I am originally from Texas.

### What is the professor's teaching philosophy?
> Tell me and I'll forget; show me and I may remember; involve me and I'll understand. --- Chinese proverb

- [Schools are broken](http://www.youtube.com/watch?v=zDZFcDGpL4U).
- [Lectures don't work](http://www.consulting-business.com/why-schools-are-broken-and-reading-sucks-how-to-really-learn.html).
- [Higher education is broken](http://www.davidtinapple.com/illich/1970_deschooling.html).
- [Schools kill creativity](http://www.ted.com/talks/ken_robinson_says_schools_kill_creativity.html).

Let's do better. Principles:

- Information is abundundant. Attention is scarce. To get the most from information, act on it.
- [Learning is doing](http://www.engines4ed.org/hyperbook/nodes/NODE-120-pg.html).
- Teaching is feedback that [addresses misconceptions](http://www.veritasium.org/).
- [Assignments should matter](http://www.sethgodin.com/sg/docs/StopStealingDreamsSCREEN.pdf).
- Textbooks [should be free](http://whyopenedmatters.org/) in every sense of the word.
- [Always question authority](http://www.johntaylorgatto.com/underground/prologue.htm). [Always suestion the hierarchy](http://www.unwelcomeguests.net/Disciplined_Minds).
- [Test beforehand](http://www.agiledata.org/essays/tdd.html), not just afterward.
- We all can and should [teach and learn from each other](http://mazur.harvard.edu/research/detailspage.php?rowid=8).

### What would you attempt to do if you knew you could not fail?
> [The fear of failure prevents us from doing great things](http://www.ted.com/talks/regina_dugan_from_mach_20_glider_to_humming_bird_drone.html).
> --- Regina Duncan

> If you're not failing 90% of the time, then you're probably not working on sufficiently challenging problems. --- Alan Kay

As long as you [contribute to this class](#what-will-i-contribute), you cannot and will not fail.

Of course, the first time we try anything, we tend to suck at it. So, to [do great things](#how-do-i-make-the-world-better), be prepared to be wrong.

> [If you are not prepared to be wrong, you will never come up with anything original](http://www.ted.com/talks/ken_robinson_says_schools_kill_creativity.html).
> --- Kevin Robinson

### How do I make the world better?
Contribute something that matters. Don't just sit there.

Don't know what to contribute? [The professor has some ideas](#what-will-i-contribute).

- Ask yourself. What do you wish was better?
- Ask around. What do other people want?

Don't know how to do it? 

- Research online and offline.
- Find people who know how.
- Do it, and share what you learn ([especially what didn't work](https://www.youtube.com/watch?v=cY_o4A1wzsg)).

Pre-requisites
--------------
### What should I know already?
- The ACM [Body of Knowledge](http://www.acm.org/education/curricula/ComputerScience2008.pdf)
- [How to be a programmer](http://samizdat.mines.edu/howto/HowToBeAProgrammer.html)
- [Background knowledge](#what-background-do-i-need-to-write-a-compiler)

### What do I need to do?
1. [Install Software](#what-software-do-i-need).
2. [Contribute](#what-will-i-contribute).
3. [Solicit and share feedback](#how-do-i-solicit-and-share-feedback).
4. Go to 2.

### What software do I need?
- A compiler (Visual Studio, Xcode, GCC, MinGW, or Clang)
- Version control (Git)
- Build tool (CMake)
- Testing tool (Clar)
- Documentation tool (Doxygen)

### What will I contribute?
We all will work on two projects:

- A [parser combinator/parser generator](#what-is-a-parser-combinator-parser-generator).
- [Open educational resources](#what-are-open-educational-resources).

Why? To develop: [Autonomy, mastery, and purpose](http://www.youtube.com/watch?v=u6XAPnuFjJc).

### What are open educational resources?
[Creative Commons](http://creativecommons.org/) licensed material for teaching and learning.

- <http://www.saylor.org/open-textbook-challenge-peer-review-criteria/>

### What background do I need to write a compiler?
A strong background in discrete structures is necessary.

- What is the difference between [sets](#what-is-a-set), [sequences](#what-is-a-sequence), and [bags](#what-is-a-bag)?
- What is the difference between an [alphabet](#what-is), a string, and a character?

Knowledge of some design patterns helps.

- [What are design patterns?](#what-are-design-patterns)
- [What is the visitor design pattern?](#what-is-the-visitor-design-pattern)

### What are design patterns?

### What is the visitor design pattern?

### What does discrete mean?

### What is a set?
An unordered, possibly infinite, collection of unique objects.

Examples and counterexamples:

- {apple,pear,banana} is a set.
- {apple,apple,pear} is not a set, because apple is not unique.
- The integers form an infinite set.
- {1,2,3} is the same set as {3,1,2}, because order does not matter.

### What is a string?
A sequence of characters.

Examples:

- "This is a string"
- "Strings are surrounded by quote marks"
- "This string" is not "this string." Case and punctuation matter.

### What is a sequence?
An ordered collection of objects.

Examples:

- {apple,pear, banana} is a sequence.
- {apple, apple, pear} is a sequence, because objects need not be unique.
- {1,2,3} is different from {3,1,2}, because order matters.

### What is a character?
A symbol in an alphabet.

### What is an alphabet?
A finite set (of symbols).

Examples:

- Roman, Greek alphabet
- Numerals
- ASCII
- Unicode

Compilers
---------

### What is a compiler?
A compiler translates from a source [language](#what-is-a-language) to a target language.

Examples:

- GCC, Clang, Visual C++ translate C into machine code
- LaTeX, Pandoc translate document markup into PDF, HTML, etc.

### What is a language?
A [set](#what-is-a-set) of [strings](#what-is-a-string).

Examples and counterexamples:

- "I love you dearly!" is in English.
- "Love I dearly you!" is not in English, despite the English words.
- "int main() { return 0; }" is in C.

### What is an interpreter?

### The C compiler is written in C. How can that be?

### How do compilers work?

Regular languages
-----------------

### What is a regular language?

### What is a regular expression?
The empty set, empty string, and character are regular expressions.
If a and b are regular expressions, then:

- ab is a regular expression that matches a followed by b
- a|b is a regular expression that matches a or b
- a* is a regular expression that matches a zero or more times

### What is a finite automaton?

### What is an nondeterministic finite automaton?

### What is a deterministic finite automaton?


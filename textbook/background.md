\pagebreak

Background
==========
What should I know already to write a compiler?

- Most of the ACM [Body of Knowledge](http://www.acm.org/education/curricula/ComputerScience2008.pdf)
- [How to be a programmer](http://samizdat.mines.edu/howto/HowToBeAProgrammer.html)
- [Discrete structures](#discrete-structures)
- [Algorithms and data structures](#algorithms-and-data-structures)
- [Software Engineering](#software-engineering)

Discrete structures
-------------------
Writing a compiler requires familiarity with discrete structures.

- What does [discrete](#what-does-discrete-mean) mean?
- What is the difference between [sets](#what-is-a-set), [sequences](#what-is-a-sequence), and [bags](#what-is-a-bag)?
- What is the difference between an [alphabet](#what-is-an-alphabet), a [string](#what-is-a-string), and a [character](#what-is-a-character)?
- What is a [stack](#what-is-a-stack)?

### What does discrete mean?
Discrete means:

- The opposite of continuous
- Separate
- Distinct

Discrete does not mean:

- Respecting privacy
- Avoiding attention

That's discreet.

### What is a set?
An unordered, possibly infinite, collection of unique objects.

Examples and counterexamples:

- {apple,pear,banana} is a set.
- {apple,apple,pear} is not a set, because apple is not unique.
It's a [bag](#what-is-a-bag).
- The integers form an infinite set.
- {1,2,3} is the same set as {3,1,2}, because order does not matter.

### What is a stack?

### What is a bag?
An unordered, possibly infinite, collection of objects.

Examples:

- {apple,apple,pear} is a bag.
- {1,2,1} is the same bag as {1,1,2}, because order does not matter.

### What is a sequence?
An ordered collection of objects.

Examples:

- {apple,pear, banana} is a sequence.
- {apple, apple, pear} is a sequence, because objects need not be unique.
- {1,2,3} is different from {3,1,2}, because order matters.

### What is a string?
A sequence of characters.

Examples:

- "This is a string"
- "Strings are surrounded by quote marks"
- "This string" is not "this string." Case and punctuation matter.

### What is a character?
A symbol in an alphabet.

### What is an alphabet?
A finite set (of symbols).

Examples:

- Roman, Greek alphabet
- Numerals
- ASCII
- Unicode

Algorithms and data structures
------------------------------
Writing a compiler requires working with trees.

- What is a tree?
- What is the difference between an inorder, preorder, and postorder traversal?

### What is code?
A [sequence](#what-is-a-sequence) of [instructions](#what-is-an-instruction).

### What is an instruction?
A basic operation that a machine can perform.

Examples:

- Arithmetic instructions (e.g., addition, subtraction, multiplication, division)
- Logic and bitwise instructions (e.g., and, or, not, exclusive or, shift-left, shift-right)
- Control instructions (e.g., goto, jump)
- Relational instructions (e.g., equal, less than, greater than)
- Data movement instructions (e.g., move)

Software Engineering
--------------------
Knowledge of some design patterns, version control, and testing is necessary to write a compiler.

- [What are design patterns?](#what-are-design-patterns)
- [What is the visitor design pattern?](#what-is-the-visitor-design-pattern)
- What is the composite design pattern?
- What is the strategy design pattern?

### What are design patterns?

### What is the visitor design pattern?

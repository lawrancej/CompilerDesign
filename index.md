Compiler Design
===============

[Coordinate here](https://docs.google.com/document/d/1g7SXO8BSL5rq2cJVqp_9XfWkzNyi9ZWKKl2Heb_nS1g/edit)

Compilers
---------

### What is a compiler?
A compiler translates from a source [language](#what-is-a-language) to a target language.

Examples:

- GCC, Clang, Visual C++ translate C into machine code
- LaTeX, Pandoc translate document markup into PDF, HTML, etc.

### What is a language?
A [set](background.md#what-is-a-set) of [strings](background.md#what-is-a-string).

Examples and counterexamples:

- "I love you dearly!" is in English.
- "Love I dearly you!" is not in English, despite the English words.
- "int main() { return 0; }" is in C.

### What is Chomsky's hierarchy?

### What is an interpreter?

### The C compiler is written in C. How can that be?

### What are the phases of a compiler?
List the phases here. Briefly describe what each phase does. Give examples.

### Who is [Grace Hopper](http://www.smbc-comics.com/?id=2516)?

#### Military Career

#### Contributions to Computer Science
 - Developed the first compiler for a computer programming language.
 - Conceptualized machine-independent programming languages.
 - Popularized the term "debugging."
 
#### Honors
 - "Computer Sciences Man of the Year" award from the Data Processing Management Association in 1969
 
Regular languages
-----------------

### What is a regular language?
[Regular expressions](#what-is-a-regular-expression) define the regular languages.

### What is a regular expression?
Regular expressions consist of:

Primitives:

- $\emptySet$. The empty set. Reject everything.
- $\epsilon$. The empty string. Match the empty string.
- c. Character. Match a single character

Operations:

If a and b are regular expressions, then the following are regular expressions:

- ab. Catenation.  Match a followed by b.
- a|b. Alternation. Match a or b.
- a*. Kleene closure. Matches a zero or more times.

### What is a finite automaton?


### What is an nondeterministic finite automaton?

### What is a deterministic finite automaton?

### How to convert an NFA to a DFA?

### What is the derivative of a regular expression?

### What is a scanner (lexical analyzer)?

Context-free languages
----------------------
### What is a context-free language?

### What is the difference between a regular language and a context free language?

### What is a grammar?

### What is a derivation?
Give examples.
### What is a leftmost derivation?

### What is a rightmost derivation?

### What is an ambiguous grammar?

### What is a LL(k) grammar?

### What is a LR(k) grammar?

### What is a pushdown automaton?

### What is a deterministic pushdown automaton?

### What is a nondeterministic pushdown automaton?

### What is a parser?

### What is a parse tree?

Abstract Syntax Trees
---------------------
### What is an abstract syntax tree?

### What is the difference between an abstract syntax tree and a parse tree?

### What is the visitor design pattern?

Optimization
------------
### What is optimization?

### What is the point of optimization?

### What is peephole optimization?(Kyle, Dariush)
Peephole optimization is a type of optimization that covers a trivial set of instructions in generated code. The set of instructions that the optimization operates on is called the "Peephole" or "window". The basic task for the peephole optimizer (for most optimizers) is to recognize a set of instructions that can be replaced by a shorter or faster set.

Example #1 - Redundant Operations
Consider the following code:
foo = bar + d;
foobar = foo + a;

In Assembly, it would be translate to:
MOV bar, AL 	#move B into the EAX Register
ADD d, AL   	#Add D to the EAX Register = bar + d
MOV AL,foo  	#move the result of the add to the foo variable
MOV foo,AL  	#now move foo into AL to be operated on
ADD a, AL   	#Add A to foo = foo + a
MOV foobar, AL	#move the result of foo + a into foobar

This can be optimized by using algebraic rules to simplify the operation from two operations with memory manipulation ( a = b + c; d = a + e;) to a two step operation without an intermediate storage step (d = b + c  + e):

MOV bar, AL # Copy bar to the register 
ADD d, AL # Add d to the register, which is now bar+d 
MOV AL, foo # Copy the register to foo
ADD a, AL # Add a to the register, which is now b+c+e 
MOV AL, foobar # Copy the register to foobar

### What is single static assignment (SSA)?

### What is loop unrolling?

### What is method inlining?

Code generation
---------------
### What is code generation?

Interpretation
--------------
### What is interpretation?

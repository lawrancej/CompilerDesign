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

Follow-up:

- [How do compilers work](#what-are-the-phases-of-a-compiler)?
- [Who developed the first compiler](#who-is-grace-hopper)?

### What is a language?
A [set](background.md#what-is-a-set) of [strings](background.md#what-is-a-string).

Examples and counterexamples:

- "I love you dearly!" is in English.
- "Love I dearly you!" is not in English, despite the English words.
- "int main() { return 0; }" is in C.

### What is Chomsky's hierarchy?
The Chomsky hierarchy, as the name implies, is a containment hierarchy of classes of [formal grammars](#what-is-a-grammar).
The hierarchy consists of four levels:

1. [Unrestricted grammars](#what-is-an-unrestricted-grammar).
2. [Context sensitive grammars](#what-is-a-context-sensitive-grammar).
3. [Context-free grammars](#what-is-a-context-free-grammar).
4. [Regular grammars](#what-is-a-regular-grammar).

### What is an interpreter?
An interpreter executes souce code without producing an executable.

#### Examples:

- Debuggers
- Scripting languages

#### Follow-up:

- [How do interpreters work](#how-do-interpreters-work)?

### How do interpreters work?
Interpreters consist of the exact [same phases of a compiler](#what-are-the-phases-of-a-compiler), but execute programs instead of [generating machine code](#what-is-code-generation).

### The C compiler is written in C. How can that be?
With the exception of the first C compiler, it is possible to write a C compiler in C and then compile it using another existing C compiler.
Writing the first C compiler in C is known as [bootstrapping](#what-is-bootstrapping-and-how-does-it-work).

### What is bootstrapping and how does it work?
Bootstrapping is a series of steps that slowly builds up a self-hosting compiler.

### What are the phases of a compiler?
Compilers operate around these phases:

Front end (process source language):

- [Scanner (Lexical analyzer)](#what-is-a-scanner). Split source code (a [string](background.md#what-is-a-string)) into a token sequence.
- [Parser (Syntactic analyzer)](#what-is-a-parser). Check if token sequence conforms to language grammar and construct the [parse tree](#what-is-a-parse-tree) or [abstract syntax tree](#what-is-an-abstract-syntax-tree).
- [Type checker (Semantic analyzer)](#what-is-a-type-checker). Check if the program is [semantically valid](#what-is-semantics).

Middle end (an intermediate representation):
- [Translator](#what-is-a-translator). Convert an abstract syntax tree into an [intermediate representation](#what-are-intermediate-representations).
- [Optimizer](#what-is-optimization). Improves IR code by eliminating redundancy and [dead code](#what-is-dead-code).

Back end (generate target language):
- [Code generator](#what-is-code-generation). Produces machine code.

### Who is [Grace Hopper](http://www.smbc-comics.com/?id=2516)?

#### Military Career
 - Sworn into the United States Navy Reserve in 1943.
     - Volunteered to serve in the WAVES.
 - Trained at the Smith College in Northampton, MA.
     - Graduated first in her class in 1944.
 - Assigned to the Bureau of Ships Computation Project at Harvard University as a lieutenant.
 - Served on the Mark I computer programming staff.
 - Was declined entry to the standard Navy due to her age.
     - Continued serving in the Navy Reserve.
 - Continued working in the Harvard Computation Lab until 1949 under a Navy Contract.

#### Contributions to Computer Science
 - Developed the first compiler for a computer programming language.
 - Conceptualized machine-independent programming languages.
 - Popularized the term "debugging."
 
#### Honors
 - Computer Sciences Man of the Year award from the Data Processing Management Association in 1969
 - Made a Distinguished Fellow of the British Computer Society in 1973.
 - Defense Distinguished Service Medal in 1986.
 - Computer History Museum Fellow Award in 1987.
 - Golden Gavel Award at the Toastmasters International convention in 1988.
 - National Medal of Technology in 1991.
 
Regular languages
-----------------

### What is a regular language?
[Regular expressions](#what-is-a-regular-expression) define the regular languages.

### What is a regular grammar?

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

### What is the difference between deterministic and nondeterministic?

### How to convert an NFA to a DFA?

### What is the derivative of a regular expression?

### What is a scanner (lexical analyzer)?

Context-free languages
----------------------
### What is a context-free language?

A language generated by [context-free grammar](#what-is-a-context-free-grammar).

### What is a context-free grammar?
A [formal grammar](#what-is-a-grammar) that uses expressions where the left-hand side is a single "[non-terminal](#what-is-a-nonterminal)" symbol.

### What is the difference between a regular language and a context free language?

[Formal regular expressions](#what-is-a-regular-expression) define [regular languages](#what-is-a-regular-language),
and can be accepted by [deterministic and non-deterministic](#what-is-the-difference-between-deterministic-and-nondeterministic) [finite state machines](#what-is-a-finite-automaton).
Regular languages also do not accept arbitrary nesting, like [recursion](background.md#what-is-recursion).
[Context-free grammars](#what-is-a-context-free-grammar) define context-free languages, and can be accepted by [pushdown automata](#what-is-a-pushdown-automaton) 

Example:

- The [language](#what-is-a-language) of balanced parentheses is context-free, but not regular. Thus, it is impossible to construct a regular expression (but possible to construct a context-free grammar) that matches balanced parentheses.

### What is a Nonterminal?

### What is a Terminal?
Terminals correspond to [tokens](#what-is-a-token).

### What is a grammar?

### What is a derivation?
Give examples.
### What is a leftmost derivation?

### What is a rightmost derivation?

### What is an ambiguous grammar?

### What is a LL(k) grammar?

### What is a LR(k) grammar?

### What is a pushdown automaton?
A pushdown automaton (PDA) is a finite state machine with [stack](background.md#what-is-a-stack) memory. 
It manipulates a stack by choosing an indexing variable within the stack, a current state, and a symbol at the top of the stack. 

Followup:

- [Show me an example pushdown automaton](#what-does-a-pushdown-automaton-look-like)?

#### What does a pushdown automaton look like?

### What is a deterministic pushdown automaton?

### What is a nondeterministic pushdown automaton?

### What is a parser?
A parser:
- Checks for [syntax errors](#what-is-a-syntax-error)
- Constructs a [parse tree](#what-is-a-parse-tree) or an [abstract syntax tree](#what-is-an-abstract-syntax-tree).

Typically, a [scanner](#what-is-a-scanner) first [tokenizes](#what-is-tokenization) the source code into a [token](#what-is-a-token) [sequence](background.md#what-is-a-sequence) that the parser reads as input.
However, scanner-less parsers work directly with source code as input.

Parsers do not [produce assembly or object code](#what-is-code-generation).

Follow ups:
- [How do parsers work](#how-do-parsers-work)?

### What is a syntax error?

A parser first tokenizes the source code depending on its syntax. It takes the structure of the code and uses said tokens to convert it to object code. After evaluation it will convert it to ASM code if there are no syntax errors.

### What is a parse tree?

### How do parsers work?

Abstract Syntax Trees
---------------------
### What is an abstract syntax tree?

### What is the difference between an abstract syntax tree and a parse tree?

### What is the visitor design pattern?

Semantics
---------
### What is semantics?

### What is static semantics?

### What is runtime semantics?

### What is type-checking?

Intermediate representations
----------------------------
### What are intermediate representations?

### What is a translator?

Optimization
------------
### What is optimization?

### What is the point of optimization?
Unoptimized programs do not fully exploit underlying hardware capabilities, since [high-level languages](#what-is-a-high-level-langauge) abstract away from machine code.
Therefore, optimization can make programs:

 - Faster.
 - More efficient.
 - Smaller.

### What is peephole optimization?

### What is single static assignment (SSA)?

### What is loop unrolling?

### What is method inlining?

### What is dead code?

Code generation
---------------
### What is code generation?

Interpretation
--------------
### What is interpretation?

Compiler Design
===============

[Coordinate
here]([https://docs.google.com/document/d/1g7SXO8BSL5rq2cJVqp\_9XfWkzNyi9ZWKKl2Heb\_nS1g/edit](https://docs.google.com/document/d/1g7SXO8BSL5rq2cJVqp_9XfWkzNyi9ZWKKl2Heb_nS1g/edit))

Compilers
---------

\#\#\# What is a compiler? A compiler translates from a source
[language](\#what-is-a-language) to a target language.

Examples:

-   GCC, Clang, Visual C++ translate C into machine code
-   LaTeX, Pandoc translate document markup into PDF, HTML, etc.

\#\#\# What is a language? A [set](background.md\#what-is-a-set) of
[strings](background.md\#what-is-a-string).

Examples and counterexamples:

-   "I love you dearly!" is in English.
-   "Love I dearly you!" is not in English, despite the English words.
-   "int main() { return 0; }" is in C.

\#\#\# What is Chomsky's hierarchy?

\#\#\# What is an interpreter?

\#\#\# The C compiler is written in C. How can that be?

\#\#\# What are the phases of a compiler? List the phases here. Briefly
describe what each phase does. Give examples.

\#\#\# Who is Grace Hopper?

Regular languages
-----------------

\#\#\# What is a regular language? [Regular
expressions](\#what-is-a-regular-expression) define the regular
languages.

\#\#\# What is a regular expression? Regular expressions consist of:

Primitives:

-   \$emptySet\$. The empty set. Reject everything.
-   \$epsilon\$. The empty string. Match the empty string.
-   c.  Character. Match a single character

Operations:

If a and b are regular expressions, then the following are regular
expressions:

-   ab. Catenation. Match a followed by b.
-   a|b. Alternation. Match a or b.
-   a\*. Kleene closure. Matches a zero or more times.

\#\#\# What is a finite automaton?

\#\#\# What is an nondeterministic finite automaton?

\#\#\# What is a deterministic finite automaton?

A deterministic finite automaton (DFA) always has a unique transition. A
transition is a move from one state to another. In a DFA transitions are
represented using a transition table.

\#\#\# How to convert an NFA to a DFA?

\#\#\# What is the derivative of a regular expression?

\#\#\# What is a scanner (lexical analyzer)?

Context-free languages
----------------------

\#\#\# What is a context-free language?

\#\#\# What is the difference between a regular language and a context
free language?

\#\#\# What is a grammar?

\#\#\# What is a derivation? Give examples. \#\#\# What is a leftmost
derivation?

\#\#\# What is a rightmost derivation?

\#\#\# What is an ambiguous grammar?

\#\#\# What is a LL(k) grammar?

\#\#\# What is a LR(k) grammar?

\#\#\# What is a pushdown automaton?

\#\#\# What is a deterministic pushdown automaton?

\#\#\# What is a nondeterministic pushdown automaton?

\#\#\# What is a parser?

\#\#\# What is a parse tree?

Abstract Syntax Trees
---------------------

\#\#\# What is an abstract syntax tree?

\#\#\# What is the difference between an abstract syntax tree and a
parse tree?

\#\#\# What is the visitor design pattern?

Optimization
------------

\#\#\# What is optimization?

\#\#\# What is the point of optimization?

\#\#\# What is peephole optimization?

\#\#\# What is single static assignment (SSA)?

\#\#\# What is loop unrolling?

\#\#\# What is method inlining?

Code generation
---------------

\#\#\# What is code generation?

Interpretation
--------------

\#\#\# What is interpretation?

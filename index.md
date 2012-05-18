Compiler Design
===============

Assessment
----------

<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dFhGcklySG5VQWh4cWlWNlNRclZfM3c6MQ" width="760" height="1400" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>

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

### What is an interpreter?

### The C compiler is written in C. How can that be?

### How do compilers work?

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


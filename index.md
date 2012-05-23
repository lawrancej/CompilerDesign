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

### What is an interpreter?
An interpreter is a type of compiler that simply executes the code directly without translating it to a lower level.

Examples:

- Debuggers
- Scripting languages

Follow-up:

- [How do interpreters work](#how-do-interpreters-work)?

### The C compiler is written in C. How can that be?

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

### How do interpreters work?
Interpreters consist of the exact [same phases of a compiler](#what-are-the-phases-of-a-compiler), but execute programs instead of [generating machine code](#what-is-code-generation).

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

When a language is context free, it means that when reading the language a word or a token can be only one thing. A good example of this si the English language. "The boy bought the basketball." When we look at this sentence boy and baskeball are only defined as nouns and bought is defines as a verb. Since we require no context when we see those words to understand what they are, the language is context free. An example of a context based language would be most Asian based languages. A single symbol can be many things depending on the rest of the sentence. Since we rely on the context of the rest of the sentence to understand it, the language is not context free.

So what is a context free language in programming? A context free language is one that is made up using context free grammar. The simplest way to understand this is by looking at some basic examples.

B->hB
B->

If we look at the grammar above, we can see that it is context free. We know this because it meets two simple conditions.

1. It has one symbol on the left hand side.
2. It is not infinitly recursive.

Why does more than one symbol on the left hand side make a language context free?

In order to explain this lets look at some grammar in which that occurs.

A->h
B->k
AB->Asd

Now if we look at the language and we have AB, do we mean that we have A and B or do we mean that we have AB? This cannot be determined simply by just using the rules of the grammar. We would need other information. This means that the language is not context free.

Why can the language not be infinitly recursive?

Lets look at another example piece of grammar.

B->hB

If we look at this example of grammar, we notice that it has no end. This means that the we will never be able to convert to just symbols on the left hand side, making the language not context free.

### What is the difference between a regular language and a context free language?

### What is a grammar?

NOTES - not final answer (all information taken from Wikipedia)

In formal language theory, a context-free grammar (CFG) is a formal grammar in which everyproduction rule is of the form
V ? w
where V is a single nonterminal symbol, and w is a string of terminals and/or nonterminals (w can be empty).
The languages generated by context-free grammars are known as the context-free languages.
Context-free grammars are important in linguistics for describing the structure of sentences and words in natural language, and in computer science for describing the structure of programming languages and other formal languages.
In linguistics, some authors use the term phrase structure grammar to refer to context-free grammars, whereby phrase structure grammars are distinct from dependency grammars. Incomputer science, a popular notation for context-free grammars is Backus�Naur Form, or BNF.
	-Wikipedia

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

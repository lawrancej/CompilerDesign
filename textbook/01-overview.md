
\pagebreak

<!---
DO NOT REMOVE THIS COMMENT OR TOPICS LISTED HERE.

This section should cover these topics.
It need not be in this order.

Indicate coverage of topics by copying topic lines verbatim into a comment adjacent to the relevant text.
Covered topics appear twice in a file: here and adjacent to the relevant text.
Uncovered topics appear only once in a file (in this comment).

This command checks whether topic lines appear only once in a file.

    ./check.sh uncovered

TOPICS:

1.1 Introduction
1.1.1 Definition of a Compiler
1.1.2 History and Purpose
1.1.2.1 Grace Hopper
1.1.2.2 Purpose
1.1.2.2.1 Translate Source Language to Target Language
1.1.2.2.2 Object Code and Executables
1.1.2.2.3 Platform Independent Compilers
1.1.3 Comparison between Compiler and Interpreter
1.1.4 Hardware Compilation
1.2 Compiler Design
1.2.1 One-Pass vs Multi-Pass
1.2.1.1 One Pass
1.2.1.1.1 Simple to Implement
1.2.1.1.2 Limited Optimization
1.2.1.2 Multi-Pass
1.2.1.2.1 Enhanced Optimization
1.2.1.2.2 Easier to Prove Correctability
1.2.1.2.3 Source-to-Source Compilation Possible (Translators)
1.2.1.2.4 Source-Bytecode-Native Code
1.2.2 Structure
1.2.2.1 Front End
1.2.2.1.1 Create Intermediate Representation
1.2.2.1.2 Manages Symbol Table
1.2.2.1.3 Steps
1.2.2.1.3.1 Preprocessing
1.2.2.1.3.2 Lexical Analysis
1.2.2.1.3.3 Syntax Analysis
1.2.2.1.3.4 Semantic Analysis
1.2.2.2 Back End
1.2.2.2.1 Steps
1.2.2.2.1.1 Analysis
1.2.2.2.1.2 Optimization
1.2.2.2.1.3 Code Generation
-->

Introduction
============

## Overview

### What is a compiler?
<!---
1.1.1 Definition of a Compiler
-->
A compiler translates from a source [language](#what-is-a-language) to a target language.

Examples:

- GCC, Clang, Visual C++ translate C into machine code
- LaTeX, Pandoc translate document markup into PDF, HTML, etc.

Follow-up:

- [How do compilers work](#what-are-the-phases-of-a-compiler)?
- [Who developed the first compiler](#who-was-grace-hopper)?

### What are the phases of a compiler?
Compilers consist of several distinct phases split among the front and back end.

![Phases of a compiler](images/compiler-phases.svg)

#### Front end
The front end processes the source language and consists of these phases:

- [Scanning (Lexical analysis)](#what-is-a-scanner). Split source code (a [string](#what-is-a-string)) into a token sequence.
- [Parsing (Syntactic analysis)](#what-is-a-parser). Check if token sequence conforms to language grammar and construct the [parse tree](#what-is-a-parse-tree) or [abstract syntax tree](#what-is-an-abstract-syntax-tree).
- [Type checking (Semantic analysis)](#what-is-a-type-checker). Check if the program is [semantically valid](#what-is-semantics).

#### Back end
The back end generates the target language and consists of these phases:

- [Translation](#what-is-a-translator). Convert an abstract syntax tree into an [intermediate representation](#what-is-an-intermediate-representation).
- [Analysis](#what-is-analysis). Collect information necessary for optimization.

- [Optimization](#what-is-optimization). Improve [intermediate representation](#what-is-an-intermediate-representation) code.
- [Code generation](#what-is-code-generation). Produce machine code from an intermediate representation or an [abstract syntax tree](#what-is-an-abstract-syntax-tree).

## Compiler and interpreters
<!---
1.1.3 Comparison between Compiler and Interpreter
-->

### What is an interpreter?
An interpreter reads in souce code and executes immediately without producing an executable.

#### Examples:

- Debuggers
- Scripting languages

#### Follow-up:

- [How do interpreters work](#how-do-interpreters-work)?
- [Which is better, compilers or interpreters](#which-is-better-compilers-or-interpreters)?

### How do interpreters work?
Interpreters share many [phases of a compiler](#what-are-the-phases-of-a-compiler), but execute instead of [generating machine code](#what-is-code-generation).
Interpreter implementations vary:

- Trivial interpreters execute code while parsing (e.g., early versions of Lisp, Python, Perl, Basic)
- Traditional interpreters omit the code generator, and execute the intermediate representation.
- Complex interpreters execute precompiled code as part of a compiler-interpreter system.

### Which is better, compilers or interpreters?
It depends.

Because an interpreter never produces an executable, interpreted code is always up to date.
However, an interpreter must process source code every time it executes, thus it can be slower than compiled machine code.

### The C compiler is in C; how can that be?
With the exception of the first C compiler, it is possible to write a C compiler in C and then compile it using another existing C compiler.
Writing the first C compiler in C required [bootstrapping](#what-is-bootstrapping-and-how-does-it-work).

### What is bootstrapping and how does it work?
Bootstrapping is a series of steps that slowly builds up a self-hosting compiler.

> TODO: expand this so to answer how it works.

## Theory of computation

### What is a language?
A [set](#what-is-a-set) of [strings](#what-is-a-string).
Typically, a [formal grammar](#what-is-a-grammar) defines the language.

Examples and counterexamples:

- "I love you dearly!" is in English.
- "Love I dearly you!" is not in English, despite the English words.
- "int main() { return 0; }" is in C.

### What is a grammar?
A grammar consists of:

- A set of [productions](#what-is-a-production).
- A set of terminals.
- A set of nonterminals.
- A start symbol (a nonterminal)

#### Example
This two production grammar (written in a variant of [Backus Naur Form](#what-is-backus-naur-form)) matches balanced parentheses.

$Parens \to (Parens)*$
$Parens \to [^()]*$

### What is a production?
A production, or rewriting rule, consists of a left hand side (LHS) and a right hand side (RHS).

$LHS \to RHS$

[Depending on the class of grammar](#what-is-chomskys-hierarchy), the left hand side and right hand side can be sequences of [terminals](#what-is-a-terminal) and [nonterminals](#what-is-a-nonterminal).

### What is a Nonterminal?
A nonterminal is anything in a grammar that can be replaced, and corresponds to [parent nodes](#what-is-a-parent-node) in a [parse tree](#what-is-a-parse-tree).

### What is a Terminal?
A terminal is a primitive unit in a grammar (a [symbol](#what-is-a-symbol) or [token](#what-is-a-token)) that corresponds to the [leaf nodes](#what-is-a-leaf-node) in a [parse tree](#what-is-a-parse-tree).
Terminal Symbols/Tokens cannot be broken down.
Example:
1. s can become sg
2. s can become gs
G is terminal because no rule can change the s.
S however is nonterminal because there are two rules that can modify the s in the lexical analysis portion.

### What is Chomsky's hierarchy?
The Chomsky hierarchy, as the name implies, is a containment hierarchy of classes of [formal grammars](#what-is-a-grammar).
The hierarchy consists of four levels:

1. [Unrestricted grammars](#what-is-an-unrestricted-grammar). Recognized by [Turing machines](#what-is-a-turing-machine).
2. [Context sensitive grammars](#what-is-a-context-sensitive-grammar). Recognized by a [bounded Turing machine](#what-is-a-bounded-turing-machine).
3. [Context-free grammars](#what-is-a-context-free-grammar). Recognized by a [pushdown automaton](#what-is-a-pushdown-automaton).
4. [Regular grammars](#what-is-a-regular-grammar). Recognized by a [finite state machine](#what-is-a-finite-automaton).

#### Follow-up questions
- [What are the implications of Chomsky's hierarchy](#what-are-the-implications-of-chomskys-hierarchy)?

### What are the implications of Chomsky's hierarchy?
The difference between regular, context-free, and context-sensitive languages is in the structure of strings.
The difference has nothing to do with meaning or semantics.

> TODO: pumping lemma, examples of regular, context-free, context-sensitive languages (move existing examples here?)

### What is an unrestricted grammar?
An unrestricted grammar's productions can include sequences of terminals and nonterminals in both the left and right hand sides of productions.

### What is a context-sensitive grammar?
> TODO: define context-sensitive here.
Why does more than one symbol on the left hand side make a language context free?

In order to explain this lets look at some grammar in which that occurs.

$A\to h$
$B\to k$
$AB \to Asd$

Now if we look at the language and we have AB, do we mean that we have A and B or do we mean that we have AB?
This cannot be determined simply by just using the rules of the grammar.
We would need other information.
This means that the language is not context free.


## History of compilers
<!---
1.1.2 History and Purpose
-->

### Who was [Grace Hopper](http://www.smbc-comics.com/?id=2516)?
<!---
1.1.2.1 Grace Hopper
-->

![Grace Hopper.
Official U.S.
Navy Photograph.](images/grace-hopper.jpg)

Grace Hopper developed the first compiler for a computer programming language and influenced subsequent programming languages.
Her [distinguished naval career](#what-did-grace-hoppers-naval-career-have-to-do-with-compilers) led to her [contributions to computer science](#what-did-grace-hopper-contribute-to-computer-science).

#### Follow-up questions

- [What did Grace Hopper contribute to computer science](#what-did-grace-hopper-contribute-to-computer-science)?
- [What did Grace Hopper's naval career have to do with compilers](#what-did-grace-hoppers-naval-career-have-to-do-with-compilers)?

### What did Grace Hopper contribute to computer science?
Grace Hopper:

 - Conceptualized machine-independent programming languages.
 - Coined the term "compiler".
 - Popularized the term "debugging".
 - Influenced the design of COBOL.
 - Guided the standardization of Fortran and COBOL.

#### What did Grace Hopper's naval career have to do with compilers?
> TODO: answer the question above

 - Sworn into the United States Navy Reserve in 1943.
     - Volunteered to serve in the WAVES.
 - Trained at the Smith College in Northampton, MA.
     - Graduated first in her class in 1944.
 - Assigned to the Bureau of Ships Computation Project at Harvard University as a lieutenant.
 - Served on the Mark I computer programming staff.
 - Was declined entry to the standard Navy due to her age.
     - Continued serving in the Navy Reserve.
 - Continued working in the Harvard Computation Lab until 1949 under a Navy Contract.
 
#### Honors
 - Computer Sciences Man of the Year award from the Data Processing Management Association in 1969.
 - Made a Distinguished Fellow of the British Computer Society in 1973.
 - Defense Distinguished Service Medal in 1986.
 - Computer History Museum Fellow Award in 1987.
 - Golden Gavel Award at the Toastmasters International convention in 1988.
 - National Medal of Technology in 1991.

#### Purpose
> TODO: add purpopse

#### Translate Source Language to Target Language
> TODO: Translate Source Language to Target Language

#### Object Code and Executables
> TODO: Object Code and Executables

#### Platform Independent Compilers
> TODO: add Platform Independent Compilers

#### Hardware Compilation
> TODO: add Hardware Compilation

#### Compiler Design

#### One-Pass vs Multi-Pass
> TODO: add One-Pass vs Multi-Pass

#### One Pass
> TODO: add One Pass
> TODO: add Simple to Implement
> TODO: add Limited Optimization

#### Multi-Pass
> TODO: add Multi-Pass
> TODO: add Enhanced Optimization
> TODO: add Easier to Prove Correctability
> TODO: add Source-to-Source Compilation Possible (Translators)
> TODO: add Source-Bytecode-Native Code

#### Structure

#### Front End
> TODO: add Front End

#### add Create Intermediate Representation
> TODO: add Create Intermediate Representation

#### Manages Symbol Table
> TODO: add Manages Symbol Table

#### Steps
> TODO: add Preprocessing
> TODO: add Lexical Analysis
> TODO: add Syntax Analysis
> TODO: add Semantic Analysis

#### Back End
> TODO: add Back End

#### Steps
> TODO: add Analysis
> TODO: add Optimization
> TODO: add Code Generation

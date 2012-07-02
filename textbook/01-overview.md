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
A nonterminal is anything in a grammar that can be replaced, and corresponds to [parent nodes](background.md#what-is-a-parent-node) in a [parse tree](#what-is-a-parse-tree).

### What is a Terminal?
A terminal is a primitive unit in a grammar (a [symbol](background.md#what-is-a-symbol) or [token](#what-is-a-token)) that corresponds to the [leaf nodes](background.md#what-is-a-leaf-node) in a [parse tree](#what-is-a-parse-tree).
Terminal Symbols/Tokens cannot be broken down.
Example:
1. s can become sg
2. s can become gs
G is terminal because no rule can change the s. S however is nonterminal because there are two rules that can modify the s in the lexical analysis portion.
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

A->h
B->k
AB->Asd

Now if we look at the language and we have AB, do we mean that we have A and B or do we mean that we have AB?
This cannot be determined simply by just using the rules of the grammar. We would need other information. This means that the language is not context free.


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

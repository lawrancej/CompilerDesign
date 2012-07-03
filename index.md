Compiler Design
===============
About this book
---------------
This textbook is meant to be:

- An [open educational resource](open-educational-resources.md). (<a rel="license" href="http://creativecommons.org/licenses/by/3.0/">CC-BY</a>)
- Short in its definitions and explanations.
- Long in its examples, follow-up questions, addressing misconceptions.
- A [collaborative effort](https://github.com/lawrancej/CompilerDesign/issues).
  1. [Pick a piece to own from the compiler course mapping outline](http://www.saylor.org/content/coursemapping/CourseMappingFormCS304.xls)
  2. Since version control is not a substitute for communication, [open an issue and review existing issues](https://github.com/lawrancej/CompilerDesign/issues) before you proceed.
  3. Ask and answer questions.

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

### The C compiler is written in C. How can that be?
With the exception of the first C compiler, it is possible to write a C compiler in C and then compile it using another existing C compiler.
Writing the first C compiler in C required [bootstrapping](#what-is-bootstrapping-and-how-does-it-work).

### What is bootstrapping and how does it work?
Bootstrapping is a series of steps that slowly builds up a self-hosting compiler.

> TODO: expand this so to answer how it works.

### What are the phases of a compiler?
Compilers consist of several distinct phases split among the front and back end.

#### Front end
The front end processes the source language and consists of these phases:

- [Scanning (Lexical analysis)](#what-is-a-scanner). Split source code (a [string](background.md#what-is-a-string)) into a token sequence.
- [Parsing (Syntactic analysis)](#what-is-a-parser). Check if token sequence conforms to language grammar and construct the [parse tree](#what-is-a-parse-tree) or [abstract syntax tree](#what-is-an-abstract-syntax-tree).
- [Type checking (Semantic analysis)](#what-is-a-type-checker). Check if the program is [semantically valid](#what-is-semantics).

#### Back end
The back end generates the target language and consists of these phases:

- [Translation](#what-is-a-translator). Convert an abstract syntax tree into an [intermediate representation](#what-is-an-intermediate-representation).
- [Analysis](#what-is-analysis). Collect information necessary for optimization. 
- [Optimization](#what-is-optimization). Improve [intermediate representation](#what-is-an-intermediate-representation) code.
- [Code generation](#what-is-code-generation). Produce machine code from an intermediate representation or an [abstract syntax tree](#what-is-an-abstract-syntax-tree).

### Who is [Grace Hopper](http://www.smbc-comics.com/?id=2516)?
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
 
Regular languages
-----------------
### What is a regular language?
[Regular expressions](#what-is-a-regular-expression) define the regular languages.
[Regular grammars](#what-is-a-regular-grammar) and [finite automata](#what-is-a-finite-automaton) recognize regular languages.

#### Follow-up questions
- [What is a regular expression](#what-is-a-regular-expression)?
- [How can you tell if a language is regular](#how-can-you-tell-if-a-language-is-regular)?
- [What is a finite automaton](#what-is-a-finite-automaton)?
- [What is a regular grammar](#what-is-a-regular-grammar)?

### How can you tell if a language is regular?
> TODO: see Pumping lemma for regular languages

[If the language is finite, it is regular](#why-are-all-finite-languages-regular)?

### Why are all finite languages regular?
> TODO: prove this 

### What is a regular grammar?
A regular grammar is a [formal grammar](#what-is-a-grammar) limited to productions of the following forms:

- $A \to a B$
- $B \to c$
- $D \to \epsilon$

Regular grammars also define the regular languages.

### What is a regular expression?
Regular expressions consist of:

#### Primitives:

- $\emptySet$. The empty set. Reject everything.
- $\epsilon$. The empty string. Match the empty string: ""
- `c`. Character. Match a single character.

#### Operations:

If `a` and `b` are regular expressions, then the following are regular expressions:

- `ab`. Catenation.  Match `a` followed by `b`.
- `a|b`. Alternation. Match `a` or `b`.
- `a*`. Kleene closure. Matches `a` zero or more times.

### What is a finite automaton?
A finite automaton, or finite state machine, can only be in a finite number of states in which it transititons between. 
An example is that when an automaton sees a symbol for input.
It then transititons to another state based on the next input symbol. 

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
A context-free grammar is a [formal grammar](#what-is-a-grammar) in which:

- The left-hand side of every [production](#what-is-a-production) is a single [nonterminal](#what-is-a-nonterminal) symbol.
- The right-hand side of every production is a sequence of terminals and nonterminals. If the sequence is empty, as in $A \to \epsilon$, the nonterminal [derives](#what-is-a-derivation) the empty string.

#### Examples
This grammar is [context-free], but [improper](#what-is-an-improper-context-free-grammar), because it is impossible to derive B into just terminal symbols.
$B \to hB$

This grammar is [context-free](#what-is-a-context-free-grammar) and [regular](#what-is-a-regular-grammar) (it matches `h*`).
$B \to hB$
$B \to \epsilon$

This grammar is [context-free], but not [regular](#what-is-a-regular-grammar), since it has [left-recursion](#what-is-left-recursion) (it matches balanced parentheses).
$S \to S (S)$
$S \to \epsilon$

#### Follow-up questions

- [How can you tell if a language is context-free](#how-can-you-tell-if-a-language-is-context-free)?
- [Is English context-free](http://cs.haifa.ac.il/~shuly/teaching/08/nlp/complexity.pdf)?
- [When a language is context free, do terminals have only one meaning](#what-are-the-implications-of-chomskys-hierarchy)?
- [Is infinite recursion allowed in context-free grammars](#what-is-left-recursion)?

### How can you tell if a language is context-free?

### What is left recursion?

### What is the difference between a regular language and a context free language?

[Formal regular expressions](#what-is-a-regular-expression) define [regular languages](#what-is-a-regular-language),
and can be accepted by [deterministic and non-deterministic](#what-is-the-difference-between-deterministic-and-nondeterministic) [finite state machines](#what-is-a-finite-automaton).
Regular languages also do not accept arbitrary nesting, like [recursion](background.md#what-is-recursion).
[Context-free grammars](#what-is-a-context-free-grammar) define context-free languages, and can be accepted by [pushdown automata](#what-is-a-pushdown-automaton) 

#### Example:

- The [language](#what-is-a-language) of balanced parentheses is context-free, but not regular. Thus, it is impossible to construct a regular expression (but possible to construct a context-free grammar) that matches balanced parentheses.

### What is a derivation?
Give examples.

### What is a leftmost derivation?

### What is a rightmost derivation?

### What is an ambiguous grammar?

### What is a LL(k) grammar?

### What is a LR(k) grammar?

### What is Backus-Naur Form?

### What is a pushdown automaton?
A pushdown automaton (PDA) is a finite state machine with [stack](background.md#what-is-a-stack) memory. 
It manipulates a stack by choosing an indexing variable within the stack, a current state, and a symbol at the top of the stack. 

> TODO: It'd be nice to have a picture of a pushdown automaton, in a vector format such as SVG.

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
> TODO: this section needs fixing. state what a syntax error is.

A parser first tokenizes the source code depending on its syntax. It takes the structure of the code and uses said tokens to convert it to object code. After evaluation it will convert it to ASM code if there are no syntax errors.

### What is a parse tree?

### How do parsers work?

Abstract Syntax Trees
---------------------
### What is an abstract syntax tree?
An abstract Syntax Tree is the data structure compilers/interpreters use in order to perform the actual code generation. It represents the hirearchy of the programmers code. An important note is that not all syntax of the code is displayed in the tree in the case of grouping paranthesis.

Example
int doSomething(int a)
{
	if(a > 10)
		a = a % 10;
	return a;
}

					[doSomething]
					/       \
				     [if]     [return]
				     / | \	   \
				   [a][>][10]     [a]
				   / \
				  [%][10]

An [abstract syntax tree (AST)](http://en.wikipedia.org/wiki/Abstract_syntax_tree) is simply a tree representation of the structure of source code. Each node of the tree represents a part of the code.

The "abstract" part of the AST comes from the fact that the tree does not represent the syntax down to the character level. Tokens like parenthesis and brackets are not nodes on the tree, and are instead represented implicitly by the structure of the tree itself.

If the code cannot be represented accurately as a tree, the parsed language is not [context-free](#what-is-a-context-free-language).

An abstract syntax tree (AST) is a tree representation of the abstract syntactic structure of the code written in any language. 
Also, it is the output of a parser. Every node is a structure of a particular type of node. 
Each node is created by creating a function which will return a pointer to a structure that will signify that node. 
Example: 
=========
struct Signature
	{
	struct AttributeList *attributes;
	struct Identifier *name;
	struct DeclarationList *arguments;
	struct TerminationSet *responses;
	};
extern struct Signature *node_signature (
	struct AttributeList *attributes,
	struct Identifier *name,
	struct DeclarationList *arguments,
	struct TerminationSet *responses);
	
	The example above is from the following website: 
	http://www.ansa.co.uk/ANSATech/95/Primary/155101.pdf

### What is the difference between an abstract syntax tree and a parse tree?

Parse Tree: are the rules to match the input text where as a syntax tree record the structure of the input. 

Syntax Tree: It will be less sensitivity from the "Parse tree" as it focuses more on the structure of the language not the grammar.


### What is the visitor design pattern?

Semantics
---------
### What is semantics?

### What is static semantics?

### What is runtime semantics?

### What is type-checking?

Intermediate representations
----------------------------
### What is an intermediate representation?
An intermediate representation is a target language internal to the compiler (like machine code).
A common intermediate representation simplifies the construction of compilers supporting multiple source and target languages.

### What is a translator?

A translator is a [compiler phase](#what-are-the-phases-of-a-compiler) which converts an [abstract syntax tree](#what-is-an-abstract-syntax-tree) into an [intermediate representation](#what-is-an-intermediate-representation).

Optimization
------------
### What is optimization?
Optimization is the penultimate [compiler phase](#what-are-the-phases-of-a-compiler).
Optimizers improve code performance, size, and efficiency toward an optimum.

#### Example optimizations:

- [Peephole optimization](#what-is-peephole-optimization)
- [Loop unrolling](#what-is-loop-unrolling)
- [Method inlining](#what-is-method-inlining)
- [Dead code](#what-is-dead-code) elimination

### What is the point of optimization?
Unoptimized programs do not fully exploit underlying hardware capabilities, since [high-level languages](#what-is-a-high-level-langauge) abstract away from machine code.
Therefore, optimization can make programs:

 - Faster.
 - More efficient.
 - Smaller.

### What is peephole optimization?
Peephole optimizers replace small subsequences of instructions with fewer or faster instructions.
The sequence of instructions that the optimization operates on is called the "peephole" or "window". 

#### Example
Depending on the target language, a peephole optimizer would replace the following code:

    j = i * 16;

with this faster code (left bit shift is faster than generic multiplication):

    j = i << 4;

### What is single static assignment (SSA)?

### What is loop unrolling?
Loop unrolling, or loop unwinding, removes or precalculates control operations.
The optimization improves speed by removing expensive branches, but comes at the cost of space complexity.

Loop unrolling includes these optimizations:

- Precalculating the end of loop condition
- Precalculating pointer increments
- Optimizing memory access
- Running independent iterations in parallel

#### Example

Original Code

```C#
for (int i = 0; i < 10; i++)
{
  if (i == 0)
    Console.WriteLine("I'm the beginning");
  else if (i % 2 == 0)
    Console.Writeline("I'm even");
  else
    Console.Writeline("I'm odd");
}
```

Unrolled Loop

```C#
Console.Writeline("I'm the beginning"); //i = 0
Console.Writeline("I'm odd"); //i = 1
Console.Writeline("I'm even"); //i = 2
Console.Writeline("I'm odd"); //i = 3
Console.Writeline("I'm even"); //i = 4
Console.Writeline("I'm odd"); //i = 5
Console.Writeline("I'm even"); //i = 6
Console.Writeline("I'm odd"); //i = 7
Console.Writeline("I'm even"); //i = 8
Console.Writeline("I'm odd"); //i = 9
```

### What is method inlining?

### What is dead code?
Dead code is any code whose result is never used, and therefore a waste of resources.

Examples:
- Definitions of uncalled functions
- Computations that do not affect output
- `if (false) { /* Dead code */ }`

Code generation
---------------
### What is code generation?
Code generation is the final [compiler phase](#what-are-the-phases-of-a-compiler).
It produces code in the target language, which is typically a machine language (e.g., x86, arm), but may be assembly or even a high-level language.

The code generator is distinct from the [parser](#what-is-a-parser) and the [translator](#what-is-a-translator).

Interpretation
--------------
### What is interpretation?

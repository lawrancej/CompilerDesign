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

It has:
- A start state
- A set of states
- A set of accepting states
- A set of transitions from (state, character) -> something

### What is an nondeterministic finite automaton?
It is a finite automaton in which we have a choice of where to go next.

The set of transitions is from (state, character) -> set of states.

### What is a deterministic finite automaton?
It is a finite automaton in which we have only one possible next state.

The set of transitions is from (state, character) -> state.

### What is the difference between deterministic and nondeterministic?
Deterministic finite automaton's (DFA's) are specific in regard to the input that they accept and the output yielded
by the automaton. The next state that the machine goes to is literally determined by the input string it is given.
A nondeterministic finite automaton is not as particular, and depending on its state and input, could change into a several 
possible new states.

Simple put the difference between a DFA and an NFA is that a DFA has no epilsons between the transitional states. The reasons that this makes a difference is that when we place an epsilon between our states it is not always possible to figure out the correct path to go without looking aheard in the current string we are parsing. This means that we are using something that is nondeterminsitic. Where as if we know the correct path to go at all times, it is determnistic.

### How to convert an NFA to a DFA?
Since both automaton's only accept regular languages as input, an NFA is able to be simplified and converted to a DFA. 
The process is called a powerset (or subset) construction and it takes the possible states of the NFA and translates them
into a map of states accessible to a DFA. This process is not without a cost, since deterministic finite automaton's are 
much less complex than their nondeterministic counterparts there will always be a loss of potential states in conversion.
All of the states of the NFA will still exist, but they will be unreachable from the origin once converted and thus obsoleted.
A converted NFA will have N^2 the number of states when converted where N is the number of states that the NFA originally had.

### What is the derivative of a regular expression?

### What is a scanner (lexical analyzer)?
> TODO: Merge these definitions. Some of these definitions are misconceptions, which we should include to address why they're wrong.
A scanner is a program in a parser that converts characters into tokens. This already has the information it needs about whatever characters that can be tokenized. This then matches any string that was put in to possible tokens and processes said information.

Lexical analysis or scanning is the process where the stream of characters making up the
source program is read from left-to-right and grouped into tokens. Tokens are sequences
of characters with a collective meaning. There are usually only a small number of tokens
for a programming language: constants (integer, double, char, string, etc.), operators
(arithmetic, relational, logical), punctuation, and reserved words.

A lexical analyzer is a piece of software that takes in a string as input, from that string it generates tokens based off of pre-defined rules. This is done to help for the actual compilation proccess later, as well as error checking.

#### Example

Lets take a look at some basic code with some basic rules.
int a = sum(7,3)

We define the rules as.
VARIABLE_TYPE = int | float | double | char
ASSIGNMENT_OPERATOR = =
OPEN_PARANTHESIS = (
CLOSE_PARANTHESIS = )
DIVIDER = ,
NUMBER = all numbers
NAME = any that remain

Using these rules we can now figure out what everything in this piece of code is.

VARIABLE_TYPE NAME ASSIGNMENT_OPERATOR NAME OPEN_PARENTHESIS NUMBER DIVIDER NUMBER CLOSE_PARANTHESIS

We can pass that on to the next step of the compilation proccess and it will now know what each of those words/symbols means.

Scanner, also know as Lexical analyzer or Lexer is a program which performs lexical analysis. It converts a sequence of characters into string of characters with a collective meaning following some rules. These rules contain identifier, assignment operator, number etc. The lexical analyzer takes a source program as input, and produces a stream of tokens as output.

Source Program -----> Lexical Analyzer ---------> Token stream
                           |
                           |
                           |
                     Error Message

> TODO: Let's use SVG instead of ASCII art.

A Scanner is used within lexical analysis to match token character strings that
are passed through it. Scanners use finite-state machines (FSM) to hold all possible combinations of tokens
so they may quickly process large amounts of data.

#### Follow-up:
### What is a token?
=======

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

A BNF specification is a set of derivation rules, written as

 <symbol> ::= __expression__

where <symbol> is a nonterminal, and the __expression__ consists of one or more sequences of symbols; more sequences are separated by the vertical bar, '|', indicating a choice, the whole being a possible substitution for the symbol on the left. Symbols that never appear on a left side are terminals. On the other hand, symbols that appear on a left side are non-terminals and are always enclosed between the pair <>.

The '::=' means that the symbol on the left must be replaced with the expression on the right

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

A parse tree for a grammar G is a tree where

    -the root is the start symbol for G

    -the interior nodes are the nonterminals of G

    -the leaf nodes are the terminal symbols of G.

    -the children of a node T (from left to right) correspond to the symbols on the right hand side of some production for T in G. 

Every terminal string generated by a grammar has a corresponding parse tree; every valid parse tree represents a string generated by the grammar (called the yield of the parse tree). 

### How do parsers work?


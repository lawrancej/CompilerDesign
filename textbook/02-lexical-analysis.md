
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

2.1 Grammars
2.1.1 Defined in Language Specification
2.1.2 Tokens and Lexemes
2.1.2.1 Defined in Specification
2.1.2.2 Described Set of Valid Character Sequences
2.2 Components
2.2.1 Tokens
2.2.1.1 Structured Text
2.2.1.2 Categorized
2.2.1.3 Example
2.2.1.3.1 int x = 3;
2.2.1.3.2 Tokens
2.2.1.3.2.1 int (variable type)
2.2.1.3.2.2 x (variable)
2.2.1.3.2.3 = (operator)
2.2.1.3.2.4 3 (value)
2.2.2 Tokenizer
2.2.3 Scanner
2.2.3.1 Finite State Machine
2.2.3.2 Contains Information What Constitutes a Valid Token
2.2.4 Evaluator
2.2.4.1 Works with Lexemes
2.2.4.2 Produces a Value
-->

Lexical Analysis
================
### What is a regular language?
[Regular expressions](#what-is-a-regular-expression) define the regular languages.
[Regular grammars](#what-is-a-regular-grammar) and [finite automata](#what-is-a-finite-automaton) recognize regular languages.

#### Follow-up questions
- [What is a regular expression](#what-is-a-regular-expression)?
- [How can you tell if a language is regular](#how-can-you-tell-if-a-language-is-regular)?
- [What is a finite automaton](#what-is-a-finite-automaton)?
- [What is a regular grammar](#what-is-a-regular-grammar)?

### How can you tell if a language is regular?
To find if a language is regular, one must employ a *pumping lemma*:

- All sufficiently long words in a regular language may be "pumped."
	- The middle section of the word repeats itself any number of times to produce a new word that is within language syntax.
	- i.e.
abc, abbc, abbbc, etc.
- In a regular language $L$, there exists an integer $p$ depending only on said language that every string $w$ of "pumping length" $p$ can be written as $w = xyz$ satisfying the following conditions:
	1. $|y| \ge 1$
	2. $|xy| \le p$
	3. for all $i \ge 0$, $xy^iz \in L$
	- Where $y$ is the pumpable substring.

[If the language is finite, it is regular](#why-are-all-finite-languages-regular)?

### Why are all finite languages regular?
> TODO: prove this 
<!---
2.1 Grammars
-->
### What is a regular grammar?
A regular grammar is a [formal grammar](#what-is-a-grammar) limited to productions of the following forms:

- $A \to a B$
- $B \to c$
- $D \to \epsilon$

Regular grammars also define the regular languages.

### What is a regular expression?
Regular expressions consist of:

#### Primitives:

- $\emptyset$. The empty set.
Reject everything.
- $\epsilon$. The empty string.
Match the empty string: ""
- `c`. Character.
Match a single character.

#### Operations:

If `a` and `b` are regular expressions, then the following are also considered such:

- `ab`. Catenation.
 Match `a` followed by `b`.
- `a|b`. Alternation.
Match `a` or `b`.
- `a*`. Kleene closure.
Matches `a` zero or more times.
<!---
2.2.3.1 Finite State Machine
-->
### What is a finite state machine?
A finite state machine, also known as an automaton, can only be in a finite number of states in which it transitions between.

An example is that when an automaton sees a symbol for input.
It then transitions to another state based on the next input symbol.


It has:
- A start state
- A set of states
- A set of accepting states
- A set of transitions from (state, character) to something

### What is an nondeterministic finite automaton?
It is a finite automaton in which we have a choice of where to go next.

The set of transitions is from (state, character) to a group of states.

### What is a deterministic finite automaton?
It is a finite automaton in which we have only one possible next state.

The set of transitions is from (state, character) to state.

### What is the difference between deterministic and nondeterministic?
Deterministic finite automaton's (DFA's) are specific in regard to the input that they accept and the output yielded
by the automaton.
The input string determines the next state that the machine goes to.
A nondeterministic finite automaton is not as particular.
Depending on its state and input, it could change into possible new states.

The difference between a DFA and an NFA is that a DFA has no epsilon between the transitional states.

Despite placing an epsilon between the states, it is not always possible to figure out the correct path to go without looking ahead in the current string the program is parsing.
This is an example of a nondeterministic finite automaton.
Where as if we know the correct path to go at all times, it is deterministic.

Deterministic and nondeterministic are similar, with 1 distinctable difference between them.
The main difference is that nondeterministic essentially chooses the state indiscriminately, while deterministic doesn't.

### How to convert an NFA to a DFA?
Since both automatons only accept regular languages as input, they can simplify an NFA to convert to a DFA.
The process, referred as a powerset (or subset) construction, takes the possible states of the NFA and translates them
into a map of states accessible to a DFA.
This process is not without a cost.

Deterministic finite automaton's are much less complex than their nondeterministic counterparts; there will always be a loss of potential states in conversion.
All states of the NFA will still exist, but they will be unreachable from the origin once converted and obsoleted.
A converted NFA has N^2 the number of states; N represents the original amount before conversion.

### What is the derivative of a regular expression?
<!--- 
2.2.3 Scanner
-->
### What is a scanner (lexical analyzer)?
> TODO: Merge these definitions.
Some of these definitions are misconceptions, which we should include to address why they're wrong.
A scanner is a program in a parser that converts characters into tokens.
It contains information about what it can tokenize.
It matches inputted strings to possible tokens and processes the information.

Lexical analysis or scanning
- A process where it reads the stream of characters making up the source program from left-to-right and groups them into tokens.
Tokens are sequences
of characters with a collective meaning.
There are usually only a small number of tokens
for a programming language: constants (integer, double, char, string, etc.), operators
(arithmetic, relational, logical), punctuation, and reserved words.

A lexical analyzer is a piece of software that takes in a string as input, then generates tokens based off of pre-defined rules.
This helps for the compilation process and error checking later on.

#### Example


int a = sum(7,3)

Rules:

VARIABLE_TYPE = int | float | double | char
ASSIGNMENT_OPERATOR = =
OPEN_PARANTHESIS = (
CLOSE_PARANTHESIS = )
DIVIDER = ,
NUMBER = all numbers
NAME = any that remain

These rules simplify understanding the code sample below:

VARIABLE_TYPE NAME ASSIGNMENT_OPERATOR NAME OPEN_PARENTHESIS NUMBER DIVIDER NUMBER CLOSE_PARANTHESIS

The analyzer passes these values to the next step of the compilation process to process.




Source Program -----> Lexical Analyzer ---------> Token stream
                           |
                           |
                           |
                     Error Message

> TODO: Let's use SVG instead of ASCII art.

The lexical analysis uses a scanner to match strings passed into it to token characters.

Scanners use finite-state machines (FSM) to hold all possible combinations of tokens so they may quickly process large amounts of data.

A program or function which can parse a sequence of characters into usable tokens.
Sequences are typically delimited in some way using characters (i.e.
[,],[|],[~])

#### Follow-up:
Examples
> TODO: Add some examples

<!--- 
2.1.2 Tokens and Lexemes
-->
### What is a lexeme?
A lexeme is a string of characters that follow a set of rules in a language, categorized by a [token][#what-is-a-token].

### What is a token?
A token is a single element of a programming language.
Tokens could be keywords ( a word reserved by a program because the word has a special meaning), operators (elements in a program usually used to assist in testing conditions (OR, AND, =, >, etc.)), or punctuation marks.

<!--- 
2.2.1.3.2 Tokens
-->
A token is a string of characters categorized based on the types used (e.g., IDENTIFIER, NUMBER, COMMA). 
They are frequently defined by regular expressions.
Tokens are generally formed by having a lexical analyzer read the input sent to it, identify the lexemes, then categorizes them into the tokens.


#### Example
<!--- 
2.2.1.3.1 int x = 3;
-->


<!---
2.2.1.3.2 Tokens
2.2.1.3.2.1 int (variable type)
2.2.1.3.2.2 x (variable)
2.2.1.3.2.3 = (operator)
2.2.1.3.2.4 3 (value)
-->
Consider this example for clarification: 
Input: int x = 3;

- int is a numeric variable type token.
- x is an identifier variable token.
- = is an assignment operator token.
- 3 is a value token.
- ; is the end of a statement token.




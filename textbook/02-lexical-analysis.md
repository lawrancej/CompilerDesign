
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
	- A middle section of the word can be repeated any number of times to produce a new word which also lies within the same language.
	- i.e.
abc, abbc, abbbc, etc.
- In a regular language $L$, there exists an integer $p$ depending only on said language that every string $w$ of "pumping length" $p$ can be written as $w = xyz$ satisfying the following conditions:
	1. $|y| \ge 1$
	2. $|xy| \le p$
	3. for all $i \ge 0$, $xy^iz \in L$
	- Where $y$ is the substring that can be pumped.

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

- $\emptyset$. The empty set.
Reject everything.
- $\epsilon$. The empty string.
Match the empty string: ""
- `c`. Character.
Match a single character.

#### Operations:

If `a` and `b` are regular expressions, then the following are regular expressions:

- `ab`. Catenation.
 Match `a` followed by `b`.
- `a|b`. Alternation.
Match `a` or `b`.
- `a*`. Kleene closure.
Matches `a` zero or more times.

### What is a finite automaton?
A finite automaton, or finite state machine, can only be in a finite number of states in which it transititons between.

An example is that when an automaton sees a symbol for input.
It then transititons to another state based on the next input symbol.


It has:
- A start state
- A set of states
- A set of accepting states
- A set of transitions from (state, character) to something

### What is an nondeterministic finite automaton?
It is a finite automaton in which we have a choice of where to go next.

The set of transitions is from (state, character) to set of states.

### What is a deterministic finite automaton?
It is a finite automaton in which we have only one possible next state.

The set of transitions is from (state, character) to state.

### What is the difference between deterministic and nondeterministic?
Deterministic finite automaton's (DFA's) are specific in regard to the input that they accept and the output yielded
by the automaton.
The next state that the machine goes to is literally determined by the input string it is given.
A nondeterministic finite automaton is not as particular, and depending on its state and input, could change into a several 
possible new states.

Simple put the difference between a DFA and an NFA is that a DFA has no epilsons between the transitional states.
The reasons that this makes a difference is that when we place an epsilon between our states it is not always possible to figure out the correct path to go without looking aheard in the current string we are parsing.
This means that we are using something that is nondeterminsitic.
Where as if we know the correct path to go at all times, it is determnistic.

Deterministic and nondeterministic are very similar and there is no huge difference between them.
The main difference is that nondeterministic essentially chooses on a whim which state to go to while deterministic does not do this at random.

### How to convert an NFA to a DFA?
Since both automaton's only accept regular languages as input, an NFA is able to be simplified and converted to a DFA.

The process is called a powerset (or subset) construction and it takes the possible states of the NFA and translates them
into a map of states accessible to a DFA.
This process is not without a cost, since deterministic finite automaton's are 
much less complex than their nondeterministic counterparts there will always be a loss of potential states in conversion.
All of the states of the NFA will still exist, but they will be unreachable from the origin once converted and thus obsoleted.
A converted NFA will have N^2 the number of states when converted where N is the number of states that the NFA originally had.

### What is the derivative of a regular expression?

### What is a scanner (lexical analyzer)?
> TODO: Merge these definitions.
Some of these definitions are misconceptions, which we should include to address why they're wrong.
A scanner is a program in a parser that converts characters into tokens.
This already has the information it needs about whatever characters that can be tokenized.
This then matches any string that was put in to possible tokens and processes said information.

Lexical analysis or scanning is the process where the stream of characters making up the
source program is read from left-to-right and grouped into tokens.
Tokens are sequences
of characters with a collective meaning.
There are usually only a small number of tokens
for a programming language: constants (integer, double, char, string, etc.), operators
(arithmetic, relational, logical), punctuation, and reserved words.

A lexical analyzer is a piece of software that takes in a string as input, from that string it generates tokens based off of pre-defined rules.
This is done to help for the actual compilation proccess later, as well as error checking.

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

Scanner, also know as Lexical analyzer or Lexer is a program which performs lexical analysis.
It converts a sequence of characters into string of characters with a collective meaning following some rules.
These rules contain identifier, assignment operator, number etc.
The lexical analyzer takes a source program as input, and produces a stream of tokens as output.

Source Program -----> Lexical Analyzer ---------> Token stream
                           |
                           |
                           |
                     Error Message

> TODO: Let's use SVG instead of ASCII art.

A Scanner is used within lexical analysis to match token character strings that
are passed through it.
Scanners use finite-state machines (FSM) to hold all possible combinations of tokens
so they may quickly process large amounts of data.

A program or function which can parse a sequence of characters into usable tokens.
Sequences are typically delimited in some way using characters (i.e.
[,],[|],[~])

#### Follow-up:
> TODO: Add some examples

### What is a token?
> TODO: What is a token?

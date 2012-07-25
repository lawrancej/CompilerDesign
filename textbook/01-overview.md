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

#Overview

##1.1 Introduction
###1.1.1 Definition of a Compiler
###1.1.2 History and Purpose
####1.1.2.1 Grace Hopper
####1.1.2.2 Purpose
#####1.1.2.2.1 Translate Source Language to Target Language
#####1.1.2.2.2 Object Code and Executables
#####1.1.2.2.3 Platform Independent Compilers
###1.1.3 Comparison between Compiler and Interpreter
###1.1.4 Hardware Compilation
##1.2 Compiler Design
###1.2.1 One-Pass vs Multi-Pass
####1.2.1.1 One Pass
#####1.2.1.1.1 Simple to Implement
#####1.2.1.1.2 Limited Optimization
####1.2.1.2 Multi-Pass
#####1.2.1.2.1 Enhanced Optimization
#####1.2.1.2.2 Easier to Prove Correctability
#####1.2.1.2.3 Source-to-Source Compilation Possible (Translators)
#####1.2.1.2.4 Source-Bytecode-Native Code
###1.2.2 Structure
#####1.2.2.1 Front End
#####1.2.2.1.1 Create Intermediate Representation
#####1.2.2.1.2 Manages Symbol Table
#####1.2.2.1.3 Steps
######1.2.2.1.3.1 Preprocessing
######1.2.2.1.3.2 Lexical Analysis
######1.2.2.1.3.3 Syntax Analysis
######1.2.2.1.3.4 Semantic Analysis
####1.2.2.2 Back End
#####1.2.2.2.1 Steps
######1.2.2.2.1.1 Analysis
######1.2.2.2.1.2 Optimization
######1.2.2.2.1.3 Code Generation

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
The term "bootstrapping" comes from the saying "to pull yourself up by your bootstraps", which means to improve yourself as a result of your own efforts.
In computing the term is often used to describe the act of building a system using itself, or a previous version of the system.
More specifically, when referring to compilers, bootstrapping means writing a compiler in its own target language, creating a self-hosting compiler that can compile its own source code.

The first few versions of a compiler for a new language are written on an existing reliable language until the new compiler become reliable enough to be self-hosting.
The first couple of C compilers were written in assembly, but now they are written in C.

Examples of self-hosting compilers:
- Basic
- C
- C++
- Java
- Python
- Scheme


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

$Parens \to [^\wedge ()]*$

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

### What is a containment hierarchy?
A containment hierarchy is a hierarchical ordering of nested sets that are uniquely different from each other.
There are two types of containment hierarchy, one where the parent includes its children (subsumptive), and the other where the parent is made up of its children (compositional).

- Subsumptive: all cars are vehicles, but not all vehicles are cars, so the vehicle class subsumes the car class.
- Compositional: cars contain engines and tires, so the car class is composed of the engine and tire objects.


### What is Chomsky's hierarchy?
The Chomsky hierarchy, as the name implies, is a [containment hierarchy](#what-is-a-containment-hierarchy) of classes of [formal grammars](#what-is-a-grammar).
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

Context-sensitive
------------------
Rules are of the form:
    ?A?
? ?B?
    S ? ?
where
    A, S ? N
    ?, ?, B ? (N ? ?)?
    B ? ?

Context-free
------------------
Rules are of the form:
   A ? ?
where
   A ? N
   ? ? (N ? ?)?

Regular
------------------
Rules are of the form:
  A ? ?
  A ? ?
  A ? ?B
where 
  A, B ? N and ? ? ?

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

The Navy's David Taylor Model Basin was one of the government agencies that sponsored the development of COBOL.
Grace Hopper's position in the Navy allowed her to work with the latest technology at the time, and it was the Navy that assigned her the task of overseeing the development of a set of programs and procedures for validating COBOL compilers as part of a standardization program for the entire Navy.
 

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

## Purpose
<!---
1.1.2.2 Purpose
-->
As we mention in the definition of the compiler is to translate the source language to a source language, so, the purpose of the compiler will be to make these high lever languages easy for the computer to understand because the computer only understand the 0 and 1. In addition, a compiler will let to communicate with hardware.

### Translate Source Language to Target Language
The purpose of a compiler is to translate a program into computer language.


### Object Code and Executables
Let's first define each of Source code, Object code and Executable and then later we can talk about how they work with the compiler.
Source Code: is the code that the programmers write it and run it on his/her machines.
Executable Code: is the code that runs on your machines, which is usually linked to the source code.
Last, Object Code: is act as the transitional form between the source code and the Executable code.

### Platform Independent Compilers
Platform Independent compilers compiles the source code irrespective of the platform(operating systems) on which it is being compiled. 
Java compiler is one example of Platform Independent Compilers. All operating system uses same java compiler. 
When java compiler compiles the java source code, it outputs java byte code which is not directly executable. 
The java byte code is interpreted to machine language through JVM(Java Virtual Machine) in respective platform.

### Hardware Compilation
Hardware compilation is the process of compiling a program lagnuage into a digital circuit. 
Hardware compilers produce implementation of hardware from some specification of hardware. 
Instead of producing machine code which most of the software compiler does, hardware compiler compiles a program into some hardware designs.

# Compiler Design

## One-Pass vs Multi-Pass
> TODO: add One-Pass vs Multi-Pass

### One Pass
> TODO: add One Pass
> TODO: add Simple to Implement
> TODO: add Limited Optimization
A one pass compiler only passes through the parts of each compilation unit once and immediately translates each part into its final machine code.
The implementation of a one pass compiler is much easier since there is no need to keep track of special cases and have one well defined understanding of all code.
While the one pass method is also much faster it has some inherent disadvantages.
One pass compilers are are unable to generate as efficient programs with their limimited scope and need forward declaration of identifiers.
Loops, subroutines, and modules can need more than one pass to more effectly optimize them.

### Multi-Pass
> TODO: add Multi-Pass
> TODO: add Enhanced Optimization
> TODO: add Easier to Prove Correctability
> TODO: add Source-to-Source Compilation Possible (Translators)
> TODO: add Source-Bytecode-Native Code
A multi-pass compiler traverses the program multiple times.
Each pass takes the result of the previous pass as input and creates an intermediate output.
This retraversal gives the multi-pass compiler a much bigger scope as it allows it to see the entire program being compiled as opposed to a one pass compiler that can only see a small portion of the program being compiled.
A multi-pass compiler is easier to prove correct.
Each pass is its own unit and self contained which can be checked each pass for correctness independantly of eachother.
Each intermediate step is able to perform simpleer, easier to prove correct, opperations on each pass.


<!---
By using intermediate steps and allowing for retraversal the compiler does not have to perform as much optimization in each pass and can instead do smaller optimizations each time.
These smaller optimization performed on each step makes it easier to prove the correctness as it is possible to check each intermediate step for correctness independantly of eachoter.

In a multi-pass compiler it is easier to prove that it is correct sicne each pass is its own unit and self contained and we can check each pass for correctness independantly of eachother.
Using smaller steps with each pass we can more easily reason about what is going on with les
smaller steps make less assumptions?-->


## Structure

### Front End
The front end of compiler analyzes the source code that is being compiled.
It also creates the intermediate representation(IR) of the source code and manages symbol table.

#### Create Intermediate Representation
Normally, compiler first translates the source code into some form of intermediate representation of source code.
Athough it adds another step, IR provides advantage of abstraction and cleaner seperation between front end and back end.
Compiler analyzes the source code to create intermediate representation of source code in front end.

#### Manages Symbol Table
Symbol table is compile-time data structure which holds information needed to locate and relocate a program's symbolic definitions and references. 
Compiler manages symbol table when it analyzes the source code.
This is done in several steps.

#### Steps

#### Preprocessing
Preprocessing is process of performing preliminary operation on source code before it gets actually compiled.
Only few compiler includes this step.
In this phase, the preprocessor looks through source code to find out specific instruction for compilation process.
C, C++, C# uses preprocessor.


#### Lexical Analysis
Lexical analysis or scanning is the process where the stream of characters making up the source program is read from left-to-right and grouped into tokens.
Tokens are sequences of characters with a collective meaning.
There are usually only a small number of tokens for a programming language: constants (integer, double, char, string, etc.), operators (arithmetic, relational, logical), punctuation, and reserved words.
Lexical analyzer is responsible for lexical analysis.

#### Syntax Analysis
In this phase, the token from lexical analysis is parsed to determine the grammatical structure of source code. 
Syntax analysis is closely related with semantic analysis.
Normally, a parse tree is built in this process.
It determines if the source code of the program is syntatically correct or not so that the program can be further processed for semantic analysis.
 
#### Semantic Analysis
In this phase, semantic information is added into parse tree that was built during syntax analysis.
Semantic analysis consist of tracking variable type, function type, declaration type and type checking.
It checks if all of the variables, functions and classes are properly defined or not.
Typically, symbol table is created during this phase.

### Back End
> TODO: add Back End

#### Steps
> TODO: add Analysis
> TODO: add Optimization
> TODO: add Code Generation

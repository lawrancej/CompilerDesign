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
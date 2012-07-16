
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

7.1 Overview
7.1.1 Manipulate Execution Parameters to Maximize Performance
7.1.1.1 Program Runtime
7.1.1.2 Memory Footprint
7.1.2 Complexity
7.1.2.1 Many Optimizations Are NP-Complete
7.1.2.2 Memory Major Limitation in Other
7.1.3 Effectiveness
7.1.3.1 Target Architecture
7.1.3.1.1 The Machine on which the Program Will Run
7.1.3.1.2 Factors
7.1.3.1.2.1 CPU Registers
7.1.3.1.2.2 Pipelining
7.1.3.1.2.3 Caches
7.1.3.1.2.4 Hardware Design
7.1.3.2 Host Architecture
7.1.3.2.1 The Machine Doing the Compilation
7.1.3.2.2 Factors
7.1.3.2.2.1 CPU Speed
7.1.3.2.2.2 Pipelining
7.1.3.2.2.3 Memory Capacity and Architecture
7.1.3.2.3 Program Usage
7.1.3.2.4 Release vs Debugging
7.1.3.2.4.1 Release Is Often Optimized for Performance
7.1.3.2.4.2 Debug Program Contain Debugging Symbols which Slow the Execution
7.2 Optimization Categories
7.2.1 Peephole
7.2.1.1 Performed after Machine Code Has Been Generated
7.2.1.2 Connects Adjacent Instructions to See If They Can Be Compressed
7.2.2 Local
7.2.3 Loop
7.2.3.1 Act upon Loops
7.2.3.2 Potentially High Impact
7.2.3.3 Reduce Dependence on Memory and Time-intensive Looping
7.2.4 Language Dependent
7.2.4.1 Optimize Functions Unique to a Specific Language
7.2.4.2 Some Optimizations May Be General across Multiple Languages
7.2.5 Machine Dependent
7.3 Optimization Techniques
7.3.1 Exploit Properties of the "Common Case"
7.3.2 Reduce Redundancy
7.3.3 Reduce Branching
7.3.4 Parallelize Operations When Available
7.3.5 Maximize Memory Efficiency
7.3.6 Decrease Special Memory Reference Distance

-->

Optimization
============

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

    for (int i = 0; i < 5; i++)
    {
        if (i == 0)
            Console.WriteLine("I'm the beginning");
        else if (i % 2 == 0)
            Console.Writeline("I'm even");
        else
            Console.Writeline("I'm odd");
    }

Unrolled Loop

    // i = 0
    Console.Writeline("I'm the beginning");
    // i = 1
    Console.Writeline("I'm odd");
    // i = 2
    Console.Writeline("I'm even");
    // i = 3
    Console.Writeline("I'm odd");
    // i = 4
    Console.Writeline("I'm even");

### What is method inlining?
Compiler optimization that replaces a function call with the body of the caller(i'm not very sure what this part means). This optimization may improve time and space usage when ran, but might make the program bigger.

### What is dead code?
Dead code is any code whose result is never used, and therefore a waste of resources.

Examples:
- Definitions of uncalled functions
- Computations that do not affect output
- `if (false) { /* Dead code */ }`

### Complexity
#### Many Optimizations Are NP-Complete 
In compiler design, many code optimization problems are NP-complete, or undecidable.  NP-complete problems are decision problems that take a long and inefficient amount of time to find a solution, yet verifying the solution can be done quickly.  NP stands for “nondeterministic polynomial time”, referring to running time of an algorithm that can exhibit different behaviors or different runs.  Undecidable problems are decision problems that a single algorithm is not sufficient to accurately lead to a correct answer.  
#### Memory Major Limitation in Other
Memory limitations exist for optimization, as optimization is a cpu-heavy and memory heavy process.  In addition, even the programmer’s time to wait for a compiler to complete also places restrictions on optimization.
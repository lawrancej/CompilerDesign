
\pagebreak

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

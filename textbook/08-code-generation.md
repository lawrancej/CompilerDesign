
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

6.1 Overview
6.1.1 Produces Machine-Executable Code
6.1.2 Input Parse Tree
6.1.3 Output Machine Code
6.1.4 Includes Some Optimization Techniques
6.2 Process
6.2.1 Instruction Selection
6.2.1.1 Transforms Middle-Level IR to Low-Level IR
6.2.1.1.1 Middle Level IR
6.2.1.1.1.1 Tree-Based
6.2.1.1.1.2 Intermediate Representation
6.2.1.1.2 Low Level IR
6.2.1.1.2.1 Reduced From Tree
6.2.1.1.2.2 Close to Target Language (Machine Code)
6.2.1.2 Templates and Tiles
6.2.1.2.1 Tiles
6.2.1.2.1.1 Template That Matches a Portion of IR Tree
6.2.1.2.1.2 Implemented with a Single Target Instruction
6.2.1.2.2 Templates
6.2.1.2.2.1 Convert Code from IR to Target Language
6.2.1.2.2.2 Open to Optimization
6.2.1.2.3 Implementation
6.2.1.2.3.1 Backward Dynamic Programming
6.2.1.2.3.2 Greedy Algorithms
6.2.2 Instruction Scheduling
6.2.2.1 Optimization Technique
6.2.2.1.1 Reorders Instructions for Optimal Processing
6.2.2.1.2 Avoid Data Stalls and Code Structure Hazards
6.2.2.2 Types of Scheduling Algorithms
6.2.3 Register Allocation
6.2.3.1 Multiplexes Program Variables to CPU Registers
6.2.3.1.1 Maximize Program Execution Time
6.2.3.1.2 Occurrences
6.2.3.1.2.1 Local
6.2.3.1.2.2 Global
6.2.3.1.2.3 Interprocedural
6.2.3.2 NP-Complete Optimization Problem
6.2.4 Non-Standard Compilers
6.2.4.1 Just-In-Time Compilation
6.2.4.2 Profiling

-->

Code generation
===============

### What is code generation?
Code generation is the final [compiler phase](#what-are-the-phases-of-a-compiler).
It produces code in the target language, which is typically a machine language (e.g., x86, arm), but may be assembly or even a high-level language.

The code generator is distinct from the [parser](#what-is-a-parser) and the [translator](#what-is-a-translator).


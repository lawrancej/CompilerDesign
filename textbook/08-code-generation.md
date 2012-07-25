Code generation is the final compiler phase. It produces code in the target language, which is typically a machine language (e.g., x86, arm), but may be assembly or even a high-level language.

The code generator is distinct from the parser and the translator.
=======
=======

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

8.1 Overview
8.1.1 Produces Machine-Executable Code
8.1.2 Input Parse Tree
8.1.3 Output Machine Code
8.1.4 Includes Some Optimization Techniques
8.2 Process
8.2.1 Instruction Selection
8.2.1.1 Transforms Middle-Level IR to Low-Level IR
8.2.1.1.1 Middle Level IR
8.2.1.1.1.1 Tree-Based
8.2.1.1.1.2 Intermediate Representation
8.2.1.1.2 Low Level IR
8.2.1.1.2.1 Reduced From Tree
8.2.1.1.2.2 Close to Target Language (Machine Code)
8.2.1.2 Templates and Tiles
8.2.1.2.1 Tiles
8.2.1.2.1.1 Template That Matches a Portion of IR Tree
8.2.1.2.1.2 Implemented with a Single Target Instruction
8.2.1.2.2 Templates
8.2.1.2.2.1 Convert Code from IR to Target Language
8.2.1.2.2.2 Open to Optimization
8.2.1.2.3 Implementation
8.2.1.2.3.1 Backward Dynamic Programming
8.2.1.2.3.2 Greedy Algorithms
8.2.2 Instruction Scheduling
8.2.2.1 Optimization Technique
8.2.2.1.1 Reorders Instructions for Optimal Processing
8.2.2.1.2 Avoid Data Stalls and Code Structure Hazards
8.2.2.2 Types of Scheduling Algorithms
8.2.3 Register Allocation
8.2.3.1 Multiplexes Program Variables to CPU Registers
8.2.3.1.1 Maximize Program Execution Time
8.2.3.1.2 Occurrences
8.2.3.1.2.1 Local
8.2.3.1.2.2 Global
8.2.3.1.2.3 Interprocedural
8.2.3.2 NP-Complete Optimization Problem
8.2.4 Non-Standard Compilers
8.2.4.1 Just-In-Time Compilation
8.2.4.2 Profiling

-->

>>>>>>> 6e5fd0d4c08f37c452ae8d1647391a2575390bc2
Code generation
===============

##8.1 Overview
####8.1.1 Produces Machine-Executable Code
####8.1.2 Input Parse Tree
####8.1.3 Output Machine Code
####8.1.4 Includes Some Optimization Techniques
###8.2 Process
####8.2.1 Instruction Selection
#####8.2.1.1 Transforms Middle-Level IR to Low-Level IR
######8.2.1.1.1 Middle Level IR
#######8.2.1.1.1.1 Tree-Based
#######8.2.1.1.1.2 Intermediate Representation
######8.2.1.1.2 Low Level IR
#######8.2.1.1.2.1 Reduced From Tree
#######8.2.1.1.2.2 Close to Target Language (Machine Code)
#####8.2.1.2 Templates and Tiles
######8.2.1.2.1 Tiles
#######8.2.1.2.1.1 Template That Matches a Portion of IR Tree
#######8.2.1.2.1.2 Implemented with a Single Target Instruction
######8.2.1.2.2 Templates
#######8.2.1.2.2.1 Convert Code from IR to Target Language
#######8.2.1.2.2.2 Open to Optimization
######8.2.1.2.3 Implementation
#######8.2.1.2.3.1 Backward Dynamic Programming
8.2.1.2.3.2 Greedy Algorithms
8.2.2 Instruction Scheduling
8.2.2.1 Optimization Technique
8.2.2.1.1 Reorders Instructions for Optimal Processing
8.2.2.1.2 Avoid Data Stalls and Code Structure Hazards
8.2.2.2 Types of Scheduling Algorithms
8.2.3 Register Allocation
8.2.3.1 Multiplexes Program Variables to CPU Registers
8.2.3.1.1 Maximize Program Execution Time
8.2.3.1.2 Occurrences
8.2.3.1.2.1 Local
8.2.3.1.2.2 Global
8.2.3.1.2.3 Interprocedural
8.2.3.2 NP-Complete Optimization Problem
8.2.4 Non-Standard Compilers
8.2.4.1 Just-In-Time Compilation
8.2.4.2 Profiling
### What is code generation?
Code generation is the final [compiler phase](#what-are-the-phases-of-a-compiler).
It produces code in the target language, which is typically a machine language (e.g., x86, arm), but may be assembly or even a high-level language.

The code generator is distinct from the [parser](#what-is-a-parser) and the [translator](#what-is-a-translator).
>>>>>>> 834e59cdc23433988ce06729e5c192b9e30bc2c5
=======

Code generators try to optimize the generated code by doing several different things including using faster instructions, using fewer instructions,
exploit available registers, and avoid redundant computations.

>>>>>>> 6e5fd0d4c08f37c452ae8d1647391a2575390bc2

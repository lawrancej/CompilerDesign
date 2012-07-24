
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

4.1 Overview
4.1.1 Relation to Parse Tree
4.1.1.1 Input from Parser
4.1.1.2 Adds Semantic Information to Parse Tree
4.1.2 Output to Code Generation Phase
4.2 Process
4.2.1 Type Checking
4.2.1.1 Verify Type Constraints
4.2.1.2 Static Checking
4.2.1.2.1 Done at Compile Time
4.2.1.2.2 Dynamic Checking Done at Runtime
4.2.1.2.3 Example Languages
4.2.1.2.3.1 Ada
4.2.1.2.3.2 C++
4.2.1.2.3.3 Java
4.2.1.3 Type Safety
4.2.1.4 Types Specified by the Language Specification
4.2.2 Object Binding
4.2.2.1 Associates Variable with its Definition
4.2.2.2 Resolve Object References
4.2.3 Assignment Operations
4.2.3.1 Data Flow Analysis
4.2.3.2 Definite Assignment Analysis
4.2.3.2.1 Ensures Variable are Assigned Before Used
4.2.3.2.2 Allows Potential Optimization
4.2.4 Produce Errors/Warnings
4.3 Time/Space Complexity

-->


Semantic Analysis
=================

### What is semantics?
<!---
4.1 Overview
-->

Semantics is the field concerned with the rigorous mathematical study of the meaning of programming languages.
It does so by evaluating the meaning of syntactically legal strings defined by a specific programming language, showing the computation involved.
In such a case that the evaluation would include syntactically illegal strings, it would not be compilable.
Semantics describes the processes a computer follows when executing a program in that specific language.

### What is static semantics?

<!--
4.2.1.2 Static Checking
4.2.1.2.1 Done at Compile Time
-->

Static semantics are enforced at compile time.
Examples of this include undeclared variables and type mismatches.
These semantical errors can be detected by the parser, or in separate semantic analysis passes.

<!-- I will add more to this section - Mike D -->
The semantic analyzer will start by traversing the [abstract syntax tree](#what-is-an-abstract-syntax-tree) created by the parser.



### What is runtime semantics?

<!--
4.2.1.2.2 Dynamic Checking Done at Runtime
-->

Runtime semantics are enforced during the execution of the program.
Examples of this include division by zero and out-of-bound array indexing.
These semantics will display to the user informative messages in regards to the errors.
Conversely, the addition of these semantics will often result in slower compile and execution times.

Dynamic checking is also used by higher level languages such as Java and C++ to allow for polymorphism.
Since objects can be of multiple types, it is to difficult to do type checking during compilation.
Two seperate paths in the code can mean the difference between a shape being a square or circle.
Instead during run time when we create the new Circle object and try to place it into a variable defined as a shape.
A seperate proccess running in our code determines wheter or not the circle can be a shape.

### What is type-checking?
<!---
4.1.1 Relation to Parse Tree
-->

The Parse Tree is the means by which multi stage compilers check the semantics of a program in a nonlinear fashion.
An additional symbol table is added to the Parse Tree during the semantic analysis.

### What is Space Time Complexity
<!--
4.3 Time/Space Complexity
-->
When dealing with code, there are a few considerations to keep in mind.
Some of the considerations are how much memory the application will take up and how much time the application will take to run.
This means that, in some instances, we trade space for time or time for space.
In terms of imperative languages, we can judge how fast a program is by looking at how many operations the program performs.
With regards to memory, we can look at how much is allocated at any given point.
Because we can examine the dynamics of the complexity, we can adjust these dynamics accordingly by changing our algorithims or using different ones all together.

For a more in depth anaylsis on how to analyze the space time complexity of a program look at:
[A Function Semantics for Space and Time by Catherine Hope](http://www.cs.nott.ac.uk/Research/fop/hope-thesis.pdf)
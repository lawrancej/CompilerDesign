
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

5.1 Types
5.1.1 Types of Types
5.1.1.1 Primitive
5.1.1.2 Reference
5.1.1.3 Null
5.1.1.4 Object
5.1.1.5 Function
5.1.2 Type Checking
5.1.2.1 Static Typing
5.1.2.2 Dynamic Typing
5.1.2.3 Strong Typing
5.1.2.4 Weak Typing
5.3 Runtime Organization
5.3.1 Storage
5.3.1.1 Allocation
5.3.1.1.1 Static
5.3.1.1.2 Dynamic
5.3.1.2 Local references
5.3.1.3 Global References
5.3.2 Runtime
5.3.2.1 Debugging vs Release
5.3.2.2 Runtime Exceptions
-->

###### Types
<!--
5.1 Types
-->

###### Types of Types
<!--
5.1.1 Types of Types
-->

###### Primitive
<!--
5.1.1.1 Primitive
-->

###### Reference
<!--
5.1.1.2 Reference
-->
A reference is a value that tells a program where specific data exists. References are also known as addresses or pointers because they "point to" the data they are referencing. References may also be offsets to a base reference, in which case the first reference points to data in relationship to the base pointer.

###### Null
<!--
5.1.1.3 Null
-->
Null is the computational equivalent to nothing. It can be used in many ways and implemented differently in different programming languages. Most commonly, Null will equal zero or a pointer to zero (memory location 0x0000).

###### Object
<!--
5.1.1.4 Object
-->

###### Function
<!--
5.1.1.5 Function
-->

###### Type Checking
<!--
5.1.2 Type Checking
-->

###### Static Typing
<!--
5.1.2.1 Static Typing
-->

###### Dynamic Typing
<!--
5.1.2.2 Dynamic Typing
-->

###### Strong Typing
<!--
5.1.2.3 Strong Typing
-->

###### Weak Typing
<!--
5.1.2.4 Weak Typing
-->

Intermediate representations
============================

### What is an intermediate representation?
An intermediate representation is a target language internal to the compiler (like machine code).
A common intermediate representation simplifies the construction of compilers supporting multiple source and target languages.

### What is a translator?

A translator is a [compiler phase](#what-are-the-phases-of-a-compiler) which converts an [abstract syntax tree](#what-is-an-abstract-syntax-tree) into an [intermediate representation](#what-is-an-intermediate-representation).
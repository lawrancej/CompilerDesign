
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

###### Types of Types

###### Primitive
A primitive is defined as the base units that data can be stored in.
If we look at the C language we see variable types of char, int and double.
Each one of those is a primitive type.
Though C also has structures that can combine primitive types into one variable type.
While the data inside the structure can be primitive, the structure itself is not.

struct Color
{
	int red;
	int green;
	int blue
};

Color in this example is not a primitve type, because it is not a base unit of the language.
Red, green and blue are primitves because they are integers and intergers are a base unit in C.

###### Reference
<!--
5.1.1.2 Reference
-->
A reference is a value that tells a program where specific data exists.
References are commonly refered to as pointers because they "point to" the data they reference.
This means that the pointer holds the address of where the data is stored in memory rather than the actual data.
When using references they can also point to the first element in an array.
An array in this case be traversed by incrementing the pointer by the size of the type being held by the array.

###### Null
<!--
5.1.1.3 Null
-->
Null is the computational equivalent to nothing.
It can be used in many ways and implemented differently in different programming languages.
Most commonly, Null will equal zero or a pointer to zero (memory location 0x0000).

###### Object

###### Function

###### Type Checking

Type checking determines a program's type correctness, either during compile time, a little later as the program is evaluated, or in some cases (Java) both. Type checking ensures that the type of an expression has not changed as it is passed through different instances and evaluations. 

###### Static Typing

Static type checking determines the type-correctness of a program at compile time. Static typing dictates that if a variable has a certain type, and that variable is passed or assigned to a new variable, then that new variable must also be of the same type. The programming language C, and other languages that explicityly demand types use static typing to quickly establish accuracy in type checking.

###### Dynamic Typing

Dynamic type checking allows a programming language to use typing more loosely than static type checking, as variable types need to be established until runtime. This allows for a variable to take on different types throughout the execution of code, although a final type is eventually assigned.

###### Strong Typing

A strong typed programming language has stringent limitations on the way that variables in a program may interact with variables of different types. An easy example of this would be that a string could not mathematically interact with another variable of numerical type. A lot of major high level languages require this kind of typing, but surprisingly there are some exceptions such as PHP and JavaScript which are of weak typing.

###### Weak Typing

A weakly typed language will allow multiple operations to occur without concern over the type definition of the operands in use. This eases restrictions in what the type of a variable must be, since it might not need to be definied initially. The drawback to this form of type checking is that errors are not always identifiable by the compiler and could lead to difficuly to trace bugs.

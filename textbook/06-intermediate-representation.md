
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
An object is a means to which a programmer can group variables and methods that correlate to one another.
This is done in order to organize relevant information.

Java

public class Car
{
	String name;
	int number_of_seats;
	
	public Car()
	{
		name = "Default Car";
		number_of_seats = 4;
	}
	
	public int get_number_of_seats()
	{
		return number_of_seats;
	}
}

In this case we see an object denoted in the Java language.
The object contains variables and functions related around the idea of a Car.
We have the name of the car and the number of seats in the car as variables.
We then have a Constructor and a accessor method to get the number of seats in the car.

<!--
Is there anything else of relevance that should be added to this topic?
Such as static vs non-static?
-->

###### Function

Functions are small pieces of code that can be called from other points in the code.
Each function consists of a return type, a name, some parameters and other keywords dependent on the language.

In the C language a typical function may look like

int fib(int number)
{
	if(number == 1)
		return 1;
	if(number == 0)
		return 0;
	return fib(n-1)+fib(n-2);
}

In this example we see a piece of code that is designed to solve for a specific Fibonacci number using recursion.
This function has a return type int and the name fib.
It takes in an integer value called number.
This function also shows how functions can be called from other pieces of code when we look at the return line.

return fib(n-1)+fib(n-2);

In this case we see that the function fib is being called twice with a new parameter.

###### Type Checking

Type checking is the means of checking variable types and how they are used to make sure that they fall within the given rules of the language.

###### Static Typing

During the compilation time of an application the compiler may check to make sure all variables that are compared and used are of the correct type.
If the compiler does this then that means the language uses static typing.
This allows type errors to be caught early during the debug phase of development.
It also allows code to run quicker since we know all possible evaluations of the type before runtime.

###### Dynamic Typing

A langugae that uses Dynamic Typing is one that checks to make sure no invalid type checks are made during the execution of the application.
This leads to a more roboust program and is a neccessity for languages that use objects.
The one downside is that it creates a large overhead on the application by requiring type checks every time the application runs.

###### Strong Typing

A language is said to be strong typed when it has strict rules on how different types interact.
This means that instead of allowing say a string and int to be added it will throw a type error.
Strong typing can make a language more secure, but it makes it less roboust.

###### Weak Typing

A langugae is considered to use weak typing when it has relaxed rules on how types interact.
Instead of throwing an error when adding an int to a string it will instead return some combination of the two.
This helps to make a language more roboust, but allows the programmer to fall into more traps.

###### Runtime Organization
When a program runs it needs to store information about the program.
This could be variables, what functions are being called, where it is in the code or a multitude of other things.
How this information gets stored in memory is important and can be different for each piece of information

###### Allocation

###### Static
Static memory is memory that does not change size once initialized.
This is generally a primitive type.
No matter what happens we know in C that a char or an int will alwyas be the same size.
This memory is usually held on the stack.

###### Dynamic
Dynamic memory is memory that has the capability to change size.
This is generally things such as StringBuilders in Java or dynamic arrays.
Memory like this is held on the heap so that it can access more memory if need be.

###### Local references
A local Reference is a variable that only exists within the function or scope it was created in.
Take a look at the following C function.

int sum(int num1, int num2)
{
	int answer = num1 + num2;
	return answer;
}

The variable answer in this case is only a part of the function sum.
When sum is called the variable will be created.
When sum returns the value all variables in the scope will be destroyed.
This also means that the variable can only be accessed locally by other code within the scope.
Lets take a look at another example.

int sum(int low, int high)
{
	int i;
	int answer = 0;
	for(i = low;i <= high;i++)
	{
		answe += i;
	}
	return answer;
}

Since the for loop is held within the scope of the variable answer the code within the scope of the for loop can access the data of the for loops parent scope.

###### Global References
A global refernce is data that can be accessed by any piece of code in the program.
Take a look at the following code.

int number;

void setNumberToSix(void);

void main(void)
{
	number = 5;
	printf("Number: %d\r\n",number);
	setNumberToSix();
	printf("Number: %d\r\n",number);
	return;
}

void setNumberToSix(void)
{
	number = 6;
}

As the code shows we can access number in both main and setNumberToSix.
This is because the variable has been set in the global scope.
Every function can access this variable.
This does mean we have to be careful though since we can not always garuntee the data in the variable.

###### Runtime
Memory that is stored during run time is stored in the heap.
The heap is a giant pool of memory that a program can use any time it wishes.
An important thing to note is that the program can use any section of the memory at any time.

###### Debugging vs Release
###### Runtime Exceptions
When the program is run and memory is being allocated on the fly it is possible that we can run out of memory.
This would cause a runtime exception.

<!---
Will insert a diagram showing heap usage here.
-->
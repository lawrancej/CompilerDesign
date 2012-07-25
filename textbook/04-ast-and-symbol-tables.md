Abstract Syntax Trees
---------------------
### What is an abstract syntax tree?
An abstract Syntax Tree is the data structure compilers/interpreters use in order to perform the actual code generation. It represents the hirearchy of the programmers code. An important note is that not all syntax of the code is displayed in the tree in the case of grouping paranthesis.

Example
int doSomething(int a)
{
  if(a > 10)
		a = a % 10;
	return a;
}

					[program]
					/       \
				  [if] 		[return]
				  /			   \
				[-]			   [a]
				/ \
			  [a] [10]

An [abstract syntax tree (AST)](http://en.wikipedia.org/wiki/Abstract_syntax_tree) is simply a tree representation of the structure of source code. Each node of the tree represents a part of the code.

The "abstract" part of the AST comes from the fact that the tree does not represent the syntax down to the character level. Tokens like parenthesis and brackets are not nodes on the tree, and are instead represented implicitly by the structure of the tree itself.

If the code cannot be represented accurately as a tree, the parsed language is not [context-free](#what-is-a-context-free-language).

An abstract syntax tree (AST) is a tree representation of the abstract syntactic structure of the code written in any language. 
Also, it is the output of a parser. Every node is a structure of a particular type of node. 
Each node is created by creating a function which will return a pointer to a structure that will signify that node. 
Example: 
=========
struct Signature
	{
	struct AttributeList *attributes;
	struct Identifier *name;
	struct DeclarationList *arguments;
	struct TerminationSet *responses;
	};
extern struct Signature *node_signature (
	struct AttributeList *attributes,
	struct Identifier *name,
	struct DeclarationList *arguments,
	struct TerminationSet *responses);
	
	The example above is from the following website: 
	http://www.ansa.co.uk/ANSATech/95/Primary/155101.pdf

### What is the difference between an abstract syntax tree and a parse tree?

Parse Tree: are the rules to match the input text where as a syntax tree record the structure of the input. 

Syntax Tree: It will be less sensitivity from the "Parse tree" as it focuses more on the structure of the language not the grammar.


### What is the visitor design pattern?
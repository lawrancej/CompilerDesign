CompilerKit library
===================
CompilerKit streamlines developing software deriving tree structures from sequences, including compilers and interpreters.

## Why does this library exist?
This library solves these problems in existing compiler construction tools:

- Require learning a new syntax (e.g., lex, yacc, Bison)
- Add complexity to the build process (e.g., lex, yacc, Bison)
- Do not handle all possible context free grammars (e.g., lex, yacc)
- Work with only one language (e.g., lex, yacc)
- Produce blocking code (e.g., lex)
- Produce non thread-safe code (e.g., lex)
- Do not work well with Unicode

## Where can I contribute to this?
Here:

<https://github.com/lawrancej/CompilerKit>

## What is a [parser combinator](http://en.wikipedia.org/wiki/Parser_combinator)?
A parser combinator is a higher-order function that creates parsers from parsers.

Similar libraries:

- [Boost Spirit (C++)](http://boost-spirit.com/home/)
- [Parsec (Haskell)](http://www.haskell.org/haskellwiki/Parsec)

Proposed example usage:

    Nonterminal * value = nonterminal ("value");
    Nonterminal * product = nonterminal ("product");
    Nonterminal * sum = nonterminal ("sum");
    Nonterminal * expr = nonterminal ("expr");
    Parser * formula = derivative_parser (expr);
    
    /*
     Define the grammar below:
     value -> [0-9]+ | (expr)
     product -> value ((*|/) value)*
     sum -> product ((+|-) product)*
     expr -> sum
     */
    value->becomes (many1(digit()));
    value->becomes (parens(expr));
    product->becomes (value, many (or(symbol('*'),symbol('/')), value));
    sum->becomes (product, many (or(symbol('+'), symbol('-')), product));
    expr->becomes (sum);
    
    /* Return whether the formula parser matched the expression "(1+2+3+4)/2". Should return true */
    formula->match("(1+2+3+4)/2");
    
    /* Free the parser. */
    parser_free (formula);

## How will this work?
This library will use [GObject](http://developer.gnome.org/gobject/stable/) internally.

We will employ test-first pair programming in the development of parsed. (By the way, if you have a better name for this, I’m all ears.)

Testing and documentation first ensures that we consider the usage of this library before we develop it. It also helps track development progress by test completion and coverage.

Pair programming ensures that we learn from each other.

The library will consist of the following components:

- [Regular expression engine](#what-is-the-regular-expression-engine)
- [Scanner](#what-is-the-scanner-component)
- [Parser](#what-is-the-parser-component)
- [Language bindings](#what-are-the-language-bindings)

### What is the regular expression engine?
The regular expression engine will be swappable:

- NFA backend
- DFA backend
- Derivative backend
- PCRE backend

### What is the scanner component?
The scanner requires a regular expression engine to work.

### What is the parser component?
The parser construction will be separate from the swappable parsing backends:

- Recursive descent parser.
- [Derivative based parser](http://matt.might.net/articles/parsing-with-derivatives/).
- GLR parser, if time permits.

### What are the language bindings?
Language bindings will make use of GObject introspection. This library will target support for:

- Python
- C++
- Java

## What do I need to do?
1. [Install Software](#what-software-do-i-need).
2. [Contribute](#what-will-i-contribute).
3. [Solicit and share feedback](#how-do-i-solicit-and-share-feedback).
4. Go to 2.

## What software do I need?
- A compiler (Visual Studio, Xcode, GCC, [MinGW](http://sourceforge.net/projects/mingw/files/latest/download?source=files), or Clang)
- Version control (Git)
- Build tool ([CMake](http://www.cmake.org/cmake/resources/software.html))
- Testing tool (Clar)
- Documentation tool (Doxygen)

## What will I contribute?
Test cases, documentation, and code.

## How do I solicit and share feedback?
Via github.
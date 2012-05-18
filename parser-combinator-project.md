Parser combinator library
=========================
## Where can I contribute to this?
Here:

<https://github.com/lawrancej/parsed>

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

The grammar will be separate from the parsing backend, of which there will be multiple choices.

There will be the following backends:

- Recursive descent parser.
- [Derivative based parser](http://matt.might.net/articles/parsing-with-derivatives/).
- GLR parser, if time permits.

## What do I need to do?
1. [Install Software](#what-software-do-i-need).
2. [Contribute](#what-will-i-contribute).
3. [Solicit and share feedback](#how-do-i-solicit-and-share-feedback).
4. Go to 2.

## What software do I need?
- A compiler (Visual Studio, Xcode, GCC, MinGW, or Clang)
- Version control (Git)
- Build tool (CMake)
- Testing tool (Clar)
- Documentation tool (Doxygen)

## What will I contribute?
Test cases, documentation, code.

## How do I solicit and share feedback?
Via github.
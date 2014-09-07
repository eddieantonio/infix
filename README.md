% infix: An Introduction
% Eddie Antonio Santos
% September 7, 2014

# <span class="logo">In<span class="fix">fix</span></span>

Smalltalk but 20% cooler.

## Introduction

Taking inspiration from:

 * Smalltalk -- Message passing semantics
 * Haskell -- Type system and pattern matching
 * Erlang -- Actor-based concurrency
 * Wyvern -- [Type specific languages][tsl]
 * Scala -- Anti-inspiration: bloated semantics
 * Python -- [`docstrings`][docstring] and [`doctest`][doctest]

Experiments in language design, trying to trim the fat of a bunch of **cool
things** down to a small, but tremendously useful set of semantics:

 * pattern matching
 * message passing
 * type inference
 * actor-model concurrency
 * type specific languages

Note: I am *completely* aware of the hypocrisy! This is a playground for a
bunch of nifty ideas; only the niftiest will survive.

## Observation:

The amount of semantics in a language ($Sem(L)$) is minimally bound by the
amount of syntax in a language ($Syn(l)$):

$$Sem(l) = \Omega(Syn(l))$$

# Classes and objects

`Display` object

:   `print String -> void`

    Prints the string to the standard display.

`Integer` class

:   `to (end: Integer) -> Range`

    Creates a new `Range` from the first integer to the second incrementing by 1.

:   `mod (n: Integer) -> Integer`

    Modulo division. The image of the function is restricted in $[0, n)$.

:   `= (n: Integer) -> Boolean`

    Value equality. True iff the integer represents the same value as `n`.

`Function` class

:   `documentation -> Markdown`

    Returns documentation assoicated with the function in Markdown format.

`Object` class

:   `to (t: Type) -> Type`

    Attempts to coerce (oh no!) the object to type `t`.

`Boolean` class

:   `ifTrue (proc: -> Void) -> Computation`

    Executes `proc` only when the Boolean is the `True` object
    (inheritance-based).

:   `ifFalse (proc: -> Void) -> Computation`

    Executes `proc` only when the Boolean is the `False` object
    (inheritance-based).


`Range` class

:   `each (proc: Integer -> Void) -> Void`

    Executes `proc` on each integer sequentially.

:   `map (fn: Integer -> A) -> Iterable[A]`

    Returns an iterable made by running `fn` on every integer. Makes no
    gaurentees of execution order.


# Info dump!

 - Type system cleverly allows side-effects (basically, marks functions
   with effects and forbids optimizations with dem guys).
 - Pattern matching is a pretty cool guy
 - Allow for clever compilation techniques rather than base the language on
   easy/well-known transliteration to target architecture.
 - Explicitly a "character stream" or "string based" language. Mark this as a
   paradigm, because we want to encourage languages that do away with the
   text editor.
 - Extracting the tests from an explicit (strict) Markdown literal will be easy-peasy.
   We essentially have an AST -- this means we can extract all body nodes
   that look like infix code.


# Credits

A silly distraction by [eddieantonio](https://github.com/eddieantonio). This
document and all of its ideas are Copyright © 2014 Eddie Antonio Santos.



[tsl]: http://www.cs.cmu.edu/~aldrich/papers/ecoop14-tsls.pdf
[docstring]: http://en.wikipedia.org/wiki/Docstring 
[doctest]: https://docs.python.org/3.4/library/doctest.html


<style>

h1.title, h2.author, h3.date { display: none; }

.logo { text-transform: lowercase; }
.fix { font-style: italic; }

body {
    max-width: 32em;
    margin: auto;
    font-family: sans-serif;
}

body > h1:first-of-type {
    text-align: center;
    font-family: serif;
}

</style>

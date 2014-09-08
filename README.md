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
amount of syntax in a language ($Syn(L)$):

$$Sem(L) = \Omega(Syn(L))$$

I'm only half kidding about this.

# Examples ####################################################################

## Hello, World

    Display print "Hello, World!"

## Fizzbuzz

    (1 to 100) each
        num when (num mod 15) = 0
            Display print "fizzbuzz"
        num when (num mod 3) = 0
            Display print "fizz"
        num when (num mod 5) = 0
            Display print "buzz"
        num
            Display print num toString

## Type Specific Languages

    # Comments are given by prefixing a line with '#'
    url : URL = <https://github.com/eddieantonio/>

    url path
    #=> </eddieantonio> : URLPath
    (url path) toString
    #=> "/eddieantonio" : String

    url scheme
    #=> <http:> : URLScheme
    (url scheme) toString
    #=> "https://"

    url domain
    #=> <github.com> : Domain
    (url domain) toString
    #=> "gihub.com"

    url match
        <_://%name%/eddieantonio>
            Display print \
                "My user name is registered on name%!"
        # Catch-all pattern. Patterns must be exhaustive.
        _
            Display print "Oh, guess I'm not registered "
                          "on this URL afterall."
    #=> My user name is registered on github.com!

    url match
        <https://%name/_>
            Display print "Golly! %name% is a secure site!"
        <http://%name%/_>
            Display print "Be carefull when dealing "
                          "with %name%!"
    #=> Golly! github.com is a secure site!



# Classes and objects ##########################################################

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

    ~~Attempts to coerce (oh no!) the object to type `t`.~~ Actually... I don't
    like this at all. Not one bit at all!

:   `repr -> String`

    Prints the string representation of the object. This should just be a
    valid object literal that can be used to get the value again, where
    possible.

:   `match -> Object`

    Do a pattern match on the object.

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
 - Strict Markdown: Precisely defined Markdown dialect. Can potentially be
   parsed using a [(layout sensitive) context-free grammar][Adams].


# Credits

A silly distraction for [eddieantonio](https://github.com/eddieantonio). This
document and all of its ideas are Copyright © 2014 Eddie Antonio Santos.



[tsl]: http://www.cs.cmu.edu/~aldrich/papers/ecoop14-tsls.pdf
[docstring]: http://en.wikipedia.org/wiki/Docstring
[doctest]: https://docs.python.org/3.4/library/doctest.html
[Adams]: http://michaeldadams.org/papers/layout_parsing/


<style>

body {
    max-width: 32em;
    margin: auto;
    font-family: sans-serif;
}

h1, h2, h3, h4, h5, h6 { font-family: Futura, sans-serif; }

/* Main body stuff. */
body > h1:first-of-type {
    text-align: center;
}
.logo {
   font-family: "Computer Modern", Baskerville, serif;
   font-weight: normal;

   text-transform: lowercase;
   text-rendering: optimizeLegibility;
}
.fix { font-style: italic; }


/* Code listings. */
pre {
    padding: 5px 10px;
    border-radius: 0 0 5px 5px;
    background-color: rgba(0,0,0,0.02);
    box-shadow: 0 2px 2px rgba(0,0,0,0.1);
}
code {
    font-family: "Droid Sans Mono", "Consolas", "Anonymous Pro", monospace;
}

/* Pandoc generated things. */
h1.title, h2.author, h3.date { display: none; }
.math { font-family: "Computer Modern", Times, serif; }

</style>

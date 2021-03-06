# Reverse String

Reverse a string

For example:
input: "cool"
output: "looc"


## Hint

While there is a #reversed method for Strings, can you figure out how to do this yourself using lower level character iteration or streams? To help you browse code, Pharo has a neat code finder tool. Press Shift-Enter to activate it.NOTE: We have followed the Exercism convention of calling the solution ReverseString, however a more Smalltalk name would be StringReverser.## Smalltalk and StringsConcerning strings, there are some obvious little details like double quotes for comments, single quotes for strings, and special syntax for characters (e.g., $x for character “x”) that might confuse you on first reading as the conventions are different from those used by other languages. There is also the notion of a symbol which is a string that is unique memory-wide; i.e. when it is constructed (typically at compile-time), a memory search is made to determine if another one like it exists; and only the original is used. The rationale is not just memory saving but significant speed-up when comparing symbols.```smalltalk"this is a comment"'this is a string'#'this is a symbol'#thisIsASymbolToo```There are also very few commas in Smalltalk programs because they play no syntactic role.That’s why array literals, for example, are comma-free; e.g.`#(1 2 3 4 5)`However, comma is an operator in its own right and you will notice it when concatenating two strings; e.g.`'string1', 'string2'`Finally, it's worth knowing that strings are collections of characters. This can catch you off guard when iterating over strings as you can end up giving characters to a method that expects strings.


## Downloading

To download this exercise in Pharo, type: `reverse-string` into the `Exercism | Fetch new exercise` top menu prompt (or right click on any `Exercise@<Name>` package in the Pharo System Browser).

When you are finished writing and testing your solution, and want to submit it, you should right click on the `Exercise@ReverseString` package and choose `Exercism | Submit exercise` in the context menu. You DON'T use the exercism cli (as indicated on the right hand panel).

## Running The Tests

Tests can be run directly from the Pharo IDE, by clicking on the test orb next to any test.
The SUnit convention is that the provided `ReverseStringTest`, will test the functionality of `ReverseString`.

If you are still stuck, the track documentation has detailed help for [running tests](https://exercism.io/tracks/pharo/tests).

## Language and Environment Help

For Pharo installation and learning resources, refer to the [track help page](https://exercism.io/tracks/pharo/learning).


## Source

Introductory challenge to reverse an input string [https://medium.freecodecamp.org/how-to-reverse-a-string-in-javascript-in-3-different-ways-75e4763c68cb](https://medium.freecodecamp.org/how-to-reverse-a-string-in-javascript-in-3-different-ways-75e4763c68cb)


## Submitting Incomplete Solutions

Remember, it is also possible to submit an incomplete solution so you can see how others have completed this exercise and can learn from their approach.

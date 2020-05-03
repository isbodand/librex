# TODO

This list contains the features to be implemented in Rex.
If, perchance, you happen to be a contributor to be, 
feel free to use this list as a reference, 
and remove the implemented element with a commit in your PR.

## API features

 - Compile-time creation of matcher DFA
 - Class for matching the next char

## Regex Features:

 - Raw character matching
 - `\d`, `\w`, `\s`, and uppercase reverse
 - `{min[,[max]]}`
 - Kleene star
 - Kleene plus
 - Question mark
 - Dot
 - Or pipe
 - \[non-]capture groups and back-refs
 - Whitespace: `\t`, `\r`, `\n`, `\N`, `\h`, `\H`, `\v` and `\V` in PCRE sense, and `\R`
 - Character classes
 - `^`, `$` and `\A`, `\Z`
 - Word boundary: `\b`, `\B`
 - POSIX character classes
 - Lookbehind, with lookahead not supported for reasons
 - Character class operations
 - `\Q...\E`

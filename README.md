spass
=====

spass is a simple passphrase generator that chooses random words from a
dictionary. It was inspired by [an XKCD strip](http://xkcd.com/936/)
which reminds us that hard-to-remember passwords are not necessarily hard for a
computer to guess.


Prerequisites
-------------

spass assumes you have a dictionary file to use as its source of words. By
default, `/usr/share/dict/words` is used, but you can pass your own dictionary
using the `-f/--file` option.


Installation
------------

spass is distributed as a gem, so just do:

    $ gem install spass


Usage
-----

When run without arguments, spass generates 10 passphrases up to 24 characters
long using words up to 10 characters long. You can configure this behavior by
passing command-line arguments; run `spass -h` to see full usage notes.

Examples:

    $ spass -l 30           # Generate phrases at least 30 characters long
    $ spass -l 30 -n 20     # Generate 20 phrases at least 30 characters long
    $ spass -c 6            # Limit words to 6 characters
    $ spass -d              # Include some 1- or 2-digit random numbers
    $ spass -f mywords.txt  # Get words from mywords.txt (one per line)

Passphrases are guaranteed to be at least as long as the given `-l` number, but
may be longer.


Disclaimer
----------

spass makes absolutely no guarantee that its output results in secure
passwords. If you use spass to protect your bank account or your porn
collection, I cannot be held responsible if you lose your money or marriage.
[Check your password strength](http://rumkin.com/tools/password/passchk.php)
before using it for anything important. Passwords generated with spass are
inherently vulnerable to a dictionary attack; the only thing that can make
them resistant to such attacks is their length, so always use at least three
(preferably more) words.


Future plans
------------

- Optional inclusion of uppercase and symbols
- Avoid possible word repetition


MIT License
-----------

spass is licensed under the MIT License.

Copyright (c) 2011 Eric Pierce

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


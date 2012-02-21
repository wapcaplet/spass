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

When run without arguments, spass generates 10 passphrases, each 4 words long,
using words up to 8 characters long. You can configure this behavior by passing
command-line arguments; run `spass -h` to see full usage notes.

Examples:

    $ spass -w 3            # Generate 3-word phrases
    $ spass -w 5 -n 20      # Generate twenty 5-word phrases
    $ spass -c 6            # Limit words to 6 characters
    $ spass -d              # Append a digit to each word
    $ spass -f mywords.txt  # Get words from mywords.txt (one per line)

Samples:

    $ spass -n 5
    Read 36530 words up to 8 characters long from /usr/share/dict/words
    clump gecko planters marksmen
    cylinder croupier fonds craggier
    lip scorned misspend knitting
    triple assuaged wisdom flatbeds
    journal wigs sultan danders

    $ be bin/spass -n 5  -c 5
    Read 7655 words up to 5 characters long from /usr/share/dict/words
    babes annul elm gate
    gains flaky mash gang
    grim state yaps dado
    kinds ms cults terms
    ogles today taco guild


Disclaimer
----------

spass makes absolutely no guarantee that its output results in secure
passwords. If you use spass to protect your bank account or your porn
collection, I cannot be held responsible if you lose your money or marriage.
[Check your password strength](http://rumkin.com/tools/password/passchk.php)
before using it for anything important. Passwords generated with spass are
inherently vulnerable to a dictionary attack; the only thing that can make
them resistant to such attacks is their length, so always use at least three
(preferably more) words. Single-dictionary-word passwords are trivial for a
computer to guess.

I'm not any kind of expert on password security, but a little math convinces me
that dictionary passwords can be quite strong. Using the default spass
settings, and a typical `/usr/share/dict/words`, the dictionary of words 8
characters or fewer is about 35,000. In theory, if your passphrase consists of
4 words chosen from this dictionary, an attacker would have to exhaust
(35,000^4 / 2) possibilities on average before finding your passphrase (and
that's assuming the attacker *knows* that your passphrase consists of four
dictionary words). At 1 billion guesses per second, this would take about 24
years. Of course, if your four words were "a", "an", "i", and "eh", the
cracking time would be somewhat lessened.

If you're paranoid, use more words, and longer words. Toss in a few digits or
symbols to make it even stronger, and/or to meet the password requirements of
the system you're using. You might use CamelCase or snake_case or
hyphenated-words, depending on what's easy for you to remember and type. spass
can't choose your password for you; it only gives some randomized suggestions
that will help you construct a password that is both memorable and hard to guess.


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


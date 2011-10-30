spass
=====

spass is a simple passphrase generator that chooses random words from a
dictionary. It was inspired by [an XKCD strip](http://xkcd.com/936/)
which reminds us that hard-to-remember passwords are not necessarily hard for a
computer to guess.


Prerequisites
-------------

Currently, spass only words on Unix-like systems, which are expected to have a
`/usr/share/dict/words` file. Future versions may support other platforms.


Installation
------------

spass is distributed as a gem, so just do:

  $ gem install spass


Usage
-----

Run `spass` from the command-line to see usage notes. At present, the only
argument is the minimum passphrase length (in characters). Examples:

  $ ./makepass.rb 12
  hive frighten

  $ ./makepass.rb 24
  moppet castigator harvesters

  $ ./makepass.rb 32
  munificent icebound raymond clorets

Passphrases are guaranteed to be at least as long as the given number, but
may be longer.


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


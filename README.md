[![Build Status](https://travis-ci.org/grossadamm/soundex.svg?branch=master)](https://travis-ci.org/grossadamm/soundex)

Ruby function to find american Soundex of an word

Based upon https://en.wikipedia.org/wiki/Soundex

Usage
-----

Install by using this code

```bash
$ gem intall soundex
```

Use it like this

```ruby
require 'soundex'

Soundex.new "Madras"
Soundex.new "Madharas"
```
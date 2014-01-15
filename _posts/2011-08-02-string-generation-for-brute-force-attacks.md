---
layout: post
title: String Generation for Brute-force Attacks
description: "A simple way to generate strings in Python."
cover: startbucks.jpg
comments: true
categories:
- Howto
- Software
tags:
- brute force
- C++
- password cracking
- Python
---
A [brute-force attack](http://en.wikipedia.org/wiki/Brute-force_attack) is one
of the most trivial (and yet pretty useful) methods of cracking passwords and
breaking access keys.

The idea is simply trying all possible sequences of input characters, until
you guess the right combination. The thing is, that it might take some time.
Actually, sometimes it might take literally ages, due to large number of
possible outcomes. The faster our machines (and algorithms!) get, the
lesser time it takes to break in using brute-force attack.

One of the key components in this technique is an algorithm that generates the
input combinations. It's run every time in the main loop. Well, the loop is
pretty much **generate a password**, **try it** and **try again**. This article
will present a couple of simple implementations of string sequence generators
in various languages.

## Python implementation

Here is code for a most basic example in Python. It's a simple recursive
function that is able to generate strings up to infinite length. I use a `list`
instad of `string` in this example, because strings in python are immutable.
You need to convert it to string ( `"".join(list)` ).


{% highlight python %}
def next(string):
    if len(string)
        string.append(chr(0))
    else:
        string[0] = chr((ord(string[0]) + 1) % 256)
        if ord(string[0]) is 0:
            return list(string[0]) + next(string[1:])
    return string
{% endhighlight %}
[Download](https://gist.github.com/1116715) the whole example from github.

This example is very simple. It tries **every possible combination** which takes
it's success rate up to 100 percent. You just can't miss anything if you try
them all, right? But a lot of the characters from ASCII table are
non-printable, weird and people don't use them for passwords. So you spend a
great amount of time by trying out combinations that are extremely unlikely to
ever occur. It would be pretty awesome if there was some way of saying what
characters can be part of a password string and use only them. The number of
possible outcomes lowers a lot by this optimization while the chance to miss is
still almost zero. I made a some alternations to the `next()` function above:


{% highlight python %}
import string

ALLOWED_CHARACTERS = string.printable
NUMBER_OF_CHARACTERS = len(ALLOWED_CHARACTERS)

def characterToIndex(char):
    return ALLOWED_CHARACTERS.index(char)

def indexToCharacter(index):
    if NUMBER_OF_CHARACTERS
        raise ValueError("Index out of range.")
    else:
        return ALLOWED_CHARACTERS[index]

def next(string):
    if len(string)
        string.append(indexToCharacter(0))
    else:
        string[0] = indexToCharacter((characterToIndex(string[0]) + 1) \
                                                   % NUMBER_OF_CHARACTERS)
        if characterToIndex(string[0]) is 0:
            return list(string[0]) + next(string[1:])
    return string
{% endhighlight %}

This snippet above works only with printable characters (as specified in
python's `string` module). You can also change the subset of characters it
works with by changing the value of `ALLOWED_CHARACTERS` constant. The whole
source is again available at [github](https://gist.github.com/1121315).

Next time I'll look into a C implementation of the technique and a comparison
of speed between the two languages.

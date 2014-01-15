---
layout: post
title: Strings in Computer Science
description: "The concept of a string in Computer Science and what can you do with it."
cover: tower-bridge.jpg
comments: true
categories:
- Computer Science
- Math
tags:
- definitions
- string operations
---
You have probably stumbled upon a string data type in some programming
language. In C it's `<string.h>`, in C++ `std::string`, Python has them even
PHP! They're useful, pretty straight-forward. And the most beautiful thing is,
that there is a theoretical foundation for them! These operations e.g.
reversation, concatenation, making sub-string and of course the string itself!
Let's have a look.

**Definition 1.** String is a finite ordered sequence of characters. Let Σ be
an alphabet, then _s_ ∈ Σ<sup>*</sup> is a string over Σ.

The mysterious Σ<sup>*</sup> is an alphabet iteration. That is a set of all
existing strings over Σ. Which makes it a infinite set, unless the alphabet is
empty. You see, all the strings fall within this definition. s = "abcc" might
be a string over alphabet Σ = {a, b, c}. One, sort of special case exists -- an
empty string, that is usually denoted by ε and its length is 0. Now, let's
proceed to some string operations. One of the most important is
**concatenation**.

**Definition 2.** Let w and x be strings over Σ. Then string y = wx is a
concatenation of these two. It's also a string over Σ. You see, that
concatenation is not commutative. You cannot switch the strings and expect to
get the same result. Length of the new string |y| = |w| + |x| i.e. is equal to
a sum of lengths of the concatenated strings.

Concatenation is very important string operation. It allows you to connect
multiple strings together. When you have two or multiple strings connected, for
instance w, x, y, z ∈ Σ<sup>*</sup> , z = wxy, you can say that w is a **prefix**
of z, y is a **suffix** of z and x is a **substring** of z. A **proper prefix**
of a string is not equal to the string itself, i.e. xy != ε and equivalently y
is a **proper suffix** if wx != ε.

**Definition 3.** Let x = a<sub>1</sub>a<sub>2</sub>...an be a string over Σ.
Reversal of the string, y = _reverse_(x) =
a<sub>n</sub>...a<sub>2</sub>a<sub>1</sub>.

One rather trivial definition in the end, reverse string is the same sequence
of characters backwards. The thing is, why can string reversal be defined this
rather intuitive way? It's because we can be absolutely sure, that each string
has a finite number of symbols, i.e. we know the n.

## Note

It's important to point out, that we're talking about **theoretical strings**.
You can apply this theory to string literals in programming (like I did) and it
will work, but the strings in theory are far more abstract than that. It
actually depends on what is your alphabet. Let's say, that a every symbol in Σ
represent a single processor instruction. If you create a string over that Σ,
you'll get a sequence of instructions. You can do it multiple times and get
programs _x_, _y_ ∈ Σ<sup>*</sup>. Now, you can use concatenation, right? Then
_y_ = _xz_, where y is also a program in which _x_ and _z_ are **subroutines**!

## Conclusion

Strings are useful, when you need to model any **sequential behavior**.
Computers are sequential machines (well, not that much lately, but in
principle) so there is plenty to cover with these couple of definitions!

## Sources
- Češka M., Vojnar T., Smrčka A., Teoretická informatika, Studijní opora.

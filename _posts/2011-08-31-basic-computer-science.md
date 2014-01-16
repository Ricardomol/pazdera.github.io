---
layout: post
title: Basic Computer Science
comments: true
categories:
- Computer Science
- Math
tags:
- computer science
- formal languages
- grammars
---
There is a couple of very basic definitions and axioms in computer science. I
consider them to be very important, because everything that comes later is
based on them. And if you don't fully comprehend the basic stuff, it will be
very hard to understand anything further. That's why I decided to write a whole
post on these trivial definitions.

## An Alphabet

Yeah, I'm not kidding. There's a formal definition for alphabet. And what's
worse: it actually makes sense. I just wonder what would a kindergartener say
on this :-D. Anyway, here it goes:

**Definition 1.1.** An **alphabet** is a finite non-empty set of _symbols._

Alphabets are usually denoted by Greek big sigma _**Σ**_. A set _**Σ**_ can be
referred to as alphabet when it's not empty, but also not infinitely big.

- _Σ = {a, b, c}_ is an alphabet
- _Σ = {0, 1}_ is an alphabet
- _Σ = {}_ is **NOT** an alphabet
- _Σ = all integers_; is **NOT** an alphabet

Content of an alphabet are _symbols_. A symbol is some indivisible or atomic
unit that can have some meaning (not necessarily). For example, if _Σ =
{righteous, dude}_ were alphabet, **righteous** and **dude** would be
considered to be atomic indivisible elements (even though they contain multiple
characters). Some folks also choose to omit the _finite_ word from the
definition. But that's for some very advanced stuff and I'm guessing that
finite alphabets will be more than sufficient for us.

## String

Another fundamental thing is a string. **String** or a **word** is a sequence
of some symbols (the order is important). Strings usually contain symbols from
only one alphabet.  In that case we say string _x_ over _Σ_ is
a finite sequence of symbols from _Σ_. The formal definition is this:

**Definition 1.2**. Let _Σ_ be an alphabet.

1. empty string _e_ is string over _Σ_
2. if _x_ is a string over _Σ_ and  _a in Σ_ is a
symbol from _Σ_, then $latex xa$ is a string over _Σ_
3. _y_ is string over _Σ_ only when we can derive it by applying
rules 1 and 2.

There are some more basic definitions like string length, concatenation,
reversation that are useful and important, but they might be a little
intimidating at first, so let's skip ahead to languages.

## Language

What is a **formal language**? We need to define _Σ<sup>*</sup>_ first.
_Σ<sup>*</sup>_ is a set of all existing strings over alphabet _Σ_.
For example, let _Σ = {0, 1}_, then _Σ<sup>*</sup> = _{_ e _}_ u _{_ all
positive binary numbers _}_.

Then a formal language **L** over alphabet _Σ_ is a subset of
_Σ<sup>*</sup>_. Formally said, _L ≤ Σ<sup>*</sup>. Basically,
language is a _set of strings_. In context of programming languages, a language
would be a set of all possible programs in that programming language. You see,
that in most practical cases the set will be **infinite** (as it is in the
programming language case). So, it's not very practical to describe languages
by enumerating all possible sentences of the language. One way of describing a
language is with things called **formal grammars**. But we'll get on to that
later.

## Sources
- [http://www.cs.umbc.edu/portal/help/theory/lang\_def.shtml](http://www.cs.umbc.edu/portal/help/theory/lang_def.shtml)

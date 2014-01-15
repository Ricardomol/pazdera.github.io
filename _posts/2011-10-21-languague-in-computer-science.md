---
layout: post
title: Languages in Computer Science
description: "Certainly not the typical ones."
cover: wall-leaves.jpg
comments: true
categories:
- Computer Science
- Math
tags:
- formal languages
- grammars
---
The [last post](http://linuxwell.wordpress.com/2011/09/23/strings-in-computer-science/
"Strings in Couputer Science") was about strings, so now it's the right time to
learn something something about **languages** too.

From the theoretical point of view a _language_ is a set of words or more
precisely sentences (strings). Possibly and usually an infinite set. Only the
sentences that are a part the set belong to the language, nothing else. Neat
feature of languages is that they actually interconnect two separate formal
theories/models into one beautiful concept. Let me explain.

Language is a **set**. As in mathematical
[set](http://en.wikipedia.org/wiki/Set_%28mathematics%29). So anything that
applies to sets applies to languages as well (like union, intersection,
complement, Cartesian product). Members of any language are only
**[strings](http://en.wikipedia.org/wiki/String_%28computer_science%29)**. And
there are some operations defined over strings (that is concatenation,
reversal, sub-strings etc.). We can take advantage of this fact and abstract
those, so they work with language as well. There is generally **a lot** you can
do with a formal language either from the set or string point of view.

**Definition 1.** A **formal language** _L_ over an alphabet Σ is a subset of
Σ<sup>*</sup>. Formally, L ⊆ Σ<sup>*</sup>. The magical Σ<sup>*</sup> denotes
a set of all existing words and sentences over Σ. Sometimes it's called an
alphabet iteration.

Like I said earlier, all operations defined for sets work with languages as
well. For example **language union** L<sub>1</sub> ∪ L<sub>2</sub> =
{s; s ∈ L<sub>1</sub> ∨ s ∈ L<sub>2</sub>} etc. Even more interesting are the
string operations that can be abstracted so they work on languages too. There
is **language concatenation**:

**Definition 2.** Let L<sub>1</sub> be a language over Σ<sub>1</sub> and
L<sub>2</sub> be a language over Σ<sub>2</sub>. **Concatenation** of these
two L = L<sub>1</sub>⋅<sub>2</sub> = {xy; x ∈ L<sub>1</sub>, y ∈ L<sub>2</sub>}
is a language over alphabet Σ = Σ<sub>1</sub> ∪ Σ<sub>2</sub>.

Language concatenation as well as the string equivalent is not commutative
operation. There is a couple of special cases:

- L ⋅ {ε} = L
- L ⋅ ∅ = ∅

The first, {ε} is a language with a single word -- an empty string, in the
second case we're talking about an empty set. Concatenation can be looked at a
sort of multiplication between the two languages (remember Cartesian product?).
As a result of this thought, we define **language power**.

**Definition 3.** Let _L_ be a language over Σ, then _Ln_ denotes n-power of
language and

- L<sub>0</sub> = {ε}
- L<sub>n+1</sub> = L<sub>n</sub>⋅L

With language power defined, we can advance to the last operation called
**language iteration**. It's basically an abstraction of language power.

**Definition 4**. L+ denotes positive iteration of language L defined
accordingly

- L<sup>+</sup> = L ∪ L<sub>2</sub> ∪ … ∪ L<sub>∞</sub>

**Definition 5**. L\* denotes iteration of language L defined accordingly

- L<sup>*</sup> = {ε} ∪ L ∪ L<sub>2</sub> ∪ … ∪ L<sub>∞</sub>

## Summary
In this post were introduced some of the most basic and most common operations
that are defined on languages. The most important thing to remember is, that
language is a **set** of **sentences** (or words) and the operations that we
define originate from these two areas. We have some set operations like
**union**, **intersection**, **complement** as for generic sets. And we have
abstractions for
[string operations](http://linuxwell.wordpress.com/2011/09/23/strings-in-computer-science/
"Strings in Computer Science") like **concatenation** (notice, that it's
somewhat similar to cartesian product), **language power** and **iteration**.
Anyway, these couple of operations is nowhere near to the complete list of all
existing functions for languages! After all, if you dive into some algebraic
structures a little you can easily define your own :-).

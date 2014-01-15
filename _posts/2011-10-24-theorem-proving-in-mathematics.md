---
layout: post
title: Theorem Proving in Mathematics
description: "The most common methods of proving you're explained."
cover: bricks.jpg
comments: true
categories:
- Computer Science
- Math
tags:
- math
- mathematical proof
---
The very foundation of mathematics as we know it! Or, well, that evil thing
math teachers had invented so they could torture the students. And we all know
_that_ very well... Anyway, I'm one of the tortured this fall, so let's talk
the math!

Mathematical proving is a way of convincingly demonstrating that some
mathematical statement is necessarily true[1]. There are several different
types and ways of proofs and proving things, but one thing is common among all
of them -- a proof can only be obtained from unquestionable truths (axioms) by
some sort of deductive reasoning. Experience, intuition or belief are not valid
arguments when it comes to mathematical proving.

When you show that your statement works for every possible element from the
[**universe**](http://en.wikipedia.org/wiki/Universe_%28mathematics%29), your
statement or **proposition** becomes a **theorem**. Now, let's have a look at
some of the techniques that are frequently used to prove stuff.

## Direct Proof

Direct proof in mathematics is a way of proving that some statement is true by
showing that the statement can be deduced from generally anything that is
**known to be true** (which are some basic truths -- **axioms** and all
**previously proven theorems**). It's most common for proving conditional
statements in a form of **A → B**.

Formally speaking, when constructing a direct proof, were looking for a
sequence of statements A<sub>1</sub>, A<sub>2</sub>, ..., A<sub>n</sub> so
(A<sub>1</sub> → A<sub>2</sub>) ∧ ... ∧ (A<sub>n-1</sub> → A<sub>n</sub>) ∧ _T_,
where T = A → B is the statement we're proving.

It sounds weird, but it's really simple. Take for instance solving an
equation. Almost any 5th grader can do that, right? If you think about that,
the sequence of steps you go through in order to get to the value of **x** is a
sort of a direct proof. You have some **precondition** (the equation) and some
**expected result** (e.g., _x_ = 5). Also there are some **basic axioms** that
your math teacher told you (like subtracting 5 of both sides of the equation).
While solving the equation, you try to come up with the right sequence of steps
that will get you from _x_ + 1 - 2 _x_ = -4 to _x_ = 5.

The solution looks like this:

- _x_ + 1 - 2 _x_ = -4 →
- _x_ - 2 _x_ = -5 →
- -_x_ = -5 →
- **_x_ = 5**

We have proven that with the given precondition, **_x_ = 5**. Formally speaking,
_x_ + 1 - 2 _x_ = -4 → _x_ = 5.

## Proof by Induction

More precisely proof by _mathematical_ induction. This proof is often used
when we need to show, that something is true for an infinitely large universum
(natural numbers for instance). It's tied to the [universal
quantification](http://en.wikipedia.org/wiki/Universal_quantification) in
predicate logic.

The proof consists of two steps. At first, **base case** is proved for some
element from the universe, then an **induction rule** is used to prove all
other cases.

1. The **basis (base case)**: showing that the statement holds when _n_ is
equal to the **lowest** value that _n_ is given in the question. Usually, _n_ =
0 or _n_ = 1.
2. The **inductive step**: showing that _**if**_ the statement holds for some
_n_, _**then**_ the statement also holds when _n_ + 1 is substituted for _n_.

The principle can be illustrated on the " [domino
effect](http://en.wikipedia.org/wiki/Domino_effect)" on a row of falling
dominoes.

1. **Base case** -- The first domino will fall.
2. **Induction rule** -- Whenever a domino falls, its next neighbor will also
fall.

<figure class="align-center" style="width: 50%;">
	<a href="http://en.wikipedia.org/wiki/File:Domino_effect.jpg">
        <img src="http://upload.wikimedia.org/wikipedia/commons/a/a8/Domino_effect.jpg"
             alt="The domino effect">
    </a>
	<figcaption>
        Figure 1: The domino effect
    </figcaption>
</figure>

## Proof by Contradiction

Proof by contradiction is rather common as well. In this proof, it is shown
that if some statement were so, a logical contradiction occurs, hence the
statement must be not so. It starts by adding a statement to the preconditions,
that we expect to be false. Then we try to show why the precondition is so, but
in the process we find some **contradiction**.

Textbook case of the proof by contradiction is proving that a language is not
regular by [pumping theorem](http://en.wikipedia.org/wiki/Pumping_lemma). We
say, that a language is regular then pumping lemma states, that if a language
is regular, some conditions and restrictions must be met.

Here's an example proof from wikipedia[1]:

Suppose that sqrt(2) wes a **rational number**, so by definition
sqrt(2) = _a_/_b_ where _a_ and _b_ are non-zero integers with no
common factor. Thus, b sqrt(2) = a. Squaring both sides yields 2 _b_ 2 =
_a_ 2. Since 2 divides the left hand side, 2 must also divide the right hand
side (as they are equal and both integers). So _a_ 2 is even, which implies that
_a_ must also be even. So we can write _a_ = 2 _c_, where _c_ is also an
integer. Substitution into the original equation yields 2_b_2 = (2_c_)2 =
4 _c_2. Dividing both sides by 2 yields _b_ 2 = 2 _c_ 2. But then, by the same
argument as before, 2 divides _b_ 2, so _b_ must be even. However, if _a_ and
_b_ are both even, they share a factor, namely 2. This contradicts our
assumption, so we are forced to conclude that sqrt(2) is an
**irrational number**.

At first we make an assumption which is followed by sequence of steps, that
should be valid, if the former statement is so until we find a contradiction,
therefore the opposite is true.

## Summary

Proofs in mathematics can be a little... eh, well, fricking intimidating at
first. They're strictly formal, sometimes very hard to understand and it might
seem almost impossible to come up with one, when you need to. Proving theorems
requires a lot of knowledge and experience. Proofs in math might not be for
anybody, but it's good to know they're there :-).

## Sources

- [1] [Mathematical Proof
@wikipedia.org](http://en.wikipedia.org/wiki/Mathematical_proof)
- [2] [Mathematical Induction
@wikipedia.org](http://en.wikipedia.org/wiki/Mathematical_induction)


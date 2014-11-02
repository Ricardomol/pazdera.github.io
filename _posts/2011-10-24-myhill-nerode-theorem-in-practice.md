---
layout: post
title: Myhill-Nerode Theorem in Practice
description: "A way of proving that a language is regular."
cover: the-boleyn.jpg
comments: true
categories:
- Computer Science
- Math
tags:
- computer science
- formal languages
- regular languages
---
When it comes to practical side of computer science, we often work with
**regular** and **context-free** languages. Regular languages are most common
for expressing syntax through the widely used **regular expressions**. Somewhat
stronger context-free grammars dominate in the field of compilers and various
language processors.

As we know from the [Chomsky hierarchy of formal
languages](http://en.wikipedia.org/wiki/Chomsky_hierarchy), the class of
regular languages is a subset (or a sort-of a special case) of context-free
language class. This means that every regular language can be described not
only by finite automatons, regular expressions or regular grammars but also by
context-free grammars, pushdown automatons and also (for the hard-core folks) a
turing machine.

In theory this is fine, but it's not very good for practice. I mean, if you
were developing some app that requires syntax checking, would you rather
develop some sort of lineary bounded automaton or use a library for regular
expressions?

Sometimes we want to prove, that we don't need to do magic to check the
correct syntax of an email address. There are some ways of doing so. For
example **pumping theorem**, which is fairly straight forward. But [pumping
lemma](http://en.wikipedia.org/wiki/Pumping_lemma) can be only used to prove,
that a language is **not** regular. The lemma doesn't provide sufficient
condition for a language to be regular. That's where the folks Myhill and
Nerode come in!

The [Myhill-Nerode
theorem](http://en.wikipedia.org/wiki/Myhill%E2%80%93Nerode_theorem) on the
contrary provides necessary and sufficient condition for the language to be
regular! Yay! But as you can imagine it's not that simple :-P.

## Formal definition

**Definition 1.** Let Σ be an alphabet and ~ a relation of equivalency on
Σ<sup>*</sup>. Then relation ~ is right invariant if for all _u_, _v_, _w_ ∈
Σ<sup>*</sup>:

- _u_ ~ _v_ <=> _uw_ ~ _vw_

**Definition 2.** Let _L_ be a language (not neccessarily regular) over Σ. We
define relation ~_L_ called **prefix equivalence** on Σ<sup>*</sup> as follows:

- _u_ ~_L_ _v_ <=> ∀_w_ ∈ Σ<sup>*</sup>: _uw_ ∈ _L_ <=> _vw_ ∈ _L_

**Theorem 1.** (_Myhill-Nerode_) Let _L_ be a language over Σ. Then these three
statements are equivalent:

1. _L_ is accepted by some deterministic finite automaton.
2. _L_ is the union of some of the equivalence classes of a **right invariant**
equivalence relation of finite index.
3. Relation ~_L_ is of finite index.

## Informal description

The heart of this theorem is the fact that finite automaton has only a finite
number of states. With this, any language that can be described by a finite
automaton must consist of only finite number of string patterns. This is
expressed by the right invariant relation with finite index.

The prefix equivalence is a form of the right invariant equivalence, but
stronger. It's tied to the respective language and says that if some strings
are ~L-equivalent they both are included or excluded from the language after we
extend them. The Myhill-Nerode theorem says, that a regular language always has
a finite number of equivalence classes, i.e., there is only a finite number of
word patterns that can be repeated through the string.

### Example proof

Now a little example of how to show, that a language is not regular by using
this theorem. Let's take for instance the most classic context-free language of
all times _L_ = { _a<sup>n</sup>b<sup>n</sup>_ | _n_ >= 0 }.

We'll be interested in the third part of Myhill-Nerode theorem which states,
that **relation ~L is of finite index**. We need to find a way of showing that
it's not and therefore the language is not regular (since Myhill-Nerode theorem
is an equivalence).

In this case, the most elegant way is [proof by
contradiction](/2011/10/24/theorem-proving-in-mathematics/
"Theorem Proving in Mathematics"). We will show, that
_L_ = { _a<sup>n</sup>b<sup>n</sup>_ | _n_ >= 0 } is not reglar.

**Proof 1.** Suppose that _L_ is a regular language. Let _i_, _j_ ∈ _N_
be two natural numbers so _i_ != _j_. Then consider words _u_, _v_, _w_ ∈
Σ<sup>*</sup> and a sequence of words over Σ<sup>*</sup> ∈ _a_<sub>1</sub>,
_a_<sub>2</sub>, ..., _a_<sub>i</sub>.

Now let's assign some values to strings _u_, _v_ and _w_:

u = a<sup>i</sup>, v = a<sup>j</sup>, c = b<sup>i</sup>.

According to the definition of prefix equivalence (**definition 2**),

a<sup>i</sup>b<sup>i</sup> ∈ L -> a<sup>j</sup>b<sup>i</sup> ∈ L

we can see, that none of the words _ai_ from the sequence are
**~L**-equivalent. The sequence is infinite, so the **index of the relation
will be infinite**. But that's a contradiction with the Myhill-Nerode theorem.
Therefore, the language is **not** regular.

## Sources

- [Myhill-Nerode Theorem](http://www.mec.ac.in/resources/notes/notes/automata/Myhill%20theorm.htm)
- [Myhillova-Nerodova věta](http://cs.wikipedia.org/wiki/Myhillova-Nerodova_v%C4%9Bta)
- Češka M., Vojnar T., Smrčka A.. Teoretická informatika: studijní opora. FIT VUT v Brně. 2010.


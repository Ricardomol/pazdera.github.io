---
layout: post
title: 'Design Patterns: Builder'
categories:
- Code
- Design Patterns
- Software
tags:
- builder
- C++
- code
- creational
- design patterns
- object-oriented
- programming
- Python
- software
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
It's time for another design pattern example and today it's going to be the
**builder** design pattern! Another one from the group of creational patterns,
as it's name suggests. And how does it work?

Using builder pattern is something like outsourcing a constructor into a
separate class. It deals with building object that have a lot of various parts.
This increases the level of complexity of the object, which often results in
complicated initialization. Builder splits the construction into a number of
stages in which different parts are built. The **builder** is an abstract class
(or an interface) that is able to build various components of the final object,
but not the object itself. The building process is controlled by another class
-- a **director**. Director has an instance of **builder** and uses it to build
the final object. Decides what components will be used and at the end, the
director's output is the final fully initialized object.

<figure class="align-center">
	<a href="/assets/images/posts/builder.png">
        <img src="/assets/images/posts/builder.png"
             alt="Class diagram for the builder pattern">
    </a>
	<figcaption>
        Class diagram for builder pattern (source: wikipedia.org).
    </figcaption>
</figure>

The example, I will be working with is a process of assembling a car. Don't
worry, I won't go through each screw in the engine, I don't know much about
that stuff anyway :-). The point is, a car is quite complicated thing to build
and that's exactly what we're looking for.

So take this, we're in a factory that builds two types of cars: a big-ass SUVs
and tiny smarts. The both cars have virtually the same parts. Well, both have
wheels, an engine, some windows (not to be confused with the operating system,
that would be a deadly weapon, a car with Windows XP installed) and maybe
doors. They might differ in their attributes -- size, shape, used material, but
both are used for the same purpose and in our example, they will be of the same
type.

Then, there are two types of guys in our store -- **builders** and a
**director**. Builders work on the low-level. Every builder knows how to
assemble various parts of a car (an engine, car body, a wheel). There might be
multiple builders for multiple types of cars -- nobody can understand
everything. The director then takes those parts from a builder and puts them
together so they form a working vehicle. The director controls the whole
construction process, does important decisions and takes responsibility for the
product while builders take care of assembling the smaller basic parts.

When a customer comes to the director and says, "Hi, can I have one Big Ass
SUV?" The director's like, "Sure buddy, gimme a sec", and goes into the back of
the store to the builders. He asks them for the parts and assembles them
together. After while he comes back and hands the customer the keys to his new
chick magnet. If something goes wrong during this process, for instance builder
cannot give him four wheels because they've run out of tires, the director
apologizes to the customer, that they cannot build him the SUV today (maybe
next time).

In other words, there are one algorithm for setting up an object from some
parts, which is implemented in **director class** and it's independent from the
exact types of the basic parts. Basic parts are built by **builders**, that are
associated with the director. The final shape of the product is determined by
both.

## Difference between Builder and Abstract Factory

The Builder pattern is somewhat similar to the **Abstract Factory**. This
pattern extends the abstract factory with the director object which makes the
design more flexible. Some initialization is often associated to the building
process as well.

> Builder focuses on constructing a complex object step by step. Abstract
Factory emphasizes a family of product objects (either simple or complex).
Builder returns the product as a final step, but as far as the Abstract Factory
is concerned, the product gets returned immediately.

Builder often builds a composite while Abstract Factory outputs a set of
objects.

## C++
This time, the code is not included in the post due to it's length. It's
available only through [github](https://gist.github.com/1121152).

## Python
Same as the C++ code. You can see it at [github](https://gist.github.com/1121157)

## Sources

- [http://sourcemaking.com/design\_patterns/builder](http://sourcemaking.com/design_patterns/builder)
- [http://www.oodesign.com/builder-pattern.html](http://www.oodesign.com/builder-pattern.html)
- [http://en.wikipedia.org/wiki/Builder\_pattern](http://en.wikipedia.org/wiki/Builder_pattern)



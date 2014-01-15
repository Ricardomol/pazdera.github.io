---
layout: post
title: Test Driven Development
description: "A review of Kent Beck's famous piece on testing."
cover: traffic-light.jpg
comments: true
categories:
- Books
- Software
tags:
- test driven development
- TDD
- kent beck
- software testing
---
Another book from my huge **TOREAD** pile is [Test Driven Development: By
Example](http://www.amazon.com/Test-Driven-Development-Kent-Beck/dp/0321146530)
from **Kent Beck**.

I learned about this method of development from the **Extreme Programming**
book (also from Kent Beck) and I tried to take advantage of it during the
coding phase of my thesis for bachelor's. It's a great way to develop software!
Having your software covered by unit tests, you are way more confident with it.
Along with this comes an assurance, that you didn't break some part of your
software when you add or change something. Without proper testing (either
regression or unit) you just try stuff and see what happens. And it's usually
accompanied by glass shattering sounds and echoes of screaming people.

There is a metaphor (according to Steve McConnell in [Code
Complete](http://linuxwell.com/2011/08/29/code-complete/ "Code Complete!")) for
software development that describes the process as drowning in tar pits with
dinosaurs. I was a bit skeptical towards this metaphor at first, but it's damn
accurate when you code, but don't test.

<figure class="full">
	<a href="/assets/images/posts/tdd-book.jpg">
        <img src="/assets/images/posts/tdd-book.jpg" alt="Book cover">
    </a>
	<figcaption>
        Test Driven Development book cover
    </figcaption>
</figure>

What exactly can you find in the book? In the **first hundred pages**, Mr.
Beck explains test driven development on a case study of  _WyCash_ -- some
software that handles money. It's a step-by-step (and by step I mean really
small steps) guide through the whole process. To be honest, I didn't like this
part of the book. It explains how exactly TDD should be done, but it's sooo
annoying to read about copying methods from one place to another and replacing
`return 5;` by `return x+y;` .

The **second part** gets a little more interesting. It's about [xUnit
](http://en.wikipedia.org/wiki/XUnit) -- the family of widely used frameworks
for unit testing (**sUnit** for Smalltalk, **jUnit** for Java, **CppUnit** for
C++ etc). In this part, you will learn how the framework works with test cases,
test suits and fixtures, the `setUp()` and `tearDown()` methods etc. Kent Beck
is actually the original author of sUnit, the first framework from this family,
so all information you get here comes directly from the source. He actually
explains how to implement such a framework using TDD method.

And the **last part** covers TDD method in general, answers some questions
that might spring to mind, usage of design patterns together with TDD and
explains some situations you might find yourself in while using test driven
development method.

## <span style="color:#ff0000;">Red</span>-<span style="color:#008000;">Green</span>-Refactor

I'd like to point out one last principle -- the **Red-Green-Refactor**. It's a
sort of mantra that will guide you through the whole book. It explains pretty
much the whole routine of TDD in three steps (but you have to read the book to
understand it properly!).

1. **Write a test** -- a test for some new functionality, that will obviously
fail (hence the red sign)
2. **Make it work** -- write as little code as possible to make the test
execute correctly (copy some code, fake the implementation, whatever, just make
it work, turn the red to green)
3. **Refactor** -- at this point, the functionality is already done, so let's
focus only on the quality of design and implementation

It's surprisingly easy, but extremely powerful, if you think about that in
broader terms. I definitely recommend this book, maybe along with the **Extreme
Programming** from the same author.

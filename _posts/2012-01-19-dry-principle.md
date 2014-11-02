---
layout: post
title: The DRY Principle
description: "Under no circumstances, never repeat yourself."
cover: phone-booths.jpg
comments: true
categories:
- Code
- Software
tags:
- don't repeat yourself
- programming
- software design
- software development
---
I read a couple of books on software development lately and I stumbled upon
some more principles of software design that I want to talk about. And the
first and probably the most important one is this:

> **Don't repeat yourself.**

Well, this is new... I mean as soon as any programmer learns about functions
and procedures, he knows, that it is way better to split things up into smaller
reusable pieces. The thing is, this principle should be used in much broader
terms. As in **NEVER EVER EVER** repeat any information in a software project.

The long version of the DRY principle, which was authored by **Andy Hunt** and
**David Thomas** states

> Every piece of knowledge must have a single, unambiguous, authoritative
representation within a system.

The key is, that it doesn't apply only to the code. Every single time you have
something stored in two places simultaneously, **you can be almost certain**,
that it will cause pain at some point in the future of your project. It will
sneak up on you from behind and hit you with a baseball bat. And then keep
kicking you while you're down. This is one of those cases in which foretelling
future works damn well.

Authors of The Pragmatic Programmer show this on a great example with
**database schemes**. At one point in your project you make up a database
scheme, usually on a paper. Then you store it with your project somewhere in
plain text or something. The people responsible for writing code will look in
the file and create database scripts for creating the database and start
putting various queries in the code.

What happened now? You have **two** definitions of the database scheme in your
system. One in the text file and another as a database script. After while, the
customer shows up and demands some additional functionality, that requires
altering the scheme. Well, that shouldn't be that much of a problem. You simply
change the database script, alter the class that handles queries and go get
some lunch. Everything works fine, but after a year or two, you might want to
change the scheme a bit further. But you don't remember a thing about the
project, so you will probably want to look at the design first, to catch up. Or
you hire someone new, who will look on the scheme definition. And it will be
wrong.

Storing something multiple times is painful for a number of reasons. First,
you have to sync changes between the representations. When you change the
scheme, you have to change the design too and vice versa. That's an extra work,
right?  And as soon as you forget to alter both, it's a problem.

The solution to this particular problem is **code generation**. You can create
the database definition and a very simple script, that will turn it into the
database script. Here's a wonderful illustration (by [Bruno
Oliveira](https://plus.google.com/102451193315916178828/posts/MGxauXypb1Y)) of
how that works :).

<figure class="align-center">
	<a href="/assets/images/posts/repetitive.png">
        <img src="/assets/images/posts/repetitive.png" alt="Automation of repetitive tasks">
    </a>
	<figcaption>
        Repetitive tasks (author Bruno Oliveira)
    </figcaption>
</figure>

## Sources

- [1] [Hunt A., Thomas D.. The Pragmatic Programmer. Addison Wesley.
1999.](/2011/10/24/the-pragmatic-programmer/)
- [2] [DRY @wiki](http://en.wikipedia.org/wiki/Don%27t_repeat_yourself)


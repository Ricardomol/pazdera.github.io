---
layout: post
title: "How to pick an open source licence for your code"
description: ""
comments: true
categories:
- Programming
- Software
tags:
- open source
- free software
- licensing
- GPL
- MIT
---

What makes a project open source? That the code is freely available online?
That you can use it, modify it and send it to a friend? Strictly speaking, it's
**the licence** that grants you permissions to do all of the above. When
open-sourcing your project, you must include a licence file that lays out the
terms under which people can use it. Fortunately, there are many options to
choose from so you don't have to be a lawyer. Unfortunately, there are **way
too many** of them. This is how to pick the right one.

{% include note.html colour='green' head='HEADS UP' text="This how I do it for my personal projects, but I'm not a lawyer and this certainly isn't legal advice." %}

## What licenses are there?

The number of licences that would qualify as free and/or open source is in
hundreds. If you're into long lists, check out the enumerations at the [GNU
Project](http://www.gnu.org/licenses/license-list.html#SoftwareLicenses) and
[Open Source Initiative](http://opensource.org/licenses/alphabetical) websites
or on
[Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licenses).
Even these are probably far away from being exhaustive.

Despite the variety, the differences aren't usually that dramatic. There's so
many of them because people are too fussy about wording and certain details,
but many of them map onto essentially the same terms. To quickly review the
conditions of various licences, check out [tl;drLegal](https://tldrlegal.com/).

## Copyleft vs. Permissive licences

The biggest thing that divides licences is
[copyleft](http://www.gnu.org/copyleft/copyleft.html), a concept introduced by
the GNU project to prevent further distributors of your software from
restricting the freedoms you granted to the project originally. This means that
anyone who would like to redistribute a modified version of your code will have
to publish their modifications as well.

Some licences choose to implement this (GPL, LGPL, MPL) while others don't
(MIT, Apache, BSD). In some cases, copyleft can be extremely useful to prevent
abuse of your project; in others, it can hinder its adoption by companies that
won't be able to use copylefted code with their non-free products or
proprietary libraries.

## The scope of your project

One of the most important things to consider when picking a licence for your
project is its scope. Is it a library, dev tool or full-fledged application? If
it's meant to be used along with other libraries, you need to be much more
careful of which licence you pick, not to prevent adoption due to compatibility
issues (more on that in the next section).

For full-fledged applications or products where he primary goal isn't to be
used with other projects — like an Android app, desktop program or command line
tool, I'd probably go with a copyleft licence like
[GPLv3](http://www.gnu.org/licenses/gpl-3.0.en.html) which gives me an extra
bit of security that it will always remain open.

When releasing a library or framework to be used by developers in their
projects, the choice is a bit more difficult. Not allowing them to distribute
their programs that depend on your library without including the source code
might prevent companies from using it in their projects, which might slow down
wider adoption.

Personally, I'd choose a permissive licence in this case, like
[MIT](http://opensource.org/licenses/MIT) or
[BSD](http://opensource.org/licenses/BSD-3-Clause). While that leaves the
possibility of a company forking the project, improving it and never giving
back the changes, it doesn't make much sense for many companies to do that.
Diverging from master means they would have to bear the maintenance costs which
usually outweighs the price of any ultra-smart innovation they might have made
to your code.

## Compatibility issues

Some licences contain clauses that contradict with other licences, making them
[incompatible](https://en.wikipedia.org/wiki/License_compatibility). That means
that you can't combine two software packages or libraries that are licensed
under such contradicting terms.

Look at the packages your project is using and make sure to pick a licence that
doesn't contradict with the terms of those. There are many resources to get
compatibility information from, including
[Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licenses).
This issue tends to affect the more complicated and restrictive ones, such as
GPLv3. Because they're much longer and more specific, the chances of conflicts
are higher.

## Ecosystem bias

Depending on the technologies your project uses, one licence might be a better
option than the other, considering the ease of adoption. Even more so if it's a
library. Sticking with the popular choice makes it easier for your users,
because they're likely to be familiar with its terms. It also minimises chances
of conflicts.

For example, the JavaScript and Ruby communities favour the more permissive MIT
while projects in C/C++ are much more often distributed under GPL.

When releasing a library, make sure to research the climate in your niche. The
ecosystem might help you decide. That said though, don't feel obliged to do
exactly what everybody else is doing if you don't feel it's the right choice
for your project. Unless the one you go for is incompatible with the majority
of the libraries in the area, you'll be fine.

## No licence

The [usage
statistics](https://github.com/blog/1964-open-source-license-usage-on-github-com)
published by [Ben Balter](https://twitter.com/BenBalter) on Github's blog
earlier this year show that about 80% of repositories on their site don't
include a licence. Due to the way copyright works, this means that **nobody is
lawfully able to use their code** and even though it's available online it
can't be considered open source. This is a real shame.

Unless this is explicitly what you're aiming for, take the time to think about
licensing, otherwise no experienced developers will touch your code, risking
their reputation in a lawsuit.

## Summary

This is how I would go about picking a licence for my project. As long as
you're making an informed decision, there's no right or wrong answer to *which
licence is the best*. Pick one that best suits your needs. Just make sure to
pick at least one.

Which licence do you prefer? Let me know in the comments below or by tweeting
at [@radekpazdera](https://twitter.com/radekpazdera).

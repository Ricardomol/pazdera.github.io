---
layout: post
title: Licensing Your Software
categories:
- Linux
- Software
tags:
- code
- linux
- programming
- software
- source
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
When it comes to releasing your software publicly, you need to specify at
what conditions may other people use, modify, copy and redistribute it. This
is usually done by supplying some kind of a document along with your
software called **license**. Writing a good license could mean having a
pretty rough times over a fat pile of lawyer books for a common software
developer though.

Luckily for us, there are many licenses already available, that you can use
and under which you can distribute your software. Some are more restrictive
than others and it's only up to you which licensing path you want to take :-).
Since you're reading my blog about Linux, I'll assume you probably want to
distribute your application's sources as well. There are numerous ways to
go. So let's have a look ...

## Public Domain

One way to publish your software is by forfeiting your copyright a thereby
releasing it into **public domain**. Anything that belongs to the public
domain is **without copyright**. That means, that everybody can do anything
they want with is. This might be useful for someone.

The thing is, that by default, if you write a piece of software, **you**
automatically become it's copyright holder. This is stated in a thing
called **Berne Convention**, which most of the countries have signed. So,
in order to make your software public domain, you need to make clear, that
you forfeit your copyright.

## Open Source vs. Free Software

Another great ways to distribute your software. Generally, there are two ways.
Using an open **source license** or a **free software** license. What is the
difference between these two? Well, there are two separate camps -- **OSI**
(Open Source Initiative) and FSF (Free Software Foundation).

By making your project **open source** you allow others to "do whatever they
want" with the sources (as long as you don't violate the licensing terms).
The open source is more practical. It gives the user a lot of freedom in
copying and modifying the software.

On the other hand, making your project a **free software** will allow users
to "do whatever they want" (under the terms of the license) and if they
modify the software, they have to publish the changes and give it back to
the community. This makes the derivative works also publicly available. The
free software is more philosophical. It wants to make sure, that the software
once released as free will retain it's freedoms.

## Popular licenses

Here are some examples of popular and widely used licenses for your software.
My personal favorite is [GNU GPLv3.0](http://www.gnu.org/licenses/gpl.html).
It's a free software license, pretty restrictive about usage in proprietary
software, but I like the philosophy behind it. It was initially written by
this guy named
[Richard Stallman](http://en.wikipedia.org/wiki/Richard_stallman) :-).
The lesser version of this license (allowing linking in proprietary software)
is [GNU LGPL](http://www.gnu.org/licenses/lgpl.html).

Other popular ones are the
[BSD licenses](http://en.wikipedia.org/wiki/BSD_licenses). There are multiple
variants of the BSD license. They are more open source, than free software.

The [MIT License](http://www.opensource.org/licenses/MIT) is pretty
straight-forward as well as permissive.

Great comparison of various free software and open source licenses is
available on
[Wikipedia](http://en.wikipedia.org/wiki/Comparison_of_free_software_licenses).

### Sources:

- [Open Source Initiative](http://www.opensource.org/)
- [Free Software Foundation](http://www.fsf.org/)
- [Wikipedia](http://en.wikipedia.org/wiki/Permissive_and_copyleft_licenses)


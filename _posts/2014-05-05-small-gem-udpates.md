---
layout: post
title: Small gem updates
description: "A short summary of the recent changes made to the tco and word_wrap gems."
cover: bricks.jpg
comments: true
categories:
- Software
tags:
- ruby
- gem
- word_wrap
- tco
---

Recently, I had a chance to do a bit of work on the two gems that I currently
maintain ([tco](http://rubygems.org/gems/tco) and
[word_wrap](http://rubygems.org/gems/word_wrap)). I pushed a few minor updates
to both, and in this short post, I would like to sum up what has changed.

## tco 0.1.1

Unfortunately, the first release of `tco` came with a nasty little error that
made the majority of users unable to display their palette using the `-d`
option. The bug showed up only when you forgot to configure the ANSI part of
the palette. While the issue was very quickly discovered and
[reported](https://github.com/pazdera/tco/issues/3) by
[Brandon](https://github.com/brandonpittman) on GitHub, it took me quite a
while to fix. However, it has now been
[resolved](https://github.com/pazdera/tco/commit/a3bff189762bef7784fa1452bde792fb88df6ed7).

<figure class="align-center">
    <img src="/assets/images/posts/tco-palette.png" alt="Extended palete">
    <figcaption>
        The extended palette displayed by tco
    </figcaption>
</figure>

Apart from that, [Hannes](https://github.com/kwando) added a [simpler
way](https://github.com/pazdera/tco/commit/fb43c50d86700ce12cd4ce138fc14f72adab386c)
of reconfiguring the library through passing a block to the `#configure`
method, rather than calling `#reconfigure`. I like this approach much better
than the original one.

## word_wrap 0.2.1

After a short while of working on `tco`, I moved on to the [word_wrap
gem](https://github.com/pazdera/word_wrap) to make a few improvements there
as well.

Although `ww` is quite a simple utility, I find it to be very useful when
manipulating plain text documents, such as blog posts or READMEs. You can get
more information about this gem from one of my [previous
posts](http://linuxwell.com/2014/01/25/word-wrap-in-ruby/) on this website, if
you're interested.

But one thing that really bothered me was the fact that the output was always
printed to **stdout**.  That way, it wasn't possible to edit a file in-place
(since you can't be reading and writing to the same file at the same time). To
help with this, I added the `-i` (long `--in-place`) option, which will make
`ww` save the modified contents back to the original file. One might argue,
that it is somewhat less secure, because it doesn't force you to make a backup
of the file, but it is way more convenient if you know what you're doing.

The other change is not related to the `ww` utility directly, but in case
you're using the `word_wrap` library in your gems, you can now take advantage
of the `#wrap!` and `#fit!` functions that will modify the string in place,
rather than returning a modified copy.

## Summary
These were not big changes, but I hope they make the gems more stable and
easier to use. Special thanks goes to
[Brandon](https://github.com/brandonpittman),
[Hannes](https://github.com/kwando), [Chip](https://github.com/chip), and
[Jikku](https://github.com/JikkuJose), who helped me and contributed to one
of the two projects.

If you have any questions, comments, suggestions, or problems, please [let me
know](https://twitter.com/radekpazdera), I’ll be happy to help you :-).

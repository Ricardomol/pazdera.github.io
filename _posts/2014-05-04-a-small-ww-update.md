---
layout: post
title: A small ww update
description: "Tiny improvements to a small command-line tool."
cover: bricks.jpg
comments: true
categories:
- General
tags:
- ruby
- gem
- word_wrap
---

After a short while of working on the [tco
gem](https://github.com/pazdera/tco), I got back to the [word_wrap
gem](https://github.com/pazdera/word_wrap) to make a few improvements.

Although `ww` is quite a simple utility, I find it to be very useful when
manipulating plain text documents, such as blog posts, READMEs, or
documentation. All it can do is to wrap all the lines in a file at a certain
length like this:

{% highlight bash %}
$ cat sample.txt
Dreamcatcher +1 brunch, tofu Helvetica single-origin coffee
distillery trust fund lo-fi.

$ ww -w60 sample.txt
Dreamcatcher +1 brunch, tofu Helvetica single-origin
coffee
distillery trust fund lo-fi.
{% endhighlight %}

Actually, you can get more information about this gem from one of my [previous
posts](http://linuxwell.com/2014/01/25/word-wrap-in-ruby/) on this website.

One thing that really bothered me was the fact that you had to create a new
file when using it. The only supported way of output was **stdout** and you
can't be reading and writing to the same file at the same time. Therefore, I
added the `-i` (long `--in-place`) option yesterday, which will make `ww` edit
the file in place instead of printing out the results. That is somewhat less
secure, because it doesn't force you to make a backup of the file, but it
is way more conveient if you know what you're doing.

{% highlight bash %}
$ cat sample.txt
Dreamcatcher +1 brunch, tofu Helvetica single-origin coffee
distillery trust fund lo-fi.

$ ww -w55 -i sample.txt

$ cat sample.txt
Dreamcatcher +1 brunch, tofu Helvetica single-origin
coffee
distillery trust fund lo-fi.
{% endhighlight %}

The other change is not related to the `ww` utility directly, but in case
you're using the `word_wrap` library in your gems, you can now take advantage of
the `#wrap!` and `#fit!` functions that will modify the string in place, rather
than returning a modified copy.

## Summary
These were not big changes, but I hope they make `ww` even easier to use in
different settings. All the above-mentioned changes are available from version
0.2.1. If you're interested, you can get it from
[RubyGems](http://rubygems.org/gems/word_wrap), or download the sources of the
gem from [GitHub](https://github.com/pazdera/word_wrap).

If you have any questions, comments, suggestions, or problems, please [let me
know](https://twitter.com/radekpazdera), I’ll be happy to help you :-).

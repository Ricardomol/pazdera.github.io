---
layout: post
title: Word-wrap in Ruby
description: "As simple as it gets CLI tool and Ruby library."
cover: telephone.jpg
comments: true
categories:
- Software
tags:
- word-wrap
- ruby gem
- ww
---
I spent a couple of hours this week making and releasing my very first Ruby
gem. It is a really small and simple utility to word-wrap text files. That's
all what it can do and in fact, the simplicity plays a key role in it.

I implemented the wrapping code when I was migrating this website from
[Wordpress.com](http://wordpress.com) to [Jekyll](http://jekyllrb.com) a couple
of weeks ago. I will probably never use the original script that helped me
convert the posts from HTML to Markdown, but I thought it would be a good idea
to keep the wrapping algorithm so I can use it easily in the future. So I
turned it to the [word_wrap](https://rubygems.org/gems/word_wrap/) gem.

## How it works
The gem is hosted on [RubyGems.org](https://rubygems.org/gems/word_wrap/), so
you can get it using either bundler or installing it directly via:

{% highlight bash %}
$ gem install word_wrap
{% endhighlight %}

### In the command line
After installing it, you'll able to use the `ww` program. It's interface is very
simple. You can pass a file to be word-wrapped either via an argument or the
standard input. In both cases, the result will be written to stdout. You can
specify the maximum width via the -w parameter (the default width is set to 80)
and you can also enable exact fit (described bellow) by passing the -f flag. A
few examples follow.

{% highlight bash %}
$ cat hip.txt
Forage Shoreditch disrupt Pitchfork meh.

Mustache 3 wolf moon gluten-free whatever master burn
vinyl.

$ ww -w20 hip.txt
Forage Shoreditch
disrupt Pitchfork
meh.

Mustache 3 wolf moon
gluten-free whatever
master burn
vinyl.
{% endhighlight %}

### In Ruby
The Ruby interface is a bit more diverse, but just as simple. First, you will
need to add the following require to your script.

{% highlight ruby %}
require "word_wrap"
{% endhighlight %}

After that, the most convenient way of accessing this functionality is via the
**String** class extensions **#wrap** and **#fit**. The former does wrapping
only, the later one adds the exact fit (the difference is explained bellow).
Again, a couple of example follow.

{% highlight ruby %}
hip=<<EOF
Forage Shoreditch disrupt Pitchfork meh.

Mustache 3 wolf moon gluten-free whatever master burn
vinyl.
EOF

twenty = WordWrap.ww hip, 20
thirty = hip.wrap 30
fourty = hip.fit 40
{% endhighlight %}

### Wrapping vs. fitting
We mentioned two slightly different approaches to wrapping that you can use --
**wrapping only** and **exact fit**. The first one will only modify the lines
that exceed the predefined paragraph width and leave all the others untouched.
That works quite well, only in some cases, it may produce lines with single
words on them.

{% highlight bash %}
$ cat sample.txt
Dreamcatcher +1 brunch, tofu Helvetica single-origin coffee
distillery trust fund lo-fi.

$ ww -w60 sample.txt
Dreamcatcher +1 brunch, tofu Helvetica single-origin
coffee
distillery trust fund lo-fi.
{% endhighlight %}

That doesn't look good at all, so that's why there is the other approach.
Unfortunately, not even the exact fit is ideal. The problem with that one is
that it modifies all the lines and if you'll try to use it with code, it will
most likely bugger up your white-space.

{% highlight bash %}
$ ww -w60 -f sample.txt
Dreamcatcher +1 brunch, tofu Helvetica single-origin
coffee distillery trust fund lo-fi.
{% endhighlight %}

To sum it up, if you work with unformatted plain-text only, you will get better
results with exact fit. However, if your input contains code or any other text
formatted with white-space, stick to the default one.

## Summary
Making simple gems is awesome. They're easy to build, and what's more important
-- even easier to use. Sticking to the good-old ways of UNIX sometimes really
pays off.

Anyway, if you would like to fix something or otherwise contribute to this gem,
I'll be more than happy to help you with that! The gem is licensed under the
MIT license and hosted on [Github](https://github.com/pazdera/word_wrap).

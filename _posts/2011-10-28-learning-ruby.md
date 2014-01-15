---
layout: post
title: Learning Ruby
description: "My personal take on learning the Ruby programming language."
cover: rubies.jpg
comments: true
categories:
- Code
- Software
tags:
- ruby books
- ruby resources
---
I always wanted to learn [Ruby](http://www.ruby-lang.org/en/). It became so
popular over the last couple of years and I hear people praise the language
everywhere I go. Well, time has come and I cannot postpone this anymore (not
with a clear conscience anyway). **So I'm finally learning Ruby.** I went
quickly over the net and also our campus library today, to see what resources
are available for the Ruby newbies.

## Resources

There is a load of good resources on the internet, so before you run into a
bookstore to buy 3000 pages about Ruby, consider starting with the online books
and tutorials. You can always buy something on paper later (I personally like
stuff the old-fashioned way -- on paper more). Here is a list of what I found:

- [Programming Ruby](http://ruby-doc.org/docs/ProgrammingRuby/html/index.html)
by David Thomas and Andy Hunt -- That's right an online version of the Ruby
book from the authors of _The Pragmatic Programmer_
- [Ruby Programming
WikiBook](http://en.wikibooks.org/wiki/Ruby_programming_language)
- [Ruby Learning](http://rubylearning.com/)

That would be some of the online sources for Ruby beginners. And now something
on paper:

- [The Ruby Way](http://www.amazon.co.uk/Ruby-Way-Programming-Addison-Wesley-Professional/dp/0672328844)
by Hal Fulton -- Great, but sort-of-a big-ass book. Just don't go for the Czech translation, it's horrifying.
- [Learning Ruby](http://www.amazon.co.uk/Learning-Ruby-Michael-Fitzgerald/dp/0596529864/ref=sr_1_1?s=books&ie=UTF8&qid=1319657585&sr=1-1)
by Michael Fitzgerald -- A little more lightweight, recommend pocket-size reading!

I personally read The Ruby Way at home and the Learning Ruby when I'm out
somewhere. Both of them are good. These are the books that I read (because I
could get them in the library). There is a pile of other titles like:

- [The Ruby Programming Language](http://www.amazon.com/Ruby-Programming-Language-David-Flanagan/dp/0596516177/ref=pd_sim_b_1)
- [Ruby Cookbok](http://www.amazon.com/Cookbook-Cookbooks-OReilly-Lucas-Carlson/dp/0596523696/ref=pd_sim_b_3)
- [Eloquent Ruby](http://www.amazon.com/Eloquent-Ruby-Addison-Wesley-Professional/dp/0321584104/ref=pd_sim_b_4)
- [Programming Ruby 1.9](http://www.amazon.com/Programming-Ruby-1-9-Pragmatic-Programmers/dp/1934356085/ref=pd_sim_b_6)
- [Ruby Best Practices](http://www.amazon.com/Ruby-Best-Practices-Gregory-Brown/dp/0596523009/ref=pd_sim_b_8)
- [Begining Ruby](http://www.amazon.com/Beginning-Ruby-Professional-Peter-Cooper/dp/1430223634/ref=pd_sim_b_9)

Just pick your own and you can start learning :-).

## Installation

Ruby is interpreted language so we will need to install the ruby interpret. On
Linux it's fairly simple, most distributions have ruby packed in their software
repositories. On Fedora 15 write `sudo yum install ruby` . On Debian-based
distros `sudo apt-get install ruby` . If you are Windows user, **please**, do
yourself a favor and try [Ubuntu](http://www.ubuntu.com/)!

To check whether the ruby interpret is available go to terminal and type

{% highlight bash %}
$ ruby --version
{% endhighlight %}

## Hello Matz!

The only thing that's missing is the famous Hello World :-)! In Ruby the code
looks something like this:

{% highlight ruby %}
#!/usr/bin/env ruby
puts "Hello Matz!"
{% endhighlight %}

## Summary

From what I saw during my yesterdays quick tour through Ruby, I can say, that
it's a very interesting language. I'd recommend anyone to give it a shot! I
definitely will.

## Sources

- [1] [Ruby home](http://www.ruby-lang.org/en/)
- [2] [Programming Ruby](http://ruby-doc.org/docs/ProgrammingRuby/html/index.html)

---
layout: post
title: Private, protected and public in Python
description: "How does encapsulation (not) work in Python."
cover: nature.jpg
comments: true
categories:
- Code
- Software
tags:
- encapsulation
- Python
---
A lot of folks learn object-oriented programming with languages like C++ and
Java. And while they learn, they're told repeatedly (over and over again),
that [encapsulation](http://en.wikipedia.org/wiki/Encapsulation_%28object-oriented_programming%29)
is one of the key principles of object-oriented paradigm and that they should
take advantage of it. Sure, until you get down with
[Python](http://www.python.org/) :-).

In C++ and Java, things are pretty straight-forward. There are 3 magical and
easy to remember access modifiers, that will do the job (public, protected
and private). But there's no such a thing in Python. That might be a little
confusing at first, but it's possible too. We'll have look at how do it
**right** in Python.

Python doesn't have any mechanisms, that would effectively restrict you from
accessing a variable or calling a member method. All of this is a matter of
[culture](http://stackoverflow.com/questions/1641219/does-python-have-private-variables-in-classes)
and **convention**.

## Public

All member variables and methods are public by default in Python. So when you
want to make your member public, you just do nothing. See the example bellow:


{% highlight python %}
class Cup:
    color = None
    content = None

    def fill(self, beverage):
        content = beverage

    def empty(self):
        content = None
{% endhighlight %}

We have there a `class Cup`. And here's what we can do with it:


{% highlight python %}
redCup = Cup()
redCup.color = "red"
redCup.content = "tea"
redCup.empty()
redCup.fill("coffee")
{% endhighlight %}


All of this is good and acceptable, because all the attributes and methods
are **public**.

## Protected

Protected member is (in C++ and Java) accessible **only** from within the
class and it's subclasses. How to accomplish this in Python? The answer is
-- **by convention**. By prefixing the name of your member with **a single
underscore**, you're telling others "[don't touch this, unless you're a subclass](http://www.youtube.com/watch?v=otCpCn0l4Wo)".
See the example bellow:


{% highlight python %}
class Cup:
    color = None
    _content = None # protected variable

    def fill(self, beverage):
        _content = beverage

    def empty(self):
        _content = None
{% endhighlight %}


Same example as before, but the content of the cup is now protected. This
changes virtually nothing, you'll still be able to access the variable from
outside the class, only if you see something like this:


{% highlight python %}
cup = Cup()
cup._content = "tea"
{% endhighlight %}


you explain politely to the person responsible for this, that the variable
is protected and he should not access it or even worse, change it from
outside the class.

## Private

By declaring your data member private you mean, that nobody should be able to
access it from outside the class, i.e. strong
[you can't touch this](http://www.youtube.com/watch?v=otCpCn0l4Wo) policy.
Python supports a technique called [name mangling](http://en.wikipedia.org/wiki/Name_mangling#Name_mangling_in_Python).
This feature turns every member name **prefixed with at least two underscores
and suffixed with at most one underscore** into `_<className><memberName>` .
So how to make your member private? Let's have a look at the example bellow:


{% highlight python %}
class Cup:
    _color = None    # protected variable
    __content = None # private variable

    def __init__(self, color):
        _color = color

    def fill(self, beverage):
        __content = beverage

    def empty(self):
      __content = None
{% endhighlight %}

Our cup now can be only filled and poured out by using `fill()` and `empty()`
methods. Note, that if you try accessing `__content` from outside, you'll get
an error. But you can still stumble upon something like this:

{% highlight python %}
redCup = Cup("red")
redCup._Cup__content = "tea"
{% endhighlight %}

This will work, except, in case you see this, you kick your colleague, who's
responsible for it [hard in the nuts](http://www.youtube.com/watch?v=otCpCn0l4Wo&feature=player_detailpage#t=128s).

## Sources

- [Name mangling @wiki](http://en.wikipedia.org/wiki/Name_mangling#Name_mangling_in_Python)
- [Python docs](http://docs.python.org/tutorial/classes.html)

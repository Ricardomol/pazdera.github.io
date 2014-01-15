---
layout: post
title: 'Design Patterns: Singleton'
categories:
- Code
- Design Patterns
- Software
tags:
- design patterns
- object-oriented
- C++
- Python
- signleton
status: publish
type: post
published: true
image:
  feature: abstract-1.jpg
share: true
comments: true
---
Let's start with something simple. Singleton is probably the most basic of
design patterns. When someone explains the term *design pattern*, you can be
sure that, at some point, he will mention the **singleton**.

I won't go through the whole theory, there are a way to many good sources,
that explain singleton well already. I'll just focus on the code. So we would
like to have a single, one and only globally accessible instance of a certain
class in our program. There are couple steps we need to do:

- Have some place to store the instance -- **static variable**.
- Have some way of globally accessing the instance -- **static method**.
- Prevent any other way of instantiation the class -- **disable constructor**.

## C++

Implementation in C++ is pretty straight-forward. All the tasks mentioned
above are easy to achieve with C++. Here is the code:

{% highlight cpp %}
class Singleton
{
    private:
        /* Here will be the instance stored. */
        static Singleton *instance;

        /* Private constructor to prevent instantiation. */
        Singleton(); public:

        /* Static access method. */
        static Singleton *getInstance();
};

/* Null, because instance will be initialized on demand. */
Singleton *Singleton::instance = 0;

Singleton *Singleton::getInstance()
{
    if (instance == 0) {
        instance = new Singleton();
    }

    return instance;
}

Singleton::Singleton() {}
{% endhighlight %}


You can download the whole code [here](https://gist.github.com/1098119).

## Python

In Python situation gets a little bit stickier, but it's not that hard to
produce a singleton class as well. The problem is, that there's no such a
thing as private constructor in Python. So, you need to find another way of
preventing multiple instantiation of the class. This can be achieved by
raising an exception in constructor which works ok, but some might not
consider that a good practice since exceptions should be use only for errors.
Let's have look at the code:

{% highlight python %}
class Singleton:
    # Here will be the instance stored.
    __instance = None

    @staticmethod
    def get_instance():
        """ Static access method. """

        if Singleton.__instance == None:
            Singleton()
            return Singleton.__instance

    def __init__(self):
    """ Virtually a private constructor. """

        if Singleton.__instance != None:
            raise Exception("This class is a singleton!")
        else:
            Singleton.__instance = self
{% endhighlight %}

Again, you can get the whole thing [here](https://gist.github.com/1098129).

## Sources

- [http://sourcemaking.com/design\_patterns/singleton](http://sourcemaking.com/design_patterns/singleton)


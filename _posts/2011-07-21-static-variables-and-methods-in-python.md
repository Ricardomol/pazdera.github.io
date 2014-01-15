---
layout: post
title: Static variables and methods in Python
description: "Bringing a bit of C++ to Python."
cover: tower-bridge-2.jpg
comments: true
categories:
- Code
- Software
tags:
- object-oriented
- Python
- static member
- static method
- static variable
---
How to declare a data member or a method
[static](http://en.wikipedia.org/wiki/Method_%28computer_programming%29#Static_methods)
in Python? Static means, that the member is on a class level rather on the
instance level. Static variables exist only in single instance per class and
are not instantiated. If a static variable is changed in one instance of the
class, the change will affect its value in all other instances.

Static methods don't refer to any instance of the class and can be called
outside of it. They also cannot access any non-static data members of the
class for obvious reasons. Let's have a look how to get some static from
Python.

## Variables

All variables defined on the class level in Python are considered static.
See this example:

{% highlight python %}
class Example:
    staticVariable = 5 # Access through class

print Example.staticVariable # prints 5

# Access through an instance
instance = Example()
print instance.staticVariable # still 5

# Change within an instance
instance.staticVariable = 6
print instance.staticVariable # 6
print Example.staticVariable # 5

# Change through
class Example.staticVariable = 7
print instance.staticVariable # still 6
print Example.staticVariable # now 7
{% endhighlight %}


Seems pretty straight-forward to me. Only confusion might come from the fact,
that you can have two different variables in your class under the same name
(one static and one ordinary). But I recommend (for your own sakes) to avoid
that behavior entirely.

## Methods

With static methods it gets a little more complex. In Python, there are two
ways of defining static methods within a class.

### @staticmethod

Method decorated with this decorator shares with the class only the namespace.
Note that, no arguments are mandatory in the method definition. Static method
can access classes static variables. See in the following example:

{% highlight python %}
class Example:
    name = "Example"

    @staticmethod
    def static():
        print "%s static() called" % Example.name

class Offspring1(Example):
    name = "Offspring1"

class Offspring2(Example):
    name = "Offspring2"

    @staticmethod
    def static():
        print "%s static() called" % Offspring2.name

Example.static() # prints Example
Offspring1.static() # prints Example
Offspring2.static() # prints Offspring2
{% endhighlight %}

### @classmethod

The difference between class method and static method in Python is, that class
method recieves one mandatory argument -- a class name it was called from.
Let's have a look:


{% highlight python %}
class Example:
    name = "Example"

    @classmethod
    def static(cls):
        print "%s static() called" % cls.name

class Offspring1(Example):
    name = "Offspring1"
    pass

class Offspring2(Example):
    name = "Offspring2"

    @classmethod
    def static(cls):
        print "%s static() called" % cls.name

Example.static()    # prints Example
Offspring1.static() # prints Offspring1
Offspring2.static() # prints Offspring2 
{% endhighlight %}


Which one should you use? The first option allows you only to access the
static variables in the same class. With the second approach you'll be able
to modify class variables of the subclasses without the neccessity of
redefining the method when using inheritance. I prefer the first variant,
because I personaly think it's a cleaner solution, but the second variant
might come useful in certain situations as well.

## Sources

- [Static vs. Class method @ RAPD](http://rapd.wordpress.com/2008/07/02/python-staticmethod-vs-classmethod/)
- [Static variable @ stack overflow](http://stackoverflow.com/questions/68645/static-class-variables-in-python)

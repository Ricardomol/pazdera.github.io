---
layout: post
title: 'Design Patterns: Prototype'
categories:
- Code
- Design Patterns
- Software
tags:
- C++
- code
- design patterns
- object-oriented
- Python
- software design
- source
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
Prototype is one of the easier to understand design patterns. The intent of
prototype is to create new instances of classes by **cloning a prototype
instance**, rather than building them from scratch. This is particularly useful
when the initialization of the objects is very expensive and very similar among
the majority of created instances.

Take this for instance, you have some data stored on a remote server. You need
them to initialize 1000 instances of some class during your program runtime.
This data are static and very unlikely to be changed during the runtime of your
application. You see, that downloading the data during initialization in
constructor is pretty ineffective. Design like that would lead to exactly 999
pointless connections to the server and a lot of unnecessary network traffic,
which is a gigantic waste of resources and time. If you use prototype instead,
the application will download the data just once and the 1000 more instances
will be cloned from the first one, saving us all the trouble.

There are three participants in the prototype pattern:

- **Client** - creates a new object by asking a prototype to clone itself.
- **Prototype** - declares an interface for cloning itself.
- **Concrete Prototype** - implements the operation for cloning itself.

You also need a place where all the prototypes will be stored. A good practice
is using a **factory class** that will cover the initial prototype setup  and
will handle the cloning operations. This might remind you of the [abstract
factory](http://linuxwell.wordpress.com/2011/07/24/design-patterns-abstract-factory/
"Design Patterns: Abstract Factory") design pattern. This is because they both
are creational patterns and can be used to achieve the same behavior. The thing
about prototype is that, you can dynamically change the prototype instance
during the runtime and begin constructing something completely different with
the same factory without sub-classing it.

Another way of dynamic handling a lot of prototype instances is **prototype
manager**. A class that stores a pool of prototypes and makes decisions on
which one to instantiate based on some parameters. This is particularly useful
when the amount of prototypes isn't fixed.

Now, let's proceed to the code examples. I went with the first variant -- a
factory class for storing the prototypes.

## C++

{% highlight cpp %}
/*
* Example of `prototype' design pattern.
* Copyright (C) 2011 Radek Pazdera
*/

#include <iostream>
#include <string>

/* Prototype base class. */
class Prototype
{
    protected:
        std::string type;
        int value;

    public:
        virtual Prototype* clone() = 0;

        std::string getType()
        {
            return type;
        }

        int getValue()
        {
            return value;
        }
};

class ConcretePrototype1 : public Prototype
{
    public:
        ConcretePrototype1(int number)
        {
            type  = "Type1";
            value = number;
        }

        Prototype* clone()
        {
            return new ConcretePrototype1(*this);
        }
};

class ConcretePrototype2 : public Prototype
{
    public:
        ConcretePrototype2(int number)
        {
            type  = "Type2";
            value = number;
        }

        Prototype* clone()
        {
            return new ConcretePrototype2(*this);
        }
};

/* Factory that manages prorotype instances and produces their clones. */
class ObjectFactory
{
    static Prototype* type1value1;
    static Prototype* type1value2;
    static Prototype* type2value1;
    static Prototype* type2value2;

    public:
        static void  initialize()
        {
            type1value1 = new ConcretePrototype1(1);
            type2value1 = new ConcretePrototype2(1);
        }

        static Prototype* getType1Value1()
        {
            return type1value1->clone();
        }

        static Prototype* getType2Value1()
        {
            return type2value1->clone();
        }
};

int main()
{
    ObjectFactory::initialize();
    Prototype* object;

    /* All the object were created by cloning the prototypes. */
    object = ObjectFactory::getType1Value1();
    std::cout << object->getType() << ": " << object->getValue() << std::endl;

    object = ObjectFactory::getType2Value1();
    std::cout << object->getType() << ": " << object->getValue() << std::endl;

    return 0;
}
{% endhighlight %}
[Download](https://gist.github.com/1122349) the fully working example from
github.

## Python

{% highlight python %}
#!/usr/bin/env python
# -*- coding: utf-8 -*-
 
# Example of `prototype' design pattern
# Copyright (C) 2011 Radek Pazdera

import copy

class Prototype:

    """ Object, that can be cloned.

    This is just a base class, so the clone() method
    is not implemented. But all subclasses have to
    override it.
    """

    _type  = None
    _value = None

    def clone(self):
        pass

    def getType(self):
        return self._type

    def getValue(self):
        return self._value

class Type1(Prototype):

    """ Concrete prototype.

    Implementation of Prototype. Important part is the
    clone() method.
    """

    def __init__(self, number):
        self._type = "Type1"
        self._value = number

    def clone(self):
        return copy.copy(self)

class Type2(Prototype):
    """ Concrete prototype. """

    def __init__(self, number):
        self._type = "Type2"
        self._value = number

    def clone(self):
        return copy.copy(self)

class ObjectFactory:

    """ Manages prototypes.

    Static factory, that encapsulates prototype
    initialization and then allows instatiation
    of the classes from these prototypes.
    """

    __type1Value1 = None
    __type2Value1 = None

    @staticmethod
    def initialize():
        ObjectFactory.__type1Value1 = Type1(1)
        ObjectFactory.__type2Value1 = Type2(1)

    @staticmethod
    def getType1Value1():
        return ObjectFactory.__type1Value1.clone()

    @staticmethod
    def getType2Value1():
        return ObjectFactory.__type2Value1.clone()


def main():
    ObjectFactory.initialize()

    instance = ObjectFactory.getType1Value1()
    print "%s: %s" % (instance.getType(), instance.getValue())

    instance = ObjectFactory.getType2Value1()
    print "%s: %s" % (instance.getType(), instance.getValue())
{% endhighlight %}
[Download](https://gist.github.com/1122366) the fully working example from
github.

## Sources

- [http://sourcemaking.com/design\_patterns/prototype](http://sourcemaking.com/design_patterns/prototype)
- [http://www.oodesign.com/prototype-pattern.html](http://www.oodesign.com/prototype-pattern.html)
- [http://en.wikipedia.org/wiki/Prototype\_pattern](http://en.wikipedia.org/wiki/Prototype_pattern)

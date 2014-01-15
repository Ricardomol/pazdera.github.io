---
layout: post
title: 'Design Patterns: Bridge'
categories:
- Code
- Design Patterns
- Software
tags:
- C++
- code
- design patterns
- object-oriented
- programming
- Python
- software design
- software development
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
Today I'm going to write some examples of **Bridge**. The [design
pattern](http://www.oodesign.com/bridge-pattern.html) not the
[game](http://www.youtube.com/watch?v=TQRdnEtzjiQ). Bridge is a _structural
pattern_ that decouples abstraction from the implementation of some component
so the two can vary independently. The bridge pattern can also be thought of as
two layers of abstraction[3].

Bridge pattern is useful in times when you need to switch between multiple
implementations at runtime. Another great case for using bridge is when you
need to couple pool of interfaces with a pool of implementations (e.g. 5
different interfaces for different clients and 3 different implementations for
different platforms). You need to make sure, that there's a solution for every
type of client on each platform. This could lead to very large number of
classes in the inheritance hierarchy doing virtually the same thing. The
implementation of the abstraction is moved one step back and hidden behind
another interface. This allows you to outsource the implementation into another
(orthogonal) inheritance hierarchy behind another interface. The original
inheritance tree uses implementation through the bridge interface. Let's have a
look at diagram in **Figure 1**.

<figure>
	<a href="/assets/images/posts/bridge.png">
        <img src="/assets/images/posts/bridge.png" alt="Bridge Pattern UML Diagram">
    </a>
    <figcaption>Bridge Pattern UML Diagram</figcaption>
</figure>

As you can see, there are two orthogonal inheritance hierarchies. The first
one is behind `ImplementationInterface` . This implementation is _injected_
using aggregation through `Bridge` class into the second hierarchy under the
`AbstractInterface` . This allows having multiple cases coupled with multiple
underlying implementations. The Client then uses objects through
`AbstractInterface` . Let's see it in code.

## C++

{% highlight cpp %}
/* Implemented interface. */
class AbstractInterface
{
    public:
        virtual void someFunctionality() = 0;
};

/* Interface for internal implementation that Bridge uses. */
class ImplementationInterface
{
    public:
        virtual void anotherFunctionality() = 0;
};

/* The Bridge */
class Bridge : public AbstractInterface
{
    protected:
        ImplementationInterface* implementation;

    public:
        Bridge(ImplementationInterface* backend)
        {
            implementation = backend;
        }
};

/* Different special cases of the interface. */

class UseCase1 : public Bridge
{
    public:
        UseCase1(ImplementationInterface* backend)
          : Bridge(backend)
        {}

        void someFunctionality()
        {
            std::cout << "UseCase1 on ";
            implementation->anotherFunctionality();
        }
};

class UseCase2 : public Bridge
{
    public:
        UseCase2(ImplementationInterface* backend)
          : Bridge(backend)
        {}

        void someFunctionality()
        {
            std::cout << "UseCase2 on ";
            implementation->anotherFunctionality();
        }
};

/* Different background implementations. */

class Windows : public ImplementationInterface
{
    public:
        void anotherFunctionality()
        {
            std::cout << "Windows" << std::endl;
        }
};

class Linux : public ImplementationInterface
{
    public:
        void anotherFunctionality()
        {
            std::cout << "Linux!" << std::endl;
        }
};

int main()
{
    AbstractInterface *useCase = 0;
    ImplementationInterface *osWindows = new Windows;
    ImplementationInterface *osLinux = new Linux;

    /* First case */
    useCase = new UseCase1(osWindows);
    useCase->someFunctionality();

    useCase = new UseCase1(osLinux);
    useCase->someFunctionality();

    /* Second case */
    useCase = new UseCase2(osWindows);
    useCase->someFunctionality();

    useCase = new UseCase2(osLinux);
    useCase->someFunctionality();

    return 0;
}
{% endhighlight %}
[Download](https://gist.github.com/1147487) complete source file from github.

## Python

{% highlight python %}
class AbstractInterface:

    """ Target interface.

    This is the target interface, that clients use.
    """

    def someFunctionality(self):
        raise NotImplemented()

class Bridge(AbstractInterface):

    """ Bridge class.

    This class forms a bridge between the target
    interface and background implementation.
    """

    def __init__(self):
        self.__implementation = None

class UseCase1(Bridge):

    """ Variant of the target interface.

    This is a variant of the target Abstract interface.
    It can do something little differently and it can
    also use various background implementations through
    the bridge.
    """

    def __init__(self, implementation):
        self.__implementation = implementation

    def someFunctionality(self):
        print "UseCase1: ",
        self.__implementation.anotherFunctionality()

class UseCase2(Bridge):
    def __init__(self, implementation):
        self.__implementation = implementation

    def someFunctionality(self):
        print "UseCase2: ",
        self.__implementation.anotherFunctionality()

class ImplementationInterface:

    """ Interface for the background implementation.

    This class defines how the Bridge communicates
    with various background implementations.
    """

    def anotherFunctionality(self):
        raise NotImplemented

class Linux(ImplementationInterface):

    """ Concrete background implementation.

    A variant of background implementation, in this
    case for Linux!
    """

    def anotherFunctionality(self):
        print "Linux!"

class Windows(ImplementationInterface):
    def anotherFunctionality(self):
        print "Windows."

def main():
    linux = Linux()
    windows = Windows()

    # Couple of variants under a couple
    # of operating systems.
    useCase = UseCase1(linux)
    useCase.someFunctionality()

    useCase = UseCase1(windows)
    useCase.someFunctionality()

    useCase = UseCase2(linux)
    useCase.someFunctionality()

    useCase = UseCase2(windows)
    useCase.someFunctionality()
{% endhighlight %}
[Download](https://gist.github.com/1173009) complete source file from github.

## Summary
The Bridge pattern is very close to the
[Adapter](http://linuxwell.wordpress.com/2011/08/15/design-patterns-adapter/
"Design Patterns: Adapter") by it's structure, but there's a huge difference in
semantics. Bridge is designed up-front to let the abstraction and the
implementation vary independently. Adapter is retrofitted to make unrelated
classes work together [1].

## Sources
1. [http://sourcemaking.com/design\_patterns/bridge](http://sourcemaking.com/design_patterns/bridge)
2. [http://www.oodesign.com/bridge-pattern.html](http://www.oodesign.com/bridge-pattern.html)
3. [http://en.wikipedia.org/wiki/Bridge\_pattern](http://en.wikipedia.org/wiki/Bridge_pattern)

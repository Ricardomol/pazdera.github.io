---
layout: post
title: 'Design Patterns: Factory Method'
categories:
- Code
- Design Patterns
- Software
tags:
- C++
- code
- design patterns
- factroy method
- Python
- software design
status: publish
type: post
image:
  feature: abstract-1.jpg
share: true
comments: true
---
Another design pattern today! The second most common (after the singleton) is,
in my opinion **factory method**. It's a creational design pattern, that's
useful when you need to control creation process of the objects a little more
than by a constructor.

For instance you might want to decide what subclass to create at the runtime
rather than while writing the code. Or you don't care what subclass will be
constructed. Factory method in some more advanced implementations also allows
reusing old objects insead of always creating new instances. The **factory
method** will give you an object when you request it, but the creation process
is encapsulated. That encapsulation is enforced, and allows an object to be
requested without inextricable coupling to the act of creation.

Detailed description of the design pattern can be found at
[sourcemaking.com](http://sourcemaking.com/design_patterns/factory_method).
I'll just throw in the code. In my examples, there's a base class -- a `Cup`
and two subclasses `RedCup` and `BlueCup` . The base class has a factory method
that will get you a cup of the color you like.

## C++

{% highlight cpp %}
#include <iostream>
#include <string>

class Cup
{
    public:
        Cup()
          : color("")
        {}

        std::string color;

        /* This is the factory method. */
        static Cup* getCup(std::string color);
};

class RedCup : public Cup
{
    public:
        RedCup()
        {
            color = "red";
        }
};

class BlueCup : public Cup
{
    public:
        BlueCup()
        {
            color = "blue";
        }
};

Cup* Cup::getCup(std::string color)
{
    if (color == "red")
        return new RedCup();
    else if (color == "blue")
        return new BlueCup();
    else
        return 0;
}


/* A little testing */
int main()
{
    /* Now we decide the type of the cup at
     * runtime by the factory method argument */
    Cup* redCup  = Cup::getCup("red");
    std::cout << redCup->color << std::endl;

    Cup* blueCup = Cup::getCup("blue");
    std::cout << blueCup->color << std::endl;
}
{% endhighlight %}


The whole source file is available on [github](https://gist.github.com/1099562).

## Python

{% highlight python %}
class Cup:
    color = ""

    # This is the factory method
    @staticmethod
    def getCup(cupColor):
        if (cupColor == "red"):
            return RedCup()
        elif (cupColor == "blue"):
            return BlueCup()
        else:
            return None

class RedCup(Cup):
    color = "red"

class BlueCup(Cup):
    color = "blue"

# A little testing
redCup = Cup.getCup("red")
print "%s(%s)" % (redCup.color, redCup.__class__.__name__)

blueCup = Cup.getCup("blue")
print "%s(%s)" % (blueCup.color, blueCup.__class__.__name__)
{% endhighlight %}


The whole source text is available on [github](https://gist.github.com/1099559).

## Sources

- [http://sourcemaking.com/design\_patterns/factory\_method](http://sourcemaking.com/design_patterns/factory_method)
- [http://objekty.vse.cz/Objekty/Vzory-Factory](http://objekty.vse.cz/Objekty/Vzory-Factory)



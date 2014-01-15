---
layout: post
title: Interface Segregation Principle
categories:
- Software
tags:
- C++
- code
- interface segregation principle
- isp
- object-oriented
- object-oriented software design
- programming
- software
- software design
- software development
- SOLID
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
**ISP**, not _Internet Service Provider_, but **Interface Segregation
Principle** is the last of the famous principles of
[SOLID](http://linuxwell.wordpress.com/2011/08/05/solid-object-oriented-design/
"SOLID Object-Oriented Design") object-oriented software design. It was
introduced by [Robert C. Martin](http://en.wikipedia.org/wiki/Robert_C._Martin)
in his series of articles in 1996. Intention of this principle is to avoid
creation of "fat" interfaces.

A _fat_ (or _polluted_) interface comes from extending current interface with
some functionality that is useful only to a subset of entities that depends on
it. This phenomenon leads eventually to creation of dummy methods just to be
able to use the interface. And that's bad. Dummy methods are dangerous and also
violate the
[LSP](http://linuxwell.wordpress.com/2011/08/09/liskov-substitution-principle/
"Liskov Substitution Principle"). The ISP as wrote the author declares that

> Clients should not be forced to depend upon interfaces that they do not use.

Each interface should have clearly defined purpose and make reasonable
abstraction of a part of the current problem. The best practice (in my opinion)
is to use multiple inheritance when implementing the interfaces. This method
will separate things that don't logically belong together on the abstraction
level and clean wrong dependencies in our code. But it also allow us to couple
them back together in objects, that cover multiple things and work on the same
data.

Let me show an example of how it should _not_ look like. This is an interface
for a **car**.

{% highlight cpp %}
/* Bad example */
class CarOperation
{
    public:
        virtual void steer(int degrees) = 0;
        virtual void pullHandbrake() = 0;
        virtual void accelerate() = 0;

        virtual void shift(int gear) = 0;

        virtual void toggleAirConditioning() = 0;
};
{% endhighlight %}

There are a couple common things you can do with a car. Every car usually has
a steering wheel, an acceleration pedal and possibly even a handbrake. But what
about those cars with automatic transmission? They don't allow the driver to
shift gears, so what should they do with the shift method? The interface
enforces it's implementaion. And again with air conditioning. Some cars don't
have an air conditioner. The way here is to split `CarOperation` interface into
a couple smaller ones.


{% highlight cpp %}
class BasicCarOperation
{
    public:
        virtual void steer(int degrees) = 0;
        virtual void pullHandbrake() = 0;
        virtual void accelerate() = 0;
};

class GearboxCarOperation
{
    public:
        virtual void shift(int gear) = 0;
};

class AirConditioningCarOperation
{
    public:
        virtual void toggleAirConditioning() = 0;
};

class AlfaRomeo166 : public BasicCarOperation, GearboxCarOperation, AirConditioningCarOperation
{
    /* Implementation of all the interfaces. */
};

class SkodaFavorit136L : public BasicCarOperation, GearboxCarOperation
{
    /* No air conditioning for old cars. */
};
{% endhighlight %}


The clients that will use the concrete cars won't look at them directly as
`AlfaRomeo166` or `SkodaFavorit136L` . They will operate them through the
interfaces. If some client function wants to turn on a air-conditioning it will
look like this

{% highlight cpp %}
void beCool(AirConditioningCarOperation* vehicle)
{
    vehicle->toggleAirConditioning();
}
{% endhighlight %}

That's the beauty of **interface segregation principle**. You get exactly what
you need, nothing more and nothing less, which makes the code easier to
maintain, reuse and saves you from a cascade of unpredictable errors, when you
decide to modify existing code.

## Sources
- [http://www.oodesign.com/interface-segregation-principle.html](http://www.oodesign.com/interface-segregation-principle.html)
- [http://en.wikipedia.org/wiki/Interface\_segregation\_principle](http://en.wikipedia.org/wiki/Interface_segregation_principle)
- [http://www.objectmentor.com/resources/articles/isp.pdf](http://www.objectmentor.com/resources/articles/isp.pdf)

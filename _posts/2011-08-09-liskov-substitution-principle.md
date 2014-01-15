---
layout: post
title: Liskov Substitution Principle
categories:
- Software
tags:
- Liskov Substitution Principle
- LSP
- object-oriented
- OOD principles
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
Another principle of object-oriented software design, the **L** in
[SOLID](http://linuxwell.wordpress.com/2011/08/05/solid-object-oriented-design/
"SOLID Object-Oriented Design"), the **Liskov Substitution Principle**! But
first a little background and some theory (feel free to skip right to the
practical part of the post). The principle is called after [Barbara
Liskov](http://en.wikipedia.org/wiki/Barbara_Liskov), who initially introduced
it in 1987. **Prof. Liskov** first defined it like this

> What is wanted here is something like the following substitution property:
If for each object _O1_ of type _S_ there is an object _O2_ of type _T_ such
that for all programs _P_ defined in terms of _T_, the behavior of _P_ is
unchanged when _O1_ is substituted for _O2_ then _S_ is a subtype of _T_.

This definition is a little other way around. It says (at least I read it like
this), “if you can substitute each _O1_ with some _O2_, it's safe to say, that
_S_ is a subtype of _T_”. But there are cases (not that rare) in which _S_ is
subtype of _T_, but the objects aren't substitutable (and that's bad). It was
later rephrased and published in a paper by Barbara Liskov and Jeannette Wing
in 1994. The formulation changed to

> Let _q(x)_ be a property provable about objects _x_ of type _T_. Then _q(y)_
should be provable for objects _y_ of type _S_ where _S_ is a subtype of _T_.

This is a little better. Now it says that if something works for objects of
type _T_, it should work for objects of type _S_ as well in case that _S_ is a
subtype of _T_. And that's the **Liskov Substitution Principle**. [Robert C.
Martin](http://en.wikipedia.org/wiki/Robert_Cecil_Martin) later described it in
one of his articles like this

> Functions that use pointers or references to base Classes must be able to
use objects of derived classes Without knowing it.

Now, that's how most of us like our software principles, right? No weird
letters or signs -- straight-forward and easy to understand. I like the theory
though :-). Anyway, how is this good in practice in the [regular
everyday](http://www.youtube.com/watch?v=5PsnxDQvQpw) coding? Let's have a look
at some examples. One of the most typical violation is Square-Rectangle class
hierarchy.

One would think that having a `Square` class that is a subclass of `Rectangle`
could be a good idea, right? The relationship represented `Square` _is a_
`Rectangle` seems to work, so let's do it.

{% highlight cpp %}
class Rectangle
{
    int width;
    int height;

    public:
        int getWidth() { return width; }
        int getHeight() { return height; }

        virtual void setWidth(int value) { width = value; }
        virtual void setHeight(int value) { height = value; }
};
{% endhighlight %}

Pretty straight-forward declaration. The square _is a_ rectangle which width
and height are equal. So we redefine the set methods.

{% highlight cpp %}
class Square : public Rectangle
{
    public:
        void setWidth(int value)
        { width = value; height = value; }
        void setHeight(int value)
        { width = value; height = value; }
};
{% endhighlight %}

This modification will make sure, that our square has always all sides equal.
Then consider having a function like this

{% highlight cpp %}
bool test(Rectangle &rectangle)
{
    rectangle.setWidth(2);
    rectangle.setHeight(3);

    return rectangle.getWidth() * rectangle.getHeight() == 6;
}
{% endhighlight %}

This function tests the interface of `Rectangle` . But what happens when you
pass a reference to a `Square` to it? It will break, because of the side effect
of the set methods, that keeps the `Square` a square. So, where's the problem
here?

The square is a rectangle, but_ does not_ share the same behaviour. And that's
a deal-breaker when it comes to inheritance in software. The LSP clarifies that
in OOD the _is a_ relationship applies to public behavior of objects.

[Bertrand Meyer](http://en.wikipedia.org/wiki/Bertrand_Meyer) also explored
the topic in Design by Contract. He states

> ...when redefining a routine [in a derivative], you may only replace its
precondition by a weaker one, and its postcondition by a stronger one.

**Preconditions** are something that must be true in order to the method to
execute and **postconditions** are always true after the method has been
executed. This rule really helps me when I design something. Basically it says,
that you can _only reduce_ the set of preconditions and _only extend_ the set
of postconditions. In other words, the new routine cannot require anything more
than the original one (but can require even less) and cannot yield anything
less then the original one (but can also return something on top of that).

In context with the square-rectangle problem, there were no **preconditions**,
but there was one postcondition to the `setHeight()` method. The postcondition
assumed, that _the set method for height won't change the width_ (that's a
perfectly justified assumption). And this precondition was broken by the
redefined routine of `Square` .

Inheritance is very powerful and important concept in object-oriented design.
But it's also easy to get it dead wrong. The **Liskov Substitution Principle**
should make you thing more about the relationship, when you create one and help
avoid eventual
[oh-moment](http://linuxwell.wordpress.com/2011/08/05/the-oh-moment/ "The
‘Oh’ Moment") coming your way.

## Sources
- [http://en.wikipedia.org/wiki/Liskov\_substitution\_principle](http://en.wikipedia.org/wiki/Liskov_substitution_principle)
- [http://www.objectmentor.com/resources/articles/lsp.pdf](http://www.objectmentor.com/resources/articles/lsp.pdf)



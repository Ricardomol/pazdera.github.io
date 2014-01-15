---
layout: post
title: Open/Closed Principle in Software Design
categories:
- Software
tags:
- Open-Close principle
- software
- software architecture
- software design
- SOLID
- well-formed
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
Open/Closed principle or **OCP** is one of the guidelines that help software
developers achieve high quality software design.

Well, it's actually pretty hard to tell, what _exactly_ does the term
[high quality software mean](http://en.wikipedia.org/wiki/Software_quality).
Back to the OCP.
[Bertrand Meyer](http://en.wikipedia.org/wiki/Bertrand_Meyer "Bertrand Meyer")
is credited as having originated the term _Open/Closed Principle_, which
appeared in his 1988 book _ [Object Oriented Software
Construction](http://en.wikipedia.org/wiki/Object-Oriented_Software_Construction
"Object-Oriented Software Construction")_. It goes like this:

> _Software entities (classes, modules, functions, etc.) should be open for
extension, but closed for modification_.

What does it mean? When you design some piece of software, it's vital to keep
in mind possible places for future extensions. Let's face it, the customer
specifications change with a speed of a guy, who just found out he had
accidentally drunk a whole bottle of extremely effective laxative. So your code
is most certainly going to be a subject of change and extension. And as we
know, it doesn't end well (in either case).

What the principle implies is, that you can think a little forward (build for
today, design for future, right?) and design your software so no changes are
necessary when it comes to adding a new features and functionality. Let the
code speak for itself:

{% highlight python %}
def area(geometric_entity):
    if geometric_entity.type() == SQUARE:
        return geometric_entity.a * geometric_entity.a
    elif geometric_entity.type() == CIRCLE:
        return PI * geometric_entity.r * geometric_entity.r
    else:
        raise UnknownEntityError("I literally have no idea.")
{% endhighlight %}


This is a really dumb example in the first place, but it shows the key aspect
of **OCP**. If you decide, that it'd nice to have your neat area function work
with triangles as well, you need to go here and add another `elif` clause. Then
others will come with requirements on other geometric entities and before you
know it, this 6 harmless, poorly coded lines will turn into 1500-line Riemann
integral solving monster (seen it happen). And if the code monster won't eat
you, your project manager definitely will...

The point is, every time you change something in your software, something else
can go wrong (and according to [Murphy's
laws](http://en.wikipedia.org/wiki/Murphy%27s_law), it usually does). There are
unit tests, which are designated specifically to discover such errors (if you
don't even write unit tests, you're either doomed, a superman or a fellow, who
enjoys a quality time with a gallons of coffee and GNU debugger). But even unit
tests don't get everything and it's generally a good idea to avoid poking [the
bear](http://blogs.guardian.co.uk/news/bear44.jpg), if you absolutely don't
have to.

Software quality might be a little subjective and generally hard to define
formally. So are, as the software quality, this guidelines (that's right, not
rules). They cannot be enforced unconditionally. But it's definitely good to
know, that they're there. And they might help you see flaws in your design
before it's too late and save your ass from getting fired :-P. Or not. Anyway,
Open-Close principle is not the only one, so stay tuned for more premium 95
octane knowledge (ok, I probably watch How I Met Your Mother waaay to much
lately).

## Sources
- [http://en.wikipedia.org/wiki/Open/closed\_principle](http://en.wikipedia.org/wiki/Open/closed_principle)
- [http://blog.symprise.net/2009/06/open-closed-principle-concerns-about-change-in-software-design/](http://blog.symprise.net/2009/06/open-closed-principle-concerns-about-change-in-software-design/)
- [http://www.threeriversinstitute.org/blog/?p=242](http://www.threeriversinstitute.org/blog/?p=242)
- [http://www.oodesign.com/open-close-principle.html](http://www.oodesign.com/open-close-principle.html)



---
layout: post
title: Dependency Inversion Principle
comments: true
categories:
- Software
tags:
- SOLID
- dependency inversion principle
- object-oriented
- software design
- software development
---
**DIP** or **Dependency Inversion Principle** is yet another guideline for the
software designers that work in object-oriented environment. It's the **D** in
[SOLID](/2011/08/05/solid-object-oriented-design/
"SOLID Object-Oriented Design") and it has one huge advantage over the other
principles: in case it doesn't work for you, you can always get some [tortilla
chips](http://en.wikipedia.org/wiki/Dip_%28food%29) to help (they work
wonderfully with dip ;-)).

This principle was introduced by [Robert C.
Martin](http://en.wikipedia.org/wiki/Robert_C._Martin) in [his
article](http://www.objectmentor.com/publications/dip.pdf) in 1996. He points
out that the usual way of dependency design among software project is to make
general high-level modules dependent on the low-level utilities and mechanism
that do the hard (and in most cases also not very interesting) work. This way
of dependency makes the high level modules very hard to reuse without many
modifications (and people often thing "why the hell didn't I wrote it again").
And this is _wrong_.

The high-level modules are key part of the application. That's where the
_heart_ of the application actually is. The algorithm that _knows_ how to use
the lower-level modules to achieve the desired functionality of our
application. And we want to reuse that without having to modify every third
line, so what do we do?

Mr. Martin proposes the **Dependency Inversion Principle**, which says >

> **A.** High level modules should not depend upon low level modules. Both
should depend upon abstractions. **B.** Abstractions should not depend upon
details. Details should depend upon abstractions.

It's a little tough one to understand at first, so let me explain. The
principle states, that there should be some additional layer between high and
low level modules -- **the layer of abstractions**. The author says, that there
should be an interface (or abstraction) defined between those two modules on
whom should both depend. That way high level modules don't work directly with
the low level classes. Low level classes implement the interfaces. In case
you'd like to take some module out and use it elsewhere, you don't need to
touch anything inside that module. You simply take it out and implement the
interfaces upon which the module depends. Isn't that awesome?

The second part (part **B**.) makes clear that the abstractions (or
interfaces) should not be designed according to the low level modules (the
details). That's something that might come naturally to a lazy coder "yeah,
I'll just duplicate the header file, make all methods pure virtual and I'm good
to go", [no](http://www.youtube.com/watch?v=X21mJh6j9i4). The interfaces have
to be implemented on the same level of abstraction as the high level module
otherwise they're more than useless.

## Example of Dependency Inversion

That would be the principle in theory. Let's see some examples from user
interfaces. We'll have a `Window` class with two buttons.

{% highlight cpp %}
class Button
{
    public:
        void makeVisible();
};

class Window
{
    Button* okButton;
    Button* cancelButton;

    Window()
    {
        okButton = new Button;
        okButton->makeVisible();

        cancelButton = new Button;
        cancelButton->makeVisible();
    }

};
{% endhighlight %}

The problem here is, that if the `Button` implementation changes, we'll have
to go here and change the constructor as well. We don't want that, because the
Window class were a subject of a lot of tests, it passed and any additional
messing around in it might introduce errors into the class. Using the
abstraction layer the situation would look like this


{% highlight cpp %}
class IButton
{
    public:
        static virtual IButton* getInstance() = 0; // factory method
        virtual void show() = 0;
};

class Window
{
    IButton* okButton;
    IButton* cancelButton;

    public:
        Window()
        {
            okButton = IButton::getInstance();
            okButton->show();

            cancelButton = IButton::getInstance();
            cancelButton->show();
        }
};

class Button : public IButton
{
    public:
        void show();
};
{% endhighlight %}


Now, as you can see, there's an interface `IButton` and both `Button` and
`Window` depend on this interface. And that's the dream. You can take the
window and the interface place into an another application, implement the
interface and you're good to go! Note the [factory
method](http://linuxwell.wordpress.com/2011/07/22/design-patterns-factory-method/
"Design Patterns: Factory Method") I used to be able to get the correct
instance of buttons.

## Sources
- [http://www.objectmentor.com/publications/dip.pdf](http://www.objectmentor.com/publications/dip.pdf)
- [http://www.oodesign.com/dependency-inversion-principle.html](http://www.oodesign.com/dependency-inversion-principle.html)
- [http://en.wikipedia.org/wiki/Dependency\_inversion\_principle](http://en.wikipedia.org/wiki/Dependency_inversion_principle)

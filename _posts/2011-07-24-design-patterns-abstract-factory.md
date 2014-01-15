---
layout: post
title: 'Design Patterns: Abstract Factory'
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
- software
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
I'm trying to keep up the tempo and do a design pattern a day, so here goes
another one! Today it's
[abstract factory](http://sourcemaking.com/design_patterns/abstract_factory).
I wrote a post about the
[factory method](http://linuxwell.wordpress.com/2011/07/22/design-patterns-factory-method/)
yesterday and this one (as you can guess) is somewhat similar.

What exactly is an **abstract factory**? It's from the creational patterns
group, so it controls object creation. The intent is to abstract creating whole
families of objects without specifying concrete classes. We have a class called
**abstract factory** that controls the creation. The class is abstract, because
it has only virtual methods. This interface is later implemented by concrete
factory classes. These object factories then creates a matching set of objects
under some circumstances.

Take this for instance, you have a certain set of objects, that works on
Windows and a certain set of objects, that does the same job, but under Linux.
In this case there will be two subclasses of the abstract factory class. One
that will create objects for windows and the second one for Linux. At the
runtime, you create an instance of either one, depending on what platform is
the program running on and the factory will build the appropriate set of
objects.

More in-depth explanation is
[here](http://sourcemaking.com/design_patterns/abstract_factory). I'm trying to
focus at the code examples:

## User Interface Example with Gimp

The code is not as straight-forward as the previous, I'll try to explain it
with some more detail. I used a picture of GIMP UI to illustrate better what I
mean, but this has absolutely nothing to do with the GIMP's code and how it's
implemented!

<figure>
	<a href="/assets/images/posts/gimp.png">
        <img src="/assets/images/posts/gimp.png" alt="">
    </a>
	<figcaption>GIMP user interface.</figcaption>
</figure>

So take this for instance. Your task is to write user interface for a program.
The interface design says, there will be three windows (like there are in
gimp). Also, among the requirements, there is one that says your code has to
work natively with both -- KDE and Gnome desktop environments. Each of these is
built on a different toolkit. KDE uses Qt, Gnome uses Gtk. So somewhere in your
code, you'll need to check, what environment is available and construct an
object, that will work with the current environment. This is where the abstract
factory comes handy.

You will encapsulate the creation of all the UI components (in this case the
three windows) into the abstract factory. Abstract factory is a class,
something like this:


{% highlight cpp %}
class UIFactory
{
    virtual void Window *getToolboxWindow() = 0;

    virtual void Window *getMainWindow() = 0;
    virtual void Window *getLayersWindow() = 0;
};
{% endhighlight %}


It's an abstract class -- it says, "I can get you the user interface", but it
doesn't say how or what exactly are you going to recieve. Then, for each case
(in our example it's Qt and Gtk), there will be a subclass that implements this
abstract factory, saying "from me, you're going to get Qt/Gtk windows". Then in
your program, you check what your environment is and create an instance of
`QtUIFactory` or `GtkUIFactory` . At this point you can be sure, that all
windows will be constructed with support of the correct environment.

## C++

Here is the implementation of the above in C++.

{% highlight cpp %}
class Window
{
    protected:
        int width;
        int height;
        std::string toolkit;
        std::string type;

        Window(std::string usedToolkit, std::string windowType)
            : toolkit(usedToolkit), type(windowType)
        {}

    public:
        std::string getToolkit();
        std::string getType();
};

class GtkToolboxWindow : public Window
{};

class GtkLayersWindow : public Window
{};

class GtkMainWindow : public Window
{};


class QtToolboxWindow : public Window
{};

class QtLayersWindow : public Window
{};

class QtMainWindow : public Window
{};

/* This is the abstract factory. */
class UIFactory
{
    public:
        virtual Window* getToolboxWindow() = 0;
        virtual Window* getLayersWindow() = 0;
        virtual Window* getMainWindow() = 0;

};

/* Factory for Gtk toolkit */
class GtkUIFactory : public UIFactory
{
    public:
        Window* getToolboxWindow()
        {
            return new GtkToolboxWindow();
        }

        Window* getLayersWindow()
        {
            return new GtkLayersWindow();
        }

        Window* getMainWindow()
        {
            return new GtkMainWindow();
        }
};

/* Factory for Qt toolkit */
class QtUIFactory : public UIFactory
{
    public:
        Window* getToolboxWindow()
        {
            return new QtToolboxWindow();
        }

        Window* getLayersWindow()
        {
            return new QtLayersWindow();
        }

        Window* getMainWindow()
        {
            return new QtMainWindow();
        }
};

int main()
{
    UIFactory* ui = 0;

    /* Check what environment is running
       and create appropriate factory. */
    if (/* Gtk == */ true)
    {
        ui = new GtkUIFactory();
    }
    else
    {
        ui = new QtUIFactory();
    }

    /* Use the factory to build interface. */
    Window* toolbox = ui->getToolboxWindow();
    Window* layers = ui->getLayersWindow();
    Window* main = ui->getMainWindow();

    /* See what have we recieved. */
    std::cout << toolbox->getToolkit() << ":"
              << toolbox->getType() << std::endl;

    std::cout << layers->getToolkit() << ":"
              << layers->getType() << std::endl;

    std::cout << main->getToolkit() << ":"
              << main->getType() << std::endl;
}
{% endhighlight %}

The code has been shortened a little. The fully working source file is
available, as per ushe at [github](https://gist.github.com/1102546).

## Python

And here is the Python version.

{% highlight python %}
class Window:
    __toolkit = ""
    __purpose = ""

    def __init__(self, toolkit, purpose):
        self.__toolkit = toolkit
        self.__purpose = purpose

    def getToolkit(self):
        return self.__toolkit

    def getType(self):
        return self.__purpose

class GtkToolboxWindow(Window):
    def __init__(self):
        Window.__init__(self, "Gtk", "ToolboxWindow")

class GtkLayersWindow(Window):
    def __init__(self):
        Window.__init__(self, "Gtk", "LayersWindow")

class GtkMainWindow(Window):
    def __init__(self):
        Window.__init__(self, "Gtk", "MainWindow")


class QtToolboxWindow(Window):
    def __init__(self):
        Window.__init__(self, "Qt", "ToolboxWindow")

class QtLayersWindow(Window):
    def __init__(self):
        Window.__init__(self, "Qt", "LayersWindow")

class QtMainWindow(Window):
    def __init__(self):
        Window.__init__(self, "Qt", "MainWindow")

# Abstract factory class
class UIFactory:
    def getToolboxWindow(self): pass
    def getLayersWindow(self): pass
    def getMainWindow(self): pass

class GtkUIFactory(UIFactory):
    def getToolboxWindow(self):
        return GtkToolboxWindow()

    def getLayersWindow(self):
        return GtkLayersWindow()

    def getMainWindow(self):
        return GtkMainWindow()

class QtUIFactory(UIFactory):
    def getToolboxWindow(self):
        return QtToolboxWindow()

    def getLayersWindow(self):
        return QtLayersWindow()

    def getMainWindow(self):
        return QtMainWindow()

if __name__ == "__main__":
    gnome = True
    kde   = not gnome

    # What environment is available?
    if gnome:
        ui = GtkUIFactory()
    elif kde:
        ui = QtUIFactory()

    # Build the UI
    toolbox = ui.getToolboxWindow()
    layers  = ui.getLayersWindow()
    main    = ui.getMainWindow()

    # Let's see what have we recieved
    print "%s:%s" % (toolbox.getToolkit(), toolbox.getType())
    print "%s:%s" % (layers.getToolkit(), layers.getType())
    print "%s:%s" % (main.getToolkit(), main.getType())
{% endhighlight %}

The whole thing at [github](https://gist.github.com/1102620).

## Sources

- [http://sourcemaking.com/design\_patterns/abstract\_factory](http://sourcemaking.com/design_patterns/abstract_factory)

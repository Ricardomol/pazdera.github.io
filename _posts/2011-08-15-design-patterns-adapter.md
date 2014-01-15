---
layout: post
title: 'Design Patterns: Adapter'
categories:
- Code
- Design Patterns
- Software
tags:
- adapter
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
And back to design patterns! Today it's time to start with [structural
patterns](http://sourcemaking.com/structural_patterns), since I have finished
all the creational patterns. What are those _structural_ patterns anyway?

> In Software Engineering, Structural Design Patterns are Design Patterns that
ease the design by identifying a simple way to realize relationships
between entities.

The first among the structural design patterns is **Adapter**. The name for it
is totally appropriate, because it does exactly what any other real-life thing
called adapter does. It converts some attribute of one device so it is usable
together with another one. Most common adapters are between various types of
electrical sockets. The adapters usually convert the voltage and/or the shape
of the connector so you can plug-in different devices.

The software adapters work exactly like the outlet adapters. Imagine having
(possibly a third-party) class or module you need to use in your application.
It's poorly coded and it would pollute your nicely designed code. But there's
no other way, you need it's functionality and don't have time to write it from
scratch. The best practice is to write your own adapter and wrap the old code
inside of it. Then you can use your own interface and therefore reduce your
dependence on the old ugly code.

Especially, when the code comes from a third-party module you have no control
on whatsoever. They could change something which would result in breaking your
code on many places. That's just unacceptable.

<figure class="align-center">
	<a href="/assets/images/posts/adapter.png">
        <img src="/assets/images/posts/adapter.png" alt="Adapter pattern example">
    </a>
    <figcaption>Adapter pattern example</figcaption>
</figure>

Here is an example class diagram of adapter use. You see there is some old
interface which the adapter **uses**. On the other end, there is new **target
interface** that the adapter implements. The **client** (i.e. your app) then
uses the daisy fresh new interface. For more explanation see the source code
examples bellow.

## C++

{% highlight cpp %}
typedef int Cable; // wire with electrons

/* Adaptee (source) interface */
class EuropeanSocketInterface
{
    public:
        virtual int voltage() = 0;

        virtual Cable live() = 0;
        virtual Cable neutral() = 0;
        virtual Cable earth() = 0;
};

/* Adaptee */
class Socket : public EuropeanSocketInterface
{
    public:
        int voltage() { return 230; }

        Cable live() { return 1; }
        Cable neutral() { return -1; }
        Cable earth() { return 0; }
};

/* Target interface */
class USASocketInterface
{
    public:
        virtual int voltage() = 0;

        virtual Cable live() = 0;
        virtual Cable neutral() = 0;
};

/* The Adapter */
class Adapter : public USASocketInterface
{
    EuropeanSocketInterface* socket;

    public:
        void plugIn(EuropeanSocketInterface* outlet)
        {
            socket = outlet;
        }

        int voltage() { return 110; }
        Cable live() { return socket->live(); }
        Cable neutral() { return socket->neutral(); }
};

/* Client */
class ElectricKettle
{
    USASocketInterface* power;

    public:
        void plugIn(USASocketInterface* supply)
        {
            power = supply;
        }

        void boil()
        {
            if (power->voltage() > 110)
            {
                std::cout << "Kettle is on fire!" << std::endl;
                return;
            }

            if (power->live() == 1 && power->neutral() == -1)
            {
                std::cout << "Coffee time!" << std::endl;
            }
        }
};

int main()
{
    Socket* socket = new Socket;
    Adapter* adapter = new Adapter;
    ElectricKettle* kettle = new ElectricKettle;

    /* Pluging in. */
    adapter->plugIn(socket);
    kettle->plugIn(adapter);

    /* Having coffee */
    kettle->boil();

    return 0;
}
{% endhighlight %}
[Download](https://gist.github.com/1145857) example from Github.
## Python

{% highlight python %}
# Adaptee (source) interface
class EuropeanSocketInterface:
    def voltage(self): pass

    def live(self): pass
    def neutral(self): pass
    def earth(self): pass

# Adaptee
class Socket(EuropeanSocketInterface):
    def voltage(self):
        return 230

    def live(self):
        return 1

    def neutral(self):
        return -1

    def earth(self):
        return 0

# Target interface
class USASocketInterface:
    def voltage(self): pass

    def live(self): pass
    def neutral(self): pass

# The Adapter
class Adapter(USASocketInterface):
    __socket = None

    def __init__(self, socket):
        self.__socket = socket

    def voltage(self):
        return 110

    def live(self):
        return self.__socket.live()

    def neutral(self):
        return self.__socket.neutral()

# Client
class ElectricKettle:
    __power = None

    def __init__(self, power):
        self.__power = power

    def boil(self):
        if self.__power.voltage() > 110:
            print "Kettle on fire!"
        else:
            if self.__power.live() == 1 and \
               self.__power.neutral() == -1:
                print "Coffee time!"
            else:
                print "No power."

def main():
    # Plug in
    socket = Socket()
    adapter = Adapter(socket)
    kettle = ElectricKettle(adapter)

    # Make coffee
    kettle.boil()

    return 0

if __name__ == "__main__":
    main()
{% endhighlight %}
[Download](https://gist.github.com/1145859) example from Github.

## Summary
The adapter uses the old rusty interface of a class or a module and maps it's
functionality to a new interface that is used by the clients. It's kind of
wrapper for the crappy code so it doesn't get your code dirty.

## Sources
- [http://www.oodesign.com/adapter-pattern.html](http://www.oodesign.com/adapter-pattern.html)
- [http://sourcemaking.com/design\_patterns/adapter](http://sourcemaking.com/design_patterns/adapter)

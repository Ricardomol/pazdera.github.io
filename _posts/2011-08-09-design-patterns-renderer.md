---
layout: post
title: 'Design Patterns: Renderer'
categories:
- Code
- Design Patterns
- Software
tags:
- C++
- code
- design patterns
- graphics
- renderer
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
This post about design patterns will be a little unusual. To this day, I was
going through a generally recognized set of design patterns that was introduced
by the [Gang of Four](http://www.hillside.net/the-gang-of-four) in [Design
Patterns: Elements of Reusable Object-Oriented
Software](http://en.wikipedia.org/wiki/Design_Patterns). But today I want to
introduce to you a useful design bit I came up with, while I was working on my
[bachelor's thesis](http://p-g-c.blogspot.com/). I call it **Renderer**.

The problem I had was simple -- _unbelievable_ mess in my application's source
code. I was working on a procedural approach to rendering cities. And believe
me, a city is kind of big-ass model to draw. There's awful lot of rendering of
different things on different places. And when it comes together it's a giant
blob of instructions. So I needed some way of structuring this rendering code
and making it readable and if-I-got-lucky also extensible (don't judge me, the
due date was really haunting me in my sleep at the time). Finally I came up
with a tree-like data structure.

## What is a Renderer?

Glad you asked! It's a class that renders stuff. The concept is reeeeeally
simple, but it's very powerful when you need to structure your code properly.
The definition of the class is as simple like this


{% highlight cpp %}
class Renderer
{
    public:
        virtual void render();
};
{% endhighlight %}


It's actually more like interface. Every **Renderer** must implement this
interface. The `render()` routine renders the content of the current renderer.
The beauty of this concept is in the fact, that you can organize your renderers
into a tree. The top-level renderer will render the object by delegating
rendering of different parts to other renderers. This makes your code nicely
structured as well as modular and reusable. Take for instance rendering of a
car.

Cars can be visually relatively complex objects and it wouldn't be nice to
have all the rendering code in one class. If you wanted to draw a different car
you'd have to write everything again even though that wheels are virtually the
same in both models. But with using the renderer pattern, things would look
like this

{% highlight cpp %}
class CarRenderer : public Renderer
{
    CarBodyRenderer *body;
    WheelRenderer *wheels[4];
    WindowRenderer windshield;

    public:
        void render()
        {
            body->render();
            windshield->render();

            for (int i = 0; i < 4; i++) {
                wheels[i]->render();
            }
        }
};

class CarBodyRenderer : public Renderer
{
    SpoilerRenderer* spoiler;
    HoodRenderer* hood;
    SkeletonRenderer* skeleton;
    DoorRenderer* doors[5];
    public:
         void render();
};
{% endhighlight %}

I guess you get the idea. You decompose the object into a set of smaller
entities and render them instead. This decomposition can go on virtually
forever, in extreme cases you could be able to render a car from pixels using
this design pattern and still be able to look at your code and understand it.
Anyway, let me know if you find this pattern useful!

## Sources
- [http://www.fit.vutbr.cz/study/DP/rpfile.php?id=11947](http://www.fit.vutbr.cz/study/DP/rpfile.php?id=11947)



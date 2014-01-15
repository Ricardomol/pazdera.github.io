---
layout: post
title: 'Design Patterns: Object Pool'
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
- source
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
Last one from the family of creational patterns is **Object Pool**. The main
purpose of object pool and why designers choose to incorporate to the software
is a performance boost. Construction and destruction of object can become very
expensive operation in some cases (especially if it occurs very often).
Constant building and throwing away instances may significantly slow down your
application. Object Pool pattern offers a solution to this problem. Object pool
is a managed set of reusable objects. Clients then "check out" objects from the
pool return them back when they don't need them any more. But it's not that
easy as it sounds. The manager of the pool has to deal with various problems.

- **What happens if the pool is empty and a client asks for an object?** Some
implementations work with **growing pool** of objects. That means if there's no
object available at the time of the request the pool manager creates one more.
The manager can also destroy objects periodically when they're not used. But
what was the initial goal? Performance boost? Well, with this amount of
overhead it might not be as fast. Another solution to the problem is simply to
decline a client's request if the pool is empty. This also slows down your
system, because clients needs to do things right now and not wait for someone
else to free up resources.
- **When the reservation expires?** The other problem is dealing with errors.
Every client must explicitly free up the resource when he's done. But
programmers are also only humans (well, in most cases) and there will be errors
and your pool can easily become a hole full of zombies. So you might need to
implement an algorithm for detecting and freeing expired reservations on
resources in order to make stuff work properly.
- **Synchronization in multi-threaded applications** Multi-threading brings
into the game a whole other aspect. Two processes asking for resources at the
same time. Some synchronization tools might be necessary as well.

As you can see, there are some serious drawbacks in this pattern. It's a huge
amount of work in the first place, if you decide to implement all the above.
You need to consider every aspect very carefully before you implement the
object pool and evaluate whether it really is, what you need.

The resource manager can be implemented many ways. Static class or singleton
will work. I personally chose singleton. Here is my implementation of object
pool:

## C++

{% highlight cpp %}
/*
 * Example of `object pool' design pattern
 * Copyright (C) 2011 Radek Pazdera
 */

class Resource
{
    int value;

    public:
        Resource()
        {
            value = 0;
        }

        void reset()
        {
            value = 0;
        }

        int getValue()
        {
            return value;
        }

        void setValue(int number)
        {
            value = number;
        }
};

/* Note, that this class is a singleton. */
class ObjectPool
{
    private:
        std::list<Resource*> resources;

        static ObjectPool* instance;
        ObjectPool() {}

    public:
        /**
         * Static method for accessing class instance.
         * Part of Singleton design pattern.
         *
         * @return ObjectPool instance.
         */
        static ObjectPool* getInstance()
        {
            if (instance == 0)
            {
                instance = new ObjectPool;
            }
            return instance;
        }

        /**
         * Returns instance of Resource.
         *
         * New resource will be created if all the resources
         * were used at the time of the request.
         *
         * @return Resource instance.
         */
        Resource* getResource()
        {
            if (resources.empty())
            {
                std::cout << "Creating new." << std::endl;
                return new Resource;
            }
            else
            {
                std::cout << "Reusing existing." << std::endl;
                Resource* resource = resources.front();
                resources.pop_front();
                return resource;
            }
        }

        /**
         * Return resource back to the pool.
         *
         * The resource must be initialized back to
         * the default settings before someone else
         * attempts to use it.
         *
         * @param object Resource instance.
         * @return void
         */
        void returnResource(Resource* object)
        {
            object->reset();
            resources.push_back(object);
        }
};

int main()
{
    ObjectPool* pool = ObjectPool::getInstance();
    Resource* one;
    Resource* two;

    /* Resources will be created. */
    one = pool->getResource();
    one->setValue(10);
    std::cout << "one = " << one->getValue() << " [" << one << "]" << std::endl;

    two = pool->getResource();
    two->setValue(20);
    std::cout << "two = " << two->getValue() << " [" << two << "]" << std::endl;

    pool->returnResource(one);
    pool->returnResource(two);

    /* Resources will be reused.
     * Notice that the value of both resources were reset back to zero.
     */
    one = pool->getResource();
    std::cout << "one = " << one->getValue() << " [" << one << "]" << std::endl;

    two = pool->getResource();
    std::cout << "two = " << two->getValue() << " [" << two << "]" << std::endl;

    return 0;
}
{% endhighlight %}
[Download](https://gist.github.com/1124832) the fully working example from
github.
## Python

{% highlight python %}
#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Example of `object pool' design pattern
# Copyright (C) 2011 Radek Pazdera

class Resource:

    """ Some resource, that clients need to use.

    The resources usualy have a very complex and expensive
    construction process, which is definitely not a case
    of this Resource class in my example.
    """

    __value = 0

    def reset(self):
        """ Put resource back into default setting. """
        self.__value = 0

    def setValue(self, number):
        self.__value = number

    def getValue(self):
        return self.__value


class ObjectPool:

    """ Resource manager.

    Handles checking out and returning resources from clients.
    It's a singleton class.
    """

    __instance = None
    __resources = list()

    def __init__(self):
        if ObjectPool.__instance != None:
            raise NotImplemented("This is a singleton class.")

    @staticmethod
    def getInstance():
        if ObjectPool.__instance == None:
            ObjectPool.__instance = ObjectPool()

        return ObjectPool.__instance

    def getResource(self):
        if len(self.__resources) > 0:
            print "Using existing resource."
            return self.__resources.pop(0)
        else:
            print "Creating new resource."
            return Resource()

    def returnResource(self, resource):
        resource.reset()
        self.__resources.append(resource)

def main():
    pool = ObjectPool.getInstance()

    # These will be created
    one = pool.getResource()
    two = pool.getResource()

    one.setValue(10)
    two.setValue(20)

    print "%s = %d" % (one, one.getValue())
    print "%s = %d" % (two, two.getValue())

    pool.returnResource(one)
    pool.returnResource(two)

    one = None
    two = None

    # These resources will be reused
    one = pool.getResource()
    two = pool.getResource()
    print "%s = %d" % (one, one.getValue())
    print "%s = %d" % (two, two.getValue())
{% endhighlight %}
[Download](https://gist.github.com/1124839) the fully working example from
github.

## Sources
- [http://sourcemaking.com/design\_patterns/object\_pool](http://sourcemaking.com/design_patterns/object_pool)
- [http://www.oodesign.com/object-pool-pattern.html](http://www.oodesign.com/object-pool-pattern.html)

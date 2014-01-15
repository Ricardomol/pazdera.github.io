---
layout: post
title: Single Responsibility Principle
categories:
- Software
tags:
- object oriented design
- object-oriented
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
Single responsibility principle, or **SRP** is another of the [SOLID
guidelines](http://linuxwell.wordpress.com/2011/08/05/solid-object-oriented-design/
"SOLID Object-Oriented Design") for software designers. It's especially useful
in object-oriented design. The name suggests, that it will have something to do
with decomposing the problem up to the point, where each entity in the system
has **one** and **only one** responsibility. The principle alone states,

> “There should never be more than one reason for class to change.”

Right, but where, the heck, is the responsibility we're talking about? You
see, a _responsibility_ can be pretty hard to define and using the word
directly would have definitely started a couple of fights. So the
[author](http://en.wikipedia.org/wiki/Robert_Cecil_Martin "Robert C. Martin")
defined it precisely as a ‘_reason to change_’. Let's have a look at some
example.

Here is a definition of my old `MySQL` class. It has interface for
establishing and closing connection to a remote MySQL server and sending a
query and receiving and processing the query result.

{% highlight cpp %}
class MySQL
{
    public:
        bool connect();
        void disconnect();

        bool executeQuery(std::string queryString);
        MySQLResult* getQueryResult();
};
{% endhighlight %}

This class  has two reasons to change (i.e. responsibilities). It handles the
initialization and closing of a connection to database server and also
communication with the server (executing SQL queries). The two reasons to
change are:

- MySQL server will now accept only encrypted connections
- The server implementation changes and it will respond differently to some
queries

This violates the single responsibility principle. It would be a _bad design_
to put together two things that change for different reasons. It might not seem
that bad now, but the system will evolve and change. What now seem reasonable
solution might kill you later on. The way I would now design things is this:

{% highlight cpp %}
class MySQLConnection
{
    public:
        bool open(); /* former connect() */
        void close(); /* former disconnect() */
};

class MySQLQuery
{
    MySQLConnection* session;

    public:
        bool execute(std::string queryString);
        MySQLResult* getResult();
};
{% endhighlight %}

While SRP is fairly simple principle, it's pretty hard to get it right.
Putting responsibilities together is something that comes naturally to us and
the separation (e.g. splitting the class into several smaller ones) might not
seem as elegant at first. When I look back at some of my earlier designs, well,
to be honest, I rarely stumble upon a class that conforms to this principle.
When I look again, I can really see, how would the separation help reduce the
complexity of the design and made my code easier to read and understand.

Following this principle religiously is definitely not a good idea, but it's
good to know it's there and sometimes (especially, when you see a 500 lines in 
`my_class.h` ) think, ‘Hey, would splitting my class to a couple more help?’.
Usually it does :-P.

## Sources
- [http://www.butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod](http://www.butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod)
- [http://en.wikipedia.org/wiki/Single\_responsibility\_principle](http://en.wikipedia.org/wiki/Single_responsibility_principle)
- [http://www.oodesign.com/single-responsibility-principle.html](http://www.oodesign.com/single-responsibility-principle.html)

---
layout: post
title: Best Practices in Error Handling
description: "My idea of how errors should be handled in programs."
cover: cloudy.jpg
comments: true
categories:
- Software
tags:
- best practice
- error reporting
- exceptions
---
According to the [Murphy's law](http://en.wikipedia.org/wiki/Murphy%27s_law)
-- "_Anything that can go wrong will go wrong_". And if Mr. Murphy were also a
software engineer, he would certainly add "_and anything that cannot go wrong
will go wrong as well_". Wise man that Murphy, but what does it mean for us,
the programmers out there in the trenches?

Error handling and reporting is a programming nightmare. It's an extra work,
it pollutes [ happy path](http://en.wikipedia.org/wiki/Happy_path) of your code
with whole bunch of weird `if` statements and forces you to return sets of
mysterious error codes from functions. God, I hate error reporting (more than
[I hate New Jersey](http://www.youtube.com/watch?v=8-q2_zp3ah4)).

It might not seem very important, but it's crucial to set some error handling
strategy and **stick with it** through the whole project. The error reporting
code will be literally everywhere. If you choose poor strategy in the
beginning, all of your code will be condemned to be ugly and inconsistent even
before you start writing it.

There are multiple problems, that you need to address in error reporting. The
most important thing is to deliver an useful report to the user. The error
message should say **what** happened and **why** it happened. A stack trace can
help you find exactly what happened, but it generally won't make the user very
happy. My personal favorite format of reporting errors in terminal apps looks
like this:

{% highlight text %}
<program_name>: <what_happened>: <why_it_happened>
{% endhighlight %}

It's inspired by [GNU coreutils](http://www.gnu.org/s/coreutils/) error
reporting format. In the first section is always program name, so the user
knows who is the message coming from. Second section says what happened or what
did the error prevent to happen (e.g. "Cannot load configuration" or "Unable to
establish remote connection"). Finally the last section informs user of what
was the cause of his inconvenience, for instance "File 'configuration.txt' not
found" or "Couldn't resolve remote address".

This way gives the user complete insight in what happened, yet it won't scare
him off with too much of programming detail. In fact, revealing too much about
your errors (stack traces, memory dumps etc.) might be potential security risk.

Another criteria for evaluating error reporting strategy is how does it blend
with the code. Generally, there are two approaches -- **centralized** and
**decentralized** error handling.

## Centralized

**Centralized** way involves some sort of central database or storage of
errors (usually a module or a header file) where are all the error messages
stored. In code you pass an error code to some function and it does all the
work for you.

A big plus of this approach is that you have everything in one place. If you
want to change something in error reporting you know exactly where to go. On
the contrary, everything in your software will depend on this one component.
When you decide to reuse some code, you'll need to take the error handling code
with it. Also, as your program will grow number of errors will grow as well,
which can result in a huge pile of code in one place that will be very
vulnerable to errors (since everyone will want to edit it to add his own
errors).

## Decentralized

**Decentralized** approach to error reporting puts errors in places where they
can happen. They're part of _interface_ of the respective modules. In C every
module (sometimes even every function) would have it's own set of error codes.
In C++ a class would have a set of exceptions associated with it.

In my opinion, it's a little harder to maintain and to keep consistent than
the centralized way, but if you have the discipline to stick with it, it
results in elegant and independent code. Somebody could say, that there will be
a lot of duplicates of (let's say) 5 most common errors, like IO failures and
memory errors. Well, this is a problem of decentralized error reporting. You
can minimize this by keeping your errors in context with the abstraction of the
interface they fit in. For instance -- class Socket will throw exceptions like
**ConnectionError** or **RecievingError** not **MallocError**, **FileError** or
even **UnknownError**. Malloc failure is the reason, which resulted in a
problem with reading data, so from the point of Socket class it's a reading
error.

These are the two basic ways of error handling. I will write separate posts
about a few concrete common strategies, that I know and find useful or at least
good to know (exceptions, error codes etc.).

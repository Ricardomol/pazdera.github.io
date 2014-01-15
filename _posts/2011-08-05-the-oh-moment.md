---
layout: post
title: The 'Oh' Moment
categories:
- Software
tags:
- coding
- programming
- software
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
There's a little thing in software development I like to call the ' [Oh
moment](http://www.youtube.com/watch?v=EztemITwSrs)'.

I first noticed it when I was working on
[my bachelor's thesis](http://p-g-c.blogspot.com/) (and I was getting those
all the time). Let me explain the situation a bit. You're working on a project,
not particularly easy one and finally after a couple of sleepless nights and
rather unspecified amount of coffee, you come up with a solution. It seems
just perfect. Clean, elegant, looks cool due to all the fancy inheritance,
Mum will be proud.

Then first thing tomorrow morning, you start to eagerly write the code. It's
all good until it comes, **'Oh, man'**. One more thing (there always is) that
you didn't take into account and it just won't work this way. It might work
eventually, after some further modifications, but the result won't be nearly as
elegant nor clean. Not even mentioning the sweet inheritance tree. And there
goes your excitement. After experiencing an _oh-moment_, your goal is no longer
to create a good piece of software, but to get it done as fast as you can and
then run away from it as far as possible.

The excitement from your ideas, good feeling about your work and satisfaction
with the results is, in my opinion a key component in software development.
Everybody likes doing a good job. And it's really bad (for you and the
project), if you don't find the results good enough. But how to enjoy the job
from the beginning to end?

You need to eliminate the _Oh-moments_. The more experience you get, the less
_Oh-moments_ you experience. But you cannot take them out of the equation
entirely. Sh\*t happens, and when it does, you need to be ready to minimize the
consequences. However, there are couple of methods, that I personally find very
helpful in this matter.

### Wait

**Never** and I mean **NEVER** implement your design right away. It's good to
do something else for a while (my personal favorite is re-factoring and
documenting the existing code) and then get back to it. If you still can't see
anything wrong with it, your chances of encountering an _Oh-moment_ in the
future are decreasing.

### Show It to Others

A great way of avoiding oh moments is explaining your design to a [team-mate
or a friend](http://developer.qt.nokia.com/duck). You will see it from whole
another perspective and this will help you discover any unwanted surprises
wrapped in the design.

### Design in Iterations

Generally the later you get the flaw the bigger issue it is, so if you've
stumbled upon an _Oh-moment_ after a year of development, well, may the force
be strong with you. But If you sit back once in a while and think a little
further into the future of your application, you might find the dead end fast
enough, before you get surrounded in it by a group of guys with knives and
baseball bats interested in the contents of your wallet.

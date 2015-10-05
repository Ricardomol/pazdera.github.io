---
layout: post
title: "Turning users into contributors"
description: ""
comments: true
categories:
- Programming
- Software
tags:
- Github
- open source
- marketing
---

_Contributors_ make open source fun. Enabling a community of people to use,
re-use and improve your code into something that’s beyond what you thought
possible is amazing. But as many other things in life, the community won’t just
magically appear out of nowhere.

In this series, we’re going through a few strategies to help you build a
community around your open source project. The past three instalments focused
at attracting users. This time we’ll take a look at how to turn them into
contributors.

#### Catch up

These are the previous posts in the series:

* [1/5: Target audience and the landing
page](http://radek.io/2015/09/14/marketing-for-open-source-projects-1/)
* [2/5: Make your project
accessible](http://radek.io/2015/09/21/marketing-for-open-source-projects-2/)
* [3/5: Spreading the
word](http://radek.io/2015/09/28/marketing-for-open-source-projects-3/)

## Make it clear that your app is open source

If you made your project [easy to
install](http://radek.io/2015/09/21/marketing-for-open-source-projects-2/) for
your users by creating an installer or making a package, chances are that
many users won’t even see your landing page or repository. While that’s fine
for most of them, you should include it somewhere in your application for
those who would like to get in touch and learn more.

This could be a special `--cli-option` or a dedicated about dialog if your app
comes with a GUI. Include a link to your landing page and maybe your bug
tracker where people can report problems. This is a great opportunity to put
in some fun little easter egg into your app that will compel people to follow
the link.

A good time to point out the means of contacting you is through crash dialogs
and error messages. Tell people where they should go report the problem. This
is one of the most common ways people get involved in projects. They’re trying
to do something, it doesn’t work and so they go and fix it.

## Pending features

A somewhat cheeky way to urge people to get involved are **unfinished
features**. You may incorporate the features you’d like to add to the user
interface and show a message that explains that this still needs to be done,
inviting people to help you do the work.

It can be an extra command-line option that instead of the desired function
just prints a message. The same can be accomplished with dialogs in GUI
applications.

Bear in mind that it is a bit invasive and it can get really annoying very
quickly. The key is to use this only for the non-essential features of your
project. Having your users download your brand new fast sorting library only
to find out that quick sort still needs implementing will not make you many
friends.

## Write separate docs for developers

Your project should have some form of documentation for developers with a brief
overview of where’s what and a searchable reference for interfaces and APIs.

This is best auto-generated from the source code with tools like
[doxygen](http://www.stack.nl/~dimitri/doxygen/), [JSDoc](http://usejsdoc.org/)
or [YARD](http://yardoc.org/). Having the documentation and the code in the
same place helps with maintenance and there are even places like
[RubyDoc](http://www.rubydoc.info/) that will generate and host the docs for
you for free. It’s never been simpler to do this.

If you make the high-level overview brief and keep it to the point, chances are
you won’t need to rewrite it too often, unless you’re refactoring the whole
thing.

## Make it clear what needs to be done

The development of your app is likely to revolve around your issue tracker.
Tickets will come in and you and your contributors will be tackling them. With
this constant movement it’s easy to let it become a big and confusing pile of
stuff that only you and maybe few other insiders will understand.

But how are new contributors supposed to pick up work from there? Make sure the
issue tracker is well organised to the point where if you decide to become a
turnip farmer and never use the internet again, somebody else could just pick
up where you left off the next day.

Keep a list of simple and well defined tasks for newcomers to tackle when they
first come in; even if you could implement those in 5 minutes yourself. While
describing the issue in detail on the ticket may take same amount of time, it’s
time well spent if the issue helps to onboard a new contributor in the future.

I wrote about using [Github issues to attract new contributors](http://radek.io/2015/08/24/github-issues/)
in the past. Check it out!

## Be responsive

Once your project has got the first users and even contributors,
you will start receiving questions, feature requests, bug reports and even
fixes for them. If you can, make an effort to respond and assist the person
with their issue in timely manner. Even if you're busy and doing this in your
free time, taking a month to respond to a pull request will soon lead to
your contributors losing interest.

Respond even if you can’t fulfil their request straight away. It’s better
saying no and putting it on the backlog then leaving it hanging in the air or
promising something you will not be able to deliver. Instead, puut it on the
issue tracker where somebody else might pick it up. That’s the beauty of
open-source!

## Become a contributor yourself

If you're new into this confusing world of free and open source software, or
perhaps your project is outside the ecosystem you were used to before, try
contributing to a similar projects to see how they do it. What was easy to pick
up from their documentation and where did you get stuck? Did someone respond to
your patch or question? You'll be able to use this experience to present
your project in a way that will be accessible for anyone.

## Coming up next

Your project is now well established; the numbers of users and contributors
both rising steadily. What's the next step? That's exactly what the final
instalment of this series will focus on. Stay tuned!

Do you want to be notified when the next one comes out?
[Subscribe](http://eepurl.com/bnBELn) to my newsletter below. I publish new
posts on Mondays.

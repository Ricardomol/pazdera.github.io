---
layout: post
title: "How to organise Github issues to attract new contributors"
description: ""
comments: true
categories:
- Programming
- Software
tags:
- Github issues
- open source
- bug tracker management
---

Many open source projects need new contributors but struggle to find them.
Conversely, many first time contributors have problems finding what to work on.
What's the problem? As programmers, we focus most of our attention to the code,
forgetting about the community work that needs to be done to make it accessible.

For many projects, the [list of issues](https://github.com/joyent/node/issues)
on Github is the main point of contact between users and developers. People
will come to the issue tracker with different purposes and levels of
familiarity with your application, reporting bugs, requesting features, asking
questions and looking to contribute. How to ensure that they can always find
what they need?

## Use good labels

Labels are the way to organise issues on Github. You can assign a name and
colour to every one and that's it. Pretty straight-forward and flexible; you
can capture practically anything with them.

{% include figure.html img="github-issues/default-labels.png" alt="Github labels" width="40%" caption="<b>Github</b>: The default set of labels." %}

However, there's a fine line between using labels well and overusing them. When
there's too many or the system is too complex, people will just ignore them.
So what is worth making a label for?

## Type of work

Is it an entirely new feature, small enhancement to an existing one or bugfix?
Maybe the documentation needs fixing or the home page could use a fresh look.

Not all tasks require programming and not all contributors to your project need
to be programmers. Tagging issues to separate coding from other tasks, such as
design and docs, can help you attract tech writers and designers that are
excited about open source or enthusiastic users of your project. Here's an
example:

<ul>
<li style='margin:5px 0px;'>
  <span style="background-color:#207de5;color:white;padding:3px;">Design</span>
</li>
<li style='margin:5px 0px;'>
  <span style="background-color:#5E412F;color:white;padding:3px;">Docs</span>
</li>
<li style='margin:5px 0px;'>
  <span style="background-color:#fbca04;color:black;padding:3px;">Code</span>
</li>
</ul>

If your project doesn't have documentation (good time to create an issue)
or it's a terminal app without a homepage or anything that would require
a designer, you can split **Code** into several categories to let people know
what they're getting into. For example:

<ul>
<li style='margin:5px 0px;'>
  <span style="background-color:#e11d21;color:white;padding:3px;">Bugfix</span>
</li>
<li style='margin:5px 0px;'>
  <span style="background-color:#fbca04;color:black;padding:3px;">Enhancement</span>
</li>
<li style='margin:5px 0px;'>
  <span style="background-color:#009800;color:white;padding:3px;">New feature</span>
</li>
<li style='margin:5px 0px;'>
  <span style="background-color:#131B33;color:white;padding:3px;">Refactoring</span>
</li>
<li style='margin:5px 0px;'>
  <span style="background-color:#5319e7;color:white;padding:3px;">Tests</span>
</li>
</ul>

Needless to say, these **will** overlap. Every task is an enhancement in a way
and you will need to write some tests when adding new features. If the task is
bigger or more ambiguous, resist the temptation to assign all the labels to it.
Instead, try breaking it down or choose the one that's most appropriate. If
you still don't know, let it to [atmospheric noise](https://www.random.org/lists/)
to decide. Striving for complete accuracy often leads to even less organisation
due to the difficulty of maintaining it.

## Difficulty

Estimating the difficulty of each issue is particularly useful for newcomers to
your project. I use the following three levels:

<ul>
<li style='margin:5px 0px;'>
  <span style="background-color:#009800;color:white;padding:3px;">Beginner</span>
</li>
<li style='margin:5px 0px;'>
  <span style="background-color:#207de5;color:white;padding:3px;">Intermediate</span>
</li>
<li style='margin:5px 0px;'>
  <span style="background-color:#F0A830;color:black;padding:3px;">Bigger project</span>
</li>
</ul>

This will make sure people who just arrived won't be trying to solve things you
yourself are afraid to tackle. Using the filters on Github, you'll be able to
link directly to a list of issues suitable for beginners from your README. Like
[this](https://github.com/KanoComputing/kano-repository-manager/labels/Beginner).

## Priority and severity

While these two are probably the most common ways of categorising software
tickets, I'm not sure how useful they are for open source projects. For
companies, these can be used to prioritise employee's time and make sure
problems critical for the business are tackled first.

With open source projects though, people just work on what they want to work
on. Different people will see these very differently based on how they use the
app and what's important to them.

Also, marking issues low priority and trivial severity isn't very encouraging
for people to start working on them. These are exactly the type of issues you
want newcomers to be tackling first, so they get up to speed with the project
and marking the work inconsequential is wrong. The goal of a trivial, low
priority issue is to get a new contributor onboard. That's bloody high priority
to me…

If you really need a way of marking important issues, use just a single
<span style="background-color:#8D1919;color:white;padding:3px;">Critical</span>
label.

{% include figure.html img="github-issues/dr-labels.png" alt="Github labels" width="30%" caption="<b>Github</b>: An example label configuration on a Github repo." %}

## Explain it in the README

Don't forget to write a few words about the way the issues are structured in
your project's README. It doesn't have to be a three-page long treatise on the
subject. In fact, the shorter you can get it the better your system probably is.

Make sure to mention the categories of tags you're using and include links to
the filtered lists of each category, particularly the ones aimed at beginners.

## Summary

The issue tracker is one of the places where your contributors hang out. For
some projects, it may be the only place. Maintaining it with the same standards
as you would maintain the code will help you build a great community.

After all, the tickets aren't there for the project itself, but for the people
who make it.

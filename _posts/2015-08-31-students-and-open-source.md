---
layout: post
title: "Students and open source: A match made in heaven"
description: ""
comments: true
categories:
- Programming
- Software
tags:
- Github
- open source
- students
- beginners
---

Open source projects are always looking for new contributors, a few extra
keyboards and tapping hands. On the other end, computer science students and
graduates often struggle with demonstrating their skills to prospective
employers and applying their fresh skills in practice. Anybody else see a
great opportunity here? Let’s join forces!

{% include note.html colour='green' head='NOTE' text="The word <b>students</b> in this article include people trying to switch stacks as well as other newcomers to programming from different industries." %}

There are some great initiatives to support this type of collaboration, like
[GSoC](https://developers.google.com/open-source/gsoc/) or
[Bountysource](https://www.bountysource.com/) for starving students. But we
shouldn’t need stipends to make this work! The real value isn’t in the money
you’ll get. It’s about kickstarting your career (and salary) past junior levels
right after uni.

## What’s in it for students?

Students can build an amazing portfolio of work even _before_ leaving their
alma mater to join the job market. There are so many open source projects and
participating has never been easier. Well, sort-of.

You don’t need to completely rewrite the scheduler in the Linux kernel nor
finish implementing ES6 in Webkit. There are huge piles of work, endless stacks
of sad and abandoned issues, strayed around bug trackers with nobody to pick
them up. Start small. It’s fine if you won’t be tackling the most difficult
problems in the history of computing, you’ve got the rest of your career to do
that. Now it’s time to work your way up, learning about teamwork, git, code
reviews, navigating unfamiliar code, reading documentation or finding out that
nobody bothered to write it in the first place. Refactor a long function, grep
for TODOs in the project and fix one.

Your code will have impact on lots of people and you’ll make great friends
along the way. If you become a regular committer, it certainly isn’t
unreasonable to ask for a reference from the maintainers.

Open source is your chance to change your interviewer’s look from _we
already have a coffee machine_ to this:

{% include figure.html img="students-and-oss/fallon-gif.gif" alt="WHAT?! Gif" width="100%" caption='<strong>Your interview</strong>: You know NodeJS? — Yah. What about it? — I refactored a few things in the core. The changes went in 0.12.7 if you want to take a look. (<a href="http://fallontonightgifs.tumblr.com/post/97068060632">Source</a>)' %}

## Making your project beginner friendly

As developers, we often don’t make any effort to make it easy for beginners to
join our projects. And we’re missing out a great deal.

Students and learners of all kinds are a wonderful target group. Heaps of free
time, reasonably motivated to work, devoid of dated habits and weird industry
prejudices. They may not have lots of real world experience yet, but that
doesn’t make them incapable of doing great work. You just need to nudge them
into the right direction here and there and review the pull requests carefully
(and be nice about it). In the end, you can be the one who’ll teach them the
best practices of software development. This is a great opportunity to pass on
what you believe in.

Unfortunately, your time investments will not always pay off. People will not
finish what they had signed up for. But that’s still better than letting your
project rot in an abandoned Github repo that nobody cares about!

Personally, I’d be wary to spend a lot time with beginners on one-on-one basis
before seeing at least a few contributions from them. Rather invest in writing
up guides that many of them can benefit from. It may not sound very nice, but
this needs to be beneficial for everyone and it’s way too easy see lots of
talking and little coding.

So where to start? You might want to start by [organising your bug
tracker](http://radek.io/2015/08/24/github-issues/) to make it possible for
beginners to find smaller tasks easily. And then sweep through the code,
looking for any small task that you’d like to get done. Apart from formatting
changes and fixing grammar mistakes in comments, no task is too small.

Could a function be broken down in two? Or maybe a repeating piece of code
could be abstracted into a common module. Does this module need a few extra
tests? Describe the task with a [reasonable amount of
detail](https://github.com/KanoComputing/kano-repository-manager/issues/30) on
the ticket and outline the solution.

## The challenge for students

If you’re a student looking for experience today, I challenge you to find a
project you’ve used before and liked and in a language that you know (prefer
smaller projects over large and established ones). Get the sources and make it
work on your machine. Build it and make sure you can run the test suite (this
should be really simple if the project is small).

Then reach out to one of the maintainers and tell them that you’re a junior dev
that likes using their app and that you’d like to contribute. I sincerely hope
they’ll reply (please allow a few weeks, people are busy).

You’ll make connections with some of the top engineers in the industry, get
your work out there and learn an incredible amount in the process. And in the
end, you might even get a job in the company the maintainer works for.

Is your project beginner friendly? [Send me a
link](https://twitter.com/intent/tweet?text=Hey%20@radekpazdera,%20my%20project%20is%20beginner%20friendly.%20Here%27s%20the%20link:)!

Does your project work with students? How is it going? Let me know in the
comments section below or tweet at [@radekpazdera](https://twitter.com/radekpazdera).

---
layout: post
title: "Marketing for open-source projects 2/5"
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

Open source has become a thing. A big thing. But with so many open source
projects around, it is increasingly more difficult to attract contributors.
With many of them backed by large corporations like Facebook or Twitter, the
battle for volunteer programmers’s time is fierce.

This post is a second in a series of articles about how to build a community
around your project. The [previous
post](http://radek.io/2015/09/14/marketing-for-open-source-projects-1/)
discussed your project’s audience and how to introduce it to them. This time,
we’ll take a look at **accessibility**.

When a user decides that your project does what they need, they’ll look for
instructions how to use it and try to make it work. The pitch succeeded, but
the sale isn’t closed yet. It’s in your best interest to make the onboarding as
simple as possible to avoid losing people on the way. Here’s what you can do:

## Make a package

A typical project will come with a series of steps to build and install it. The
best ones reduce this sequence into a single action: **install a package**.

Are you more likely to try a project that you can get up and running with a
single `sudo apt-get install` command or the one where you have to go though
the whole cycle of setting up the build environment, installing a lorryload of
dependencies and compiling from source?

### Distro-level packages

Your first option is to make an **OS package**, perhaps for a Linux
distribution (deb, rpm, pacman) or for OS X using [Homebrew](http://brew.sh/).
Or you can create a language-level package, if such an option exists for the
technology you're using.

{% include figure.html img="marketing-2/fedora.png" alt="Fedora package database" width="90%" caption='<strong>Fedora Package Database</strong>: The rpms for Fedora.' %}

Distribution level packages are the most convenient for users, allowing them to
install your software from the trusted sources of their distribution. The
learning curve is usually pretty steep with up to tens of pages of documentation
to go through before you're able to get the package accepted. But doing the work
will bring your project as close as **one command away** from all the users of
the respective OS, which can be well worth the effort with the millions of users
that some operating systems have.

### Language-level packages

Or you can create a language-level package, if such an option exists for the
technology you're using. This includes [PyPI](https://pypi.python.org/pypi),
[Rubygems](https://rubygems.org/), [npm](https://www.npmjs.com/) and similar
These tend to be much simpler, often devoid of the tens of pages of
documentation you need to go through to get your package accepted into a
distro. Depending on your ecosystem, they might even be a better option.

{% include figure.html img="marketing-2/npm.png" alt="npm homepage" width="90%" caption='<strong>npm</strong>: Node Package Manager' %}

Making a language-level package is a must for projects to be used by other
developers such as libraries and toolkits. For a Ruby or JS developer, a
library that doesn’t have a gem or npm package probably wouldn’t be the first
choice.

Putting your project up on these directories gives you a bit more visibility as
well as these usually come with search that programmers use to find useful
libraries.

Sometimes, there might be tools or algorithms for converting language-level to
distro-level packages, so you might be able to take your language-level package
and reuse it in several distributions. For example
[Debhelper](https://packages.debian.org/jessie/debhelper) can build your Python
app automatically if it comes with a `setup.py`.

## Automated setup script

If packaging is not an option, then provide at least an automated build and
install script. As far as ease of use goes, this is pretty much the same to
making a package.

{% include figure.html img="marketing-2/homebrew.png" alt="Homebrew homepage" width="90%" caption='<strong>Install Homebrew</strong>: A single command to rule them all.' %}

Here’s how some other popular projects use setup scripts:

* [oh-my-zsh](http://ohmyz.sh/)
* [rvm](https://rvm.io/)

Some people don’t trust these scripts and sometimes rightfully so. You’re on
your own here, without a trusted package management tool to back you up. Be
extremely careful and make sure than anything you put in the script won’t
damage people’s system or data, particularly when doing things with root
permissions. An enraged crowd of people that lost their data to your app isn’t
the best marketing for it.

## Write the flipping manual

Now that users can install your project easily, they’ll want to know how to use
it. It’s time to write the user manual! This by no means needs to be a lengthy
document. It should explain the basic interface and highlight any limitations
and edge cases. Leave out the technicalities and focus solely on what the user
needs to know.

Don’t strive to make it exhaustive right from the beginning. Start with the
most important bits and fill the rest in as you go. You can write it up
gradually as you’ll be answering questions from new users trying to make use of
your project.

The best structure and tools depend on the nature and size of your project.
Whether you’re generating it from the source code or writing it all up
yourself, the end result should be searchable (even if you put everything on a
single page and use the browser search).

[Rich Bowen](http://drbacchus.com/) published a [great article about writing
documentation](http://opensource.com/business/15/5/write-better-docs) on
[Opensource.com](http://opensource.com/) earlier this year. Make sure to check
it out!

## Don’t forget the licence

A major mistake that can hinder the adoption of your project is the lack of an
open source licence. Make sure your code comes with one and that it’s been
approved by the [FSF](http://www.fsf.org/) or [OSI](http://opensource.org/).
Check out one of my [earlier
posts](http://radek.io/2015/08/03/picking-an-oss-licence/) on this for further
information.

## Coming up next

Now that your project is ready to be adopted by users, it’s time to spread the
word about it, which will be the topic of the next instalment.

Do you want to be notified when the next one comes out?
[Subscribe](http://eepurl.com/bnBELn) to my newsletter below. I post new
articles on Mondays.

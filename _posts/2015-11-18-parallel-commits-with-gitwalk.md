---
layout: post
title: "Parallel commits with gitwalk"
description: ""
comments: true
categories:
- Programming
- Software
tags:
- git
- tool
- developers
---

From time to time, a change comes up that needs to happen _everywhere_. You got
a new email address and so it needs to be updated in many maintainers files. Maybe
a new legal policy requires you to add a file with a disclaimer to all of the
200 repositories your company maintains. Or you just want to clear all the
trailing whitespace people accidentally committed.

Whatever the reason, sometimes we need a custom automated script to spare
ourselves hours of mindless manual work. The trick is, of course, being able to
write and debug it faster than it would take to do the actual task manually.

This post explains how to use [gitwalk](http://radek.io/2015/11/03/gitwalk/)
to quickly make changes to many repositories in parallel.

## About gitwalk

Gitwalk is a tool to manipulate multiple git repositories at the same
time. It abstracts away all the logistics of cloning, updating and iterating
over them so you can focus on **which repositories will be processed** and
**what needs to be done**. Gitwalk uses simple
[expressions](https://github.com/pazdera/gitwalk#expressions) to select groups
of repositories and [processors](https://github.com/pazdera/gitwalk#processors)
to say what needs to happen for each one.

It can do a range of things from searching through the code to making and
committing changes, which is what we’ll take a look at today.

{% include figure.html img="gitwalk/screenshot.png" alt="gitwalk: An example" width="90%" caption='Using <strong>gitwalk</strong> to search my Ruby codebase.' %}

## Selecting repositories

For the purpose of this post, let’s say we need to add a file called
`DISCLAIMER` to all my repositories on GitHub. The first step is to **figure
out the right expression that will select all of my repos**. Gitwalk supports
wildcards, so it will look something like this:

{% highlight bash %}
github:pazdera/*
{% endhighlight %}

We’ll use gitwalk with the `--dry-run` option to try it out:

{% include figure.html img="gitwalk-commits/all-repos.png" alt="Using the dry run option" width="90%" caption='<strong>gitwalk</strong>: Listing matched repositories.' %}

The glob matched quite a few forks as well that don’t really need a
`DISCLAIMER`. We can use an _exclude expression_ to remove a few matches from
the list. Gitwalk will merge the results of the two expressions into a single
list of repositories. Read more about the
[expression syntax](https://github.com/pazdera/gitwalk#expressions) in the docs.

{% include figure.html img="gitwalk-commits/filtered-repos.png" alt="Using the dry run option" width="90%" caption='<strong>gitwalk</strong>: Some are now filtered out.' %}

Now that our expressions match only repositories owned by me, let’s see how to
commit the file to each of them.

## Processing

We’ll need a short script that will create the file, commit and push it
upstream. Gitwalk will simply call that for each repo as it iterates over them.
You can use whatever language you like to write it. For this example, I picked
bash. Here’s how it looks:

{% highlight bash %}
#!/bin/bash

# Create the new file
echo 'THIS IS SPARTA!!!' >DISCLAIMER

# Make a new branch
git checkout -b test

# Commit and push them
git add DISCLAIMER
git commit -m 'Adding DISCLAIMER'
git push origin HEAD
{% endhighlight %}

It’s almost an identical set of commands that you’d run when adding a new file
by hand. We’ll make it an executable and pass it to gitwalk as follows:

{% highlight bash %}
$ gitwalk 'github:pazdera/*' \
  '^github:pazdera/@(*itree|*firmware|lnst|*blogs|jekyll*|nodegit|pazdera*)' \
  command $PWD/add-disclaimer.sh
{% endhighlight %}

Note that the path to your script needs to be absolute (hence the `$PWD`
variable). This is because the current working directory is changed to be
inside the repository when the script is executed.

The repositories will be cloned automatically when needed, so you don't need
to worry about anything else. Here's what the above command does:

{% include figure.html img="gitwalk-commits/shell.png" alt="Running the shell processor" width="90%" caption='<strong>gitwalk</strong>: Running our script on each of the repos.' %}

And one of the commits on GitHub:

{% include figure.html img="gitwalk-commits/github-commit.png" alt="" width="90%" caption='One of the commits on GitHub' %}

## JavaScript API

If you want to do something a bit more complicated and need more control, you
can use gitwalk’s JavaScript API to implement your own processors with direct
access to the [Nodegit](http://www.nodegit.org/) instance that gitwalk works
with.

I implemented the [same example in JS](https://github.com/pazdera/gitwalk/blob/master/examples/commit.js)
as well to compare. It is, however, a fair bit more complicated as Nodegit works
on slightly lower level than the `git` tool does.

## Final thoughts

Being able to automate various tasks efficiently is one of the perks of
software engineering not many other professions enjoy. Clever scripts save us
from hours of soul-draining, repetitive work. Occasionally, however, we
underestimate the real complexity of our _small scripts_ and it can take hours
of painful debugging to get them right.

Gitwalk is here to help you with that when you need to handle several
repositories at the same time. Check it out
[here](https://github.com/pazdera/gitwalk).

---
layout: post
title: "5 Useful Gmail Filters for GitHub Users"
description: "Make your life easier with these."
cover: calton-hill.jpg
comments: true
categories:
- Programming
tags:
- GitHub
- notifications
- email
- productivity
---

Trying to keep up with several projects on GitHub? You're probably no stranger
to receiving many notifications. Issues were opened, comments posted and pull
requests merged. Some require action, some things you should know about and
others are probably just noise. Here are a few Gmail filters I use to get
through my notifications quicker.

GitHub has its own [notification centre](https://github.com/notifications
"GitHub's notification centre") that allows filtering per-project as well as
only showing the ones you're participating in. Each notification has an icon
that indicates whether it's an issue or a pull request and whether it remains
open/unmerged.

{% include figure.html img="5-useful-filters/notif-centre.png" alt="GitHub's notification centre" caption="GitHub's notification centre" %}

All these are really useful and reduce the time it takes to go through the list
every day. For example, you might skip the closed and merged ones, quickly skim
through the headers where you haven't been tagged on and focus on the ones that
you're participating in.

But what if you prefer dealing with the notifications via email?  I quite like
having them in my inbox along with the rest of my messages. That means I've got
everything in one place, but of course I miss all of the time-saving perks.

Having to labour through all the messages when half of them is not interesting
surely isn't fun. Luckily for me, some of the notification centre goodness can
be brought into the mailbox through **filters**. Check out the ones I use with
Gmail.

{% include figure.html img="5-useful-filters/tags.png" alt="Tagged mailbox" width="75%" caption="<strong>Gmail</strong>: Tagged notifications in my inbox" %}


## 1. Tag all notifications from GitHub

Because I get a lot of email from GitHub, I like to tag all the incoming
notifications to quickly tell them apart from other messages. GitHub
notifications are rarely high priority and tagging all of them allows me to
hide the lot to check whether I haven't missed anything critical.

To set this up, just filter the **From:** field for
**notifications@github.com**. In Gmail that looks something like this:

`from:(notifications@github.com)`

{% include figure.html img="5-useful-filters/all.png" alt="Gmail filter settings" width="75%" caption="<strong>Gmail</strong>: Mark all GitHub notifications" %}

## 2. Assignments

To ensure I pay extra care to the tickets that have been assigned to me, I like
to mark them with a special **Assignment** tag. When I'm running short on time,
I just run through these to see that everything I'm responsible for getting
done actually does.

When someone assigns an issue to you, GitHub will trigger a notification. By
matching against this message you can tag the whole thread as your assignment.
In my case, the filter for Gmail looks like this:

`from:(notifications@github.com) Assigned to @pazdera`

Search for **Assigned to @your-handle** string.

{% include figure.html img="5-useful-filters/assignment.png" alt="Gmail filter settings" width="75%" caption="<strong>Gmail</strong>: Mark assignments" %}

Unfortunately, there are a few limitations to this approach. You won't be
notified when self-assigning an issue and the thread won't be tagged properly
in that case. Also, if the issue gets reassigned to someone else, the email
thread will still appear assigned to yourself.

##  3. Mentions

Probably the most helpful of all, this filter makes it possible to only see
those messages where you've been explicitly mentioned. Without having to skim
through heaps of rubbish in search of your GitHub handle, you know instantly
where your input would be appreciated.

Just apply a filter that matches your GitHub account handle on the message
body. I use the following:

`from:(notifications@github.com) @pazdera`

{% include figure.html img="5-useful-filters/mention.png" alt="Gmail filter settings" width="75%" caption="<strong>Gmail</strong>: Highlight mentions" %}

## 4. Merged

When a pull request is merged, it's unlikely that your input on it would be
required and you can safely pass on it in most cases (especially when you
haven't been tagged in the discussion bellow the PR).

GitHub sends a notification for which you can set up a filter to tag the
relevant email thread as **Merged**. Here's mine:

`from:(notifications@github.com) Merged `

{% include figure.html img="5-useful-filters/merged.png"  alt="Gmail filter settings" width="75%" caption="<strong>Gmail</strong>: Mark merged pull requests" %}

With the lack of support for regular expressions with Gmail, this one is a bit
tricky. It will match when someone mentions the word 'Merged' in a comment.
Even though that might seem like a problem, it doesn't really happen that often
in my experience.

## 5. Closed

Lastly, when an issue has been closed, its useful to know without having to
click on the email to open it.

I use the following Gmail filter and just mark all of them for deletion
straight from the list view.

`from:(notifications@github.com) Closed \#`

{% include figure.html img="5-useful-filters/closed.png"  alt="Gmail filter settings" width="75%" caption="<strong>Gmail</strong>: Tag closed issues" %}

These were the five filters that help me get through the bulk of GitHub
notifications in my inbox. What do you use to keep yourself from spending hours
on email? Share your setup in the comments below!

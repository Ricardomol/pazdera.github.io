---
layout: post
title: Errors as Part of Interface
description: "Steve McConnells idea about proper error handling."
cover: cloudy.jpg
comments: true
categories:
- Software
tags:
- error reporing
- good pracice
- programming
---
I was writing [this code](https://github.com/astro-/pop3client "pop3client")
the other day. It's a very small program -- a POP3 client that downloads
messages. And I just couldn't come up with an easy and consistent way to report
errors. I wanted something lightweight, but what actually makes sense. I was
looking through some code hoping, that someone else has a good strategy I could
rip. From what I saw, the most common is **none whatsoever**. Well, I didn't
like that one bit ...

But worry no longer! Steve McConnell came to aid a coder in distress once
again. I looked into my new copy of [Code
Complete](http://linuxwell.wordpress.com/2011/08/29/code-complete/) and here's
what I found:

> Throw exceptions at the right level of abstraction.

This statement has a very interesting point. The errors that can occur in your
code, regardless of whether it's a exception thrown or a status code returned,
should be at **the same level of abstraction** of the unit, class or even
routine that they happen in. For example if function called
`downloadAndPrintReport()` exits with `MALLOC_FAILED` . You see, this just
isn't right. The malloc failure is the **cause** of the problem, it's not the
problem itself and you (or the user) cannot react appropriately. I mean, which
`malloc()` call failed? Does it mean the report wasn't even downloaded or it
was but wasn't printed? What the hell is malloc anyway? User [doesn't
know](http://www.youtube.com/watch?v=ZYMnPhp2-uw)!

## Conclusion

Your error reports should be informative and useful to the receiver (which can
be either a user or some parent code that deals with the error). By sticking to
the current abstraction, your chances of delivering a good report rapidly grow.
When `downloadAndPrintReport()` returns with `UNABLE_TO_DOWNLOAD_REPORT` , you
can try to reopen the connection and try again later. In case of
`UNABLE_TO_PRINT_REPORT` you can store it somewhere in a file instead of
printing it.

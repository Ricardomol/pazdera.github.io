---
layout: post
title: Syslog Howto
categories:
- Howto
- Linux
- Software
tags:
- howto
- logging
- syslog
- syslogd
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
**Syslog** is a standard for logging program messages. It allows separation
of the software that generates messages from the system that stores them.

## Format
The traditional use of a syslog daemon is to store events in log files, in a
format like this:

{% highlight text %}
Jan 1 12:12:12 10.245.3.99 foo[421]: this is a message from foo
{% endhighlight %}

All the log files are in the `/var/log/` directory. You can explore the files
on your own machine an see the log messages for yourself.

## Writing your own messages
Now, how can you log something with syslog? There is a command-line utility
suited just for the job -- `logger` . For instance:

{% highlight bash %}
 $ logger -t "dude" "What's up New York?" 
{% endhighlight %}

will add something like

{% highlight text %}
Jul 8 10:45:53 astro-desktop dude: What's up New York? into `/var/log/messages` .
{% endhighlight %}

Logger is most useful for bash scripts, but while in C, you'd probably like
to use something else. So let's have look at some syscalls. Here is a very
simple program, that will do the same as the logger command shown a couple
lines back.

{% highlight bash %}
/* Example of using syslog. */
#include <syslog.h>

int main()
{
    openlog("dude", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_USER);
    syslog(LOG_NOTICE, "What's up %s?", "New York\0");
    closelog();
}
{% endhighlight %}

Function `openlog()` will establish a connection to the logging system. As
soon as it's ready, you can start using `syslog()` to save messages and in
the end you'll need to close the connection by `closelog()`. Fairly simple :-).

There are some parameters to the functions which are described in `man syslog`
or somewhere on the [net](http://www.linuxselfhelp.com/gnu/glibc/html_chapter/libc_18.html).

**Sources:**

- [http://en.wikipedia.org/wiki/Syslog](http://en.wikipedia.org/wiki/Syslog)
- [http://www.campin.net/syslog-ng/syslog.html](http://www.campin.net/syslog-ng/syslog.html)
- [http://basicslinux.blogspot.com/2009/04/what-is-syslog-why-use-log-file-to.html](http://basicslinux.blogspot.com/2009/04/what-is-syslog-why-use-log-file-to.html)
- [http://www.cyberciti.biz/tips/howto-linux-unix-write-to-syslog.html](http://www.cyberciti.biz/tips/howto-linux-unix-write-to-syslog.html)
- [http://www.linuxselfhelp.com/gnu/glibc/html\_chapter/libc\_18.html](http://www.linuxselfhelp.com/gnu/glibc/html_chapter/libc_18.html)


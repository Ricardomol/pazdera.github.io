---
layout: post
title: Fun with netcat
description: "A short introduction to a nifty networking tool."
cover: chinchilla.jpg
comments: true
categories:
- Howto
- Linux
tags:
- nc
- netcat
- networking
---
Ever heard of **nc**? It's a simple utility that is able to connect to a
remote host via TCP or UDP socket and send data. Basically it's a command line
interface to the BSD socket API. The manual page says

The `nc (or **netcat**) utility is used for just about anything under the
sun involving TCP, UDP, or UNIX-domain sockets.  It can open TCP connections,
send UDP packets, listen on arbitrary TCP and UDP ports, do port scanning, and
deal with both IPv4 and IPv6.

And why am I writing a whole post about this? Because it's insanely powerful
tool for development of network apps. It can be used to try out what you need
to pass to the socket in order to get some data. **RFC**'s are good, but when
it comes to basic understanding of some protocol they're pretty useless. I mean
who wants to read a 60+ page RFC full of technical implementation details.
These are also pretty hard to understand sometimes. With **netcat**, you can
try contacting the server yourself first with your keyboard! This is the most
amazing part, you simply write the messages that your program needs to send.
For example if you're programming an http client you can write your own request
like this

{% highlight bash %}
astro@desktop:~$ nc www.google.cz 80
GET /
HTTP/1.0 302 Found
Location: http://www.google.cz/
Cache-Control: private
Content-Type: text/html; charset=UTF-8
Date: Sun, 18 Sep 2011 21:32:24 GMT
Server: gws
Content-Length: 218
X-XSS-Protection: 1; mode=block
{% endhighlight %}

The only thing you need to write is `GET /` and the server will respond to
your http GET request. This is much more convenient than reading hundreds of
RFC's before you start even thinking about programming an http client. Other
than that it works exactly the same way as **cat** (and no, not the _furry_
one). Everything you pass to it, it will pass along to the remote server.

This way you can test almost all text protocols that work over TCP or UDP.
Just recently I did a [pop3client](https://github.com/astro-/pop3client) and
**netcat** helped me to track some bugs as well.

## Sources

- [nc man page](http://linux.die.net/man/1/nc)


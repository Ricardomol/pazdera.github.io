---
layout: post
title: Brief GDB Basics
description: "Introducing a few typical use-cases of gdb for debugging."
cover: christmas-lights.jpg
comments: true
categories:
- Code
- Linux
- Software
tags:
- debugging
- gnu debugger
- programming
---
In this post I would like to go through some of the very basic cases in which
`gdb` can come in handy. I've seen people avoid using `gdb` , saying it is a
CLI tool and therefore it would be hard to use. Instead, they opted for this:

{% highlight cpp %}
std::cout << "qwewtrer" << std::endl;
DEBUG("stupid segfault already?");
{% endhighlight %}

That's just stupid. In fact, printing a back trace in gdb is as easy as
**writing two letters**. I don't appreciate lengthy debugging sessions that
much either, but it's something you simply cannot avoid in software
development. What you can do to speed things up is to know the right tools and
to be able to use them efficiently. One of them is **GNU debugger**.

## Example program

All the examples in the text will be referring to the following short piece of
code. I have it stored as `segfault.c` and it's basically a program that calls
a function which results in segmentation fault. The code looks like this:

{% highlight c %}
/* Just a segfault within a function. */

#include <stdio.h>
#include <unistd.h>

void segfault(void)
{
    int *null = NULL;
    *null = 0;
}

int main(void)
{
    printf("PID: %d\n", getpid());
    fflush(stdout);

    segfault();

    return 0;
}
{% endhighlight %}

## Debugging symbols

One more thing, before we proceed to **gdb** itself. Well, two actually. In
order to get anything more than a bunch of hex addresses you need to compile
your binary **without stripping symbols** and **with debug info included**. Let
me explain.

Symbols (in this case) can be thought of simply variable and function names.
You can strip them from your binary either during compilation/linking (by
passing -s argument to gcc) or later with `strip(1)` utility from binutils.
People do this, because it can significantly reduce size of the resulting
object file. Let's see how it works exactly. First, compile the code with
striping the symbols:

{% highlight bash %}
gcc -s segfault.c
{% endhighlight %}

Now let's fire up gdb:

{% highlight bash %}
gdb ./a.out
GNU gdb (GDB) Fedora (7.3.1-48.fc15)
Reading symbols from /mnt/MyBook/code/a.out...(no debugging symbols found)...done.
{% endhighlight %}

Notice the last line of the output. **gdb** is complaining that it didn't find
any debuging symbols. Now, let's try to run the program and display stack trace
after it crashes:

{% highlight text %}
(gdb) run
Starting program: /mnt/MyBook/code/a.out
PID: 21568
Program received signal SIGSEGV, Segmentation fault.
0x08048454 in ?? ()
{% endhighlight %}

{% highlight text %}
(gdb) bt
#0 0x08048454 in ?? ()
#1 0x0804848d in ?? ()
#2 0x4ee4a3f3 in __libc_start_main (main=0x804845c, argc=1, ubp_av=0xbffff1a4,
init=0x80484a0, fini=0x8048510,
rtld_fini=0x4ee1dfc0 , stack_end=0xbffff19c) at libc-start.c:226
#3 0x080483b1 in ?? ()
{% endhighlight %}

You can imagine, that this won't help you very much with the debugging. Now
let's see what happens when the code is compiled with symbols, but without the
debuginfo.

{% highlight text %}
gcc segfault.c
gdb ./a.out
GNU gdb (GDB) Fedora (7.3.1-48.fc15)
Reading symbols from /mnt/MyBook/code/a.out...(no debugging symbols found)...done.

(gdb) run
Starting program: /mnt/MyBook/code/a.out
PID: 21765
Program received signal SIGSEGV, Segmentation fault.
0x08048454 in segfault ()

(gdb) bt
#0 0x08048454 in segfault ()
#1 0x0804848d in main ()
{% endhighlight %}

As you can see, gdb still complains about the symbols in the beginning, but
the results are much better. The program crashed when it was executing
`segfault()` function, so we can start looking for any problems from there. Now
let's see what we get when debuginfo get's compiled in.

{% highlight text %}
gcc -g segfault.c
gdb ./a.out
GNU gdb (GDB) Fedora (7.3.1-48.fc15)
Reading symbols from /mnt/MyBook/code/a.out...done.

(gdb) run
Starting program: /mnt/MyBook/code/a.out
PID: 21934
Program received signal SIGSEGV, Segmentation fault.
0x08048454 in segfault () at segfault.c:9
9 *null = 0;
{% endhighlight %}

That's more like it! **gdb** printed the exact line from the code that caused
the program to crash! That means, every time you try to use gdb to get some
useful directions for debugging, make sure, that you don't strip symbols and
have debuginfo available!

## Start, Stop, Interrupt, Continue

These are the basic commands to control your application's runtime. You can
**start** a program by writing

{% highlight text %}
(gdb) run
{% endhighlight %}

When a program is running, you can **interrupt** it with the usual **Ctrl-C**,
which will send **SIGINTR** to the debugged process. When the process is
interrupted, you can examine it (this is described later in the post) and then
either **stop it completely** or let it **continue**. To stop the execution,
write

{% highlight text %}
(gdb) kill
{% endhighlight %}

If you'd like to let your program carry on executing, use

{% highlight text %}
(gdb) continue
{% endhighlight %}

I should point out, that in gdb, you can abbreviate most of the commands to as
little as a **single character**. For instance **r** can be used for **run**,
**k** for **kill**, **c** for **continue** and so on :).

## Stack traces

[Stack traces](http://en.wikipedia.org/wiki/Stack_trace "Stack trace at
wikipedia.org") are very powerful when you need to localize the point of
failure. Seeing a stack trace will point you directly to the function, that
caused you program to crash. If your project is small or you keep your
functions short and straight-forward, this could be **all you'll ever need**
from a debugger. You can display stack trace in case of a segmentation fault or
generally anytime **when the program is interrupted**. The stack trace can be
displayed by the **backtrace or bt** command

{% highlight text %}
(gdb) bt
#0 0x08048454 in segfault () at segfault.c:9
#1 0x0804848d in main () at segfault.c:17
{% endhighlight %}

You see, that the program stopped (more precisely was killed by the kernel
with a **SIGSEGV** signal) at line 9 of `segfault.c` file while it was
executing a function `segfault()` . The segfault function was called directly
from the `main()` function.

## Listing source code

When the program is interrupted (and compiled it with debuginfo), you can list
the code directly by using the `list` command. It will show the precise **line
of code** (with some context) where the program was interrupted. This can be
more convenient, because you don't have to go back into your editor and search
for the place of the crash by line numbers.

{% highlight text %}
(gdb) list
4 #include
5
6 void segfault(void)
7 {
8 int *null = NULL;
9 *null = 0;
10 }
11
12 int main(void)
13 {
{% endhighlight %}

We know (from the stack trace), that the program has stopped at **line 9**.
This command will show you exactly what is going on around there.

## Breakpoints

Up to this point, we only interrupted the program by sending a **SIGTERM** to
it manually. This is not very useful in practice though. In most cases, you
will want the program stop at some exact place during the execution, to be able
to inspect what is going on, what values do the variables have and possibly to
manually step further through the program. To achieve this, you can use
**breakpoints**. By attaching a breakpoint to a line of code, you say that you
want the debugger to interrupt every time the program wants to execute the
particular line and wait for your instructions.

A breakpoint can be set by a **break** command (before the program is
executed) like this

{% highlight text %}
(gdb) break 8
Breakpoint 2 at 0x4005c0: file segfault.c, line 8.
{% endhighlight %}

I'm using **line number** to specify, where to put the break, but you can use
also **function name** and **file name**. There are [multiple
variants](http://www.yolinux.com/TUTORIALS/GDB-Commands.html#GDB_COMMANDS "GNU
GDB Debugger Command Cheat Sheet") of arguments to break command.

You can list the breakpoints you have set up by writing **info breakpoints**:

{% highlight text %}
(gdb) info breakpoints
Num Type Disp Enb Address What
1 breakpoint keep n 0x00000000004005d8 in main at segfault.c:14
2 breakpoint keep y 0x00000000004005c0 in segfault at segfault.c:8
{% endhighlight %}

To disable a break point, use **disable &lt;Num&gt;** command with the number
you find in the info.

## Stepping through the code

When gdb stops your application, you can resume the execution manually
step-by-step through the instructions. There are several commands to help you
with that. You can use the **step** and **next** commands to advance to the
following line of code. However, these two commands are not entirely the same.
**Next** will 'jump' over function calls and run them at once. **Step**, on the
other hand, will allow you to descend into the function and execute it
line-by-line as well. When you decide you've had enough of stepping, use the
**continue** command to resume the execution uninterrupted to the next break
point.

{% highlight text %}
Breakpoint 1, segfault () at segfault.c:8
8 int *null = NULL;

(gdb) step
9 *null = 0;
{% endhighlight %}

There are multiple things you can do during the process of stepping through a
running program. You can dump values of variables using the **print** command,
even set values to variables (using **set** command). And this is definitely
not all. Gdb is **great**! It really can save a lot of time and lets you focus
on the important parts of software development. Think of it the next time you
try to bisect errors in the program by inappropriate debug messages :-).

## Sources
- [RMS's gdb Tutorial](http://www.unknownroad.com/rtfm/gdbtut/gdbstep.html "RMS's gdb Tutorial")
- [GNU GDB Debugger Command Cheat Sheet](http://www.yolinux.com/TUTORIALS/GDB-Commands.html "GNU GDB Debugger Command Cheat Sheet")

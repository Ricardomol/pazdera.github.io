---
layout: post
title: Exploring Runlevels
categories: [Linux]
tags:
  - linux
  - operating system
  - runlevel
  - startup
status: publish
type: post
published: true
image:
  feature: autumn-leaves-2.jpg
comments: true
share: true
---

Today I would like to have a closer look at _runlevels_. Rulevel, in other
words \"a mode of operation\", is a certain setup of services in your
operating system. Conventionally, there are 7 runlevels defined in a
Linux-based operating system numbered 0 to 6.

The purpose of different runlevels is usually:

1. **Halt**
2. **Single-User Mode**
3. Multi-User Mode
4. Multi-User Mode with Networking
5. Not used/User-definable
6. Start the system normally with GUI
7. **Reboot**

The highlighted runlevels (0,1 and 6) are present in virtually all operating
systems. The definition of other runlevels might differ between different
systems and distributions. Some might be unused, some just aliases for
another runlevels. It depends on what system you use. Another important
thing is, that system during the bootup **doesn't** go sequentially through
all the runlevels.

Now a little more about what you can do with the runlevels. You can find out
in what runlevel is your system currently working by typing:

{% highlight bash %}
$ runlevel
{% endhighlight %}

or alternatively

{% highlight bash %}
$ who -r
{% endhighlight %}

It will display two numbers, first says the **previous** runlevel and the
second **current** runlevel. Now, how to change a runlevel manually? Well,
this is an easy task as well. You can switch runlevels by typing:

{% highlight bash %}
init
{% endhighlight %}

For example `init 6` will reboot. This doesn't start the init process all
over again. If the init doesn't have `PID=1` it will run a program called
`telinit` which "tells init to change runlevels".

There are a set of services that are shut down or started upon entering a
certain runlevel. The scripts that control it can be found in `/etc/init.d/`
folder. Additionally, there is a separate folder with **symlinks** into the
`/etc/init.d/` folder for each run level. The symlinks say what service to
start or kill upon entering a certain runlevel (for example `/etc/rc6.d/`
for rebooting (runlevel 6) etc.).

Each script in `/etc/init.d/` takes some parameters. Some of them are for
example: **start**, **stop**, **restart**, **status**. When you explore the
directories further, you'll find a set of weirdly named files. Here is content
of mine `/etc/rc6.d/` folder:

{% highlight bash %}
astro@astro-desktop:~$ ls /etc/rc6.d/
K05preload       K20lpd         K99laptop-mode          S35networking
K09apache2       K20vboxdrv     README                  S40umountfs
K20cinestart     K20winbind     S10unattended-upgrades  S60umountroot
K20flow-capture  K31atieventsd  S15wpa-ifupdown         S90reboot
K20fprobe        K50alsa-utils  S20sendsigs
K20hddtemp       K74bluetooth   S30urandom
K20kerneloops    K80openvpn     S31umountnfs.sh
{% endhighlight %}

The names of the files are actually very important. When init is processing a
"S"tart link, it will supply the parameter "start." When following a "K"ill
link, it will supply "stop." The number after the first letter is a sort-of
priority and specifies the order of execution of these scripts.

There can be any number of symbolic-links pointing to the same file, and very
frequently there are. If a service (daemon) needs to be started in more than
one runlevel, you simply have a symbolic-link in each of the appropriate
`/etc/rc.d/rcX.d` directories.

In addition there is one script -- `/etc/rc.local` . This script is executed
**after all the init scripts in each multi-user runlevel**. By the default it
does nothing, but you can edit it yourself to add some actions.

In the end of this post, we'll show how to add a script of your own that will
be executed on startup. There are a couple of ways of doing it. The first,
kind of obvious one is the manual way. You can create a script, put it into
the `init.d` directory and then manually create the links in each directory.

The other way is using an utility called `update-rc.d` that will do this for
you. You can specify what script you would like to start or stop in what
runlevel.

**Sources:**

- [http://www.linfo.org/runlevel\_def.html](http://www.linfo.org/runlevel_def.html)
- [http://wiki.linuxquestions.org/wiki/Run\_Levels](http://wiki.linuxquestions.org/wiki/Run_Levels)

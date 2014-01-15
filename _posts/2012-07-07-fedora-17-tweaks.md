---
layout: post
title: Fedora 17 Tweaks
description: "A collection of post-installation fixes and hacks."
cover: snaresbrook-blur.jpg
comments: true
categories:
- Howto
- Linux
tags:
- Beefy Miracle
- Fedora 17
- Gnome 3.4
- installation
- tweaks
---
I finally had a bit of time to perform the annual desktop re-install to upgrade
the OS on my primary computer.

It's always a little bit of pain, because I pretty much rely on that machine
and I want to have everything in place and ready to use. I upgraded from
Lovelock to Beefy Miracle which took me from **Gnome 3.0** right to **3.4**.
Things moved forward a lot during the past year! Lots of people [hate Gnome
Shell](https://plus.google.com/102150693225130002912/posts/UkoAaLDpF4i "Linus
Torvalds on Gnome 3.4"), but I'm ok with it - despite the occasional segfault.
It's definitely not perfect, but I like the idea of using the SUPER key for
switching between applications. I have bindings for switching workspaces and
after all, I end up using vim, chromium and terminal anyway :).

There are always some post-installation tweaks I like to do, to make the
system fit my personal needs more. Here they are, maybe someone could use them
as well.

## Gnome Tweak Tool

This is the first thing to install to a fresh Fedora 17 or probably any
distribution using Gnome 3 desktop. For some reason, the designers decided,
that normal users don't like to change fonts or window manager themes and they
moved all this "things for advanced users" to **gnome-tweak-tool**. To install
it, use the following command

{% highlight bash %}
$ su -c 'yum install gnome-tweak-tool'
{% endhighlight %}

This will add **Advanced Settings** icon to the application picker in
activities overview (that comes up after you hit the windows key). The
application allows you to fine-tune various parts of Gnome, such as font sizes,
icons on the desktop, enable or disable extensions etc.

<figure class="half">
	<a href="/assets/images/posts/advanced_settings.png">
        <img src="/assets/images/posts/advanced_settings.png"
             alt="Advanced Settings in Application Menu">
    </a>
	<a href="/assets/images/posts/gnome-tweak-tool.png">
        <img src="/assets/images/posts/gnome-tweak-tool.png" alt="Tweak Tool">
    </a>
	<figcaption>
        Gnome 3: Advanced Settings and the Tweak Tool
    </figcaption>
</figure>

## Clearlooks in Gnome 3.4

What surprised me the most is lack of **Clearlooks** theme in Fedora 17. I got
used to that theme too much over the years! Luckily for me, there's a port for
Gtk 3 called **Clearlooks-Phenix**! To install this theme you need to download
and unpack [Clearlooks-Phoenix
2](http://jpfleury.indefero.net/p/clearlooks-phenix/source/download/master/),
which is suited for Gtk 3.4. After that, copy the contents of the archive
either to `/usr/share/themes` to make it available for all users or `~/.themes`
just for yourself. There are more detailed install installing instructions
available directly on the [project's
website](http://www.jpfleury.net/en/software/clearlooks-phenix.php "Clearlooks
Phenix"). Here's a series of commands, that will do that

{% highlight bash %}
wget http://jpfleury.indefero.net/p/clearlooks-phenix/source/download/master/
unzip clearlooks-phenix-master.zip
mv clearlooks-phenix-master Clearlooks-Phenix
su -c 'cp -r Clearlooks-Phenix /usr/share/themes'
{% endhighlight %}

<figure class="full">
	<a href="/assets/images/posts/clearlooks-f17.png">
        <img src="/assets/images/posts/clearlooks-f17.png" alt="Clearlooks in Fedora 17">
    </a>
	<figcaption>
        Clearlooks-Phenix theme preview in Fedora 17
    </figcaption>
</figure>

## Nautilus Loading Too Long

I have this problem with Nautilus on my installation. When the file browser
starts, cursor changes to the loading circle one and stays like that for 20
seconds. The application on the other hand seems to be loaded and fully usable.
Fortunately, there is a simple workaround to this problem. To fix this, simply
edit `/usr/share/applications/nautilus.desktop` , find line that contains
`StartupNotify=true` (131 on my system) and change the value to **false**.

<figure class="half">
	<a href="/assets/images/posts/nautilus-loading.png">
        <img src="/assets/images/posts/nautilus-loading.png"
             alt="Nautilus Loading Issue">
    </a>
	<a href="/assets/images/posts/nautilus-config-vim.png">
        <img src="/assets/images/posts/nautilus-config-vim.png" alt="Executable config">
    </a>
	<figcaption>
        The issue with nautilus and where to fix it.
    </figcaption>
</figure>

## Multiple Workspaces with Two Screens

Another thing that bothers me on Gnome 3.4 is that, there are no workspaces on
the secondary screen. The designers assume, that if you have two monitors, you
use workspaces on the primary one and "pin" some windows to the secondary
screen, that will stay there all the time through the context switching. I
prefer to have this the other way though (i.e. so the workspaces change on the
secondary screen as well). This can be easily altered by issuing this command:

{% highlight bash %}
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
{% endhighlight %}

The situation is also described in the following articles:

- [Multimonitor support in gnome shell](http://blogs.gnome.org/alexl/2011/03/22/multimonitor-support-in-gnome-shell/ "Multimonitor support in gnome shell")
- [Fix Dual Monitors in GNOME 3 (aka My Workspaces are Broken!)](http://gregcor.com/2011/05/07/fix-dual-monitors-in-gnome-3-aka-my-workspaces-are-broken/ "Fix Dual Monitors in GNOME 3 (aka My Workspaces are Broken!)")

## Blue Faces in Flash Player

This issue is caused by combination of Adobe Flash player and nVidia
proprietary drivers. And for some reason, the colors are messed up in flash
videos. I guess, that [Linus was
right](http://www.youtube.com/watch?v=_36yNWw_07g "Fuck You nVidia") (again).
To fix this, you need turn off the hardware acceleration in flash player
settings. Right click on the flash video, chose **Settings** and **untick** the
_Enable Hardware Acceleration_ option. You need to restart your browser for the
change to take effect.

<figure class="half">
	<a href="/assets/images/posts/bbt-bad.png">
        <img src="/assets/images/posts/bbt-bad.png"
             alt="Corrupt colours in flash player">
    </a>
	<a href="/assets/images/posts/bbt-good.png">
        <img src="/assets/images/posts/bbt-good.png" alt="Proper colours in flash player">
    </a>
	<figcaption>
        The flash player issue and how to fix it.
    </figcaption>
</figure>

## Logging Screen Background

I personally don't like fireworks that much :-P and since they're the default
background of Beefy Miracle, the wallpaper is also present behind the logging
screen. You can change the default wallpaper by editing the following file:

{% highlight bash %}
vim /usr/share/backgrounds/beefy-miracle/default/beefy-miracle.xml
{% endhighlight %}

and changing the paths to wallpapers for different screen sizes. I like the
blue **Gnome stripes**. For that one, you can set the path to 
`/usr/share/backgrounds/gnome/Stripes.jpg`.

## Keyboard Layout Resets to US on Logout

I don't know what's causing this and I didn't find a complete workaround
either. Every time I log off from my account, the keyboard layout is reset to
**English(US)**, despite the settings where the default is **Czech**. The
workaround for this is to remove the **English(US)** from layout settings
completely and keep only **Czech**. I can live with that, but it can be pretty
annoying to other people I guess.

## Other Useful Links
- [Installing Adobe Flash Plugin](http://fedoraproject.org/wiki/Flash#Enabling_Flash_plugin)
- [Installing MS Windows Proprietary Fonts](http://www.fedorafaq.org/#installfonts)
- [Autoplus tool for Fedora](http://www.muktware.com/3664/install-flash-google-chrome-proprietary-codecs-fedora-17-fedora-utils-vs-autoplus)
- [Grub 2 v barvách (Czech only)](http://fedora.cz/grub-2-v-barvach/)

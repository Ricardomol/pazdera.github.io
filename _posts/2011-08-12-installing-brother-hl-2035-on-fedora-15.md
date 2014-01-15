---
layout: post
title: Installing Brother HL-2035 on Fedora 15
categories:
- Linux
tags:
- Brother HL-2035
- cups
- Fedora 15
- install drivers
- linux
- printer drivers
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
This is a step-by-step how-to on installing drivers for **Brother HL-2035**
printer. I installed it on **Fedora 15 Linux**, but it should work on most
other distributions as well (with some alterations). Let's get on with it.

### Step 1: Download the official drivers

First and foremost you'll need to download drivers for this printer from
[Brother's website](http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#HL-2030).
They don't supply HL-2035 drivers only HL-2030 so get those (download both
files [LPR driver](http://www.brother.com/pub/bsc/linux/dlf/brhl2030lpr-2.0.1-1.i386.rpm)
and [cupswrapper driver](http://www.brother.com/pub/bsc/linux/dlf/cupswrapperHL2030-2.0.1-1.i386.rpm)).
For Fedora get the **.rpm.** On Ubuntu or any other Debian-based system you'll
probably want the **.deb** packages.

### Step 2: Install the drivers

Now install the downloaded files either by double-clicking on them or from
terminal. Make sure you install **LPR driver first**.

{% highlight bash %}
$ sudo rpm -ihv brhl2030lpr-2.0.1-1.i386.rpm
$ sudo rpm -ihv cupswrapperHL2030-2.0.1-1.i386.rpm
{% endhighlight %}

There is an [installation
guide](http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/instruction_prn1a.html)
for the drivers at Brother's website. You can try following that if something
goes wrong. Just omit the **--nodeps** option. When you're done installing
restart **cups** by writing

{% highlight bash %}
$ sudo /etc/init.d/cups restart
{% endhighlight %}

### Step 3: Add **cups** printer

Open your favourite web browser and go to
[http://localhost:631/](http://localhost:631/). A nice cups homepage should
show up. [Go to Administration -> Manage
printers](http://localhost:631/printers/) and see if the printer is there. If
not, you will need to add it.

<figure>
	<a href="/assets/images/posts/cups_printers.png">
        <img src="/assets/images/posts/cups_printers.png"
             alt="A list of printers in CUPS">
    </a>
	<figcaption>A list of printers in CUPS.</figcaption>
</figure>

To add new printer go back to [administration](http://localhost:631/admin/)
and click on add printer. A dialogue will pop-up asking for your credentials.
Use **root** as user name and **your system's root password**. Then select the
**Brother HL-2030 series (Brother HL-2030 series)** from local printers and hit
**Continue**. Leave defaults on the second screen, **Continue** again. On the
last screen of the wizard you'll be asked what drivers to use. We'll do it by
supplying the [PPD
file](http://www.openprinting.org/ppd-o-matic.php?driver=hl1250&printer=Brother-HL-2035&show=0)
for HL-2035. Download the PPD, select it in the form and finish the wizard.

### Done!

The printer should be working by now and you should see it among printers in
cups and be able to print.

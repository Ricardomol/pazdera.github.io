---
layout: post
title: nVidia CUDA on Linux (Fedora 15)
description: "A step-by-step walk-through making the CUDA SDK work on Linux."
cover: park.jpg
comments: true
categories:
- Howto
- Linux
tags:
- cuda
- Fedora 15
- linux
- nvidia
---
I recently updated my desktop with a new graphic card from nVidia -- a pretty
low-end [GT440](http://www.gigabyte.com/products/product-page.aspx?pid=3746).

It's actually my first nVidia card. I owned three ATI Radeon cards (Sapphire
9550, 9600Pro and HD2600XT) before. The main reason for this was, that I
needed CUDA enabled card in order to be able to work on my school project (I
study computer graphics). On top of that, Gnome 3 has some issues with ATI
drivers and the HD2600XT is like 5 years old today. Anyway, I recently
installed the nVidia CUDA SDK on Fedora 15 and I made a little howto along the
way.

## Installing gcc

One of the biggest issues in with CUDA is that it officially supports only
**gcc** of version 4.4 and earlier. That's a bummer, especially on Fedora,
where there is **gcc-4.6** by default and you need to compile the older version
yourself. I posted series of steps to compile gcc from sources in a separate
article [Multiple Versions of gcc on Fedora
15](http://linuxwell.wordpress.com/2011/10/30/multiple-versions-of-gcc-on-fedora-15/
"Multiple Versions of gcc on Fedora 15").

## Drivers

There is something called **Developer Drivers for Linux** available from the
[nVidia website](http://developer.nvidia.com/cuda-toolkit-40). I don't know
what it is or how is it different from the original drivers, but I couldn't
make them work. The installation kept dying with some error with kernel
headers.

Good news is, that you don't need them. At least I was able to compile and run
the CUDA SDK without installing these only with the standard nVidia proprietary
driver (version 285.05.09). If you're running them, you're fine. In case you
have the noveau open-source drivers you need to get rid of them and **install
the nVidia proprietary driver**.

There is one little thing you need to do if you chose not to install the
developer drivers: make a symlink for `libcuda.so` like this


{% highlight bash %}
su cd /usr/lib
ln -s nvidia/libcuda.so libcuda.so
{% endhighlight %}

## CUDA Toolkit

This is pretty straight-forward. Download and run shell script from the
[nVidia download page](http://developer.nvidia.com/cuda-toolkit-40). Choose
what's closest to your distro. In this case it's Fedora 13. Fedora 15 is
officially unsupported due to the lack of old gcc. But we have sorted this
earlier, so it's fine to use the F13 pack.

{% highlight bash %}
wget http://www.nvidia.com/object/thankyou.html?url=/compute/cuda/4_0/toolkit/cudatoolkit_4.0.17_linux_32_fedora13.run
sudo sh cudatoolkit_4.0.17_linux_32_fedora13.run
{% endhighlight %}

In case you're prompted with question where to install the toolkit, just hit to
keep the defaults.

## GPU Computing SDK

Installing the SDK is as easy as the toolkit. Download and run the script from
nVidia homepage. This time you won't need root permissions, because it will
install into your home folder.

## Setting System Path
The tricky part is here, now you need to make sure all  the libraries and
tools are present in the correct environment variables. Edit your `~/.bashrc`
file and add the following:

{% highlight bash %}
# CUDA
export PATH="$PATH:/usr/local/cuda/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib"
{% endhighlight %}

Reopen your shell and you should be able to run the nvidia C compiler. Make
sure by trying this

{% highlight bash %}
nvcc --version
{% endhighlight %}

The last step is trying to compile all the examples in the SDK. Change to that
directory and simply run make.

{% highlight bash %}
cd /NVIDIA_GPU_Computing_SDK make
{% endhighlight %}

Everything should be working. There will be a lot of warnings during the
compilation, but we just have to ignore that...

## Sources
- [1] [CUDA on Fedora 15](http://forums.fedoraforum.org/showthread.php?t=267629)
- [2] [Guide: Installing CUDA SDK on Linux](http://forums.nvidia.com/index.php?showtopic=192306)
- [3] [Installing CUDA Toolkit 4.0 on Fedora 13 Linux](http://www.r-tutor.com/gpu-computing/cuda-installation/cuda4.0-fc13)
- [4] [Intro to CUDA](http://www.linux-mag.com/id/7791/)


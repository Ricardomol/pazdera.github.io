---
layout: post
title: Multiple Versions of gcc on Fedora 15
description: "A guide to compiling gcc from scratch on Fedora."
cover: candles.jpg
comments: true
categories:
- Howto
- Linux
tags:
- build gcc
- gnu c compiler
- multiple versions of gcc
---
This post describes a way of building and installing additional versions of
**GNU gcc** compiler on Fedora 15.

The version shipped with Lovelock is **gcc 4.6.1** which, surprisingly, can
sometimes be too new. Some apps such as _nVidia CUDA SDK_ requires a specific
version of compiler for some reason. In this howto I'll be installing
**gcc-4.4.6**.

**Notice:** There is an [official installation guide](http://gcc.gnu.org/install/)
that will help you if something doesn't work (or I forgot to mention something
here).

## 1. Getting the Source

I guess, nobody will be surprised when I say, that the first step is to obtain
the sources. Go to [http://gcc.gnu.com](http://gcc.gnu.org/mirrors.html), pick
a mirror and download the version you need. The best option is usually
downloading the package with all languages included (e.g. `gcc-4.4.6.tar.gz` ).
We will unpack the archive and rename the directory to `source/` . It is also
recommended to build the binaries into a separate directory from the sources,
so we'll create a `build/` folder too:

{% highlight bash %}
tar xzf gcc-4.4.6.tar.gz
mv gcc-4.4.6/ source/
mkdir build/
{% endhighlight %}

## 2. Configure

Now we have everything in place, we need to configure the build. Change into
the `build/` directory and call the configure script:

{% highlight bash %}
cd build/
../source/configure --prefix=/opt/gcc4.4.6 \
                    --program-suffix=-4.4
{% endhighlight %}

As you can see, there are some parameters. `--prefix` option says where should
be the gcc installed after the build. We will install it separately into the
`/opt` directory, so it will be easily removable in the future only by deleting
the respective directory. `--program-suffix` will be added to the name of the
executable (in this case `gcc-4.4` ), so it doesn't collide with other
installed versions of gcc on your system.

Warning: Be careful with the `--program-suffix` option. You might have to make
some symlinks to use the compiler in some vendor Makefiles. It will be
explained later in this post.

Optionally you can add `--enable-languages=c,c++` to choose what languages
support will be compiled. For more options, refer to the official guide above.

In case the configure script fails, you probably don't have all the necessary
packages installed to perform the build. See what's missing and install it with
yum. For me the following was enough:

{% highlight bash %}
su
yum groupinstall "Development tools"
yum install mpfr-devel
{% endhighlight %}

The full list of [prerequisites](http://gcc.gnu.org/install/prerequisites.html)
can be found here.

## 3. Build

The build is fairly simple, if you see some warnings, feel free to ignore
them. To build gcc write the following inside the `build/` directory:

{% highlight bash %}
make
{% endhighlight %}

Now is the time to get some coffee, because it will take a while to build.

## 4. Installation

Installation is also quite easy. You can install gcc by writing

{% highlight bash %}
su
make install
{% endhighlight %}

Then check whether the installation was correct and everything is in place

{% highlight bash %}
/opt/gcc4.4.6/bin/gcc-4.4 --version
{% endhighlight %}

## 5. Using the alternative compiler

Using the alternate compiler is a little tricky. You can it to your system
path by appending this line to your `~/.bashrc` file.

{% highlight bash %}
export PATH="/opt/gcc-4.4.6/bin:$PATH"
{% endhighlight %}

The alternate compiler is available through **gcc-4.4** name (as we defined in
the configuration phase). That is cool for your Makefiles, but some vendors
hardcode compiler name into their Makefile which doesn't help at all. If this
is your case, the best way to get things to work is to make symlinks to the
alternate gcc and append the directory to the **begining of `$PATH`   string**.
Here are example symlinks for gcc and g++:

{% highlight bash %}
cd /opt/gcc-4.4.6/bin
ln -s gcc-4.4 gcc
ln -s g++-4.4 g++
{% endhighlight %}

Note, that the system look-up in the `$PATH` folder is sequential, so if you
append the directory to the front of the variable, it will have higher
priority. If you need to use the newer compiler again, simply remove the
directory from path by commenting out the line in `~/.bashrc` . Remember, you
can always find out version of your current gcc by writing

{% highlight bash %}
gcc --version
{% endhighlight %}

## Sources

- [1] [http://www.mjmwired.net/resources/mjm-fedora-gcc.html](http://www.mjmwired.net/resources/mjm-fedora-gcc.html)
- [2] [Installing GCC 4.4 on Fedora 14 to use CUDA SDK 4.0](http://www.linuxquestions.org/questions/linuxquestions-org-member-success-stories-23/installing-gcc-4-4-on-fedora-14-to-use-cuda-sdk-4-0-a-903157/)
- [3] [Install and use multiple versions of gcc (on F15)](http://www.fedoraforum.org/forum/showthread.php?t=264653)

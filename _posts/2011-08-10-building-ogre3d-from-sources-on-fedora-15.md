---
layout: post
title: Building Ogre3D from Sources on Fedora 15
categories:
- Howto
- Linux
- Software
tags:
- building
- compiling
- installation
- Ogre
- Ogre3D
status: publish
type: post
published: true
image:
  feature: abstract-3.jpg
share: true
comments: true
---
This is a little walk-through the whole build process of **Ogre 3D rendering
engine**. It's primarily for users of **Fedora GNU/Linux distribution** or any
similar distro that uses rpms and yum. I chose the variant using
[cmake](http://www.ogre3d.org/tikiwiki/Building+Ogre+With+CMake), so first
thing you want to do is install [cmake](http://www.cmake.org/).

{% highlight bash %}
$ su -c 'yum install cmake cmake-gui'
{% endhighlight %}

After that there are also some
[prerequisites](http://www.ogre3d.org/tikiwiki/Prerequisites?tikiversion=Linux#Fedora),
that you need to install. For the Cg package you'll need to enable rpmfusion
nonfree repositary by writing

{% highlight bash %}
$ su -c 'yum localinstall --nogpgcheck
http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm'
{% endhighlight %}

Then install the dependencies using

{% highlight bash %}
$ sudo yum install gcc-c++ libXaw-devel freetype-devel freeimage-devel \
                   zziplib-devel boost-devel ois-devel Cg doxygen \
                   cppunit-devel
{% endhighlight %}

Some of them are optional, but I like to install them all, just in case. Since
the hard-drive space is no longer an issue, it could save you from having to
build it all over again. After that proceed to downloading the latest version
of Ogre3d [source](http://www.ogre3d.org/download/source) and unpack it
somewhere.

{% highlight bash %}
$ cd ~/Downloads
$ tar xjf ogre_src_v1-7-3.tar.bz2
{% endhighlight %}

This will extract the sources into a new directory. Let's rename it to
`source` . Then we'll need another directory where all the binaries will be
places. Let's call it `build` . After that run `cmake` .

{% highlight bash %}
$ mv ogre_src_v1-7-3/ source/
$ mkdir build
$ cmake-gui
{% endhighlight %}

In the gui set both paths to the source and to the build directory and hit
Configure button, leave the defaults (Unix Makefiles and Use default native
compilers).

<figure class="half">
	<a href="/assets/images/posts/ogre_cmake.png">
      <img src="/assets/images/posts/ogre_cmake.png" alt="CMake example (building Ogre3D)">
    </a>
	<a href="/assets/images/posts/cmake2.png">
	    <img src="/assets/images/posts/cmake2.png" alt="What should be installed">
    </a>
	<figcaption>Building Ogre3D with CMake.</figcaption>
</figure>

Check the **Advanced** and **Grouped** check-boxes and make sure you have
installed everything you might need. If you compile ogre without some features
here, you'll need to do it all over again (I did it 4 times when I compiled
Ogre for the first time). You should have installed zzip, zlib, freeimage,
freetype, boost, opengl, X11, and ois. If you don't, I highly recommend to
install those libs and hit configure again. When you're done, hit **Generate**.

At this point, we're done with the cmake, you can close the window and get
back to your terminal window. Now we proceed to the building process itself.
Change to the `build/` directory and run `make` to compile Ogre3D and wait.

{% highlight bash %}
$ cd build
$ make
{% endhighlight %}

There will be percentage coming up as the library builds. It takes (on my
machine) a solid half-hour to build, so feel free to go get some coffee. The
only thing left is installing the compiled library to your system using the
classic

{% highlight bash %}
$ su -c 'make install'
{% endhighlight %}

Enjoy your Ogre!

## Sources

- [http://www.ogre3d.org/tikiwiki/Building+Ogre](http://www.ogre3d.org/tikiwiki/Building+Ogre)



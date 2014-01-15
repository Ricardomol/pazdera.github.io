---
layout: post
title: Custom Kernel for Fedora
description: "Compile and set up your own kernel on Fedora."
cover: cathedral.jpg
comments: true
categories:
- Linux
- Kernel
tags:
- build the linux kernel
- custom kernel
- Fedora
---
Why would someone want to have a **custom kernel**? Well, maybe you like the
cutting-edge features or maybe you want to hack on it! Anyway, this post
explains step-by-step, how to **download**, **build** and **install** your
custom kernel on Fedora. I'll be building kernel from the mainline tree for
i686.

<span style="background-color:red;color:white;padding:3px;">Warning:</span>
Keep in mind that if something goes wrong you might end up
irreversibly damaging your system! Always keep a fail-safe kernel to boot to,
just in case!

## 1. Getting the kernel tree

Linux kernel tree is developed using **git** revision control system. There
are a LOT of different versions and different trees of the kernel maintained by
various people. The development tree is **linux-next**, Linus' mainline is
called simply **linux**, there is also **linux-mm** which had a similar purpose
as **linux-next** today. You need to pick one and clone it locally. In this
how-to, I'll stick with the **linux** tree from Linus that is at least a tiny
bit more stable than **linux-next**. Use the following to get the source:

{% highlight bash %}
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
{% endhighlight %}

## 2. Patching the source

Since this is really bleeding-edge code, there might be some problems with
compilation or other bugs. Now is the time to patch the tree to resolve all
these issues. Also if you want to hack a little and do some of your own changes
to the kernel, now is the time! Don't be afraid, it's not that hard ...

## 3. Configure the kernel

Kernel is a pretty big piece of software and it provides a shitload of 
configuration options. Various limits and settings can be adjusted in this
phase. You can also decide, what parts of kernel such as what drivers will be
included in your build. Like I said, there is a lot of options and a couple of
ways of setting them:

{% highlight bash %}
make config     # Go through each and every option by hand 
make defconfig  # Use the default config for your architecture
make menuconfig # Edit the config with ncurses gui
make gconfig    # Editing with gtk GUI app
{% endhighlight %}

Sometimes, the kernel is built with an option that it saves it's configuration
in `/proc/config.gz` . If this is your case, you can copy it inside the tree
and use `make oldconfig` . This will ask only for the new features, that were
not present in the previous version.

{% highlight bash %}
zcat /proc/config.gz > .config $ make oldconfig
{% endhighlight %}

On Fedora, the configuration of currently installed kernels can be found in
the `/boot` directory:

{% highlight bash %}
ll /boot/config*
-rw-r--r--. 1 root root 123540 Mar 20 17:31 /boot/config-2.6.42.12-1.fc15.i686
-rw-r--r--. 1 root root 125193 Apr 21 15:54 /boot/config-2.6.43.2-6.fc15.i686
-rw-r--r--. 1 root root 125204 May 8 14:23 /boot/config-2.6.43.5-2.fc15.i686
{% endhighlight %}

## 4. Build it

When you're done configuring, you can advance to the build. The only advice I
can give you here to take advantage of -j option that **make** offers if you're
on a system with multiple cores. To build the kernel using 2 jobs per core on a
dual-core processor use:

{% highlight bash %}
make -j4
{% endhighlight %}

It will significantly improve the build times. Either way, it will take some
time to build, so it's time to get a coffee!

## 5. Installation

Result of successful build should be a **bzImage** located in
`arch/i386/boot/bzImage` and a bunch of built
[modules](http://en.wikipedia.org/wiki/Loadable_kernel_module) **\*.ko**
(kernel object). It's vital to point out, that _bzImage_ isn't just a
bzip2-compressed kernel object. It's a specific bootable file format, that
contains compressed kernel code along with some boot code (like a stub for
decompressing the kernel etc).

<figure class="full">
	<a href="/assets/images/posts/anatomy-of-bzimage.png">
        <img src="/assets/images/posts/anatomy-of-bzimage.png" alt="Contents of bzImage">
    </a>
	<figcaption>
        Anatomy of a bzimage (source: wikipedia.org)
    </figcaption>
</figure>


To install the new kernel, rename and copy the **bzImage** to boot and install
the modules by writing:

{% highlight bash %}
cp arch/i386/boot/bzImage "/boot/vmlinuz-"`make kernelrelease`
make modules_install
{% endhighlight %}

The modules will be installed to `/lib/modules` . Also a file called
**System.map** will be created in the root of kernel source tree which is a
[symbol look-up](http://en.wikipedia.org/wiki/System.map) table for kernel
debugging. You can place it into `/boot` along with the image:

{% highlight bash %}
cp System.map "/boot/System.map-"`make kernelrelease`
{% endhighlight %}

The file contents looks like this:

{% highlight bash %}
head System.map
00000000 A VDSO32_PRELINK
00000040 A VDSO32_vsyscall_eh_frame_size
000001d5 A kexec_control_code_size
00000400 A VDSO32_sigreturn
0000040c A VDSO32_rt_sigreturn
00000414 A VDSO32_vsyscall
00000424 A VDSO32_SYSENTER_RETURN
00400000 A phys_startup_32
c0400000 T _text
c0400000 T startup_32
{% endhighlight %}

## 6. Initramfs

When all the files are in place, you need to generate the **initial ramdisk (
[initramfs](http://en.wikipedia.org/wiki/Initrd))**. The initial filesystem
that is created in RAM is there to make some preparations before the real root
partition is mounted. For instance if you're root is on a **RAID or LVM**,
you'll need to pre-load some drivers etc. It usually just **loads the block
device modules** necessary to mount the root.

There's an utility called **dracut**, that will generate this for you.

{% highlight bash %}
dracut "" `make kernelrelease`
{% endhighlight %}

This will generate the image and store it into
`/boot/initramfs-_kernelrelease_.img` . To inspect the file use

{% highlight bash %}
lsinitrd /boot/initramfs-_kernelrelease_.img
{% endhighlight %}

## 7. Bootloader Settings

In the final step, before you can actually **boot** the new kernel is to
configure your bootloader and tell it that the new kernel is there. There was a
transition between Fedora 15 and Fedora 16 from **GRUB 0.97** (nowdays known as
grub-legacy) to new **GRUB2** so I'll explain both.

### grub-legacy

In the old version (which I am currently using on F15) you need to edit the
`/boot/grub/menu.lst` file and add new entry with paths to your **kernel** and
**initrd**. The entry might look like the following:

{% highlight text %}
title Fedora (2.6.41.10-3.fc15.i686)
      root (hd0,0)
      kernel /boot/vmlinuz-3.1.0-rc7 ro root=UUID=58042206-7ffe-4285-8a07-a1874d5a70d2
                                     rd_NO_LUKS rd_NO_LVM rd_NO_MD
                                     rd_NO_DM LANG=en_US.UTF-8
                                     SYSFONT=latarcyrheb-sun16
                                     KEYTABLE=cz-us-qwertz rhgb quiet
      initrd /boot/initramfs-3.1.0-rc7.img
{% endhighlight %}

### grub2

In grub2 you should be able to do this automatically by this command

{% highlight bash %}
grub2-mkconfig -o /boot/grub2/grub.cfg
{% endhighlight %}

After this step you can reboot and let your machine chew on some fresh meat
directly from the developers! Probably as fresh as it'll ever get! Boot up and
enjoy :-).

## Sources
- [Love R., Linux Kernel Development, Addison-Wesley, 2010.](http://stid.googlecode.com/files/Linux.Kernel.Development.3rd.Edition.pdf)
- [Dracut manual](http://www.kernel.org/pub/linux/utils/boot/dracut/dracut.html#id524430)
- [Building a custom kernel @ fedoraproject.org](http://fedoraproject.org/wiki/Building_a_custom_kernel)

---
layout: post
title: Linux File Permissions Explained
categories:
- Linux
tags:
- chgrp
- chmod
- chown
- file permissions
- linux
status: publish
type: post
published: true
image:
  feature: abstract-1.jpg
share: true
comments: true
---
Because Linux is intended to be a multi-user system, there has to be a way of
controlling access to a different files by different users.

For example, you don't want to have just any user messing around with your
configuration files. Only the **root** should be able to do that. This is
(on a Linux box) accomplished by **file permissions**.

## How does it work?

Access permissions are stored along with **each and every file** on your
computer. How are they represented? Well, let's have a look, you've probably
already stumbled upon them at some point ...

{% highlight bash %}
drwxr-xr-x -r-w-rwrw- -rwxr--r--
{% endhighlight %}

Something like this shows up when you try writing `ls -l` command. This string
tells you, what access permission are on the file. It can be divided into 4
groups.

1. Character **0** -- this one shows file type
2. Characters **1-3** -- permissions for user (owner of the file)
3. Characters **4-6** -- permissions for group (group that owns the file)
4. Characters **7-9** -- permissions for others (none of the above)

The first character can be any of these:

* `-` = regular file
* `d` = directory
* `l` = symbolic link
* `s` = Unix domain socket
* `p` = named pipe
* `c` = character device file
* `b` = block device file

The next nine characters show the file's permissions, divided into three
groups, each consisting of three characters. The first group of three
characters shows the read, write, and execute permissions for **user**,
the owner of the file. The next group shows the read, write, and execute
permissions for the **group** of the file. Similarly, the last group of
three characters shows the permissions for **other**, everyone else.
In each group, the first character means the read permission, the second
one write permission, and the third one execute permission.

The characters are pretty easy to remember:

* `r` = read permission
* `w` = write permission
* `x` = execute permission
* `-` = without permission

## Changing permissions

If you want to change file's permissions, you can use command
[chmod](http://linux.die.net/man/1/chmod). There are two ways of using chmod,
one with letters (the aliases mentioned above) and the other with numbers.
I'll go through the second method, because it's faster once you know what's
going on and the first method is pretty self-explanatory.

{% highlight bash %}
 $ chmod 775 ~/my/file
{% endhighlight %}

This will change permissions of `~/my/file` to `-rwxrwxr-x` . So what do the
numbers mean?

* **4** = read (r)
* **2** = write (w)
* **1** = execute (x)
* **0** = no permission (-)

To get the permission bits you want, you add up the numbers accordingly. For
example, the rwx permissions would be 4+2+1=7, rx would be 4+1=5, and rw would
be 4+2=6. Because you set separate permissions for the owner, group, and
others, you'll need a three-digit number representing the permissions of all
these groups.

## Changing file ownership

The other thing you might want to do is change the owner and the group of the
file. There are two commands -- [chown](http://linux.die.net/man/1/chown) for
changing owner (and group) and [chgrp](http://linux.die.net/man/1/chgrp) for
changing group.

Using both are pretty straight-forward. If in doubt, don't hesitate to check
the man pages ;-).

## Sources

- [http://www.tuxfiles.org/linuxhelp/filepermissions.html](http://www.tuxfiles.org/linuxhelp/filepermissions.html)
- [http://www.tuxfiles.org/linuxhelp/fileowner.html](http://www.tuxfiles.org/linuxhelp/fileowner.html)

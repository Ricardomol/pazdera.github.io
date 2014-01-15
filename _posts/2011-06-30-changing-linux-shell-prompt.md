---
layout: post
title: Changing Linux Shell Prompt
description: "A brief guide on how to modify your shell prompt in Linux."
categories: [Howto, Linux]
tags: [bash, linux, prompt]
status: publish
type: post
published: true
image:
  feature: autumn-leaves-3.jpg
  #credit: dargadgetz
  #creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
comments: true
share: true
---
I have been wondering how to customize the prompt in bash for some time now.
However, I never had enough time and energy to look into that. Until now!
So, let's **doo-ooo-ooo** it!

It's actually one of the simpler things. The prompt string is saved in an
[environment variable](http://en.wikipedia.org/wiki/Environment_variable)
called `$PS1` (**p**rompt **s**tring). In order to change it you simply change
the variable's value and it's done. So, let's see ...

First we want to know the actual value of the variable. We'll print it out:

{% highlight bash %}
echo $PS1
{% endhighlight %}

This should give you something around `\u@\h:\w\$ `. If you compare it to the
actual prompt `astro@astro-desktop:~/MyBook$ `, you can easily guess what the
escape sequences stand for.

* **\u** -- user name
* **\h** -- host name
* **\w** -- full path to current working directory

There are a lot more sequences, you can use. You can even color your prompt!
For more information on this topic check out the links at the end of this post.

In order to change the prompt execute the following command:

{% highlight bash %}
export PS1="[his dudeness \u@\h:\w]\$ "
{% endhighlight %}

This will change your prompt string to something like

{% highlight bash %}
[his dudeness astro@astro-desktop:~]$ 
{% endhighlight %}

Now, we know how to customize the prompt string, but when you close the shell,
it resets back to default. How to make the changes permanent? All you need to
do is put the command into the `.bashrc` file in your home directory.

Actually, here are multiple prompt strings. `$PS1` is the primary one. There
is also a **secondary prompt string** that is used to indicate continuation of
a multi-line command. For example:

{% highlight bash %}
astro@astro-desktop:~$ echo "abc\
> def\
> "
abcdef
{% endhighlight %}

In this case, the `$PS2` is set to `> `.

### Sources: ###
* [How to: Change / Setup bash custom prompt (PS1)](http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html)
* [Bash Shell PS1: 10 Examples to Make Your Linux Prompt like Angelina Jolie](http://www.thegeekstuff.com/2008/09/bash-shell-ps1-10-examples-to-make-your-linux-prompt-like-angelina-jolie/)
* [BASH Shell change the color of my shell prompt under Linux or UNIX](http://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/)
* [Bash reference: Controlling the Prompt](http://www.gnu.org/software/bash/manual/bashref.html#Printing-a-Prompt)

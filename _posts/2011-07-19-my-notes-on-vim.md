---
layout: post
title: My notes on vim
categories:
- Linux
- Software
tags:
- editor
- vim
- vimrc
status: publish
type: post
published: true
image:
  feature: abstract-1.jpg
share: true
comments: true
---
One of the things that have been on my todo list forever -- **learn vim**! And
what a better time is there for such a thing than the holidays :-)!

What is [vim](http://en.wikipedia.org/wiki/Vim_%28text_editor%29)? Only the
most awesome text editor in the world! It can run in terminal, so you can use
it wherever you want, Gnome, KDE, anything. It has so many capabilities and
great features, that will make your life easier. The only downside is that
it requires some getting used to ... yeah, right :-). If you're starting with
vim as well, one of the first areas to explore is configuration. Vim loads
settings from `.vimrc` file that is stored in your home directory. There is
a fair amount of things that can be
[configured](http://items.sjbach.com/319/configuring-vim-right). And with the
right configuration vim is **godlike** text editor! Here is mine `.vimrc`
file:

{% highlight vim %}
" rpazdera .vimrc
set nocompatible
set showmode
set showcmd
set title
set number
set mouse=a
set backspace=2
set showmatch
set autoindent syntax on
{% endhighlight %}

### Make vim work with system clipboard

Very important thing (at least for me) is to be able easily copy and paste
text outside the editor. In the console environment, the classic `CTRL+[CVX]`
shortcuts doesn't work very well. Even if they did, the work would be
confusing, because vim has its own commands for copy and paste. Those
unfortunately don't work with the "outside world" -- the X11. But it's
possible to make them work, so let's have a look :-). In order to make it
work in terminal, vim has to be compiled with X11 clipboard support. This
is indicated by `+xterm_clipboard` string in vim's version. To check if the
clipboard support is present in your version, try this command:

{% highlight bash %}
 $ vim --version | grep "\+xterm\_clipboard"
{% endhighlight %}

On ubuntu and debian-like distros vim comes compiled with this feature, but
on RHEL/Fedora/SUSE without. If you are running Redhat/Fedora/CentOS, you can
install the vim-X11 package (if you have gvim then this is already installed).
This provides the vimx command, which is a console version of Vim with
X11-clipboard support. Good idea is making an alias vim to vimx by adding
this line to your .bashrc:

{% highlight bash %}
if [ -e /usr/bin/vimx ]; then alias vim='/usr/bin/vimx'; fi
{% endhighlight %}

All you need to do after that is add this line to your `.vimrc` :

{% highlight vim %}
set clipboard=unnamedplus
{% endhighlight %}

And you're good to go :-). Now you can easily copy and paste from clipboard
using standard commands (y, d and p). Detailed description of what's going
on is [here](http://vim.wikia.com/wiki/Accessing_the_system_clipboard).

### Unhighlight text after search

How to remove the highlight of last searched phrase? Try this:

{% highlight vim %}
:noh
{% endhighlight %}


### Sources

- [Vim cheatsheet](http://www.tuxfiles.org/linuxhelp/vimcheat.html)

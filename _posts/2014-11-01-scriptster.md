---
layout: post
title: Scriptster
description: "Making your Ruby scripts all hipster"
cover: shoreditch.jpg
comments: true
categories:
- Software
- Programming
tags:
- ruby
- shell
- tco
---

I’d like to introduce to you a small gem that I put together last weekend.
It’s called [scriptster](http://rubygems.org/gems/scriptster) and it's there
to help you make scripts that depend on many external tools and programs. Also,
it can make them look like a rainbow.

<figure>
    <img src="/assets/images/posts/scriptster-rainbow.png" alt="Hipster logs"
         style="width:75%">
    <figcaption>
        Rainbowy program made with scriptster
    </figcaption>
</figure>

The Unix shell is great when your scripts are small. All the
tools, such as grep and sed, combined with I/O redirection and pipes are
brilliant and can work wonders in just a few lines of code. If your script,
however, gets a bit more complicated, shell can become a nightmare of
multiline one-liners and conditionals that are on par with black magic. That’s
the best time to switch to something else.

### Why Scriptster?

I usually go to Ruby and while it's pretty good for scripting just on its own,
it still takes a bit of boilerplate to get the most of it. **Scriptster** is
that boilerplate. It comes down to these two things:

##### 1. Running Shell Commands

There is a number of ways to run a shell command from Ruby. If what you care
about is the **return value**, you can use the `Kernel#system` function. If you
need to process the output of that command, you would use the back ticks `cmd`
or go for the built in `%(cmd)` syntax.

As you probably know, the `system` method will print out whatever the command
produces as it runs, but it won’t let you process it. The other two will hold
the output off completely. Surely, you can print it yourself once you’ve
processed it, but that’s far from ideal. If you run a build for half an hour,
you want to know whether it's moving forward.

To overcome this limitation, **Scriptster** uses `Open3.popen3` and `IO.select`
to read and process both _stdout_ and _stderr_ of the shell command. That makes
it possible to both print the output in real-time as well as to keep it for
further processing once the command has finished. This how you run a command:

{% highlight ruby %}
ls = Scriptster::cmd "ls -1",
  :show_out => true,
  :show_err => true,
  :raise => true

num_text_files = ls.out.lines.grep(/.*\.txt/).length
{% endhighlight %}

By the way, I'm sorry about this horrible pice of code. That certainly isn’t how
would I normally get the number of text files in a directory in Ruby. It only
exists to get my point across.

##### 2. Logging

The other bit that often comes useful is reporting and logging the progress of
your script. If something didn’t go well, you want to know why. That isn’t
too difficult. After all, you can just `puts` stuff out and don’t worry about
it.

While that’s true, it makes sense to have something that will keep the
logging code compact and flexible. Sometimes you might want to hide the
progress messages and only display errors (for example, when using **cron** and
receiving the logs via email). At different times, you might like to see
additional debugging information.

**Scriptster** comes with a highly configurable logger class that can help you
with all that. There are four preconfigured **message types** and four
**verbosity levels** that you can use to filter what messages will be printed
at any given time.

<figure>
    <img src="/assets/images/posts/scriptster-example.png" alt="Example Output"
         style="width:75%">
    <figcaption>
        Example output of a program made with scriptster
    </figcaption>
</figure>

If you find it hard to navigate through loads of text in your terminal as I do,
you will be pleased to hear that this simple logger comes with a full support
of the **extended 256-colour palette**. Two colour schemes are included in the
library itself and you can define your own **using RGB** (to learn how, see
the last section of this post).

Here is an example use of the logger:

{% highlight ruby %}
begin
  Scriptster::log :info, "Starting the process"
  # ...
  Scriptster::log :debug, "Done in #{duration} seconds"
rescue ServerOnFire => e
  Scriptster::log :error, "The process failed: #{e.to_s}"
  abort
end
{% endhighlight %}


### Using Scriptster

The first thing you need to do is to include the library into your project:

{% highlight ruby %}
require 'scriptster'
{% endhighlight %}

Once that’s been sorted, it's time to **configure** it. This step is not
necessary, but chances are you won’t be entirely happy with the
default settings. To do so, put the following block of code somewhere at the
beginning of your script or the main function. It’s not too important where
exactly you place it, but it must be executed before any other part of your
code uses scriptster to make sure your settings were correctly applied.

{% highlight ruby %}
Scriptster::configure do |conf|
  conf.name = "nightly-build"
  conf.verbosity = :essential
  conf.colours = :dark
  conf.log_format = "%{timestamp} %{name} %{type} %{message}"
end
{% endhighlight %}

Please refer to the
[documentation](http://www.rubydoc.info/github/pazdera/scriptster/Scriptster/Configuration)
for a full and up-to-date list of all the options. With the config in place,
you’re all set and can start using the library. There are two approaches you
can take. The first one is referring to the scriptster module directly:

{% highlight ruby %}
Scriptster::log :info, "Starting the build"
Scriptster::cmd "make clean",
  :show_out => false,
  :raise => false

Scriptster::cmd "make -B", :expect => 0, :raise => true
{% endhighlight %}

This is clean and simple, you know where things are coming from, but typing the
module name again and again can become pretty tedious. If you’re integrating
**Scriptster** in a larger project, it can be useful to include it in your
classes to save yourself some typing. This is how I use the gem along with
[thor](http://whatisthor.com/):

{% highlight ruby %}
class Builder < Thor
  include Scriptster

  desc "The setup for nightly builds"
    method_option :deploy, :aliases => "-d",
                  :type => :string,
                  :desc => "where to deploy",
                  :default => "~/builds/"
  def nightly
    log :info, "Statring the build"
    cmd "make clean",
      :show_out => false,
      :raise => false

    cmd "make -B", :expect => 0, :raise => true
  end
end
{% endhighlight %}

You can see that’s much more compact.

### Custom Colour Themes

As was briefly mentioned above, the colour themes in scriptster are entirely
configurable, you can create colour themes of your own. The gem uses
[tco](https://github.com/pazdera/tco) for colouring, so setting up a new theme
in fact means configuring **tco**. What follows is an incomplete template that
you can use to start your own theme:

{% highlight ruby %}
Scriptster::configure do |s|
  s.colours = Proc.new do
    Tco::configure do |c|
      c.names["green"] = "#99ad6a"
      c.names["yellow"] = "#d8ad4c"
      # more colours here ...

      c.styles["info"] = {
        :fg => "green", :bg => "default",
        :bright => false, :underline => false
      }
      c.styles["info-message"] = {
        :fg => "green", :bg => "default",
        :bright => false, :underline => false
      }
      # more styles here ...
      # you need to define all of the following styles:
      #   info, info-message, warn, warn-message,
      #   err, err-message, debug, debug-message,
      #   name, highlight, cmd, timestamp
    end
  end
end
{% endhighlight %}

Instead of the `:dark` symbol from the previous example, we use a `Proc` which
will be called at the right moment to apply our **Tco** config. The
`Tco::configure` method is used to define several **styles** required by
scriptster. All the styles mentioned in the template must be defined for the
theme to work properly. Notice that you can also define for RGB colours and
refer to them from the style definitions. A complete example of a colour
theme can be found [in the
sources](https://github.com/pazdera/scriptster/blob/master/lib/scriptster/configuration.rb#L72).

### Summary

That’s all there is to scriptster. It’s a small gem that doesn’t have
many features, but it can make your scripts a little easier to write. It works
with terminal colours, so if you’re blind to things unless they stick out
like a giraffe in a polar bear-only golf club, it might make the logs a little
easier to read as well. It certainly helps me.

In any case, if there is something that you’d like to see as part of this
library, do get in touch. I’ll be happy to help!

<sub>I'd like to thank **Berit Watkin**, the author of the
[cover photo](https://www.flickr.com/photos/ben124/13996606950/sizes/l).</sub>

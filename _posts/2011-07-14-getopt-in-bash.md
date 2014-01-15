---
layout: post
title: Getopt in Bash
description: "The ways of parsing CLI arguments in bash scripts."
cover: decoration.jpg
comments: true
categories:
- Howto
- Linux
tags:
- bash
- getopt
- getopts
---
There are two different ways of parsing command line arguments while using
`getopt(3)`. There is an utility called **getopt** (`man 1 getopt`). This
utility is available in all shells. Then in bash, there is another built-in
tool for parsing arguments called **getopts** (it's a built-in, so it
doesn't have it's own man-page -- try `help getopts`).

## getopt(1)
Here's an example script that demonstrates the usage of **getopt**:

{% highlight bash %}
#!/bin/bash

# Execute getopt
ARGS=`getopt -o "123:" -l "one,two,three:" \
             -n "getopt.sh" -- "$@"`

#Bad arguments
if [ $? -ne 0 ]; then
    exit 1
fi

# A little magic
eval set -- "$ARGS"

# Now go through all the options
while true; do
    case "$1" in
        -1|--one) echo "Uno" shift;;
        -2|--two) echo "Dos" shift;;
        -3|--three)
            echo "Tres" # We need to take the option argument
            if [ -n "$2" ]; then
                echo "Argument: $2"
            fi
            shift 2;;
        --) shift break;;
    esac
done
{% endhighlight %}

At first, the **getopt** utility is called with desired parameters (see man
getopt for detailed description of all the options). If it returns anything
else than 0, something was wrong and we'll end the script. There is no error
message necessary, because the getopt itself will inform user about what went
wrong. After that, there's a little magic line with eval and set. It's there
to preserve whitespaces inside options arguments. Detailed description of
this technique is
[here](http://www.linuxjournal.com/content/bash-preserving-whitespace-using-set-and-eval).
All options are evaluated and appropriate actions take place in the **while**
loop at the end of the script.

## getopts
Here's an example script that demonstrates the usage of **getopts**:

{% highlight bash %}
#!/bin/bash

while getopts "123:" OPTION do
    case $OPTION in
        1) echo "Uno";;
        2) echo "Dos";;
        3) echo "Tres: $OPTARG";;

        # Unknown option. No need for an error, getopts informs
        # the user itself.
        \?) exit 1;;
    esac
done
{% endhighlight %}

As you can see, the bash built-in version is easier to use, but it can't
handle long options like `--option`.

## Conclusion
Which one you should use? Well, it's up to you, what you need. If you're
looking for compatibility of your script among more shells than just bash
or want to have long options, you'll need to use the getopt utility. If
not, I'd go for the getopts built-in, which I personally consider more
user-friendly.

## Sources:
- [http://aplawrence.com/Unix/getopts.html](http://aplawrence.com/Unix/getopts.html)
- [http://bashcurescancer.com/the-60-second-getopts-tutorial.html](http://bashcurescancer.com/the-60-second-getopts-tutorial.html)
- [http://rsalveti.wordpress.com/2007/04/03/bash-parsing-arguments-with-getopts/](http://rsalveti.wordpress.com/2007/04/03/bash-parsing-arguments-with-getopts/)
- [http://wiki.bash-hackers.org/howto/getopts\_tutorial](http://wiki.bash-hackers.org/howto/getopts_tutorial)

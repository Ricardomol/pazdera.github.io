---
layout: post
title: Unit Testing in Python
categories:
- Code
- Howto
- Software
tags:
- code
- Python
- software
- testing
- unit test
- unittest.TestCase
type: post
image:
  feature: abstract-3.jpg
share: true
comments: true
---
I probably don't need to tell you, how important testing your code is in
software developement. One way of doing so is writing **unit tests**. Unit
tests are an automated set of **test cases**. These test cases are there to
make sure, that the code does exactly what it should, nothing more and nothing
less.

Every once in a while you change something in the software, you simply just
run the tests and see if the changes didn't break something that was working
fine beforehand. A set of good tests will increase your confidence while
releasing your software and (believe me) those stupid unit tests of class
interface can save literally weeks of debugging.

In [agile](http://en.wikipedia.org/wiki/Agile_software_development), you're
supposed to write the tests before you implement the actual functionality.
That's how the tests are important :-). What are our testing possibilities in
Python? Well, let's have a look ...

## Unittest

Python itself (all hail!) provides pretty good testing framework caled
**unittest**. Let's have a look how it works. In the center of it all is a
class [unittest.TestCase](http://docs.python.org/library/unittest.html#unittest.TestCase).
While creating an unit test, you simply create a derived class from it. Here's
an example how could a test file look like:

{% highlight python %}
# Import tested modules
import example

# Import unittest
import unittest

# Test definitions
class TestExample(unittest.TestCase):
    def testCaseExample(self):
        self.assertEqual(1,1)

# Run test
if __name__ == "__main__":
    unittest.main()
{% endhighlight %}

You should create a file like this for **every module** in your code. Now,
let's have a look on how to organize the tests in your project. The best
practice is to separate them all into a folder called `test` . Directory tree
of your project might look like this:

{% highlight text %}
project/
  |-src/
  |  |-module.py
  |  |-class.py
  |-test/
  |  |-test_module.py
  |  |-test_class.py
  |-run_tests.sh
{% endhighlight %}

This is nice, but now that you're sources are in a separate directory it's a
little tricky to be able to import your modules into your tests and then run
all the tests. For that I have written a simple script `run_tests.py` that will
do it for you. Here it goes:

{% highlight python %}
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys, os, re
import unittest

TESTED_CODE = "src/"  # Path to tested code.
TEST_CODE   = "test/" # Path to test code.

sys.path.append(TESTED_CODE)
sys.path.append(TEST_CODE)

# Import all the tests from 'test/'.
for testFile in os.listdir(TEST_CODE):
    if re.match("^test_.+\.py$", testFile):
        exec "from %s import *" % testFile[0:-3]

# Run the tests.
if __name__ == "__main__":
    unittest.main()
{% endhighlight %}

For more on this subject, see the
[unittest documentation](http://docs.python.org/library/unittest.html).

[Here](http://www.stud.fit.vutbr.cz/~xpazde00/permanent/unittest-setup-example.tar.gz)
is an example setup of unit tests for your project. It contains a convenient
script, that runs all the tests in the `test/` directory.

## Nose

One of key features of an unit testing framework is simplicity. You need to be
able to create new tests fast and efficiently, because you're gonna be doing it
**A LOT**. The harder it is to write new tests, the more you'll be skipping
them and that's a highway to coder's hell.

Using the Python's built-in `unittest` framework isn't that time-consuming,
but there is still some space for improvement. That's where
[nose](http://code.google.com/p/python-nose/) comes in.

It's a third-party testing framework for Python and it comes with a load of
other cool featuers. I personaly have never used it, because I find the
built-in framework quite sufficient for my needs, but if you look for something
more robust, **nose** is definitely worth trying.

## Sources

- [http://infinitemonkeycorps.net/docs/pph/](http://infinitemonkeycorps.net/docs/pph/)
- [http://docs.python.org/library/unittest.html](http://docs.python.org/library/unittest.html)



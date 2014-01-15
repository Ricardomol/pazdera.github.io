---
layout: post
title: The Magical container_of() Macro
description: "Probably the most confusing piece of C code I've ever seen explained step-by-step."
cover: british-museum.jpg
comments: true
categories:
- Code
- Kernel
tags:
- C macros
- GNU C
- kernel
---
When you begin with the kernel, and you start to look around and read the
code, you will eventually come across this magical preprocessor construct.

What does it do? Well, precisely what its name indicates. It takes three
arguments -- a _pointer_, _type_ of the container, and the _name_ of the member
the pointer refers to. The macro will then expand to a new address pointing to
the container which accommodates the respective member. It is indeed a
particularly clever macro, but how the hell can this possibly work? Let me
illustrate...

The first diagram illustrates the principle of the `container_of(ptr, type,
member)` macro for who might find the above description too clumsy.

<figure class="full">
	<a href="/assets/images/posts/container_of.png">
        <img src="/assets/images/posts/container_of.png" alt="The container_of macro">
    </a>
	<figcaption>
        Illustration of how the containter_of macro works.
    </figcaption>
</figure>

Bellow is the actual implementation of the macro from Linux Kernel:

{% highlight c %}
#define container_of(ptr, type, member) ({                      \
        const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
        (type *)( (char *)__mptr - offsetof(type,member) );})
{% endhighlight %}


At first glance, this might look like a whole lot of magic, but it isn't quite
so. Let's take it step by step.

## Statements in Expressions

The first thing to gain your attention might be the structure of the whole
expression. The statement should return a pointer, right? But there is just
some kind of weird `({})` block with two statements in it. This in fact is a
GNU extension to C language called **braced-group within expression**. The
compiler will evaluate the whole block and use the value of the last statement
contained in the block. Take for instance the following code. It will print 5.

{% highlight c %}
int x = ({1; 2;}) + 3;
printf("%d\n", x);
{% endhighlight %}

## typeof()

This is a non-standard GNU C extension. It takes one argument and returns its
type. Its exact semantics is throughly described in [gcc
documentation](http://gcc.gnu.org/onlinedocs/gcc/Typeof.html).

{% highlight c %}
int x = 5;
typeof(x) y = 6;
printf("%d %d\n", x, y);
{% endhighlight %}

## Zero Pointer Dereference

But what about the zero pointer dereference? Well, it's a little pointer magic
to get the type of the member. It won't crash, because the expression itself
will never be evaluated. All the compiler cares for is its type. The same
situation occurs in case we ask back for the address. The compiler again
doesn't care for the value, it will simply add the offset of the member to the
address of the structure, in this particular case 0, and return the new
address.

{% highlight c %}
struct s {
        char m1;
        char m2;
};

/* This will print 1 */
printf("%d\n", &((struct s*)0)->m2);
{% endhighlight %}

Also note that the following two definitions are equivalent:

{% highlight c %}
typeof(((struct s *)0)->m2) c;
char c;
{% endhighlight %}

## offsetof(st, m)

This macro will return a byte offset of a member to the beginning of the
structure. It is even part of the standard library (available in `stddef.h` ).
Not in the kernel space though, as the standard C library is not present there.
It is a little bit of the same 0 pointer dereference magic as we saw earlier
and to avoid that modern compilers usually offer a built-in function, that
implements that. Here is the messy version (from the kernel):

{% highlight c %}
#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
{% endhighlight %}

It returns an address of a member called MEMBER of a structure of type TYPE
that is stored in memory from address 0 (which happens to be the offset we're
looking for).

## Putting It All Together

{% highlight c %}
#define container_of(ptr, type, member) ({                      \
        const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
        (type *)( (char *)__mptr - offsetof(type,member) );})
{% endhighlight %}

When you look more closely at the original definition from the beginning of
this post, you will start wondering if the first line is really good for
anything. You will be right. The first line is not intrinsically important for
the result of the macro, but it is there for type checking purposes. And what
the second line really does? **It subtracts the offset of the structure's
member from its address** yielding the address of the container structure.
That's it!

After you strip all the magical operators, constructs and tricks, it is that
simple :-).

## References
- [ `container_of()`  explained by Greg KH](http://www.kroah.com/log/linux/container_of.html)
- [ `container_of()` definition in Linux Kernel](http://lxr.free-electrons.com/source/include/linux/kernel.h#L691)
- [Statements and Declarations in Expressions](http://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html#Statement-Exprs)
- [Referring to a Type with  `typeof` ](http://gcc.gnu.org/onlinedocs/gcc/Typeof.html)
- [ `offsetof()` ](http://en.wikipedia.org/wiki/Offsetof)

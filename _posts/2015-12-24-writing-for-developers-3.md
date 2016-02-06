---
layout: post
title: "Writing for developers, part 3"
description: ""
comments: true
categories:
- Programming
- Writing
tags:
- writing
- programmers
- developers
- documentation
---

This is the third part of my writing guide for developers. The written word is
how we share ideas with each other on the internet. In a blog post, README file
or program documentation. This exchange is incredibly important for the
software engineering community so we don’t keep reinventing the wheel. And the
better writers we are, the easier it is.

{% include figure.html img="writing-for-devs/pen-horiz.png" alt="Illustrated fountain pen" width="80%" %}

Check out the first two instalments if you haven't yet:

 * [Writing for developers 2: Red-Green-Refactor](/2015/12/10/writing-for-programmers-1/)
 * [Writing for developers 1: Clarity and context](/2015/12/17/writing-for-programmers-2/)

In this one, we'll take a look at **style**.

## The Mysterious Affair of Style

As vague as the definition of the term **writing style** is, it concerns
everything that affects how your writing comes across. This is, of course, an
extremely wide and highly subjective topic. Take a few books on writing and
you’ll end up with hundreds of pages on different aspects of it.

Just as with [JavaScript style
guides](http://addyosmani.com/blog/javascript-style-guides-and-beautifiers/),
there are many opinions out there. This post lists the best practices that I
try to apply to my writing (some with more success then others, but hey, I’m
working on it).

## (1) Use the active voice

Many technical writers (myself included) overuse the [passive
voice](https://en.m.wikipedia.org/wiki/English_passive_voice). Describing
inanimate objects forces our thinking into sentences like these:

* This feature will be implemented in version 1.5.
* That issue was fixed months ago.
* Null is returned when error occurs.

Quite a common sight, aren't they. And while they may express exactly what
happened, they are impersonal and sound rigid. The passive voice removes the
source of the action out of the sentence. Things happen, but it doesn't say
who or what's doing it.

Compare the above with: We implemented this feature in 1.5. I fixed this issue
months ago. Returns Null on error. Sounds much more like things move forward.
In the active voice, the verb bears much more power. It's direct and clear what
happened and who's responsible.

## (2) Long sentences

Lots of writing guides recommend against using long sentences. This is good
advice, except when you follow it religiously and make each of your sentences
roughly the same length. With only short sentences, you’re in danger of making
your writing monotonous and giving it an uncomfortable, regular rhythm.

Besides varying rhythm, long sentences work incredibly well in contrast with
short ones. They read slower and will make any shorter one stand out in between
them. Like this.

The problem with long sentences isn’t their length, but that writers often
overcomplicate the structure with parenthetical clauses, lists within lists,
three semicolons and god knows what else which may be grammatically correct,
but awfully unclear.

Don’t be afraid to write a long sentence when appropriate. But when you need to
refer to a dictionary for proper punctuation, it’s probably a good idea to
break it down.

## (3) Keep an eye on adverbs

[Adverbs](https://en.wikipedia.org/wiki/Adverb) are words that modify the
meaning of verbs or adjectives in a sentence (that’s the simplified definition).
Not all of them, but many end with `-ly` as in _mostly_, _really_,
_usually_, or _certainly_. Check out these examples:

* Every call to `require('foo')` will get **exactly** the same object returned.
* A file descriptor that is **currently** open in the parent process.
* The string data that will not work **properly** on Buffers.
* Bob uses a **newly** generated **cryptographically** strong pseudorandom key
pair.

And what's the problem with them? Instead of adding a modifier to an imprecise
word, it’s better to find a different, more appropriate alternative. Why
write **really good** when you could say **great**?

The first example could be rewritten to:

 * Every call to `require('foo')` will get the identical object returned.

And even further, doing away with the passive voice:

 * Every call to `require('foo')` will return the identical object.

Adverbs often intensify or repeat things that are apparent from the context.
Looking at the second example, when a descriptor _is_ open, we can assume that
it’s currently open. **Properly** in the third example intensifies that the
string data won’t work on Buffers, but doesn’t add any more information. In the
last sentence, can a pseudorandom key pair be strong in any way other than
**cryptographical**?

With this said, using adverbs isn’t always bad and sometimes, combining two
words is the best way to say what you want. In such cases your adverbs will add
meaning that isn’t imperative from the word itself or apparent from the context
around it.

Run your piece through [this regex](http://regexr.com/3cfk2) before publishing
to see whether you couldn’t tighten it up.

## (4) Point of view

The narrative point of view determines the perspective through which you
communicate with your readers. It implies the personal pronoun (I, you, (s)he,
we) that you’ll be using throughout the piece so you need to pick one before
sitting down to write the first draft.

The best one always depends on what sort of document you are working on. Here
are your options.

### First person

Within non-fiction, the first person narrative mode is limited for stories where
you describe what you did or what happened to you. It goes like this:

> I did this. Then I installed that. I went there and installed that. And then
everything exploded.

You put yourself into the centre of your piece. The writing feels immediate and
lets you describe your thinking with ease. The first person works great for
blog posts and case studies where you speak from your own experience; not so
much for manuals or technical documentation.

### Second person

Second person narrative is by far the most common in technical writing. With
`you` as the personal pronoun, you speak to the reader (just as I do to you
now) to instruct or explain.

> Open the terminal and you should see a blinking cursor popping up on the
screen. If you type on your keyboard, letters will start appearing on the
screen.

This mode is direct and informal, and works great for all sorts of
documentation, guides and tutorials where the reader learns something or even
gets involved.

### First person plural

With first person plural, `we` can mean either you with someone else (like your
friend or colleague) or you and the reader. The first option is similar to
regular first person, but indicates that you weren’t alone, while the latter
one works a bit like second person.

> We need to write the tests first before we proceed to implement the
functionality. We’ll open the `tests/parser.js` file and add the following at
the end.

Writing in this mode is also instructional but less direct then the second
person. By saying **we** you hint that you’re doing it with the reader and that
can feel a bit more friendly.

### Third person

In third person you describe what happened to someone else.

> It wasn’t as easy for Turing to figure this out in 1936. He proved it using
the diagonal method that was invented by Georg Cantor only four decades earlier.

Again, this is great for anecdotes and blogs, but impractical for technical
writing.

Referring to your reader in third person, i.e., **he/she** or **one** is in my
opinion your worst option, whatever you’re writing. Throwing one in once in
a while for comical effect is fine, but using it throughout your whole piece
sounds stuffy.

## Until the next time

Style takes time to develop. Like switching gears when driving a car, it takes
take a lot of thinking about in the beginning, but it becomes automatic with
enough practice.

My final tip is: **leave all of these for when you’ll refactoring your finished
draft**. Worrying about phrasing when drafting breaks your train of thought,
will slow you and even block you from writing anything at all.

The next post in this series will be about structure. [Sign up for my
newsletter](/newsletter/) and be the first one to know when it
comes out.

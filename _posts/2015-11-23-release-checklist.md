---
layout: post
title: "Open-source project release checklist"
description: ""
comments: true
categories:
- Programming
- Software
tags:
- open-surce
- projects
- release
---

Releasing an open-source project requires a few more things than just putting
the code up on the internet. Well, that is if you want people to see it.

The open-source community has grown a lot over the past ten years. Linux has
been deployed on washing machines and combat drones, and most programmers today
could hardly imagine doing their work without the vast array of free and
open-source tools at their disposal.

With all this attention, more and more code is being developed out in the open
by both companies and individuals alike. The downside of this amazing trend,
however, is that when releasing a brand new project, you're against some pretty
stiff competition.

How can you help your open source project get noticed?

## The checklist

These are the steps I take when making any of my code open-source.

<style>
    .checklist {
      list-style-type: none;
    }

    .checklist li {
      margin-bottom: 10px;
    }

    .checklist li input {
      margin: 0 12px 0 0;
    }

    .checklist li div {
      color: #acacac;
      padding-left: 32px;
      margin-top: 3px;
      font-size: 0.9em;
      line-height: 1.5;
    }
</style>

#### Licensing

<ul class="checklist">
  <li>
    <label><input type="checkbox">
      Does your project include a licence?
    </label>
    <div>
      Without a licence, your project isn't open source.
      <a href="/2015/08/03/picking-an-oss-licence/">Learn more.</a>
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Is the licence approved by OSI/FSF?  
    </label>
    <div>
      Some licences may look like they are open-source but they really aren't.
      See the list of <a href="http://opensource.org/licenses/alphabetical">OSI-approved</a>
      or <a href="http://www.gnu.org/licenses/license-list.html">FSF-approved</a> licences.
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Is your licence compatible with the rest of the ecosystem?
    </label>
    <div>
      Check whether your licence is compatible with the popular choices for
      other projects in your area.
      <a href="https://en.wikipedia.org/wiki/License_compatibility">Learn more.</a>
    </div>
  </li>
</ul>

#### Landing page

<ul class="checklist">
  <li>
    <label><input type="checkbox">
      Does your project have a landing page?
    </label>
    <div>
      A <a href="https://github.com/pazdera/scriptster">README</a> on GitHub,
      <a href="http://sourceforge.net/projects/audacity/">profile</a> on
      SourceForge or dedicated <a href="https://nodejs.org/en/">website</a>.
      Your project needs a place on the internet.
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Does it say what it is and where to get it?
    </label>
    <div>
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      And how to make it work?
    </label>
    <div>
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Can you include any visual elements?
    </label>
    <div>
      Screenshots or diagrams are great to grab people's attention.
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Does it say how to contact you?
    </label>
    <div>
      You don't want to miss out on ideas from people who are interested
      in your project!
    </div>
  </li>
</ul>

#### Accessibility

<ul class="checklist">
  <li>
    <label><input type="checkbox">
      Do you provide a language-level package?
    </label>
    <div>
      An <a href="https://npmjs.com">npm</a> package,
      <a href="https://rubygems.org">gem</a> or
      <a href="https://crates.io/">crate</a>. If your language has a package
      manager, your project should be on it.
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Can you provide distro-level packages?
    </label>
    <div>
      Installing software from your trusted distribution sources is the
      pinnacle of user comfort. If you have time, make sure to package your
      project up for <a href="https://fedoraproject.org/wiki/How_to_create_an_RPM_package">Fedora</a>,
      <a href="https://www.debian.org/distrib/packages">Debian/Ubuntu</a> or
      <a href="http://brew.sh/">Homebrew</a>.
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Would it make sense to write an automated installer?
    </label>
    <div>
      Automated installer can make getting your project up and running as
      easy as a package. If packaging doesn't make sense for you project,
      write and easy installer (like <a href="http://ohmyz.sh/">this</a> or
      <a href="http://brew.sh/">this one</a>).
    </div>
  </li>
</ul>

#### Documentation

<ul class="checklist">
  <li>
    <label><input type="checkbox">
      Does your documentation start with a quick guide?
    </label>
    <div>
      The easier to get up and running with your project, the more
      likely it is that somebody will give it a go.
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Does it include an interface/API reference?
    </label>
    <div>
      Beyond just giving it a go, an interface/API reference is essential if
      someone decides to really make use of your project.
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Is it searchable?
    </label>
    <div>
      Search functionality will make your docs much more useful. Even if it's
      all on one page with <code>CTRL+s</code> in the browser.
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Should it explain how to setup the dev environment?
    </label>
    <div>
      You might want to mention how to build and debug your project for
      people who decide to contribute.
    </div>
  </li>
</ul>

#### Bug tracker

<ul class="checklist">
  <li>
    <label><input type="checkbox">
      Is it NOT empty?
    </label>
    <div>
      Even if you haven't found any bugs yet, put down a few tickets for things
      that you'd like to improve or do next. You never know who might pick it up.
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Does it include a few issues for beginners?
    </label>
    <div>
      Keep a few really simple tickets to onboard first time contributors.
      Splitting a function in two or exporting an extra CLI option? These are
      great tasks for people who are unfamiliar with the codebase.
      <a href="/2015/08/24/github-issues/">Learn more.</a>
    </div>
  </li>

  <li>
    <label><input type="checkbox">
      Are all the tickets well explained?
    </label>
    <div>
      Make sure the tasks are well defined so other people can work on them
      if interested.
    </div>
  </li>
</ul>

## Ready, set, release!

With all these boxes ticked your project is well set to sail the high seas of
open code. Don't worry if you can't do all of them -- every little helps.

And when you finally get the first contributor, don't forget to celebrate:

{% include figure.html img="release-checklist/the-dude.gif" alt="The Dude from Big Lebowski" width="60%" caption='Just got home from Illinois...' %}

Do you do anything else that isn't on that list? Let me know in the comments
section below or tweet at [@radekpazdera](https://twitter.com/radekpazdera).

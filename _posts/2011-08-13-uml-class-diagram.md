---
layout: post
title: UML Class Diagram
description: "One of the most useful UML diagrams explained."
cover: blurred.jpg
comments: true
categories:
- Software
tags:
- cheat sheet
- class diagram
- object-oriented software design
---
The class diagram is a very important part of
[UML](http://en.wikipedia.org/wiki/Unified_Modeling_Language). It's a
[structure diagram](http://en.wikipedia.org/wiki/File:Uml_diagram.svg) and it's
purpose is to display classes in the system with all the relationships between
them. In my opinion it's the most popular type of diagram in software
development.

Drawing class diagram of your design really helps to see the problem in
broader terms. By writing it down you free space in your head for new ideas
:-). It is also easier to understand by others when you want to discuss the
problem with someone else. The thing is, I often find myself wondering about
the syntax when I read someone else's diagrams. That's why I decided to make a
little cheat sheet here to remind me.

### Class

Kind of a key component in a _class_ diagram. Classes will be shown as nodes
and usually as boxes. Here is a example of one. Each class can have methods and
attributes defined. The convention is shown on **Figure 1**.

<figure class="align-center">
	<a href="/assets/images/posts/class2.png">
        <img src="/assets/images/posts/class2.png" alt="UML Class">
    </a>
    <figcaption>Figure 1: A class</figcaption>
</figure>

### Inheritance

Class inheritance is in terms of UML a relationship of
[generalization](http://en.wikipedia.org/wiki/Class_diagram#Generalization). It
represents "_is a_" relationship on class level. **Figure 2** shows how to
portray generalization.

<figure class="align-center">
	<a href="/assets/images/posts/inheritance.png">
        <img src="/assets/images/posts/inheritance.png" alt="UML Inheritance">
    </a>
    <figcaption>Figure 2: Inheritance</figcaption>
</figure>

### Realization

UML has different relationship for **interfaces**. When you inherit from an
interface you _implement it_, which is in terms of UML a relationship of
[realization](http://en.wikipedia.org/wiki/Class_diagram#Realization). It's
visual appearance is similar to inheritance, but the line is dashed. Also the
interface class should be marked as abstract (have name written in italic). See
on **Figure 3**.

<figure class="align-center">
	<a href="/assets/images/posts/realization.png">
        <img src="/assets/images/posts/realization.png" alt="UML Realization">
    </a>
    <figcaption>Figure 3: Realization</figcaption>
</figure>

### Association

Another form of relationship in class diagram is
[association](http://en.wikipedia.org/wiki/Class_diagram#Association). It's a
object-level relationship (i.e. happens between objects of associated classes).
So the whole relationship represents a family of links. There are multiple
types of association with stronger policies (**composition** and
**aggregation**).

<figure class="align-center">
	<a href="/assets/images/posts/association.png">
        <img src="/assets/images/posts/association.png" alt="UML Association">
    </a>
    <figcaption>Figure 4: Association</figcaption>
</figure>

### Aggregation

[Aggregation](http://en.wikipedia.org/wiki/Class_diagram#Aggregation) is a
stronger and more specific form of association. It's "has a" relationship.
Graphical representation of aggregation is shown on **Figure 5**.

<figure class="align-center">
	<a href="/assets/images/posts/aggregation.png">
        <img src="/assets/images/posts/aggregation.png" alt="UML Aggregation">
    </a>
    <figcaption>Figure 5: Aggregation</figcaption>
</figure>

### Composition

Even stronger form of aggregation is
[composition](http://en.wikipedia.org/wiki/Class_diagram#Composition_.28Aggregation.29).
Instead of "has a" it represents "owns a". It's suited for relationship when
one object_ can only exist_ as a part of another. For example if a **plane**
has a **wing** it's a composition. What would you do with a wing alone, right?
The plane owns it. But when a  **pond** has some **ducks** in it it's an
aggregation. The ducks will survive without a pond (only probably not that
happy). And a pond will still be a pond with or without ducks. Graphical
representation of composition is virtually the same as aggregation, only the
diamond is **filled** (see on Figure 6).

<figure class="align-center">
	<a href="/assets/images/posts/composition.png">
        <img src="/assets/images/posts/composition.png" alt="UML Composition">
    </a>
    <figcaption>Figure 6: Composition</figcaption>
</figure>

### Dependency
Last type of relationship is a
[dependency](http://en.wikipedia.org/wiki/Class_diagram#Dependency). It's
weaker then association and it says, that a class **uses** another one and
therefore is dependant on it. The use of dependency is appropriate for example
in cases where an instance of a class is stored as a local variable inside
another classes' method. Or some static methods are used, so the classes are
not associated, but one depends on the other.

<figure class="align-center">
	<a href="/assets/images/posts/dependency.png">
        <img src="/assets/images/posts/dependency.png" alt="UML Dependency">
    </a>
    <figcaption>Figure 7: Dependency</figcaption>
</figure>

### Cheat Sheet
I did all the examples in an open-source diagram editor called
[Dia](http://live.gnome.org/Dia). I recommend it by the way. And because it's
such a wonderful editor, here's a complete cheat sheet (if you'd like to print
it).

<figure class="align-center">
	<a href="/assets/images/posts/cheat_sheet4.png">
        <img src="/assets/images/posts/cheat_sheet4.png" alt="UML Cheat Sheet">
    </a>
    <figcaption>Figure 8: Cheat Sheet</figcaption>
</figure>

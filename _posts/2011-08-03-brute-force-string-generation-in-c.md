---
layout: post
title: Brute-Force String Generation in C
description: "Simple and fast way of generating string sequences in C."
cover: holborn.jpg
comments: true
categories:
- Software
tags:
- brute force
- C++
---
Earlier this week, I posted an
[article](/2011/08/02/string-generation-for-brute-force-attacks/
"String Generation for Brute-force Attacks") about string generation for
brute-force attacks and a couple of example solutions. I emphasized, that the
key aspect of brute-force is speed. We want to try as many combinations of
input data as possible in the minimum amount of time. And part of this is also
efficient algorithm that will generate input combinations. But the examples I
posted were written in Python, which is kind of a high level scripting
language, not nearly as fast as C.

Hence, here is my implementation of the same in C:

{% highlight c %}
/*
 * Basic string generation for brute-force attacks
 * Copyright (C) 2011 Radek Pazdera
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

/* I chose to use an one way linked list data structure
 * to avoid restrictions on the generated string length.
 * The thing is, the list must be converted to string so
 * it could be used. This conversion have to happen in
 * each cycle and causes unnecessary slowdown.
 *
 * Faster solution would be to implement the generation
 * directly on some staticaly allocated string with fixed
 * size (20 characters are more than enough).
 */
typedef struct charlist charlist_t;
struct charlist
{
    unsigned char character;
    charlist_t* next;
};

/* Return new initialized charlist_t element.
 *
 * Elements are initialized
 * @return charlist_t
 */
charlist_t* new_charlist_element()
{
    charlist_t* element;

    if ((element = malloc(sizeof(charlist_t))) != 0)
    {
        element->character = 0;
        element->next = NULL;
    }
    else
    {
        perror("malloc() failed.");
    }

    return element;
}

/* Free memory allocated by charlist.
 *
 * @param list Pointer at the first element.
 * @return void
 */
void free_charlist(charlist_t* list)
{
    charlist_t* current = list;
    charlist_t* next;

    while (current != NULL)
    {
        next = current->next;
        free(current);
        current = next;
    }
}

/* Print the charlist_t data structure.
 *
 * Iterates through the whole list and prints all characters
 * in the list including any '\0'.
 *
 * @param list Input list of characters.
 * @return void
 */
void print_charlist(charlist_t* list)
{
    charlist_t* next = list;
    while (next != NULL)
    {
        printf("%d ", next->character);
        next = next->next;
    }
    printf("\n");
}

/* Get next character sequence.
 *
 * It treats characters as numbers (0-255). Function tries to
 * increment character in the first position. If it fails,
 * new character is added to the back of the list.
 *
 * It's basicaly a number with base = 256.
 *
 * @param list A pointer to charlist_t.
 * @return void
 */
void next(charlist_t* list)
{
    list->character++;
    if (list->character == 0)
    {
        if (list->next == NULL)
        {
            list->next = new_charlist_element();
        }
        else
        {
            next(list->next);
        }
    }
}

int main()
{
    charlist_t* sequence;
    sequence = new_charlist_element();

    while (1)
    {
        next(sequence);
        print_charlist(sequence);
    }

    free_charlist(sequence);
}
{% endhighlight %}
[Download](https://gist.github.com/1123306) the fully working code from
github.


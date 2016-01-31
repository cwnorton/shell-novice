---
layout: page
title: The Unix Shell
subtitle: Introducing the Shell
minutes: 5
---
> ## Learning Objectives {.objectives}
>
> *   Explain how the shell relates to the keyboard, the screen, the operating system, and users' programs.
> *   Explain when and why command-line interfaces should be used instead of graphical interfaces.

At a high level, computers do four things:

-   run programs
-   store data
-   communicate with each other
-   interact with us

They can do the last of these in many different ways,
including direct brain-computer links and speech interfaces.
Since these are still in their infancy,
most of us use windows, icons, mice, and pointers.
These technologies didn't become widespread until the 1980s,
but their roots go back to Doug Engelbart's work in the 1960s,
which you can see in what has been called
"[The Mother of All Demos](http://www.youtube.com/watch?v=a11JDLBXtPQ)".

Going back even further,
the only way to interact with early computers was to rewire them.
But in between,
from the 1950s to the 1980s,
most people used line printers.
These devices only allowed input and output of the letters, numbers, and punctuation found on a standard keyboard,
so programming languages and interfaces had to be designed around that constraint.

This kind of interface is called a
**command-line interface**, or CLI,
to distinguish it from a
**graphical user interface**, or GUI,
which most people now use.
The heart of a CLI is a **read-evaluate-print loop**, or REPL:
when the user types a command and then presses the enter (or return) key,
the computer reads it,
executes it,
and prints its output.
The user then types another command,
and so on until the user logs off.

This description makes it sound as though the user sends commands directly to the computer,
and the computer sends output directly to the user.
In fact,
there is usually a program in between called a
**command shell**.
What the user types goes into the shell,
which then figures out what commands to run and orders the computer to execute them. Note, the shell is called *the shell* because it encloses the operating system in order to hide some of its complexity and make it simpler to interact with.

A shell is a program like any other.
What's special about it is that its job is to run other programs
rather than to do calculations itself.
The most popular Unix shell is Bash,
the Bourne Again SHell
(so-called because it's derived from a shell written by Stephen Bourne — this
is what passes for wit among programmers).
Bash is the default shell on most modern implementations of Unix
and in most packages that provide Unix-like tools for Windows.

Using Bash or any other shell
sometimes feels more like programming than like using a mouse.
Commands are terse (often only a couple of characters long),
their names are frequently cryptic,
and their output is lines of text rather than something visual like a graph.
On the other hand,
the shell allows us to combine existing tools in powerful ways with only a few keystrokes
and to set up pipelines to handle large volumes of data automatically thus improving productivity and reproducibility.
In addition, the command line is often the easiest way to interact with remote machines and supercomputers.
Familiarity with the shell is near essential to run a variety of specialised tools and resources including high-performance computing systems. As clusters and cloud computing systems become more popular for scientific data crunching,
being able to interact with them is becoming a necessary skill. We can build on the command-line skills covered here to tackle a wide range of scientific questions and computational challenges.

## Lynne's Pipeline: Starting Point

Lynne Phaedrus, a PhD student working on corpus linguistics,
has just downloaded a number of newspaper articles from an online archiving service.
Her aim is to construct a text corpus to investigate how contemporary reporting refers to the work of comedians.
She has 10 files in all, each containing up to 500 articles, and now needs to:

1.  Split the large files into a file per article
    using a program a colleague wrote called `split_articles`.
2.  Rename each resulting article and wrap XML tags around each article
    for use in her corpus analysis software,
    using a different program by the same helpful colleague called
    `process_article`.
3.  Analyse the results and write them up.
    Her supervisor would really like her to have preliminary results ready
    in four days time, 
    to make the application deadline for giving a talk at the upcoming
    prestigous annual conference *Comedians and Corpora*.

The good news is that running `split_articles` on her ten files will take hardly
any time.

The bad news is that if she has to run `process_article` by hand,
she'll have to enter filenames and click "OK" around five thousand times, once
for each article.
Given her typing speed and the speed of the program, each run will take at least twenty seconds,
that's 5000 * 20 = 100,000 seconds, which is around 30 hours.
That's time Lynne simply doesn't have.
What's more, her PhD requires that she does this whole thing again with newspaper
articles from another country—she's planning on doing that next year.

The next few lessons will explore what she should do instead of slaving away
typing everything by hand.
More specifically,
they explain how she can use a command shell
to automate the repetitive steps in her processing pipeline
so that her computer can do the work for her.
As a bonus,
once she has put a processing pipeline together,
she will be able to use it again next year on the foreign articles—and again
whenever she needs to.


---
title: "Learning to Debug"
author: "William Wallius"
reviewers:
  - "Maia Dimas"
tags:
  - Debugging
---

At the beginning of the year, I knew nothing about Python. I learned different methods and syntaxes, but I had no idea what it meant, and if something went wrong, I was practically hopeless. My main source for help would be asking friends - which is a very good resource - though I grew reliant upon them, instead of using them as a tool for help. Looking back now, I realize that understanding what you're coding - not just how Python works - but also the problem you are trying to solve, is very important. If you don't know how the code is supposed to work, you can't debug the issues.

<h2>Write Clear, Concise Code</h2>

When I look back at old problem files, it can be hard to understand my thought process in the code, even though it works. When coding, it is extremely important that the code makes sense and is readable, not just for you but also for others to understand. This is crucial when debugging, so that you can easily find and discrepancies in your logic, especially if your code is not returning errors. A core part of having clear code is a systematic variable naming convention. If you are debugging by printing your variables, having good names makes it easy to know what they should be equal to, so you can clearly pick out anything wrong. 

An example of unclear coding is as follows:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">funct</span>(var, var2):
    numbers <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>
    numbers <span style="color: #333333">+=</span> var
    numbers <span style="color: #333333">=</span> numbers <span style="color: #333333">+</span> var2
    <span style="color: #008800; font-weight: bold">return</span> numbers
</pre></div>
</font>
<br>

Though this code would run and return the sum of the two inputs, it can be hard to tell exactly what it's doing. There are multiple ways that this code could be cleaned up:

<ul>
    <li>asdf</li>
</ul>
